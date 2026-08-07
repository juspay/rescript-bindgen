// #183 review — A DEDUP KEY MUST NOT BE AMBIGUOUS.
//
// `entrySig` used to build its key by concatenating SOURCE values with the very characters those
// values can contain (`|`, `,`, `=`, `#`). A polyvar tag set is the sharpest case:
//
//     ['a|b','c','d','e'].join('|')  ===  ['a','b|c','d','e'].join('|')   // both "a|b|c|d|e"
//
// Two DIFFERENT unions therefore hashed alike, and since the signature IS the dedup key the second
// was redirected to the first's module — i.e. to `from*` constructors accepting the WRONG literals.
// Measured on this fixture with the old encoding: `module SetTwo` disappeared and `two` became
//
//     two?: CaseTypes.SetOne.t   // fromTag: [#"a|b" | #"c" | #"d" | #"e"]
//
// so `#"b|c"` (valid per the TS) is rejected while `#"a|b"` (not in SetTwo at all) is accepted.
// `JSON.stringify` over structured arrays escapes the separators, so no source value can forge a
// boundary. Both modules must survive, each with its own tag set.
//
// WHY THE SEED LINE IS LOAD-BEARING: TS orders union members by type ID, i.e. by FIRST ENCOUNTER
// across the program — so the naive arrangement of these two unions serializes them differently
// (`a|b|c|d|e` vs `d|e|a|b|c`) and the collision never triggers. `Seed` interns the literals in the
// order that makes both unions sort into the colliding sequence:
//     'a|b'(1) 'a'(2) 'c'(3) 'b|c'(4) 'd'(5) 'e'(6)
//   SetOne sorts a|b, c, d, e ;  SetTwo sorts a, b|c, d, e ;  both join to "a|b|c|d|e".
// Remove or reorder `Seed` and this fixture silently stops testing anything.
type JsxElement = { __brand: 'element' }

interface Alpha { a: string }
interface Beta { b: number }

type Seed = 'a|b' | 'a' | 'c' | 'b|c' | 'd' | 'e'

// Two object arms => no @unboxed is possible => opaque views module; >= 4 literals => the literals
// fold into one `fromTag` polyvar arm, which is what carries the tag set into the signature.
type SetOne = 'a|b' | 'c' | 'd' | 'e' | Alpha | Beta
type SetTwo = 'a' | 'b|c' | 'd' | 'e' | Alpha | Beta

export declare const Probe: (props: { seed?: Seed; one?: SetOne; two?: SetTwo }) => JsxElement
