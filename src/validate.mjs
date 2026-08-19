// ============================================================================
// validate.mjs — post-emit dangling-reference guard (#202).
//
// The reachability sweep (#191) keeps a root/child allowlist of where a live type
// can be reached from; four times (#191, #195, #197, #197-review) an emitter change
// outran that allowlist and shipped output where a `Module.type` reference pointed
// at a declaration the sweep had dropped — a dangling ref, which is a ReScript
// COMPILE ERROR. Each fix widened the allowlist; the next change outran it again.
//
// This guard is allowlist-INDEPENDENT: after all `.res` files are written, it scans
// each for references to one of OUR OWN file-modules and asserts the referenced name
// is actually declared in that module — plus the bare `JsFn.t` handle must have a
// written `JsFn.res`. It never compiles anything, so it is fast and offline; it is a
// structural mirror of "does this compile?" for the one failure mode that recurs.
//
// Rollout (see #202): HARD-fail in the golden suite (controlled output — must be
// clean); WARN (non-fatal) at generation time for real packages, so a text-parse
// edge case can never break a user's build.
//
// Soundness bias: it is tuned for ZERO false positives on known-good output (verified
// against every golden + benchmark baseline). It only flags a reference into a
// FILE-module (a `.res` whose whole declaration was dropped) — the exact historical
// failure. References into nested `module X = {…}` (resolved intra-file by ReScript's
// own scoping) are deliberately not checked: they never produced the recurring bug and
// checking them risks false positives on legitimate intra-file scoping.
// ============================================================================

/** Strip line comments, block comments and `"…"` string literals so a module-looking
 *  token inside `@module("Foo.Bar")`, an `@as("X")` tag, or a doc comment is never
 *  mistaken for a real cross-module reference. */
function stripNoise(content) {
    return content
        .replace(/\/\*[\s\S]*?\*\//g, ' ') // block comments
        .replace(/\/\/[^\n]*/g, ' ') // line comments
        .replace(/"(?:[^"\\]|\\.)*"/g, '""') // string literals -> empty
}

/** Every identifier a module `.res` file DECLARES, collected generously. Over-collection
 *  is safe here — it can only hide a real dangling ref (a miss), never invent one (a false
 *  positive) — so we err toward breadth: type/and, let/external, nested module names,
 *  variant constructors, and record field labels. */
export function collectDeclaredNames(content) {
    const src = stripNoise(content)
    const names = new Set()
    const add = (re, group = 1) => {
        for (const m of src.matchAll(re)) names.add(m[group])
    }
    // `\b` (not line-start) so decorators are transparent — `@unboxed type stringOrNumber`,
    // `@tag(...) type …`, `@module(...) external …` all still register the declared name;
    // optional `rec` covers `type rec styledBlockProps` / `let rec …`.
    add(/\b(?:type|and)[ \t]+(?:rec[ \t]+)?([a-z_][A-Za-z0-9_]*)/g) // type / and [rec] <name>
    add(/\b(?:let|external)[ \t]+(?:rec[ \t]+)?([a-zA-Z_][A-Za-z0-9_]*)/g) // let / external [rec] <name>
    add(/\bmodule[ \t]+([A-Z][A-Za-z0-9_]*)/g) // nested module <Name>
    add(/[|][ \t]*([A-Z][A-Za-z0-9_]*)/g) // | Constructor  (incl. @unboxed arms)
    add(/[({,\n][ \t]*([a-z_][A-Za-z0-9_]*)[ \t]*\??:/g) // record field label:  (over-collects; safe)
    return names
}

/** Find dangling references across a whole emitted output tree.
 *  @param {Iterable<[string, string]>} files  [relativeName, content] for every written file.
 *  @returns {string[]} human-readable problems (empty = clean).
 *
 *  A reference `M.member` is dangling when `M` is one of our written FILE-modules but
 *  `member` is not declared anywhere in M's file. Bare `JsFn.<x>` is dangling when no
 *  `JsFn.res` was written (the #197 failure: usesJsFn recomputed false, yet a
 *  `@set_index` still emitted a `JsFn.t`). References whose module is external (React,
 *  JSON, Dict, Dom, ReactEvent, …) are skipped automatically — they are not in the
 *  written set — and so are nested-module references (M not a file). */
export function findDanglingRefs(files) {
    const entries = [...files].filter(([name]) => name.endsWith('.res'))
    // moduleName (file basename, sans dir + `.res`) -> Set of declared names.
    const decls = new Map()
    const baseName = (rel) => rel.replace(/^.*[/\\]/, '').replace(/\.res$/, '')
    for (const [name, content] of entries) decls.set(baseName(name), collectDeclaredNames(content))
    const hasJsFn = decls.has('JsFn')

    const problems = []
    const refRe = /\b([A-Z][A-Za-z0-9_]*)\.([A-Za-z_][A-Za-z0-9_]*)/g
    for (const [name, content] of entries) {
        const src = stripNoise(content)
        const seen = new Set() // de-dupe identical (module, member) misses within one file
        for (const m of src.matchAll(refRe)) {
            const [, mod, member] = m
            if (mod === 'JsFn') {
                if (!hasJsFn && !seen.has('JsFn.' + member)) {
                    seen.add('JsFn.' + member)
                    problems.push(`${name} — references \`JsFn.${member}\` but no JsFn.res was emitted (orphaned JsFn handle, #197 class)`)
                }
                continue
            }
            const target = decls.get(mod)
            if (!target) continue // external module (React/JSON/…) or a nested module — not ours to check
            if (!target.has(member) && !seen.has(mod + '.' + member)) {
                seen.add(mod + '.' + member)
                problems.push(`${name} — dangling reference \`${mod}.${member}\`: ${mod}.res declares no \`${member}\` (declaration dropped by the reachability sweep — #202 class)`)
            }
        }
    }
    return problems
}
