// ============================================================================
// diff.mjs — shared snapshot-diff helpers used by test/golden.mjs and
// benchmark/run.mjs. No deps; flat-directory snapshots only (the generator
// emits a flat tree).
// ============================================================================
import { readdirSync, readFileSync, existsSync, statSync } from 'fs'
import { join } from 'path'

export const GREEN = (s) => `\x1b[32m${s}\x1b[0m`
export const RED = (s) => `\x1b[31m${s}\x1b[0m`
export const DIM = (s) => `\x1b[2m${s}\x1b[0m`

/** Read every file in a directory (flat — the generator emits a flat tree) into a name->content map. */
export function readDir(dir) {
    const out = new Map()
    if (!existsSync(dir)) return out
    for (const name of readdirSync(dir)) {
        if (name === '.bindgen-manifest.json') continue // generator bookkeeping, not part of the snapshot
        const p = join(dir, name)
        if (statSync(p).isFile()) out.set(name, readFileSync(p, 'utf-8'))
    }
    return out
}

/** A minimal line-level diff for display (no deps). Shows up to `ctx` mismatching lines. */
export function lineDiff(expected, actual, ctx = 40) {
    const a = expected.split('\n')
    const b = actual.split('\n')
    const lines = []
    const n = Math.max(a.length, b.length)
    let shown = 0
    for (let i = 0; i < n && shown < ctx; i++) {
        if (a[i] !== b[i]) {
            if (a[i] !== undefined) lines.push(RED(`  - ${a[i]}`))
            if (b[i] !== undefined) lines.push(GREEN(`  + ${b[i]}`))
            shown++
        }
    }
    return lines.join('\n')
}

/** Compare two name->content maps (expected vs actual). Returns display-ready problem lines, [] when identical. */
export function diffDirs(expected, actual) {
    const problems = []
    const allNames = new Set([...expected.keys(), ...actual.keys()])
    for (const fn of [...allNames].sort()) {
        if (!actual.has(fn)) problems.push(`missing file (expected, not generated): ${fn}`)
        else if (!expected.has(fn)) problems.push(`extra file (generated, not in golden): ${fn}`)
        else if (expected.get(fn) !== actual.get(fn)) {
            problems.push(`content differs: ${fn}`)
            problems.push(lineDiff(expected.get(fn), actual.get(fn)))
        }
    }
    return problems
}
