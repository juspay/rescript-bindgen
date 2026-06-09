@@warning("-30")

type rec dateLibOptions = {
  locale?: calLocale,
  timeZone?: string,
}
and localeLabels = {
  labelGrid?: labelGrid,
  labelCell?: labelCell,
}
and calLocale = {
  labels?: localeLabels,
  code: string,
}
@unboxed and labelCell = Str(string) | Fn((string, dateLibOptions) => string)
@unboxed and labelGrid = Str(string) | Fn((string, dateLibOptions) => string)
