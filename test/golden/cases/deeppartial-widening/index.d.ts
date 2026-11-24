// #243: `DeepPartial<T>` (and `Partial<T>`) materializes as a fresh record with every field optional.
// TypeScript also accepts a complete `T` wherever `DeepPartial<T>` is expected — that is the documented
// way to theme in blend: take `getButtonTokens(theme)` (a full `ResponsiveButtonTokens`), adjust, and
// pass it to `ThemeProvider.componentTokens` (a `DeepPartial<...>`). But the generated ReScript partial
// is a DISTINCT record type, so without help a consumer `%identity`-casts every component's tokens.
//
// When the full source materialized as its own record (here via `getButtonTokens`'s return), bindgen
// emits a zero-cost `<partial>FromFull: <full> => <partial> = "%identity"` next to the partial. The cast
// then lives ONCE in the generated package, checked against the `.d.ts`, instead of as an untyped
// `'a => 'b` in each consumer. Only the full→partial direction is emitted (it is the only sound one).
// The widening is recovered at every level the partial is a named record, so the NESTED `sm`/`lg` config
// (a `DeepPartial<ButtonTokens>`) gets its own `…FromFull` taking the full `buttonTokens` too.
//
// Soundness is gated on TS assignability + all-fields-optional, so a mapped type that is NOT a widening
// gets nothing: `Required<T>`/`Readonly<T>` are not all-optional, and `{ [P in keyof T]?: () => T[P] }`
// is all-optional but a full `T` is NOT assignable to it.
type DeepPartial<T> = T extends object ? { [P in keyof T]?: DeepPartial<T[P]> } : T
type JsxElement = { __brand: 'element' }

interface ButtonTokens { color: string; size: number }
interface ResponsiveButtonTokens { sm: ButtonTokens; lg: ButtonTokens }

// The FULL type, materialized as its own record via a function return.
export declare function getButtonTokens(theme: string): ResponsiveButtonTokens

// The PARTIAL, via a prop — gets a `…FromFull` taking `responsiveButtonTokens`, and its nested
// `sm`/`lg` config gets one taking `buttonTokens`.
export declare const ThemeProvider: (props: {
    componentTokens?: DeepPartial<ResponsiveButtonTokens>
}) => JsxElement

// NOT a widening: a full `Guard` is not assignable to a mapped type that turns each field into a
// thunk — must get NO `…FromFull`.
interface Guard { a: string; b: number }
export declare const Thunked: (props: {
    fns?: { [K in keyof Guard]?: () => Guard[K] }
}) => JsxElement

export declare function getGuard(): Guard
