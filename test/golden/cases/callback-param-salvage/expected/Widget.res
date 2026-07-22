type props<'a> = {
  onPick?: ('a, string) => unit,  // ⓘ a parameter type could not be modelled — received as a type variable; annotate at the call site
  onBadReturn?: string,  // ⚪ loose — was `(x: string) => Weird`
  onClean?: string => unit,
}

@module("demo")
external make: React.component<props<'a>> = "Widget"
