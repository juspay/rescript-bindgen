// ============================================================================
// resolve.mjs — STAGE 1 of the pipeline: figure out WHERE the .d.ts is.
//
// Given a CLI input (a file, a folder, or an npm package name), return the path
// to the TypeScript declaration file the rest of the pipeline should read. For a
// package that isn't installed, it npm-installs the exact version into a private
// scratch cache (.bindgen-cache/) — and falls back to `@types/<name>` if the
// package ships no types of its own.
// ============================================================================

import { existsSync, readFileSync, mkdirSync, writeFileSync } from 'fs'
import { join, isAbsolute, resolve as pathResolve } from 'path'
import { execSync } from 'child_process'

/** Where packages fetched for generation are installed (kept out of the project). */
const SCRATCH = pathResolve(new URL('../.bindgen-cache', import.meta.url).pathname)

// React type definitions co-installed with every scratch package so that `React.*` types
// (ForwardRefExoticComponent, CSSProperties, ReactNode, MouseEvent, …) resolve instead of
// collapsing to `any`/`unknown`. Without these, forwardRef components extract no props.
const REACT_TYPE_DEPS = 'react react-dom @types/react @types/react-dom'

/**
 * Read and parse a JSON file, returning null on any error (missing/invalid).
 * @param {string} p  absolute path to a .json file
 * @returns {object | null}
 */
function readJSON(p) {
    try { return JSON.parse(readFileSync(p, 'utf-8')) } catch { return null }
}

/** A declaration file path (the only thing we accept as a types entry). */
const isDtsPath = (s) => typeof s === 'string' && /\.d\.[mc]?ts$/.test(s)

/**
 * Collect candidate `.d.ts` targets from an `exports`-map NODE (the value at a subpath, or the
 * whole map when it's a bare condition object), preferring the `types`/`typings` condition and
 * recursing into the runtime conditions (`import`/`require`/`node`/`default`/`browser`) — which in
 * dual-emit packages nest their own `{ types, default }`. A plain runtime string (`./index.mjs`) is
 * ignored: only a `.d.ts`/`.d.mts`/`.d.cts` is a types entry. Order = priority. (#104)
 * @param {*} node  an `exports` condition value (string | object | array)
 * @returns {string[]}  relative `.d.ts` targets, most-preferred first
 */
function exportsTypeTargets(node) {
    if (!node) return []
    if (typeof node === 'string') return isDtsPath(node) ? [node] : []
    if (Array.isArray(node)) return node.flatMap(exportsTypeTargets)
    if (typeof node === 'object') {
        const out = []
        // The `types`/`typings` conditions win — TS's own resolution order.
        for (const k of ['types', 'typings']) if (node[k]) out.push(...exportsTypeTargets(node[k]))
        // Then runtime conditions, which may nest a `types` or point straight at a `.d.ts`.
        for (const k of ['import', 'require', 'node', 'default', 'browser']) if (node[k]) out.push(...exportsTypeTargets(node[k]))
        return out
    }
    return []
}

/**
 * Resolve the MAIN (`.`) types entry of a package's `exports` map. Handles both a subpath map
 * (`{ ".": …, "./sub": … }` — use the `.` entry) and a bare condition object
 * (`{ types, import, require }` — the whole thing IS the `.` entry). Subpath binding (per-subpath
 * `@module("pkg/sub")`) is intentionally out of scope here. (#104)
 */
function exportsMainTargets(exp) {
    if (!exp || typeof exp !== 'object' || Array.isArray(exp)) return exportsTypeTargets(exp)
    const keys = Object.keys(exp)
    // A subpath map has `.`-prefixed keys; otherwise the object is itself the `.` condition set.
    return keys.some((k) => k.startsWith('.')) ? exportsTypeTargets(exp['.']) : exportsTypeTargets(exp)
}

/**
 * Apply a `typesVersions` remap to one candidate path. Shape:
 * `{ "<semver-range>": { "<pattern>": ["<target>", …] } }` (e.g. `{ ">=4": { "*": ["ts4/*"] } }`).
 * We do NOT semver-match the range (we don't know the consumer's TS version) — every range's mapping
 * is tried in declaration order and `existsSync` (in the caller) picks the first that exists, which
 * stays deterministic. Correct for the common single-range shape; a package declaring MULTIPLE
 * incompatible ranges could resolve to a valid-but-older types dir — an accepted tradeoff. A `*` in
 * the pattern is a single glob capture spliced into each target's `*`; an exact pattern matches the
 * whole path. (#104)
 * @returns {string[]}  remapped candidate paths (empty if nothing matched)
 */
