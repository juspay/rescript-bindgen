// #222 unit tests for the tombstone-reclaim structural match (src/name-reclaim.mjs).
// Bodies use the EXACT shapes real emit produces — multi-line records with a `// …` comment AFTER the
// comma, string `@as("…")` discriminants, clean cross-type refs — so the tests guard real inputs (an
// earlier version passed only because it used single-line block-comment records + numeric-only @as).
import { parseResBody, canonLive, reclaimable, splitCounter } from '../src/name-reclaim.mjs'

let pass = 0
const ok = (cond, msg) => { if (!cond) throw new Error('FAIL: ' + msg); console.log('✓ ' + msg); pass++ }

ok(splitCounter('stringOrNumber2')?.base === 'stringOrNumber' && splitCounter('foo')?.base === undefined,
    'splitCounter separates a trailing counter and returns null without one')

// 1. variant identical (stringOrNumber) — scalar payloads, no @as.
{
    const old = parseResBody('@unboxed type stringOrNumber = Str(string) | Num(float)')
    const live = canonLive({ kind: 'unboxed', members: [{ ctor: 'Str', type: { kind: 'string' } }, { ctor: 'Num', type: { kind: 'number', _float: true } }] })
    ok(reclaimable(old, live), 'RECLAIM: identical @unboxed variant (stringOrNumber)')
}

// 2. constructor rename, identical NUMERIC @as (positionAffinity).
{
    const old = parseResBody('type positionAffinity =\n  | @as(0) LeftPositionAffinity\n  | @as(1) RightPositionAffinity')
    const live = canonLive({ kind: 'enum', members: [{ ctor: 'Left', as: 0 }, { ctor: 'Right', as: 1 }] })
    ok(reclaimable(old, live), 'RECLAIM: ctor renamed but numeric @as identical (positionAffinity)')
}

// 2b. string @as("…") discriminant — disk is quoted, live IR is unquoted (Finding 3 regression).
{
    const old = parseResBody('type resp =\n  | @as("json") JsonResp\n  | @as("text") TextResp')
    const live = canonLive({ kind: 'enum', members: [{ ctor: 'Json', as: 'json' }, { ctor: 'Text', as: 'text' }] })
    ok(reclaimable(old, live), 'RECLAIM: string @as("json"/"text") on disk matches the live unquoted discriminant')
}

// 3. record referencing OTHER cluster members — CLEAN refs on both sides (the proof body predates the
//    rename, so its refs are the clean base names; the live IR's typeRef.to is the extraction base too).
{
    const old = parseResBody('type chartsHeaderConfig = {\n  padding?: chartsHeaderPaddingConfig,\n  slots?: chartsHeaderSlotsConfig,\n}')
    const live = canonLive({ kind: 'record', fields: [
        { name: 'padding', optional: true, type: { kind: 'typeRef', to: 'chartsHeaderPaddingConfig' } },
        { name: 'slots', optional: true, type: { kind: 'typeRef', to: 'chartsHeaderSlotsConfig' } },
    ] })
    ok(reclaimable(old, live), 'RECLAIM: record with clean cross-type refs (headerConfig)')
}

// 4. improvement direction, REAL multi-line record with a trailing `// …` comment AFTER the comma.
{
    const old = parseResBody('type chartsLegendConfig = {\n  dropdown: string,  // ⚠️ REVIEW — was `{ maxHeight: … }`\n  gap?: float,\n}')
    ok(old.fields.length === 2 && old.fields[0].name === 'dropdown' && old.fields[0].flagged && old.fields[1].name === 'gap',
        'PARSE: a flagged field with a trailing comment keeps its flag AND the next field is not dropped (Finding 2)')
    const live = canonLive({ kind: 'record', fields: [
        { name: 'dropdown', optional: false, type: { kind: 'typeRef', to: 'chartsDropdownConfig' } },
        { name: 'gap', optional: true, type: { kind: 'number', _float: true } },
    ] })
    ok(reclaimable(old, live), 'RECLAIM: old `string`+flag → new structured, real multi-line record (legendConfig)')
}

