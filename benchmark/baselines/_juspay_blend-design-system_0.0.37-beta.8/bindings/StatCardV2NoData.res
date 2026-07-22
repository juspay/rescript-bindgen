type props = {
  width?: string,
  height?: string,
  minWidth?: string,
  maxWidth?: string,
  title: string,
  titleIcon?: React.element,
  helpIconText?: string,
  subtitle?: string,
  dropdownProps?: SingleSelectTypes.singleSelectProps,
  showBorder?: bool,
  tokens: StatCardV2Types.statCardV2TokensType,
  isSmallScreen: bool,
  filteredProps: JsxDOM.domProps,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "StatCardV2NoData"
