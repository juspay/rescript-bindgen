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

/**
 * Find a package's TypeScript declaration entry file. Tries `package.json`
 * `types`/`typings`, then common conventions (`index.d.ts`, `dist/`, `lib/`),
 * then the `main` field with `.js` swapped for `.d.ts`.
 * @param {string} pkgDir  the package's root directory
 * @returns {string | null}  path to the entry `.d.ts`, or null if none found
 */
function typesEntry(pkgDir) {
    const pj = readJSON(join(pkgDir, 'package.json')) || {}
    const cand = []
    if (pj.types) cand.push(join(pkgDir, pj.types))
    if (pj.typings) cand.push(join(pkgDir, pj.typings))
    // common conventions
    cand.push(join(pkgDir, 'index.d.ts'))
    cand.push(join(pkgDir, 'dist', 'index.d.ts'))
    cand.push(join(pkgDir, 'lib', 'index.d.ts'))
    // main with .js swapped to .d.ts
    if (pj.main) cand.push(join(pkgDir, pj.main.replace(/\.js$/, '.d.ts')))
    return cand.find(existsSync) || null
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