// 5. REFUSE — the domProps-bag trap: old `{ ...JsxDOM.domProps }` bag, new strict field record.
{
    const old = parseResBody('type dateTimeFormatOptionsLib = {\n  ...JsxDOM.domProps,\n}')
    const live = canonLive({ kind: 'record', fields: [
        { name: 'day', optional: true, type: { kind: 'typeRef', to: 'chartsDay' } },
        { name: 'month', optional: true, type: { kind: 'typeRef', to: 'chartsMonth' } },
    ] })
    ok(old.spread === 'domProps' && !reclaimable(old, live), 'REFUSE: {...domProps} bag never matches a structured record (the trap)')
}

// 6. REFUSE — genuinely different referenced type (Finding 1: vec2 vs vec3 must NOT collapse).
{
    const old = parseResBody('type shape = {\n  basis?: vec2,\n}')
    const live = canonLive({ kind: 'record', fields: [{ name: 'basis', optional: true, type: { kind: 'typeRef', to: 'vec3' } }] })
    ok(!reclaimable(old, live), 'REFUSE: a ref that differs only by a trailing digit (vec2 vs vec3) is NOT a match')
}

// 6b. REFUSE — genuinely different variant payload (Lib vs Highcharts).
{
    const old = parseResBody('@unboxed type stringOrDateTimeFormatOptions = Str(string) | DateTimeFormatOptions(dateTimeFormatOptionsLib)')
    const live = canonLive({ kind: 'unboxed', members: [
        { ctor: 'Str', type: { kind: 'string' } },
        { ctor: 'DateTimeFormatOptions2', type: { kind: 'typeRef', to: 'dateTimeFormatOptionsHighcharts' } },
    ] })
    ok(!reclaimable(old, live), 'REFUSE: variant arm payload is a genuinely different type (Lib vs Highcharts)')
}

// 7. REFUSE — a new structured field NOT present in the old shape (field-set differs).
{
    const old = parseResBody('type chartsFoo = {\n  a?: int,\n}')
    const live = canonLive({ kind: 'record', fields: [
        { name: 'a', optional: true, type: { kind: 'number' } },
        { name: 'b', optional: true, type: { kind: 'string' } },
    ] })
    ok(!reclaimable(old, live), 'REFUSE: differing field-NAME set is not a match')
}

// 8. REFUSE — improvement direction does NOT run backwards (old structured → new placeholder).
{
    const old = parseResBody('type chartsBar = {\n  x: chartsPoint,\n}')
    const live = canonLive({ kind: 'record', fields: [{ name: 'x', optional: false, type: { kind: 'unknown', text: 'Foo' } }] })
    ok(!reclaimable(old, live), 'REFUSE: new-side placeholder is not the tolerated direction')
}

// 9. [round-2 #1] REFUSE — unmodelled (callback/tuple/nested) field types canon to `?` and BLOCK the
//    match, even `?`==`?` (else two genuinely-different callbacks would silently reclaim).
{
    const old = parseResBody('type cfg = {\n  formatter?: (string, string, bool) => float,\n  gap?: float,\n}')
    const live = canonLive({ kind: 'record', fields: [
        { name: 'formatter', optional: true, type: { kind: 'callback', params: [{ kind: 'string' }], ret: { kind: 'string' } } },
        { name: 'gap', optional: true, type: { kind: 'number', _float: true } },
    ] })
    ok(old.fields.length === 2 && old.fields[0].type === '?' && !reclaimable(old, live),
        'REFUSE: a `?` (unmodelled callback) field blocks the match — not `?`==`?` (round-2 ship-blocker)')
}

// 10. [round-2 #2] RECLAIM — a bare `number` field unifies int/float to `num` (no spurious refusal).
{
    const old = parseResBody('type sizes = {\n  gap?: float,\n  count?: int,\n}')
    const live = canonLive({ kind: 'record', fields: [
        { name: 'gap', optional: true, type: { kind: 'number' } },              // no _float
        { name: 'count', optional: true, type: { kind: 'number', _float: false } },
    ] })
    ok(reclaimable(old, live), 'RECLAIM: number fields unify int/float to `num`')
}

