@module("demo") @react.component
external make: (
  ~t: CallableWithPropertiesTypes.Translator.t,  // ⓘ was callable-with-properties `Translator` — opaque; call via Translator.asFn; props: locale, setLocale
  ~label: string=?,
) => React.element = "Localized"
