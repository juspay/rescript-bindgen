// ============================================================================
// dangling-refs.mjs — unit test for the post-emit dangling-reference guard (#202).
//
// The guard is validated for ZERO false positives against every golden + benchmark
// baseline by the golden/benchmark suites themselves (they hard-fail on any flag).
// This file pins the other half of the contract: it TRIPS on the exact failure modes
// that shipped four times (a dropped file-module type; an orphaned `JsFn.t`), and it
// stays silent on the legitimate shapes that look superficially similar (external
// modules, intra-file nested modules, decorated / `rec` declarations).
//
// Run:  node test/dangling-refs.mjs
// ============================================================================
import { findDanglingRefs } from '../src/validate.mjs'
import { GREEN, RED } from './lib/diff.mjs'

let failed = 0
function check(label, files, expect /* fn(problems)->bool */, describe) {
    const problems = findDanglingRefs(files)
    if (expect(problems)) {
        console.log(GREEN(`✓ ${label}`))
    } else {
        failed++
        console.log(RED(`✗ ${label} — ${describe}`))
        problems.forEach((p) => console.log('    ' + p))
        if (!problems.length) console.log('    (no problems reported)')
    }
}
const none = (p) => p.length === 0
const some = (re) => (p) => p.some((x) => re.test(x))

// --- TRIPS: a dropped file-module type (the #195 / #197-review class) ---------
check(
    'dangling type ref into a file-module',
    [
        ['Foo.res', 'type props = {size: FooTypes.gone}\n'],
        ['FooTypes.res', 'type kept = string\n'],
    ],
    (p) => p.length === 1 && /FooTypes\.gone/.test(p[0]),
    'should flag FooTypes.gone (FooTypes declares only `kept`)',
)

// --- TRIPS: orphaned JsFn.t with no JsFn.res (the #197 class) ------------------
check(
    'orphaned JsFn.t with no JsFn.res',
    [['Rec.res', '@set_index external set: (t, string, JsFn.t) => unit = ""\n']],
    (p) => p.length === 1 && /JsFn\.t/.test(p[0]),
    'should flag JsFn.t when no JsFn.res emitted',
)

// --- SILENT: JsFn.t is fine once JsFn.res is emitted --------------------------
check(
    'JsFn.t resolves when JsFn.res is present',
    [
        ['Rec.res', '@set_index external set: (t, string, JsFn.t) => unit = ""\n'],
        ['JsFn.res', 'type t\n'],
    ],
    none,
    'JsFn.res present -> no flag',
)

// --- SILENT: external modules are never ours to check -------------------------
check(
    'external modules (React/JSON/Dict/Dom/ReactEvent) never flag',
    [['C.res', 'type p = {a: React.element, b: JSON.t, c: Dict.t<string>, d: Dom.element, e: ReactEvent.Mouse.t}\n']],
    none,
    'externals are not in the written set',
)

// --- SILENT: intra-file nested module is resolved by ReScript scoping ----------
check(
    'intra-file nested-module ref is not checked',
    [['HighchartsSharedTypes.res', 'module ColorType = {\n  type t = string\n}\ntype series = {color: ColorType.t}\n']],
    none,
    'ColorType is a nested module (not a file) -> skipped',
)

// --- SILENT: decorated + rec declarations register their names ----------------
check(
    'decorated (@unboxed/@tag) and `rec` declarations resolve',
    [
        ['A.res', 'type p = {x: BTypes.stringOrNumber, y: BTypes.node, z: BTypes.tagged}\n'],
        ['BTypes.res', '@unboxed type stringOrNumber = Str(string) | Num(float)\ntype rec node = {next?: node}\n@tag("kind") type tagged = | A | B\n'],
    ],
    none,
    'decorator/rec forms must be collected as declared names',
)

// --- SILENT: the FIRST @unboxed/variant arm (no leading `|`) is collected ------
// (review P2: an under-collected first constructor would invent a false positive on
//  a cross-module `Mod.FirstArm` reference.)
check(
    'first constructor arm (no leading pipe) is a declared name',
    [
        ['M.res', '@unboxed type u = Str(string) | Num(float)\n'],
        ['U.res', 'let z = M.Str("a")\nlet w = M.Num(1.0)\n'],
    ],
    none,
    'both Str (first arm) and Num must be collected',
)

// --- SILENT: a `//` inside a string must not eat the rest of the line ----------
// (review P2: line-comment stripping ordered before string stripping was a false positive.)
check(
    'line-comment marker inside a string does not swallow a declaration',
    [
        ['A.res', '@module("http://cdn/x") external realThing: int = "realThing"\n'],
        ['User.res', 'let x = A.realThing\n'],
    ],
    none,
    'A.realThing is a real external; the // in the URL must not hide it',
)

// --- SILENT: nested block comments are fully masked ----------------------------
// (review P3: a non-greedy block-comment strip leaked the tail after an inner close.)
check(
    'nested block comments do not leak a ref',
    [['A.res', '/* outer /* inner */ Gone.here is still comment */\ntype t = int\n']],
    none,
    'Gone.here lives inside a nested comment -> not a reference',
)

// --- SILENT: a valid cross-file type ref resolves -----------------------------
check(
    'valid cross-file type ref resolves',
    [
        ['Widget.res', 'type props = {h: CommonTypes.stringOrNumber}\n'],
        ['CommonTypes.res', '@unboxed type stringOrNumber = Str(string) | Num(float)\n'],
    ],
    none,
    'CommonTypes.stringOrNumber is declared',
)

// --- SILENT: reference living only inside a string/comment is ignored ----------
check(
    'refs inside strings/comments are ignored',
    [['A.res', '// see FooTypes.gone for history\n@module("Pkg.Sub") external x: int = "x"\ntype t = int\n']],
    none,
    'stripNoise removes comment + string module-looking tokens',
)

if (failed) {
    console.log(RED(`\n${failed} dangling-ref test(s) failed.`))
    process.exit(1)
}
console.log(GREEN('\n✅ all dangling-ref guard tests pass'))
