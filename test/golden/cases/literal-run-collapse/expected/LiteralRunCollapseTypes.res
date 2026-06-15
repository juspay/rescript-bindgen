type jsxElement = {
  __brand: string,
}
type compClass = {
  render: unit => jsxElement,
}
type compFn = {
  tag: string,
  mount: unit => unit,
}
module WrapperLike = {
  type t
  external fromTag: [#"div" | #"span" | #"section" | #"article" | #"aside" | #"nav"] => t = "%identity"
  external fromCompClass: compClass => t = "%identity"
  external fromCompFn: compFn => t = "%identity"
}
