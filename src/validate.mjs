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

/** Blank out comments and string literals (to spaces, newlines preserved) so a module-looking
 *  token inside a `@module(...)`/`@as(...)` string arg, a line or block comment, or a backtick
 *  template is never mistaken for a real cross-module reference. A single left-to-right state
 *  machine — NOT ordered regex replaces — so the contexts interact correctly:
 *   - a line-comment marker inside a string does not start a comment, and vice versa;
 *   - block comments nest; backslash escapes inside strings/chars are respected;
 *   - a ReScript CHAR literal (`'x'`, `'\n'`, and critically `'"'`) is masked as a unit, so the
 *     quote inside it can NEVER open a phantom string that eats real code to EOF — while a type
 *     VARIABLE (`'a`, `'b`: a quote with no closing quote right after) is left as code;
 *   - inside a `` `…` `` template, the literal text is masked but a `${ … }` interpolation is
 *     scanned as CODE, so a real `Module.ref` there is still seen (no false negative). */
function stripNoise(content) {
    const n = content.length
    let out = ''
    let block = 0 // block-comment nesting depth (0 = not in a block comment)
    let tmpl = false // inside a `…` template literal, masking its literal text
    const interp = [] // brace depth of each open `${ … }` interpolation being scanned as code
    for (let i = 0; i < n; ) {
        const c = content[i], d = i + 1 < n ? content[i + 1] : ''
        if (block > 0) {
            if (c === '/' && d === '*') { block++; out += '  '; i += 2; continue }
            if (c === '*' && d === '/') { block--; out += '  '; i += 2; continue }
            out += c === '\n' ? '\n' : ' '; i++; continue
        }
        if (tmpl) { // template literal text: mask, but hand a `${` back to code scanning
            if (c === '\\') { out += '  '; i += 2; continue }
            if (c === '`') { tmpl = false; out += ' '; i++; continue }
            if (c === '$' && d === '{') { interp.push(1); tmpl = false; out += '  '; i += 2; continue }
            out += c === '\n' ? '\n' : ' '; i++; continue
        }
        // --- CODE context (top level, or inside a `${ … }` interpolation) ---
        if (c === '/' && d === '*') { block = 1; out += '  '; i += 2; continue }
        if (c === '/' && d === '/') { while (i < n && content[i] !== '\n') { out += ' '; i++ } continue }
        if (c === '"') { // regular string literal
            out += ' '; i++
            while (i < n) {
                const e = content[i]
                if (e === '\\') { out += '  '; i += 2; continue }
                if (e === '"') { out += ' '; i++; break }
                out += e === '\n' ? '\n' : ' '; i++
            }
            continue
        }
        if (c === '`') { tmpl = true; out += ' '; i++; continue } // enter a template literal
        if (c === "'") { // char literal vs type variable
            if (d === '\\' && content[i + 3] === "'") { out += '    '; i += 4; continue } // '\n' '\'' etc.
            if (d !== '\\' && d !== '' && content[i + 2] === "'") { out += '   '; i += 3; continue } // 'x'
            out += c; i++; continue // type variable ('a, 'b) — leave as code
        }
        if (interp.length) { // track braces so we know when the interpolation closes back to text
            if (c === '{') { interp[interp.length - 1]++; out += c; i++; continue }
            if (c === '}') {
                if (--interp[interp.length - 1] === 0) { interp.pop(); tmpl = true; out += ' '; i++; continue }
                out += c; i++; continue
            }
        }
        out += c; i++
    }
    return out
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
    add(/[=|][ \t]*([A-Z][A-Za-z0-9_]*)/g) // = FirstArm / | Constructor  (the first @unboxed/variant
    //                                        arm has no leading `|`; the extra `= Upper` matches are
    //                                        harmless over-collection)
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
            if (mod === 'JsFn' && !hasJsFn) {
                // No JsFn.res at all: any `JsFn.<x>` is orphaned (the #197 failure). When JsFn.res IS
                // present we fall through to the general check below, so a `JsFn.bogus` that JsFn.res
                // does not declare is still caught (it would be a compile error just the same).
                if (!seen.has('JsFn.' + member)) {
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
