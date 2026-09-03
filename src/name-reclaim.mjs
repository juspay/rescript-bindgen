// #222 — decide whether a live entry pushed to a counter-suffixed public name (`<base>N`) because a
// TOMBSTONE holds the clean `<base>` may RECLAIM `<base>`.
//
// #190 reserves a removed identity's name forever with an inactive tombstone, so an old annotation can
// never silently re-bind to a DIFFERENT type. But when the tombstone and a live newcomer have the SAME
// ReScript shape, the reservation protects nothing and instead breaks every consumer of the clean name
// permanently (`CommonTypes.stringOrNumber` → `stringOrNumber2`, 1,239 refs in blend-rescript).
//
// Reclaim ONLY on a PROVEN structural match. The proof is the entire discriminator: proven-same → the
// live entry takes `<base>` and `<base>N` is kept as a transparent alias (both names denote one identity,
// which is correct); proven-different (or unprovable) → keep `<base>N`, no alias (the tombstone denotes a
// genuinely-different, upstream-deleted type; aliasing would be the exact wrong-bind #190 prevents).
//
// Tombstones are NOT emitted, so the tombstone's proof body is recovered from the prior `.res` on disk
// (scanned before `--clean`) from a generation where the identity was still live. The live side is
// canonicalised from its IR. Both reduce to a small `{kind, members|fields}` shape with type references
// normalised to their counter-free base, so the whole rename cluster compares consistently.

// NOTE on referenced-type names: we compare them by EXACT name, never counter-stripped. Stripping a
// trailing counter off every ref (an earlier draft) conflated genuinely-different types whose leaves
// differ only by a digit — `vec2` vs `vec3`, `mat3` vs `mat4`, `int8`/`int16` — into a false match. It is
// also unnecessary: the tombstone's proof body is recovered from the generation where its base name was
// still LIVE, so its refs are the clean base names; and a live entry's IR `typeRef.to` is the
// extraction-time base, not the manifest-locked counter. So both sides already carry the clean base and
// exact comparison matches the real rename cluster while keeping `vec2`/`vec3` distinct.

/** Split a `<base>N` public name into `{ base, n }`, or null if it carries no counter. This is the
 *  entry's OWN allocFree-minted public name (the reclaim trigger), not a referenced type. */
export function splitCounter(name) {
    const m = /^(.*[A-Za-z_])(\d+)$/.exec(String(name || ''))
    return m ? { base: m[1], n: Number(m[2]) } : null
}

// ---- canonical type tokens -------------------------------------------------------------------------
// A field/member type reduces to a single comparable token. Refs carry only their counter-free leaf, so
// a cluster that renames together (`padding: …PaddingConfig2` vs `…PaddingConfig`) compares equal. A
// degraded placeholder (`string`/opaque emitted for an unresolved type) is tagged `flagged` so the ONE
// tolerated asymmetry — old placeholder → new structured — can be recognised without widening to "any
// degraded shape" (a `{...spread}` bag is degraded too but must NOT match a structured record; #144).

const SCALARS = new Set(['string', 'bool', 'unit', 'int', 'float'])

/** Canonicalise a live IR type node → token string. `flagged`-ness is reported separately by the caller
 *  (an opaque/review/unknown field IS the flagged placeholder). Unknown kinds → `?` (blocks the match). */
export function canonTypeIR(t) {
    if (!t || typeof t !== 'object') return '?'
    switch (t.kind) {
        case 'string': case 'bool': case 'unit': return t.kind
        case 'number': return t._float ? 'float' : 'int'
        case 'typeRef': return 'ref:' + (t.to || (t.key || '').split(/[|:]/).pop() || '?')
        case 'classRef': return 'ref:' + (t.to || '?')
        case 'array': return 'array<' + canonTypeIR(t.of) + '>'
        case 'option': return 'option<' + canonTypeIR(t.of) + '>'
        case 'nullable': return 'null<' + canonTypeIR(t.of) + '>'
        case 'dict': return 'dict<' + canonTypeIR(t.of) + '>'
        case 'promise': return 'promise<' + canonTypeIR(t.of) + '>'
        // opaque / review / unknown / any all EMIT the `string` placeholder — the degraded shape.
        case 'opaque': case 'review': case 'unknown': case 'any': return 'placeholder'
        default: return '?'
    }
}

/** Is a live IR field/member type a degraded placeholder (emits bare `string` with a review/loose/broken
 *  flag)? These are the ONLY old-side shapes the improvement carve-out tolerates. */
export function isPlaceholderIR(t) {
    return !!t && typeof t === 'object' && (t.kind === 'opaque' || t.kind === 'review' || t.kind === 'unknown' || t.kind === 'any')
}

// ---- disk-body parser ------------------------------------------------------------------------------
// Parse a top-level `type <name> = …` body recovered from a prior `.res` into the same canonical shape.
// Handles the two forms a reclaimable shared type takes: an `@unboxed`/tagged variant and a record.
// Anything else (or a parse failure) → null, which the caller treats as "unprovable" → refuse.

