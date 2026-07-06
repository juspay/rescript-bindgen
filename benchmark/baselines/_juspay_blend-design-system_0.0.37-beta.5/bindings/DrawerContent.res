@module("@juspay/blend-design-system") @react.component
external make: (
  ~children: React.element,
  ~className: string=?,
  ~style: JsxDOM.style=?,
  @as("aria-label") ~ariaLabel: string=?,
  @as("aria-describedby") ~ariaDescribedby: string=?,
  ~fullScreen: bool=?,
  ~direction: DateRangePickerTypes.dateRangePickerDateRangePickerPopoverConfigSide=?,
  ~showHandle: bool=?,
  ~handle: React.element=?,
  ~hasSnapPoints: bool=?,
  ~contentDriven: bool=?,
  ~width: CommonTypes.stringOrNumber=?,
  ~maxWidth: CommonTypes.stringOrNumber=?,
  ~offSet: CommonTypes.stringOrNumber=?,
  ~mobileOffset: DrawerTypes.drawerMobileOffsetConfig=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "DrawerContent"
