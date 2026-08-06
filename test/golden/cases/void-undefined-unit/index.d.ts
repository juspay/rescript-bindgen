// #175 — `void` / `undefined` IS ReScript's `unit`: its runtime value is literally `undefined` (the
// identity the views-module `none` constant already relies on). That mapping was applied in RETURN
// position and for a zero-arg signature, but NOWHERE ELSE — so the same type in any other position
// fell to the salvage/opaque path and came out worse than the exact answer.
type JsxElement = { __brand: 'element' }

// PART A — a `void`/`undefined` PARAMETER was a salvaged type VARIABLE ('a) carrying a
// "could not be modelled" note, which also dragged a spurious `<'a, 'b>` onto `type props` and into
// `React.component<props<'a, 'b>>` — for parameters that carry no information at all. Now `unit`.
// `retVoid` and `noArg` were ALREADY correct; they are here to lock that this fix didn't disturb them.
interface Disposable { dispose(): void }

// PART B — a field declared exactly `undefined` was a `string` placeholder. Not merely loose:
// actively MISLEADING, since it invites a consumer to pass a string where the library requires the
// ABSENCE of a value. This is blend's token idiom — `[CardVariant.CUSTOM]: undefined` marks "this
// variant has no tokens" — 330 fields on blend 0.0.37, its largest single ⚪ group.
type PaddingTokens = {
    default: { x: string; y: string }
    aligned: { x: string; y: string }
    custom: undefined
    optionalNone?: undefined
}

// The real-world shape behind Part A: monaco-editor's event family, re-exported through blend's
// editor surface as `IEvent<void>` — a CALLABLE interface whose listener parameter is `void`.
// 25 fields on blend (`onDidChangeAttached`, `onWillDispose`, `onDidLayout`, …).
interface Event0 { (listener: (e: void) => number, thisArg?: string): Disposable }

// PART C — `T | void` is not `T`: TypeScript accepts `undefined`, so a value-position union needs
// an explicit option layer. A direct record/component property follows bindgen's existing
// `T | undefined` convention and becomes optional; an alias remains a required `option<T>` value.
type MaybeString = string | void
type NestedMaybe = {
    direct: string | void
    aliased: MaybeString
}

// A void param that is NOT the only param must stay a real parameter — `(unit, float) => unit` —
// and must NOT collapse into a zero-arg signature.
export declare const Ed: (props: {
    paramVoid?: (e: void) => number
    paramUndef?: (e: undefined) => number
    voidThenValue?: (e: void, n: number) => void
    retVoid?: (e: number) => void
    noArg?: () => number
    onAttach?: Event0
    tokens?: PaddingTokens
    voidArray?: undefined[]
    directMaybe: string | void
    aliasedMaybe: MaybeString
    optionalAliasedMaybe?: MaybeString
    maybeArray?: MaybeString[]
    maybePromise?: Promise<MaybeString>
    maybeDict?: { [key: string]: MaybeString }
    maybeTuple?: [MaybeString, number]
    nestedMaybe?: NestedMaybe
    callbackMaybe?: (value: string | void) => string | void
    callbackOptionalMaybe?: (value?: MaybeString) => void
    callbackUndefined?: (value: string | undefined) => string | undefined
    callbackNullish?: (value: string | null | void) => string | null | void
    multiMaybe?: () => string | number | void
}) => JsxElement
