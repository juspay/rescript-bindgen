// Callable-with-properties (#103) — i18next's `t`, axios instances, framer-motion's `motion`:
// the value is a function AND an object. A bare arrow type would silently drop the object side
// (the old behavior: `t` bound as `string => string`, `locale`/`setLocale` gone unflagged).
// Modelled as an opaque module: a zero-cost `asFn` call view (`%identity`, the sanctioned `as*`
// accessor form) plus runtime-real `@get`/`@send` accessors per carried property.
type JsxElement = { __brand: 'element' }

// i18next's `t` shape: callable + data prop + method.
export interface Translator {
  (key: string): string
  locale: string
  setLocale(l: string): void
}

// EXPORT level: previously flattened to `(string) => string` by the function branch;
// now binds as a typed VALUE referencing the shared callable module.
export declare const t: Translator

// axios-instance shape: a method returning the SAME callable type must resolve through the
// registry cache (`create: (t, string) => t`), not recurse; a property that can't be typed
// (`debug: any`) is dropped from the module but NAMED in the ⚠️ note — flagged, never faked.
export interface Client {
  (url: string): Promise<string>
  baseUrl: string
  create(baseUrl: string): Client
  debug: any
}
export declare const client: Client

// PROP level: the same shared `Translator` module, referenced qualified, with the ⓘ note.
export declare const Localized: (props: { t: Translator, label?: string }) => JsxElement

// A PHANTOM BRAND marker (i18next's `TFunction.$TFunctionBrand`) is compile-time-only —
// `$`-prefixed and/or typed `never`, it cannot exist at runtime — and must NOT count as a
// carried property: `stamp` stays a plain positional function binding.
export interface Stamp {
  (value: string): string
  $stampBrand: never
}
export declare const stamp: Stamp

// A carried property whose sanitized ReScript id COLLIDES with the `asFn` signature view keeps
// BOTH bindings: the view stays `asFn`, the property disambiguates to `asFn2` while its
// `= "asFn"` JS-name string keeps the real property — nothing is silently skipped.
export interface Odd {
  (x: string): string
  asFn: string
}
export declare const odd: Odd
