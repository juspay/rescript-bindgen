// Three self-contained coverage papercuts from #109, all in the classify pipeline.
type JsxElement = { __brand: 'element' }

// #109.2: `interface X extends Array<T>` (classnames' `ArgumentArray`) IS an array — was silently a
// bogus `{ ...JsxDOM.domProps }` record (prototype methods), losing the array shape. → `array<T>`.
type Argument = string | number
interface ArgumentArray extends Array<Argument> {}
export declare const List: (props: { items: ArgumentArray }) => JsxElement

// #109.6: a NUMERIC index signature `{ [n: number]: V }` was an opaque `JSON.t` — but JS object keys
// are strings at runtime, so it's a `Dict.t<V>` (same as a string index).
interface NumMap { [n: number]: string }
export declare const Grid: (props: { cells: NumMap; label?: string }) => JsxElement

// #109.3: a SYMBOL-keyed prop surfaced as TS's mangled internal name (`@as("__@kSecret@N")`) — a JSX
// attribute that can't exist. It's skipped now, with an ⓘ note; the real props still bind.
declare const kSecret: unique symbol
export declare const Widget: (props: { visible: boolean; [kSecret]?: string }) => JsxElement
