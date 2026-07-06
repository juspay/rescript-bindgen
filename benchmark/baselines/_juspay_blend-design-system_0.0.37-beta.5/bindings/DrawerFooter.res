@module("@juspay/blend-design-system") @react.component
external make: (
  ~children: React.element,
  ~className: string=?,
  ~direction: DateRangePickerTypes.dateRangePickerDateRangePickerPopoverConfigSide=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "DrawerFooter"
