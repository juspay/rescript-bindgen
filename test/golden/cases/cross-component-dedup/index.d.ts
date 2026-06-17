// Per-home structural dedup (#61 follow-up). Two components each declare an inline config of
// the SAME shape. An anonymous `{…}` has no declaration file, so it's homed to whichever
// component builds it first; merging identical shapes ACROSS components pinned the canonical
// to that arbitrary module and drew processing-order cross-edges that fused dozens of
// unrelated component modules into ONE giant SCC (`HighchartsSharedTypes` held 2409/2578 types
// for @juspay/blend). Structural dedup is now scoped per home module:
//   - Widget's `{width,height}` config lives in WidgetTypes; Gadget's identical one lives in
//     GadgetTypes — NOT merged (each component keeps its own copy, as the library declares it).
//   - WITHIN Widget, two props of the same shape (`badge`/`icon`) still collapse to one config.
//   - A named interface that lowercases to a pervasive builtin (`Option`) is suffixed
//     (`option2`) so the emitted type can't shadow the builtin `option`.
export { Widget } from './components/Widget/Widget'
export { Gadget } from './components/Gadget/Gadget'
