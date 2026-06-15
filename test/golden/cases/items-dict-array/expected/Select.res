@module("demo") @react.component
external make: (
  ~items: ItemsDictArrayTypes.valueOrItemsConfigArray<'a>=?,
  ~itemToStringValue: 'b => string=?,
) => React.element = "Select"
