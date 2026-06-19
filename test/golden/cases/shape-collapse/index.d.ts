// Three shape-collapse cases that used to render an ARRAY/OBJECT TS type as a bare `string` — an
// array TS type must become `array<…>`, an object must become a record / DOM-attr spread / opaque
// module; only a genuinely scalar TS type may widen to `string`. (#79, follow-up to #77)
type JsxElement = { __brand: 'element' }

// (3) `Obj | Obj[]` where the object arm is an INTERSECTION (`A & { … }`) — its own `getSymbol()` is
// null, so it used to be dropped from the union's structured arms → `string`. Both arms model, so it
// becomes an opaque module: `from<Rec>` (the object) + `from<Rec>s` (the array).
type Base = { id: string; label: string }
type Dropdown = Base & { position: 'top' | 'bottom' }

export declare function Widget<T extends Record<string, unknown>>(props: {
  // (1) `(keyof T)[]` — an array of keys. A key is a string at runtime → `array<string>` (NOT a flat
  //     `string`; the array must survive). A bare `keyof T` → `string`.
  alwaysSelected?: (keyof T)[] // -> array<string>
  idField?: keyof T // -> string

  // (2) `React.ComponentProps<'div'>` (= DetailedHTMLProps<HTMLAttributes<…>, …>) — all <div> DOM
  //     attributes. The DOM-attribute bag bindgen already models -> JsxDOM.domProps (NOT `string`).
  filteredProps?: import('react').ComponentProps<'div'> // -> JsxDOM.domProps

  // (3) object-or-array-of-object union -> opaque module with `from*` views (NOT `string`).
  dropdown?: Dropdown | Dropdown[] // -> opaque module (fromDropdown / fromDropdowns)
}): JsxElement
