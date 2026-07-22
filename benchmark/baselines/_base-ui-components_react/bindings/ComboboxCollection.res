type props<'a> = {
  children: ('a, float) => React.element,
}

@module("@base-ui-components/react") @scope("Autocomplete")
external make: React.component<props<'a>> = "Collection"
