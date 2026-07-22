type props<'a, 'b, 'c> = {
  value?: array<'a>,
  defaultValue?: array<'a>,
  onValueChange?: array<'a> => unit,
  tag?: 'b,
  other?: 'c,
  meta?: AnyToTypevarTypes.widgetMeta,
}

@module("demo")
external make: React.component<props<'a, 'b, 'c>> = "Widget"
