@@warning("-30")

type rec dateLibOptions = {
  locale?: calLocale,
  timeZone?: string,
}
and localeLabels = {
  labelGrid?: dateLibOptionsLabelGrid,
  labelCell?: dateLibOptionsLabelCell,
}
and calLocale = {
  labels?: localeLabels,
  code: string,
}
@unboxed and dateLibOptionsLabelCell = Str(string) | Fn((string, dateLibOptions) => string)
@unboxed and dateLibOptionsLabelGrid = Str(string) | Fn((string, dateLibOptions) => string)
