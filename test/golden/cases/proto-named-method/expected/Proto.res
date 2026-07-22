type props<'a> = {
  toString?: unit => string,
  hasOwnProperty?: bool,
  onPick?: 'a => unit,  // ⓘ a parameter type could not be modelled — received as a type variable; annotate at the call site
}

@module("demo")
external make: React.component<props<'a>> = "Proto"
