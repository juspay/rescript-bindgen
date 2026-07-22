type props<'a, 'b> = {
  items?: ItemsDictArrayTypes.valueOrItemsDictArrayItemsConfigArray<'a>,
  itemToStringValue?: 'b => string,
}

@module("demo")
external make: React.component<props<'a, 'b>> = "Select"
