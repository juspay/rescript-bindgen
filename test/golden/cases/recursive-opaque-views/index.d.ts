// #173 — THE REGISTER-EARLY INVARIANT for `opaqueUnion`, and the compile break that proved it was
// missing. A SELF-REFERENTIAL union whose binding is the opaque-views module re-enters `opaqueUnion`
// from inside its own arm. `opaqueUnion` used to register its entry LAST, so the re-entry saw no
// entry for that `type.id` and built a SECOND one — two entries for one type, two `uniqueName`s
// (`Poisoned` and `Poisoned2`), `byKey` left pointing at the last writer, and the earlier writer's
// refs dangling at a name nothing declares:
//
//     children: array<Poisoned.t>,   // <- emitted
//     module Poisoned2 = { … }       // <- but this is the module
//     => "The module or file Poisoned can't be found." — the generated file did NOT compile.
//
// Registering before the member build makes the entry the CYCLE GUARD (the rule `recordNode` always
// followed and `tagVariantNode` adopted in #170): one entry, one name, every reference consistent —
// including the self-reference, which resolves to the hoisted forward type (`poisoned_t`) that lets a
// module participate in a `type rec` group (#110).
//
// Verified pre-existing: v1.3.0 emitted the identical non-compiling output; 1.4.0-beta.0 hid it by
// crashing earlier (#170). Both arms carry `children`, so the shape is a genuine cycle through the
// module in BOTH directions.
type JsxElement = { __brand: 'element' }

type Poisoned =
    | { kind: 'ok'; children: Poisoned[] }
    | { kind: 'bad'; children: Poisoned[]; payload: any }

// A CLEAN self-referential union that also lands on the views module — no `any`, and no string
// discriminant to make it a `@tag` variant (the tags here are numbers), so it exercises the same
// cycle on the SUCCESS path: one module, one name, `from*`/`as*` per arm.
type Shape =
    | { sides: 0; radius: number; nested: Shape[] }
    | { sides: 4; side: number; nested: Shape[] }

// `roots` (ARRAY position) is what actually reaches `opaqueUnion`, and therefore what exercises #173.
// `root` (PROP position) widens to a flagged `string` and never touches the module (#181), so it is
// NOT the load-bearing half of this fixture — keep the array prop, or the case can stop testing the
// cycle guard without any golden changing to say so.
export declare const Poison: (props: { root?: Poisoned; roots?: Poisoned[] }) => JsxElement
export declare const Shapes: (props: { shape?: Shape }) => JsxElement

// CROSS-COMPONENT re-entry (#174 review, the reviewer's P4 probe): the SAME self-referential union
// consumed by TWO components. Registering last produced `nested: array<Shape2.t>` beside only
// `module Shape22` — a second duplicate on top of the first, and again non-compiling. Included
// because one component alone does not exercise a second consumer arriving after the first
// registration, and the golden suite is the only place that would catch it.
// NB `list` is what gives this teeth: at PROP position the union widens to a flagged `string` and
// never reaches the module (see #181), so `other?: Shape` alone would pass with or without the fix.
// The ARRAY position is the discriminating one — on main this emits `array<Shape.t>` in a component
// file while the Types module is named `Shape2`.
export declare const ShapesToo: (props: { other?: Shape; list?: Shape[] }) => JsxElement
