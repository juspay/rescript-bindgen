// ============================================================================
// report.mjs — write the human-readable _REPORT.md for a generated set of
// bindings. Pure presentation: it takes the per-component counts and the
// per-prop detail (both produced by emit.report) and renders a markdown
// checklist sorting components into ready / needs-review / broken.
// ============================================================================
import { writeFileSync } from 'fs'

/**
 * Write `_REPORT.md` summarising a batch of generated bindings.
 *
 * @param {string} path     output path for the markdown file
 * @param {string} label    what was generated (e.g. `"some-pkg@1.2.3"` or a file name)
 * @param {Array<{name:string, props:number, enums:number, loose:number, defects:number, review:number}>} rows
 *   one entry per generated component (counts)
 * @param {Array<{name:string, loose:object[], defects:object[], review:object[]}>} reports
 *   per-prop detail, only for components that have something flagged
 * @returns {void}
 */
export function writeReport(path, label, rows, reports) {
    const detailByName = new Map(reports.map((r) => [r.name, r]))
    const byName = (a, b) => a.name.localeCompare(b.name)

    // Three buckets, most-serious wins: broken (has defects) > review > ready.
    const ready = rows.filter((r) => r.defects === 0 && r.review === 0).sort(byName)
    const review = rows.filter((r) => r.defects === 0 && r.review > 0).sort(byName)
    const broken = rows.filter((r) => r.defects > 0).sort(byName)

    const L = []
    L.push(`# Binding report — \`${label}\``)
    L.push(``)
    L.push(`**${rows.length}** components · ✅ **${ready.length}** usable · 🔍 **${review.length}** need review · 🛑 **${broken.length}** broken`)
    L.push(``)

    // ── ✅ USABLE (top) ────────────────────────────────────────
    L.push(`## ✅ Usable`)
    L.push(``)
    L.push(`These compile and every prop is bound type-safely — use them directly.`)
    L.push(`_(n loose)_ = some props widened to \`string\`; they still work, just loosely typed.`)
    L.push(``)
    if (ready.length) {
        for (const r of ready) L.push(`- ${r.name}${r.loose ? `  _(${r.loose} loose)_` : ''}`)
    } else {
        L.push(`_(none)_`)
    }
    L.push(``)

    // ── 🔍 NEEDS REVIEW (middle) ───────────────────────────────
    L.push(`## 🔍 Needs review`)
    L.push(``)
    L.push(`A multi-type prop couldn't be auto-discriminated at runtime (e.g. two object shapes), so an \`@unboxed\` variant won't work and we **refuse to use \`%identity\`/unsafe casts**. The prop is emitted as a \`string\` placeholder with an inline \`// ⚠️ REVIEW\` comment — bind it by hand or fix the type upstream.`)
    L.push(``)
    if (review.length) {
        for (const r of review) {
            const d = detailByName.get(r.name)
            L.push(`### ${r.name}${r.loose ? `  _(${r.loose} loose)_` : ''}`)
            L.push(``)
            L.push(`| Prop | Real TypeScript |`)
            L.push(`|------|-----------------|`)
            for (const x of (d?.review || [])) L.push(`| \`${x.prop}\` | \`${(x.declText || x.tsType || '').replace(/\|/g, '\\|')}\` |`)
            L.push(``)
        }
    } else {
        L.push(`_(none)_`)
        L.push(``)
    }

    // ── 🛑 BROKEN / SERIOUS CHANGES (bottom) ───────────────────
    L.push(`## 🛑 Broken — needs serious component change`)
    L.push(``)
    L.push(`These props resolved to \`unknown\`/\`any\` (usually a generic \`T\`). They're emitted as a placeholder so the file still compiles, but **the props will not work as typed** — they need a concrete type upstream, or generic-binding support.`)
    L.push(``)
    if (broken.length) {
        for (const r of broken) {
            const d = detailByName.get(r.name)
            const extras = []
            if (r.review) extras.push(`also 🔍 ${r.review} to review`)
            if (r.loose) extras.push(`${r.loose} loose`)
            L.push(`### ${r.name}${extras.length ? `  _(${extras.join(', ')})_` : ''}`)
            L.push(``)
            L.push(`| Prop | Real TypeScript | Why it won't work |`)
            L.push(`|------|-----------------|-------------------|`)
            for (const x of (d?.defects || [])) {
                const decl = (x.declText || x.tsType || '').replace(/\|/g, '\\|')
                const why = /\(.*\)\s*=>/.test(x.declText || '')
                    ? "It's a **callback** typed `unknown` → emitted as `string`; passing a string does nothing."
                    : "Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly."
                L.push(`| \`${x.prop}\` | \`${decl}\` | ${why} |`)
            }
            L.push(``)
        }
    } else {
        L.push(`_(none)_ 🎉`)
        L.push(``)
    }

    writeFileSync(path, L.join('\n') + '\n')
}
