@module("@juspay/blend-design-system") @react.component
external make: (
  ~minWidth: string=?,
  ~maxWidth: string=?,
  ~width: string=?,
  ~height: string=?,
  ~title: string,
  ~titleIcon: React.element=?,
  ~helpIconText: string=?,
  ~subtitle: string=?,
  ~dropdownProps: SingleSelectTypes.singleSelectProps=?,
  ~tokens: StatCardV2Types.statCardV2TokensType,
  ~isSmallScreen: bool,
  ~filteredProps: JsxDOM.domProps,
) => React.element = "StatCardV2NoData"
