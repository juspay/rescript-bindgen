// #108 — a prop/value typed as a SPECIFIC enum member (`Size.Sm`, `Mode.A`) must keep its enum
// type, not widen to `string`/`float`. TypeScript flags an enum member as BOTH a string/number
// literal AND enum-like; the const-value literal-widening (#108) is guarded with `!EnumLike` so it
// never swallows an enum member — while a whole-enum prop (`anySize: Size`) and a plain literal
// const stay exactly as before. (Regression guard for the #108 const-value work.)
type JsxElement = { __brand: 'element' }

declare enum Size { Sm = 'sm', Lg = 'lg' }
declare enum Mode { A = 1, B = 2 }

export declare const EnumMember: (props: {
  one: Size.Sm       // string-literal AND enum-like -> keeps the enum, NOT `string`
  two: Mode.A        // number-literal AND enum-like -> keeps the enum, NOT `float`
  anySize: Size      // whole enum -> the enum type
  anyMode: Mode
}) => JsxElement
