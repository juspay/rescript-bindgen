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
//   - literal consts (`DEFAULT_AVATAR_ALT = "Avatar"`, `MAX_INITIALS_LENGTH = 2`) widen
//                    to their runtime primitive type instead of being skipped (#108)
//   - readonly literal tuples used as const values become arrays (`array<string>`) (#108)
//   - literal fields inside const records widen too (`{ modal: 1000 }` -> `modal: float`)
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

export declare const DEFAULT_AVATAR_ALT = "Avatar"

export declare const MAX_INITIALS_LENGTH = 2

export declare const SELECT_V2_MENU_Z_INDEX = 101

export declare const IS_READY = true

export declare const MENU_SCROLL_SELECTORS: readonly ["[role=option]", "[data-active]"]

export declare const DEFAULT_RANGE: readonly [0, 100]

export declare const Z_INDEX: {
  modal: 1000
  popover: 900
}

export declare const CONST_LABELS: {
  small: "sm"
  large: "lg"
  enabled: true
}

// vendor type that can't be modelled — the whole value stays skipped, never `external x: string`
export declare const opaqueValue: import('some-untyped-vendor').VendorThing

declare const LIMITS: { min: number; max: number }
export default LIMITS

// a component sibling proves values don't disturb the component pipeline
export declare const Widget: (props: { label: string }) => JsxElement
