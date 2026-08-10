type props = {
  digit?: string,  // ⚪ loose — was `"2"`
  zero?: string,  // ⚪ loose — was `"0"`
  negative?: [#"-1"],
  decimal?: [#"1.5"],
  leadingZero?: [#"007"],
  exponent?: [#"1e3"],
  hex?: [#"0x1"],
  keyword?: [#"type"],
  keyword2?: [#"open"],
  keyword3?: [#"await"],
  quoted?: string,  // ⚪ loose — was `"say \"hi\""`
  backslash?: string,  // ⚪ loose — was `"C:\\Users"`
  tabbed?: string,  // ⚪ loose — was `"a\tb"`
  underscore?: string,  // ⚪ loose — was `"_"`
  underscorePrefixed?: [#"_blank"],
  empty?: [#""],
  spaced?: [#"a b"],
  unicode?: [#"café"],
}

@module("demo")
external make: React.component<props> = "Edge"
