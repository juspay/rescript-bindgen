type openStringIdiomColor =
  | @as("red") Red
  | @as("blue") Blue
@unboxed type openStringIdiomBrand = OpenStringIdiomBrand(string)
type openStringIdiomDeepConfig = {
  c?: string,  // ⚪ loose — was `"red" | "blue" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; ind`
}
type rec money = {
  toFixed: float => string,
  plus: money => money,
  currency: string,
  amount: float,
}
type charThing = {
  charCodeAt: float => float,
  label: string,
}
@unboxed type stringOrMoney = Str(string) | Money(money)
