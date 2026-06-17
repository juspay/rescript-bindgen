@module("demo") @react.component
external make: (
  ~items: ItemsDictArrayTypes.valueOrItemsDictArrayItemsConfigArray<'a>=?,
  ~itemToStringValue: 'b => string=?,
) => React.element = "Select"
