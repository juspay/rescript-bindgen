// resolve.mjs — turn a CLI input into a TypeScript declaration entry file.
//
// Accepts:
//   --file <path.d.ts>     -> that file
//   --dir  <folder>        -> folder/index.d.ts
//   --pkg  <name[@ver]>    -> install into a scratch node_modules (if needed),
//                             find the package's types entry (or @types/<name>)

import { existsSync, readFileSync, mkdirSync, writeFileSync } from 'fs'
import { join, isAbsolute, resolve as pathResolve } from 'path'
import { execSync } from 'child_process'

const SCRATCH = pathResolve(new URL('../.bindgen-cache', import.meta.url).pathname)

function readJSON(p) {
    try { return JSON.parse(readFileSync(p, 'utf-8')) } catch { return null }
}

// Given a package dir, find its declaration entry file.
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

// Find a package directory inside one of several node_modules roots.
function findPkgDir(name, roots) {
    for (const root of roots) {
        const d = join(root, ...name.split('/'))
        if (existsSync(join(d, 'package.json'))) return d
    }
    return null
}

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
        const bareName = pkg.replace(/@[^/]+$/, (m) => (pkg.startsWith('@') && pkg.lastIndexOf('@') === 0 ? m : '')) // keep scope @
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
            console.error(`[resolve] installing ${pkg} into scratch cache…`)
            execSync(`npm install --no-save --silent ${pkg}`, { cwd: SCRATCH, stdio: 'inherit' })
            // also try @types if the package ships no types
            pkgDir = findPkgDir(name, [join(SCRATCH, 'node_modules')])
            if (pkgDir && !typesEntry(pkgDir)) {
                const typesPkg = '@types/' + (name.startsWith('@') ? name.slice(1).replace('/', '__') : name)
                try {
                    execSync(`npm install --no-save --silent ${typesPkg}`, { cwd: SCRATCH, stdio: 'inherit' })
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
