// A record field that is `string | <fn>` becomes an object-bearing `@unboxed`, and the fn
// references back into the record's cycle: LocaleLabels → (string|fn @unboxed) → DateLibOptions
// → CalLocale → LocaleLabels. The `@unboxed` therefore sits INSIDE a recursive group — it can't
// be a separate later declaration (forward reference) nor an earlier one (it depends back on the
// records), so it must be folded into the `type rec … and …` group as `@unboxed and …`.
// Two such fields make two `@unboxed` types that both use `Str`/`Fn`, colliding within the group
// → the file gets `@@warning("-30")`. (Reproduces a react-day-picker compile failure.)
type JsxElement = { __brand: 'element' }

interface DateLibOptions {
  locale?: CalLocale          // back-edge that completes the cycle
  timeZone?: string
}
interface CalLocale {
  labels?: LocaleLabels
  code: string
}
interface LocaleLabels {
  labelGrid?: string | ((date: string, opts: DateLibOptions) => string)
  labelCell?: string | ((date: string, opts: DateLibOptions) => string)
}

export declare const Calendar: (props: {
  locale?: CalLocale
  options?: DateLibOptions
}) => JsxElement
