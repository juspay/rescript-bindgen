// ⓘ was callable-with-properties `Translator` — opaque; call via Translator.asFn; props: locale, setLocale
@module("demo") external t: CallableWithPropertiesTypes.Translator.t = "t"
// ⓘ was callable-with-properties `Client` — opaque; call via Client.asFn; props: baseUrl, create; ⚠️ property NOT bound (couldn't be typed): debug
@module("demo") external client: CallableWithPropertiesTypes.Client.t = "client"
@module("demo") external stamp: (string) => string = "stamp"
// ⓘ was callable-with-properties `Odd` — opaque; call via Odd.asFn; props: asFn
@module("demo") external odd: CallableWithPropertiesTypes.Odd.t = "odd"