/** A degraded placeholder on the DISK side is the literal `string` carrying a flag comment (`⚪`/`🔍`/
 *  `BROKEN`/`loose`/`review`) OR an opaque emitted as `string`. A `{...spread}` bag is degraded too but
 *  is NOT this — it parses as a record and is compared by field-set, so it can't sneak through here. */
const FLAG_RE = /(⚪|🔍|🛑|\bloose\b|\breview\b|\bbroken\b)/i

function canonTypeText(raw) {
    let s = String(raw || '').trim().replace(/\s+/g, '')
    // peel simple wrappers
    const wrap = (re, name) => { const m = re.exec(s); if (m) { s = m[1]; return name } return null }
    let w
    if ((w = wrap(/^option<(.+)>$/, 'option')) || (w = wrap(/^array<(.+)>$/, 'array')) ||
        (w = wrap(/^Js\.null<(.+)>$/, 'null')) || (w = wrap(/^Nullable\.t<(.+)>$/, 'null')) ||
        (w = wrap(/^dict<(.+)>$/, 'dict')) || (w = wrap(/^Js\.Dict\.t<(.+)>$/, 'dict')) ||
        (w = wrap(/^promise<(.+)>$/, 'promise'))) {
        return w + '<' + canonTypeText(s) + '>'
    }
    if (SCALARS.has(s)) return s
    // qualified or bare ref → leaf (drop the module qualifier so `CommonTypes.foo` aligns with the live
    // IR's bare `foo`; the counter is NOT stripped — see the note by splitCounter).
    const leaf = s.replace(/<.*$/, '').split('.').pop()
    if (/^[A-Za-z_][A-Za-z0-9_]*$/.test(leaf)) return 'ref:' + leaf
    return '?'
}

/** Parse a recovered `type <name> = …` body → `{ kind:'variant'|'record', members?|fields? }` or null.
 *  `body` is the full declaration text (head + RHS, possibly multi-line). Real emit writes a flagged
 *  field's marker as a `// …` comment AFTER the comma, one field per LINE, so records are parsed
 *  line-by-line: capture each line's flag first, then strip the comment before splitting. */
