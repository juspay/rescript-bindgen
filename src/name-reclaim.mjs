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

/** Strip a trailing allocFree counter suffix (`fooConfig2` → `fooConfig`, `stringOrNumber2` →
 *  `stringOrNumber`). Applied IDENTICALLY to both sides, so an over-strip (`int32` → `int`) stays
 *  consistent; a real reclaim still needs full structural equality AND a tombstone holding the base, so a
 *  coincidental base collision can never alone force a wrong reclaim. */
export function stripCounter(name) {
    return String(name || '').replace(/([A-Za-z_])\d+$/, '$1')
}

/** Split a `<base>N` public name into `{ base, n }`, or null if it carries no counter. */
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
        case 'typeRef': return 'ref:' + stripCounter(t.to || (t.key || '').split(/[|:]/).pop() || '?')
        case 'classRef': return 'ref:' + stripCounter(t.to || '?')
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
    // qualified or bare ref → counter-free leaf
    const leaf = s.replace(/<.*$/, '').split('.').pop()
    if (/^[A-Za-z_][A-Za-z0-9_]*$/.test(leaf)) return 'ref:' + stripCounter(leaf)
    return '?'
}

/** Parse a recovered `type <name> = …` body → `{ kind:'variant'|'record', members?|fields? }` or null.
 *  `body` is the full declaration text (head + RHS, possibly multi-line). */
export function parseResBody(body) {
    const text = String(body || '')
    const eq = text.indexOf('=')
    if (eq < 0) return null
    const head = text.slice(0, eq)
    let rhs = text.slice(eq + 1).trim()
    const isVariantHead = /@unboxed|@tag\(/.test(head)

    // record: `{ a?: T, b: U // ⚪ loose }`
    if (rhs.startsWith('{') && !isVariantHead) {
        const inner = rhs.replace(/^\{/, '').replace(/\}\s*$/, '')
        if (/\.\.\./.test(inner)) {
            // a `{ ...Spread }` bag: capture the spread so a bag never structurally equals a real record.
            const spreads = (inner.match(/\.\.\.[A-Za-z_][\w.]*/g) || []).map((x) => x.replace(/^\.\.\./, '').split('.').pop())
            const fields = splitTopLevel(inner.replace(/\.\.\.[A-Za-z_][\w.]*,?/g, '')).map(parseField).filter(Boolean)
            return { kind: 'record', spread: spreads.sort().join('+'), fields }
        }
        const fields = splitTopLevel(inner).map(parseField).filter(Boolean)
        return { kind: 'record', spread: '', fields }
    }
    // variant: `Str(string) | Num(float)` or `| @as(0) Left | @as(1) Right`
    if (isVariantHead || /(^|\s)\|/.test(rhs) || /\)\s*\|/.test(rhs)) {
        const arms = splitTopLevel(rhs.replace(/^\|/, ''), '|').map(parseArm).filter(Boolean)
        if (arms.length) return { kind: 'variant', members: arms }
    }
    return null
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

function parseField(raw) {
    const s = String(raw).trim()
    if (!s) return null
    const flagged = FLAG_RE.test(s)
    const noComment = s.replace(/\/\/.*$/, '').replace(/\/\*[\s\S]*?\*\//g, '').trim().replace(/,$/, '')
    const m = /^(?:@as\([^)]*\)\s*)?([A-Za-z_][\w]*)(\?)?\s*:\s*(.+)$/.exec(noComment)
    if (!m) return null
    return { name: m[1], optional: !!m[2], type: canonTypeText(m[3]), flagged }
}

function parseArm(raw) {
    const s = String(raw).trim().replace(/\/\/.*$/, '').trim()
    if (!s) return null
    const asM = /@as\(([^)]*)\)/.exec(s)
    const rest = s.replace(/@as\([^)]*\)/, '').trim()
    const ctorM = /^([A-Za-z_][\w]*)\s*(?:\((.+)\))?$/.exec(rest)
    if (!ctorM) return null
    return { as: asM ? asM[1].trim() : undefined, ctor: ctorM[1], type: ctorM[2] ? canonTypeText(ctorM[2]) : undefined }
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