function typesVersionsRemap(tv, rel) {
    if (!tv || typeof tv !== 'object') return []
    const out = []
    for (const range of Object.keys(tv)) {
        const map = tv[range]
        if (!map || typeof map !== 'object') continue
        for (const pattern of Object.keys(map)) {
            const targets = map[pattern]
            if (!Array.isArray(targets)) continue
            const star = pattern.indexOf('*')
            if (star >= 0) {
                const pre = pattern.slice(0, star), post = pattern.slice(star + 1)
                if (rel.startsWith(pre) && rel.endsWith(post) && rel.length >= pre.length + post.length) {
                    const mid = rel.slice(pre.length, rel.length - post.length)
                    for (const t of targets) out.push(t.replace(/\*/g, mid))
                }
            } else if (pattern === rel) {
                out.push(...targets)
            }
        }
    }
    return out
}

/**
 * Find a package's TypeScript declaration entry file. Tries `package.json`
 * `types`/`typings`, then the `exports` map (`types` condition — modern packaging), then common
 * conventions (`index.d.ts`, `dist/`, `lib/`), then the `main` field with `.js` swapped for `.d.ts`
 * — each candidate additionally expanded through `typesVersions` (a version-gated path remap). (#104)
 * @param {string} pkgDir  the package's root directory
 * @returns {string | null}  path to the entry `.d.ts`, or null if none found
 */
export function typesEntry(pkgDir) {
    const pj = readJSON(join(pkgDir, 'package.json')) || {}
    const rels = []
    if (pj.types) rels.push(pj.types)
    if (pj.typings) rels.push(pj.typings)
    // `exports` map (modern packaging) — resolve the `.` entry's `types` condition. Placed BEFORE the
    // conventions so a package whose types live only behind `exports` still resolves; AFTER the
    // explicit `types`/`typings` fields, which remain authoritative when present.
    rels.push(...exportsMainTargets(pj.exports))
    // common conventions
    rels.push('index.d.ts', 'dist/index.d.ts', 'lib/index.d.ts')
    // main with a runtime extension swapped to `.d.ts`
    if (pj.main) rels.push(pj.main.replace(/\.[mc]?js$/, '.d.ts'))
    // `typesVersions` can remap ANY of the above; try each remap FIRST (that's what typesVersions is
    // FOR — it overrides the plain entry when it matches), then the original as fallback. `existsSync`
    // decides. NB: a package shipping BOTH a `types` field and an applicable typesVersions therefore
    // resolves to the remapped path (more correct, but not literally the raw `types` value).
    const expanded = rels.flatMap((r) => [...typesVersionsRemap(pj.typesVersions, r), r])
    return expanded.map((r) => join(pkgDir, r)).find(existsSync) || null
}

/**
 * Find a package's directory by looking through several `node_modules` roots.
 * @param {string} name   package name (may be scoped, e.g. `@scope/pkg`)
 * @param {string[]} roots  node_modules directories to search, in order
 * @returns {string | null}  the package dir, or null if not found
 */
function findPkgDir(name, roots) {
    for (const root of roots) {
        const d = join(root, ...name.split('/'))
        if (existsSync(join(d, 'package.json'))) return d
    }
    return null
}

/**
 * Resolve a CLI input to a declaration entry file. Exactly one of file/dir/pkg
 * should be set. For `pkg`, installs it into the scratch cache when missing.
 *
 * @param {object} opts
 * @param {string} [opts.file]  a single `.d.ts` path
 * @param {string} [opts.dir]   a folder containing an `index.d.ts`
 * @param {string} [opts.pkg]   an npm spec, e.g. `react-day-picker` or `@mui/material@5.16.0`
 * @param {boolean} [opts.install=true]  auto-install a missing `pkg`
 * @param {string[]} [opts.nodeModulesRoots=[]]  extra node_modules roots to search first
 * @returns {{ entry: string, from?: string, untyped?: boolean }}
 *   entry — path to the `.d.ts`; from — the package name to stamp in `@module(...)`;
 *   untyped — true if types came from a `@types/*` package (the lib shipped none).
 * @throws if the input is missing or no types can be found
 */
