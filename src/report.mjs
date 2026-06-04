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
    const broken = rows.filter((r) => r.defects > 0).map((r) => r.name)
    const needsReview = rows.filter((r) => r.defects === 0 && r.review > 0).map((r) => r.name)
    const clean = rows.filter((r) => r.defects === 0 && r.review === 0)

    const L = []
    L.push(`# Binding report — \`${label}\``)
    L.push(``)
    L.push(`- **${rows.length}** components generated`)
    L.push(`- **${clean.length}** ✅ ready to use (no broken props, no review needed)`)
    L.push(`- **${needsReview.length}** 🔍 need human review (a multi-type prop couldn't be auto-bound)`)
    L.push(`- **${broken.length}** 🛑 have broken props that WON'T WORK${broken.length ? `: ${broken.join(', ')}` : ''}`)
    L.push(``)

    // ── Checklist ──────────────────────────────────────────────
    L.push(`## Components`)
    L.push(``)
    L.push(`\`[x]\` ready · \`[~]\` needs review · \`[ ]\` broken · "(n loose)" = n props widened to \`string\` but still usable`)
    L.push(``)
    for (const r of rows.slice().sort((a, b) => a.name.localeCompare(b.name))) {
        const looseNote = r.loose ? `  _(${r.loose} loose)_` : ''
        if (r.defects > 0) L.push(`- [ ] **${r.name}** — 🛑 ${r.defects} broken${r.review ? `, 🔍 ${r.review} review` : ''}${looseNote}`)
        else if (r.review > 0) L.push(`- [~] **${r.name}** — 🔍 ${r.review} to review${looseNote}`)
        else L.push(`- [x] ${r.name}${looseNote}`)
    }
    L.push(``)

    // ── 🛑 Broken (unknown/any) ────────────────────────────────
    if (broken.length) {
        L.push(`## 🛑 Broken props (won't work as typed)`)
        L.push(``)
        L.push(`Resolved to \`unknown\`/\`any\` (often a generic \`T\`). Emitted as a placeholder so the component compiles, but **these props will not work** — fix them concretely upstream, or add generic support.`)
        L.push(``)
        for (const name of broken) {
            const r = detailByName.get(name)
            if (!r || !r.defects.length) continue
            L.push(`### ${name}`)
            L.push(``)
            L.push(`| Prop | Real TypeScript | Why it won't work |`)
            L.push(`|------|-----------------|-------------------|`)
            for (const d of r.defects) {
                const decl = (d.declText || d.tsType || '').replace(/\|/g, '\\|')
                const why = /\(.*\)\s*=>/.test(d.declText || '')
                    ? "It's a **callback** typed `unknown` → emitted as `string`; passing a string does nothing."
                    : "Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly."
                L.push(`| \`${d.prop}\` | \`${decl}\` | ${why} |`)
            }
            L.push(``)
        }
    }

    // ── 🔍 Needs review (multi-type) ───────────────────────────
    if (needsReview.length) {
        L.push(`## 🔍 Needs human review (multi-type, not auto-discriminable)`)
        L.push(``)
        L.push(`Unions of types we can't tell apart at runtime (e.g. two object shapes), so an \`@unboxed\` variant won't work and we **refuse to use \`%identity\`/unsafe casts**. Emitted as a \`string\` placeholder + an inline \`// ⚠️ REVIEW\` comment. Bind by hand or fix upstream.`)
        L.push(``)
        for (const name of needsReview) {
            const r = detailByName.get(name)
            if (!r || !r.review.length) continue
            L.push(`### ${name}`)
            L.push(``)
            L.push(`| Prop | Real TypeScript |`)
            L.push(`|------|-----------------|`)
            for (const d of r.review) L.push(`| \`${d.prop}\` | \`${(d.declText || d.tsType || '').replace(/\|/g, '\\|')}\` |`)
            L.push(``)
        }
    }

    if (!broken.length && !needsReview.length) {
        L.push(`## 🎉 All clear`)
        L.push(``)
        L.push(`Every prop is bound type-safely (multi-types via \`@unboxed\` variants). Nothing needs fixing.`)
    }
    writeFileSync(path, L.join('\n') + '\n')
}
