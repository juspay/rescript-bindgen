// ============================================================================
// html-attrs.mjs — invariants for the vendored HTML attribute library.
//
// 1. PIN: the data was generated from the exact @types/react devDependency.
// 2. NO-DUP: no record (canonical or narrowed) ever has two fields with the
//    same ReScript id across its full spread chain — ReScript record spread
//    treats duplicates as a COMPILE ERROR, so this is the library's core
//    invariant (override resolution + narrowing must uphold it).
// 3. Narrowing: removed fields are gone, untouched slices stay shared,
//    variants dedup by removed-set.
//
// Run: node test/html-attrs.mjs   (part of `npm test`)
// ============================================================================
import { readFileSync } from 'fs'
import { join, dirname } from 'path'
import { fileURLToPath } from 'url'
import { ATTR_GROUPS, HTML_ATTRS_PIN } from '../src/html-attrs-data.mjs'
import { planHtmlAttrs, renderFullModule, chainFields, TS_NAME_TO_GROUP } from '../src/html-attrs.mjs'

const ROOT = dirname(dirname(fileURLToPath(import.meta.url)))
const GREEN = (s) => `\x1b[32m${s}\x1b[0m`
const RED = (s) => `\x1b[31m${s}\x1b[0m`

let failed = 0
const check = (name, ok, detail = '') => {
    if (ok) console.log(GREEN(`✓ ${name}`))
    else { console.log(RED(`✗ ${name}${detail ? ' — ' + detail : ''}`)); failed++ }
}

// 1. pin matches the devDependency (regeneration contract)
const pkg = JSON.parse(readFileSync(join(ROOT, 'package.json'), 'utf-8'))
check('pin matches @types/react devDependency', HTML_ATTRS_PIN === `@types/react@${pkg.devDependencies['@types/react']}`,
    `${HTML_ATTRS_PIN} vs ${pkg.devDependencies['@types/react']}`)

// 2. structure sanity
check('hierarchy roots exist', ['ariaAttributes', 'domAttributes', 'htmlAttributes'].every((g) => ATTR_GROUPS[g]))
check('htmlAttributes spreads aria + dom', JSON.stringify(ATTR_GROUPS.htmlAttributes.spreads) === '["ariaAttributes","domAttributes"]')
check('per-element leaves present (button/input/anchor/textarea/select)',
    ['buttonHTMLAttributes', 'inputHTMLAttributes', 'anchorHTMLAttributes', 'textareaHTMLAttributes', 'selectHTMLAttributes'].every((g) => ATTR_GROUPS[g]))
check('TS name lookup', TS_NAME_TO_GROUP.get('ButtonHTMLAttributes') === 'buttonHTMLAttributes')
check('capture-phase handlers included', ATTR_GROUPS.domAttributes.fields.some((f) => f.name === 'onClickCapture'))
check('all 53+ aria fields present', ATTR_GROUPS.ariaAttributes.fields.length >= 53, String(ATTR_GROUPS.ariaAttributes.fields.length))

// 3. NO-DUP invariant: rendered module must never repeat a field id inside one record
function checkNoDups(moduleText, label) {
    const problems = []
    for (const block of moduleText.split(/^type /m).slice(1)) {
        const recName = block.split(' ')[0]
        const ids = new Set()
        // resolve spreads transitively against the module's own records
        const collect = (b) => {
            for (const line of b.split('\n')) {
                const spread = line.match(/^\s+\.\.\.(\w+),/)
                if (spread) {
                    const target = moduleText.split(new RegExp(`^type ${spread[1]} = \\{$`, 'm'))[1]
                    if (target) collect(target.split('\n}')[0])
                    continue
                }
                const field = line.match(/(\w+)\?:/)
                if (field) {
                    if (ids.has(field[1])) problems.push(`${recName}: duplicate id '${field[1]}'`)
                    ids.add(field[1])
                }
            }
        }
        collect(block.split('\n}')[0])
    }
    check(`no duplicate field ids (${label})`, problems.length === 0, problems.slice(0, 3).join('; '))
}
checkNoDups(renderFullModule(), 'full module')

// 4. narrowing semantics
const u1 = { leaf: 'buttonHTMLAttributes', removed: ['style', 'className'] }
const u2 = { leaf: 'buttonHTMLAttributes', removed: ['className', 'style'] }
const u3 = { leaf: 'buttonHTMLAttributes' }
const u4 = { leaf: 'buttonHTMLAttributes', removed: ['not-a-real-attr'] }
const plan = planHtmlAttrs([u1, u2, u3, u4])
const out = plan.render()
check('variant dedup (order-independent removed set)', plan.refFor(u1) === plan.refFor(u2))
check('canonical ref untouched', plan.refFor(u3) === 'buttonHTMLAttributes')
check('non-chain removed keys ignored', plan.refFor(u4) === 'buttonHTMLAttributes')
const narrowedHtml = out.split(/^type htmlAttributesOmit\w+ = \{$/m)[1]?.split('\n}')[0] || ''
check('narrowed slice drops removed fields', narrowedHtml.length > 0 && !/\bstyle\?:/.test(narrowedHtml) && !/\bclassName\?:/.test(narrowedHtml))
check('narrowed slice keeps untouched spreads shared', /\.\.\.ariaAttributes,/.test(narrowedHtml) && /\.\.\.domAttributes,/.test(narrowedHtml))
check('aria/dom slices NOT duplicated for the variant', (out.match(/^type ariaAttributes = \{$/gm) || []).length === 1)
checkNoDups(out, 'narrowed module')

// 5. chain lookup sanity (PR2 will use this for collision detection)
check('chainFields covers inherited attrs', chainFields('buttonHTMLAttributes').has('aria-label') && chainFields('buttonHTMLAttributes').has('onClick') && chainFields('buttonHTMLAttributes').has('disabled'))

if (failed) { console.log(RED(`\n${failed} html-attrs check(s) failed.`)); process.exit(1) }
console.log(GREEN('\n✅ html-attrs library invariants hold'))
