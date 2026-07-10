@module("@juspay/blend-design-system") @react.component
external make: (
  ~width: string=?,
  ~height: string=?,
  ~minWidth: string=?,
  ~maxWidth: string=?,
  ~title: string,
  ~titleIcon: React.element=?,
  ~helpIconText: string=?,
  ~subtitle: string=?,
  ~dropdownProps: SingleSelectTypes.singleSelectProps=?,
  ~showBorder: bool=?,
  ~tokens: StatCardV2Types.statCardV2TokensType,
  ~isSmallScreen: bool,
  ~filteredProps: JsxDOM.domProps,
) => React.element = "StatCardV2NoData"
