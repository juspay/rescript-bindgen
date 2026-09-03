// #222 unit tests for the tombstone-reclaim structural match (src/name-reclaim.mjs).
// Each case mirrors one of the 8 real blend-rescript shapes: 7 must reclaim, 1 must refuse, plus the
// load-bearing `{...domProps}`-bag boundary.
import { parseResBody, canonLive, reclaimable, stripCounter, splitCounter } from '../src/name-reclaim.mjs'

let pass = 0
const ok = (cond, msg) => { if (!cond) throw new Error('FAIL: ' + msg); console.log('✓ ' + msg); pass++ }

// stripCounter / splitCounter
ok(stripCounter('stringOrNumber2') === 'stringOrNumber', 'stripCounter drops a trailing counter')
ok(stripCounter('sankeyLink') === 'sankeyLink', 'stripCounter leaves a counter-free name')
ok(splitCounter('chartsHeaderConfig2')?.base === 'chartsHeaderConfig' && splitCounter('foo')?.base === undefined,
    'splitCounter separates base/n and returns null without a counter')

// 1. variant identical (stringOrNumber) — scalar payloads, no @as.
{
    const old = parseResBody('@unboxed type stringOrNumber = Str(string) | Num(float)')
    const live = canonLive({ kind: 'unboxed', members: [{ ctor: 'Str', type: { kind: 'string' } }, { ctor: 'Num', type: { kind: 'number', _float: true } }] })
    ok(reclaimable(old, live), 'RECLAIM: identical @unboxed variant (stringOrNumber)')
}

// 2. constructor rename, identical @as payloads (positionAffinity).
{
    const old = parseResBody('type positionAffinity =\n  | @as(0) LeftPositionAffinity\n  | @as(1) RightPositionAffinity')
    const live = canonLive({ kind: 'enum', members: [{ ctor: 'Left', as: 0 }, { ctor: 'Right', as: 1 }] })
    ok(reclaimable(old, live), 'RECLAIM: ctor renamed but @as payloads identical (positionAffinity)')
}

// 3. record referencing OTHER cluster members that were counter-suffixed (headerConfig).
{
    const old = parseResBody('type chartsHeaderConfig = { padding?: chartsHeaderPaddingConfig2, slots?: chartsHeaderSlotsConfig2 }')
    const live = canonLive({ kind: 'record', fields: [
        { name: 'padding', optional: true, type: { kind: 'typeRef', to: 'chartsHeaderPaddingConfig' } },
        { name: 'slots', optional: true, type: { kind: 'typeRef', to: 'chartsHeaderSlotsConfig' } },
    ] })
    ok(reclaimable(old, live), 'RECLAIM: record refs normalise cluster-wide (headerConfig → paddingConfig/slotsConfig)')
}

// 4. improvement direction: old degraded `string // ⚪ loose`, new structured (legendConfig.dropdown).
{
    const old = parseResBody('type chartsLegendConfig = { dropdown: string /* ⚪ loose */, gap?: float }')
    const live = canonLive({ kind: 'record', fields: [
        { name: 'dropdown', optional: false, type: { kind: 'typeRef', to: 'chartsDropdownConfig' } },
        { name: 'gap', optional: true, type: { kind: 'number', _float: true } },
    ] })
    ok(reclaimable(old, live), 'RECLAIM: old `string`+⚪loose → new structured (legendConfig)')
}

// 5. REFUSE — the domProps-bag trap: old `{...JsxDOM.domProps}` bag, new strict field record.
{
    const old = parseResBody('type dateTimeFormatOptionsLib = { ...JsxDOM.domProps }')
    const live = canonLive({ kind: 'record', fields: [
        { name: 'day', optional: true, type: { kind: 'typeRef', to: 'chartsDay' } },
        { name: 'month', optional: true, type: { kind: 'typeRef', to: 'chartsMonth' } },
    ] })
    ok(!reclaimable(old, live), 'REFUSE: {...domProps} bag never matches a structured record (the trap)')
}

// 6. REFUSE — genuinely different variant payload (stringOrDateTimeFormatOptions: Lib vs Highcharts).
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
    const old = parseResBody('type chartsFoo = { a?: int }')
    const live = canonLive({ kind: 'record', fields: [
        { name: 'a', optional: true, type: { kind: 'number' } },
        { name: 'b', optional: true, type: { kind: 'string' } },
    ] })
    ok(!reclaimable(old, live), 'REFUSE: differing field-NAME set is not a match')
}

// 8. REFUSE — improvement direction does NOT run backwards (old structured → new placeholder).
{
    const old = parseResBody('type chartsBar = { x: chartsPoint }')
    const live = canonLive({ kind: 'record', fields: [{ name: 'x', optional: false, type: { kind: 'unknown', text: 'Foo' } }] })
    ok(!reclaimable(old, live), 'REFUSE: new-side placeholder is not the tolerated direction')
}

// 9. unparseable / non-reclaimable shapes → null → refuse.
ok(parseResBody('type t = SomeOpaque.t') === null || !reclaimable(parseResBody('type t = SomeOpaque.t'), canonLive({ kind: 'record', fields: [] })),
    'REFUSE: an opaque/module body is not a reclaim candidate')

console.log(`\n✅ name-reclaim match: ${pass} assertions hold`)
