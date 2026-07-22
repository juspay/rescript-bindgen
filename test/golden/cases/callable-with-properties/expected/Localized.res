type props = {
  t: CallableWithPropertiesTypes.Translator.t,  // ⓘ was callable-with-properties `Translator` — opaque; call via Translator.asFn; props: locale, setLocale
  label?: string,
}

@module("demo")
external make: React.component<props> = "Localized"
