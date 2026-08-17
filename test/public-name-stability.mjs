// Permanent public-name registry contract (#190).
//
// This exercises the real CLI across several generations of the SAME output directory. A generated
// name is an API assignment: shape growth cannot rename it, removed identities stay reserved, a new
// identity takes the suffix, and a reappearing identity recovers its original assignment.
import { execFileSync } from 'child_process'
import { mkdtempSync, readFileSync, rmSync, writeFileSync } from 'fs'
import { dirname, join } from 'path'
import { tmpdir } from 'os'
import { fileURLToPath } from 'url'

const HERE = dirname(fileURLToPath(import.meta.url))
const CLI = join(dirname(HERE), 'src', 'cli.mjs')
const root = mkdtempSync(join(tmpdir(), 'bindgen-public-names-'))
const source = join(root, 'index.d.ts')
const out = join(root, 'generated')
const manifestPath = join(out, '.bindgen-manifest.json')

const sourceText = ({ status = true, newcomer = false, five = false, split = false } = {}) => `
type JsxElement = { __brand: 'element' }
${status ? `export type StatusCode = 100 | 101 | 200 | 201${five ? ' | 500' : ''}` : ''}
${newcomer ? 'export type ConsumerStatusCode = 300 | 301 | 302 | 303 | 304' : ''}
export interface FirstConfig { value: string }
export interface SecondConfig { value: ${split ? 'number' : 'string'} }
export declare const ResponseView: (props: {
  ${status ? 'status?: StatusCode' : ''}
  ${newcomer ? 'consumerStatus?: ConsumerStatusCode' : ''}
  first?: FirstConfig
  second?: SecondConfig
}) => JsxElement
`

function run(shape) {
    writeFileSync(source, sourceText(shape))
    execFileSync('node', [CLI, '--dir', root, '--out', out, '--from', 'demo', '--no-install'], {
        stdio: ['ignore', 'ignore', 'pipe'],
    })
    return JSON.parse(readFileSync(manifestPath, 'utf-8'))
}

// A corrupt manifest must abort generation and be left untouched — never silently reset the
// permanent registry by overwriting it with recomputed names. Returns whether the CLI failed and
// whether the on-disk manifest is byte-identical to what we wrote.
function runExpectingCorruptManifestAbort(manifestText) {
    writeFileSync(source, sourceText({ status: true }))
    writeFileSync(manifestPath, manifestText)
    let failed = false
    try {
        execFileSync('node', [CLI, '--dir', root, '--out', out, '--from', 'demo', '--no-install'], {
            stdio: ['ignore', 'ignore', 'pipe'],
        })
    } catch { failed = true }
    return { failed, preserved: readFileSync(manifestPath, 'utf-8') === manifestText }
}

function rowFor(manifest, sourceName) {
    const marker = `|named:${sourceName}`
    const found = Object.entries(manifest.publicTypes || {}).find(([id]) => {
        const at = id.indexOf(marker)
        if (at < 0) return false
        const next = id[at + marker.length]
        return next == null || next === '<' || next === '|'
    })
    if (!found) throw new Error(`missing registry row for ${sourceName}`)
    return { id: found[0], row: found[1] }
}

function assert(ok, message) {
    if (!ok) throw new Error(message)
    console.log(`✓ ${message}`)
}