export function resolveInput({ file, dir, pkg, install = true, nodeModulesRoots = [] }) {
    if (file) {
        const p = isAbsolute(file) ? file : pathResolve(file)
        if (!existsSync(p)) throw new Error(`File not found: ${p}`)
        return { entry: p, from: undefined }
    }
    if (dir) {
        const d = isAbsolute(dir) ? dir : pathResolve(dir)
        const entry = typesEntry(d)
        if (!entry) throw new Error(`No .d.ts entry found under ${d}`)
        return { entry, from: undefined }
    }
    if (pkg) {
        // Strip the version from the spec to get the bare package name (keeping the scope @).
        // e.g. `@mui/material@5.16.0` -> `@mui/material`, `react@18` -> `react`.
        const name = pkg.startsWith('@') ? pkg.replace(/(@[^/]+\/[^@]+)@.*/, '$1') : pkg.split('@')[0]

        // 1. try existing node_modules roots (consumer project + scratch cache)
        const searchRoots = [...nodeModulesRoots, join(SCRATCH, 'node_modules')]
        let pkgDir = findPkgDir(name, searchRoots)
        let typesDir = pkgDir ? null : findPkgDir(`@types/${name.replace('@', '').replace('/', '__')}`, searchRoots)

        // 2. otherwise install into the scratch cache
        if (!pkgDir && !typesDir && install) {
            mkdirSync(SCRATCH, { recursive: true })
            if (!existsSync(join(SCRATCH, 'package.json')))
                writeFileSync(join(SCRATCH, 'package.json'), JSON.stringify({ name: 'bindgen-scratch', private: true }) + '\n')
            // A bare name (no version) installs `<name>@latest` — the dist-tag. npm treats a bare
            // name as the `*` RANGE, which EXCLUDES prereleases, so a package whose only published
            // versions are prereleases (e.g. @base-ui-components/react: alpha/beta/rc only) fails
            // with "No matching version found" despite having a `latest` tag. The dist-tag form is
            // byte-identical for normal packages. (#23)
            const spec = name === pkg ? `${pkg}@latest` : pkg
            console.error(`[resolve] installing ${spec} into scratch cache…`)
            // Always co-install React's type definitions. Component packages do `import React from
            // "react"` and type props via `React.ForwardRefExoticComponent<P>`, `React.CSSProperties`,
            // `React.ReactNode`, … — without @types/react those all resolve to `any`/`unknown`, so a
            // forwardRef component yields ZERO props and CSSProperties/ReactNode widen to a placeholder.
            // (Installed in the SAME command so npm doesn't prune them as extraneous on a later install.)
            execSync(`npm install --no-save --silent ${spec} ${REACT_TYPE_DEPS}`, { cwd: SCRATCH, stdio: 'inherit' })
            // also try @types if the package ships no types (keep React types in the same command)
            pkgDir = findPkgDir(name, [join(SCRATCH, 'node_modules')])
            if (pkgDir && !typesEntry(pkgDir)) {
                const typesPkg = '@types/' + (name.startsWith('@') ? name.slice(1).replace('/', '__') : name)
                try {
                    execSync(`npm install --no-save --silent ${typesPkg} ${REACT_TYPE_DEPS}`, { cwd: SCRATCH, stdio: 'inherit' })
                } catch { /* no @types available */ }
            }
            const roots = [join(SCRATCH, 'node_modules')]
            pkgDir = findPkgDir(name, roots)
            typesDir = findPkgDir('@types/' + (name.startsWith('@') ? name.slice(1).replace('/', '__') : name), roots)
        }

        const dir2 = (pkgDir && typesEntry(pkgDir)) ? pkgDir : typesDir
        if (!dir2) throw new Error(`Could not resolve types for package "${pkg}". It may ship no .d.ts and have no @types package.`)
        const entry = typesEntry(dir2)
        if (!entry) throw new Error(`No types entry in ${dir2}`)
        return { entry, from: name, untyped: dir2 === typesDir }
    }
    throw new Error('Provide one of: --file, --dir, or --pkg')
}
