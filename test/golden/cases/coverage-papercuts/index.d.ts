// Three self-contained coverage papercuts from #109, all in the classify pipeline.
type JsxElement = { __brand: 'element' }

// #109.2: `interface X extends Array<T>` (classnames' `ArgumentArray`) IS an array — was silently a
// bogus `{ ...JsxDOM.domProps }` record (prototype methods), losing the array shape. → `array<T>`.
type Argument = string | number
interface ArgumentArray extends Array<Argument> {}
export declare const List: (props: { items: ArgumentArray }) => JsxElement

// #109.2 (rev): a DECLARATION-MERGED Array-extender adds `extra` in a SECOND declaration. The
// "no own members" check reads the resolved property SET (not the first declaration), so `extra`
// is seen and the type keeps its record — the array-flatten must NOT silently drop it.
interface MergedList extends Array<string> {}
interface MergedList { extra: number }
export declare const Merged: (props: { m: MergedList }) => JsxElement

// #144: the hybrid record above must NOT pick up a spurious `...JsxDOM.domProps` — the Array
// prototype methods (`length`/`push`/…) are lib-inherited and misfire the domProps-spread heuristic
// (the same misfire Map/Set are guarded against). It's not a DOM element → record of own fields only.
// And `extends ReadonlyArray<T>` must flatten like `Array<T>` (pure) / keep own fields (hybrid) —
// `isArrayType` is FALSE for ReadonlyArray, so #109.2 missed it.
interface RoList extends ReadonlyArray<string> {}
interface RoHybrid extends ReadonlyArray<number> { label: string }
export declare const Ro: (props: { pure: RoList; hybrid: RoHybrid }) => JsxElement

// #109.6: a NUMERIC index signature `{ [n: number]: V }` was an opaque `JSON.t` — but JS object keys
// are strings at runtime, so it's a `Dict.t<V>` (same as a string index).
interface NumMap { [n: number]: string }
export declare const Grid: (props: { cells: NumMap; label?: string }) => JsxElement

// #109.3: a SYMBOL-keyed prop surfaced as TS's mangled internal name (`@as("__@kSecret@N")`) — a JSX
// attribute that can't exist. It's skipped now, with an ⓘ note; the real props still bind.
declare const kSecret: unique symbol
export declare const Widget: (props: { visible: boolean; [kSecret]?: string }) => JsxElement