try {
    // Bootstrap a normal assignment, then replace it with a sentinel representing a public name
    // written by some prior bindgen release. The next run must consume—not recompute—that assignment.
    let manifest = run({ status: true })
    const initial = rowFor(manifest, 'StatusCode')
    assert(initial.row.name === 'v100OrV101OrV200OrV201', 'the frozen four-member boundary keeps its structural name')
    const firstShared = rowFor(manifest, 'FirstConfig')
    const secondShared = rowFor(manifest, 'SecondConfig')
    assert(firstShared.row.name === secondShared.row.name, 'interchangeable upstream types initially share one declaration')
    const initiallyGeneratedName = initial.row.name
    initial.row.name = 'consumerStatusCode'
    initial.row.module = 'LegacyTypes'
    initial.row.aliases = [...new Set([...(initial.row.aliases || []), initiallyGeneratedName])]
    writeFileSync(manifestPath, JSON.stringify(manifest, null, 2) + '\n')

    manifest = run({ status: true })
    let status = rowFor(manifest, 'StatusCode')
    let output = readFileSync(join(out, `${status.row.module}.res`), 'utf-8')
    assert(status.id === initial.id && status.row.name === 'consumerStatusCode', 'a prior bindgen assignment is reused exactly')
    assert(status.row.module === 'LegacyTypes', 'the prior qualified type module is reused exactly')
    assert(output.includes('@unboxed type consumerStatusCode ='), 'references and declarations use the locked public name')
    assert(readFileSync(join(out, 'ResponseView.res'), 'utf-8').includes('LegacyTypes.consumerStatusCode'), 'consumer references keep the locked qualified name')
    assert(output.includes(`type ${initiallyGeneratedName} = consumerStatusCode`), 'the replaced generated name remains a compatibility alias')

    // Crossing the permanently-frozen large-union threshold changes the preferred rule, but not an
    // identity that already owns a public name.
    manifest = run({ status: true, five: true })
    status = rowFor(manifest, 'StatusCode')
    assert(status.row.name === 'consumerStatusCode', 'member/shape changes do not rename the same upstream identity')

    // Removal deactivates rather than deletes the assignment. A different upstream type requesting
    // that exact source-derived name must take a suffix instead of stealing the tombstone.
    manifest = run({ status: false, newcomer: true })
    status = rowFor(manifest, 'StatusCode')
    const newcomer = rowFor(manifest, 'ConsumerStatusCode')
    assert(status.row.active === false, 'a removed upstream type becomes an inactive tombstone')
    assert(newcomer.row.name === 'consumerStatusCode2', 'a new identity cannot steal a removed identity\'s name')

    manifest = run({ status: true, newcomer: true, five: true })
    status = rowFor(manifest, 'StatusCode')
    assert(status.row.active === true && status.row.name === 'consumerStatusCode', 'a reappearing upstream identity recovers its original name')
    assert(rowFor(manifest, 'ConsumerStatusCode').row.name === 'consumerStatusCode2', 'existing neighboring identities are not renumbered')

    // When formerly interchangeable upstream types diverge, they can no longer share a ReScript
    // declaration. The unchanged side keeps the old shared name; only the upstream-changed side moves.
    manifest = run({ status: true, newcomer: true, five: true, split: true })
    const firstSplit = rowFor(manifest, 'FirstConfig')
    const secondSplit = rowFor(manifest, 'SecondConfig')
    assert(firstSplit.row.name === firstShared.row.name, 'an unchanged identity keeps a formerly shared name after an upstream split')
    assert(secondSplit.row.name !== firstSplit.row.name, 'the upstream-changed half of a deduplicated type receives a new name')

    // A `--from` (scope) change must PRESERVE the other scope's frozen rows — anchors are
    // scope-prefixed, so scopes co-exist. Regenerating the SAME package under a different scope
    // (an innocuous flag/entry difference) must never wipe the original scope's assignments. (#190)
    {
        const scopeOut = join(root, 'scoped')
        const scopeManifest = join(scopeOut, '.bindgen-manifest.json')
        const genScoped = (fromName) => {
            writeFileSync(source, sourceText({ status: true }))
            execFileSync('node', [CLI, '--dir', root, '--out', scopeOut, '--from', fromName, '--no-install'], { stdio: ['ignore', 'ignore', 'pipe'] })
            return JSON.parse(readFileSync(scopeManifest, 'utf-8'))
        }
        genScoped('scopeA')
        const afterB = Object.keys(genScoped('scopeB').publicTypes)
        assert(afterB.some((i) => i.startsWith('scope:scopeA|')), 'a scope change preserves the prior scope\'s rows (not wiped)')
        assert(afterB.some((i) => i.startsWith('scope:scopeB|')), 'the new scope\'s rows are added alongside the old')
        const afterA = Object.keys(genScoped('scopeA').publicTypes)
        assert(afterA.some((i) => i.startsWith('scope:scopeB|')), 'returning to the first scope still preserves the other scope\'s rows')
    }

    // Corrupt manifests must fail loudly and be preserved for diagnosis, NOT silently reset the registry.
    const badJson = runExpectingCorruptManifestAbort('{ this is not valid json')
    assert(badJson.failed, 'unparseable manifest aborts generation instead of resetting the registry')
    assert(badJson.preserved, 'unparseable manifest is left intact on disk for diagnosis')

    const badShape = runExpectingCorruptManifestAbort(
        JSON.stringify({ schemaVersion: 2, scope: 'demo', files: [], publicTypes: [] }, null, 2) + '\n',
    )
    assert(badShape.failed, 'schema-v2 manifest with a non-object publicTypes aborts generation')
    assert(badShape.preserved, 'malformed schema-v2 manifest is left intact on disk for diagnosis')

    // An invalid REGISTRY ROW (e.g. a numeric name) would emit uncompilable `type 42` — reject it.
    const badRow = runExpectingCorruptManifestAbort(
        JSON.stringify({ schemaVersion: 2, scope: 'demo', files: [], publicTypes: { 'scope:demo|x': { name: 42 } } }, null, 2) + '\n',
    )
    assert(badRow.failed, 'schema-v2 row with an invalid name aborts generation')
    assert(badRow.preserved, 'manifest with an invalid registry row is left intact on disk')

    // An UNKNOWN schema version must not be silently rewritten as v2.
    const badVersion = runExpectingCorruptManifestAbort(
        JSON.stringify({ schemaVersion: 99, scope: 'demo', files: [], publicTypes: {} }, null, 2) + '\n',
    )
    assert(badVersion.failed, 'unknown schemaVersion aborts generation instead of being rewritten')
    assert(badVersion.preserved, 'manifest with an unknown schemaVersion is left intact on disk')

    // A lower-case "module" path emits an uncompilable `legacytypes.x` — module segments must be upper-case.
    const badModule = runExpectingCorruptManifestAbort(
        JSON.stringify({ schemaVersion: 2, scope: 'demo', files: [], publicTypes: { 'scope:demo|x': { name: 'x', module: 'legacyTypes' } } }, null, 2) + '\n',
    )
    assert(badModule.failed, 'schema-v2 row with a lower-case module path aborts generation')
    assert(badModule.preserved, 'manifest with an invalid module path is left intact on disk')

    // Rows are validated whenever `publicTypes` is present — even with NO schemaVersion, since those
    // rows still drive name/module assignment (a legacy files-only manifest a user annotated).
    const legacyBadRow = runExpectingCorruptManifestAbort(
        JSON.stringify({ scope: 'demo', files: [], publicTypes: { 'scope:demo|x': { name: 'x', module: 'lower_bad' } } }, null, 2) + '\n',
    )
    assert(legacyBadRow.failed, 'a manifest without schemaVersion but with an invalid row aborts (not silently used)')
    assert(legacyBadRow.preserved, 'that manifest is left intact on disk')

    // A DOTTED module (`Foo.Bar`) would write a file literally named `Foo.Bar.res` — reject it.
    const dottedModule = runExpectingCorruptManifestAbort(
        JSON.stringify({ schemaVersion: 2, scope: 'demo', files: [], publicTypes: { 'scope:demo|x': { name: 'x', module: 'Foo.Bar' } } }, null, 2) + '\n',
    )
    assert(dottedModule.failed, 'schema-v2 row with a dotted module path aborts generation')
    assert(dottedModule.preserved, 'manifest with a dotted module path is left intact on disk')

    // A RESERVED-word leaf name (`type`) would emit an uncompilable `type type = …` — reject it.
    const reservedName = runExpectingCorruptManifestAbort(
        JSON.stringify({ schemaVersion: 2, scope: 'demo', files: [], publicTypes: { 'scope:demo|x': { name: 'type', module: 'CommonTypes' } } }, null, 2) + '\n',
    )
    assert(reservedName.failed, 'schema-v2 row with a reserved-word name aborts generation')
    assert(reservedName.preserved, 'manifest with a reserved-word name is left intact on disk')

    console.log('\n✅ permanent public-name registry invariants hold')
} finally {
    rmSync(root, { recursive: true, force: true })
}
