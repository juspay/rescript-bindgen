type props = {
  digit?: string,  // ⚪ loose — was `"2"`
  zero?: string,  // ⚪ loose — was `"0"`
  negative?: [#"-1"],
  decimal?: [#"1.5"],
  keyword?: [#"type"],
  keyword2?: [#"open"],
  keyword3?: [#"to"],
}

@module("demo")
external make: React.component<props> = "Edge"
