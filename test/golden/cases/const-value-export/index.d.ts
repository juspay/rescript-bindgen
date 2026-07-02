// #105 — plain exported const VALUES (no call signature) bind as typed
// `@module external <name>: <type> = "<jsName>"`, reusing the shared type registry — the same
// path React.Context values already take. Previously they fell into the silent
// "skipped non-component" bucket (blend's `FOUNDATION_THEME`, `DEFAULT_POSITION`, …).
//
//   - THEME_TOKENS   a SCREAMING_SNAKE const with a clean record type
//                    -> `external themeTokens: constValueExportTHEMETOKENSConfig = "THEME_TOKENS"`
//                       (SCREAMING_SNAKE id → camelCase, original JS name in the `= "…"`)
//   - defaultConfig  a lowercase const with a named interface type -> `external defaultConfig: settings`
//   - VERSION        a primitive const -> `external version: string = "VERSION"`
//   - opaqueValue    typed by an unresolvable vendor type -> stays SKIPPED (flag-don't-fake:
//                    an unmodellable value never becomes a bogus binding)
//   - a DEFAULT-export const (`export default LIMITS`) -> binds via `= "default"` with the
//                    declaration's own name as the ReScript id (the de-aliased symbol of a
//                    default/re-exported const often has NO valueDeclaration — the branch gates
//                    on SymbolFlags.Value + the declarations[0] fallback, not valueDeclaration).
type JsxElement = { __brand: 'element' }

interface Settings {
  retries: number
  verbose?: boolean
}

export declare const THEME_TOKENS: {
  primary: string
  gap: number
}

export declare const defaultConfig: Settings

export declare const VERSION: string

// vendor type that can't be modelled — the whole value stays skipped, never `external x: string`
export declare const opaqueValue: import('some-untyped-vendor').VendorThing

declare const LIMITS: { min: number; max: number }
export default LIMITS

// a component sibling proves values don't disturb the component pipeline
export declare const Widget: (props: { label: string }) => JsxElement