// 11. [round-2 #3] RECLAIM — `//` inside @as("http://…") is NOT treated as a comment.
{
    const old = parseResBody('type url =\n  | @as("http://a") HttpA\n  | @as("https://b") HttpsB')
    const live = canonLive({ kind: 'enum', members: [{ ctor: 'A', as: 'http://a' }, { ctor: 'B', as: 'https://b' }] })
    ok(old.members.length === 2 && reclaimable(old, live), 'RECLAIM: `//` inside an @as string literal is not a comment')
}

// 12. [round-2 #4] external `React.element` does NOT conflate with a package-local `element`; a `*Types`
//     qualifier DOES drop so a shared-type ref aligns with the live bare ref.
{
    const extOld = parseResBody('type node = {\n  el?: React.element,\n}')
    const extLive = canonLive({ kind: 'record', fields: [{ name: 'el', optional: true, type: { kind: 'typeRef', to: 'element' } }] })
    ok(!reclaimable(extOld, extLive), 'REFUSE: external React.element vs package-local element are not conflated')
    const shOld = parseResBody('type row = {\n  v?: CommonTypes.stringOrNumber,\n}')
    const shLive = canonLive({ kind: 'record', fields: [{ name: 'v', optional: true, type: { kind: 'typeRef', to: 'stringOrNumber' } }] })
    ok(reclaimable(shOld, shLive), 'RECLAIM: a *Types qualifier drops so CommonTypes.foo matches the live bare foo')
}

// 13. [round-3 #1] REFUSE — a `?` NESTED inside a wrapper is still unprovable; `array<?>`==`array<?>`
//     must NOT match (different tuple arities inside the array are genuinely different types).
{
    const old = parseResBody('type series = {\n  points: array<(float, float)>,\n  label?: string,\n}')
    const live = canonLive({ kind: 'record', fields: [
        { name: 'points', optional: false, type: { kind: 'array', of: { kind: 'tuple', params: [{ kind: 'number', _float: true }, { kind: 'number', _float: true }, { kind: 'number', _float: true }] } } },
        { name: 'label', optional: true, type: { kind: 'string' } },
    ] })
    ok(old.fields[0].type === '?' && !reclaimable(old, live),
        'REFUSE: nested `?` propagates up — array<(f,f)> vs array<(f,f,f)> is NOT a match (round-3 ship-blocker)')
}

// 13b. RECLAIM still works for a wrapper around a MODELLED inner type (array<string>, option<ref>).
{
    const old = parseResBody('type box = {\n  tags?: array<string>,\n  child?: option<childConfig>,\n}')
    const live = canonLive({ kind: 'record', fields: [
        { name: 'tags', optional: true, type: { kind: 'array', of: { kind: 'string' } } },
        { name: 'child', optional: true, type: { kind: 'option', of: { kind: 'typeRef', to: 'childConfig' } } },
    ] })
    ok(reclaimable(old, live), 'RECLAIM: wrappers around modelled inner types still match (array<string>, option<ref>)')
}

// 14. [blend #4] a truncated `{` inside a `// ⚪ loose — was `{…` comment must NOT run the brace scan past
//     the record's real `}` and swallow the following declaration's fields.
{
    const body = 'type legendConfig = {\n  item: string, // ⚪ loose — was `{ gap: number; color: { active: Color; fo\n  gap?: float,\n}\ntype nextThing = { x: int, y: int }'
    const old = parseResBody(body)
    ok(old && old.kind === 'record' && old.fields.length === 2 && old.fields[0].name === 'item' && old.fields[0].flagged && old.fields[1].name === 'gap'
        && !old.fields.some((f) => f.name === 'x' || f.name === 'y'),
        'PARSE: an unbalanced `{` in a loose comment stops at the real `}` — next decl NOT swallowed, flag kept (blend #4)')
}

console.log(`\n✅ name-reclaim match: ${pass} assertions hold`)