export function parseResBody(body) {
    const text = String(body || '')
    const eq = text.indexOf('=')
    if (eq < 0) return null
    const head = text.slice(0, eq)
    const rhs = text.slice(eq + 1)
    const isVariantHead = /@unboxed|@tag\(/.test(head)

    // record: `{\n  a?: T,\n  b: string,  // ⚪ loose\n}` — take the balanced `{ … }`.
    const brace = rhs.trimStart().startsWith('{')
    if (brace && !isVariantHead) {
        const inner = braceInner(rhs)
        if (inner == null) return null
        return { kind: 'record', ...parseRecordFields(inner) }
    }
    // variant: `Str(string) | Num(float)` or `| @as(0) Left | @as("json") Json` — strip line comments
    // (per line) BEFORE splitting on `|`, so a trailing `// …` never glues onto the next arm.
    const code = stripLineComments(rhs).trim().replace(/^\|/, '')
    if (isVariantHead || /(^|\n|\s)\|/.test('\n' + code) || /\)\s*(\||$)/.test(code) || /\bStr?\(|@as\(/.test(code)) {
        const arms = splitTopLevel(code, '|').map(parseArm).filter(Boolean)
        if (arms.length) return { kind: 'variant', members: arms }
    }
    return null
}

/** Remove `//` line comments (per line) and `/* … *​/` block comments. */
const stripLineComments = (s) => String(s).split('\n').map((l) => l.replace(/\/\/.*$/, '')).join('\n').replace(/\/\*[\s\S]*?\*\//g, '')

/** Content of the first balanced `{ … }` in `s`, or null if there's no `{`. */
function braceInner(s) {
    const i = s.indexOf('{')
    if (i < 0) return null
    let depth = 0
    for (let j = i; j < s.length; j++) {
        if (s[j] === '{') depth++
        else if (s[j] === '}' && --depth === 0) return s.slice(i + 1, j)
    }
    return s.slice(i + 1)
}

/** Parse a record's inner text into `{ fields, spread }`, line-aware: each line's `// …` comment sets that
 *  line's fields' `flagged` bit, then is stripped; a `...Spread` line contributes to `spread` (so a
 *  `{ ...bag }` can never structurally equal a real field record). */
function parseRecordFields(inner) {
    const fields = [], spreads = []
    for (const rawLine of String(inner).split('\n')) {
        const flagged = FLAG_RE.test(rawLine)
        const codeLine = rawLine.replace(/\/\/.*$/, '').replace(/\/\*[\s\S]*?\*\//g, '')
        for (const seg of splitTopLevel(codeLine)) {
            const t = seg.trim().replace(/,\s*$/, '')
            if (!t) continue
            const sp = /^\.\.\.\s*([A-Za-z_][\w.]*)/.exec(t)
            if (sp) { spreads.push(sp[1].split('.').pop()); continue }
            const f = parseField(t, flagged)
            if (f) fields.push(f)
        }
    }
    return { fields, spread: spreads.sort().join('+') }
}

/** Split on a top-level separator (`,` for records, `|` for variants), respecting `<…>`/`(…)`/`{…}`. */
function splitTopLevel(s, sep = ',') {
    const out = []
    let depth = 0, cur = ''
    for (const ch of String(s)) {
        if (ch === '<' || ch === '(' || ch === '{' || ch === '[') depth++
        else if (ch === '>' || ch === ')' || ch === '}' || ch === ']') depth--
        if (ch === sep && depth <= 0) { out.push(cur); cur = '' } else cur += ch
    }
    if (cur.trim()) out.push(cur)
    return out
}

/** Parse one record field segment (comment already stripped; `flagged` passed in). */
function parseField(raw, flagged) {
    const s = String(raw).trim().replace(/,\s*$/, '')
    if (!s) return null
    const m = /^(?:@as\([^)]*\)\s*)?([A-Za-z_][\w]*)(\?)?\s*:\s*(.+)$/.exec(s)
    if (!m) return null
    return { name: m[1], optional: !!m[2], type: canonTypeText(m[3]), flagged: !!flagged }
}

function parseArm(raw) {
    const s = String(raw).replace(/\/\/.*$/, '').trim()
    if (!s) return null
    const asM = /@as\(([^)]*)\)/.exec(s)
    // Normalise the discriminant: strip surrounding quotes so a string `@as("json")` (disk) equals the
    // live IR's unquoted `json`; numeric `@as(0)` is unaffected. (Constructor identifiers are ignored.)
    const asVal = asM ? asM[1].trim().replace(/^["']|["']$/g, '') : undefined
    const rest = s.replace(/@as\([^)]*\)/, '').trim()
    const ctorM = /^([A-Za-z_][\w]*)\s*(?:\((.+)\))?$/.exec(rest)
    if (!ctorM) return null
    return { as: asVal, ctor: ctorM[1], type: ctorM[2] ? canonTypeText(ctorM[2]) : undefined }
}

// ---- the predicate ---------------------------------------------------------------------------------

/** Canonicalise a live IR entry → `{ kind, members?|fields? }`, mirroring `parseResBody`. */
export function canonLive(e) {
    if (!e || typeof e !== 'object') return null
    if (e.kind === 'record') {
        return {
            kind: 'record',
            spread: '', // a live shared record we might reclaim is a real field record, not a `{...bag}`
            fields: (e.fields || []).map((f) => ({ name: f.name, optional: !!f.optional, type: canonTypeIR(f.type), flagged: isPlaceholderIR(f.type) })),
        }
    }
    if (e.members) {
        return { kind: 'variant', members: e.members.map((m) => ({ as: m.as !== undefined ? String(m.as) : undefined, ctor: m.ctor, type: m.type ? canonTypeIR(m.type) : undefined })) }
    }
    return null
}

/** Do a field's OLD (tombstone) and NEW (live) type match, allowing exactly the narrow improvement
 *  direction: old side is a flagged placeholder (`string` + ⚪/🔍/broken) AND new side is structured
 *  (a non-placeholder). NOTHING else is tolerated — a `{...spread}` bag on the old side parses as a
 *  record field-set, not a placeholder, so it never qualifies here. */
function typeMatches(oldF, newF) {
    if (oldF.type === newF.type) return true
    // The ONLY tolerated asymmetry: old side was a flagged degraded placeholder (`string`+⚪/🔍/broken, or
    // an opaque), new side is now a structured type. A `?`/`string`/`placeholder` on the NEW side is not
    // "structured" and never satisfies it.
    const oldIsDegradedPlaceholder = oldF.type === 'placeholder' || (oldF.type === 'string' && oldF.flagged)
    const newIsStructured = newF.type !== 'placeholder' && newF.type !== '?' && newF.type !== 'string'
    return oldIsDegradedPlaceholder && newIsStructured
}

/**
 * Is `live` (canonicalised IR) a PROVEN structural match for `old` (parsed tombstone body)?
 * Records: same field-NAME set + optionality, each field's type matching by `typeMatches`, and NO spread
 * on either side. Variants: same `@as` payload multiset (constructor identifiers IGNORED — renamed on
 * purpose) and each arm's payload type matching. Any shape/kind/parse gap → false (refuse).
 */
export function reclaimable(old, live) {
    if (!old || !live || old.kind !== live.kind) return false
    if (old.kind === 'record') {
        if ((old.spread || '') !== (live.spread || '')) return false // a `{...bag}` never matches a real record
        const byName = (fs) => new Map(fs.map((f) => [f.name + (f.optional ? '?' : ''), f]))
        const om = byName(old.fields || []), lm = byName(live.fields || [])
        if (om.size !== lm.size) return false
        for (const [k, of] of om) { const lf = lm.get(k); if (!lf || !typeMatches(of, lf)) return false }
        return true
    }
    if (old.kind === 'variant') {
        const key = (arms) => arms.map((a) => (a.as !== undefined ? '@as(' + a.as + ')' : '') + (a.type || '')).sort()
        const ok = key(old.members || []), lk = key(live.members || [])
        if (ok.length !== lk.length) return false
        return ok.every((x, i) => x === lk[i])
    }
    return false
}
