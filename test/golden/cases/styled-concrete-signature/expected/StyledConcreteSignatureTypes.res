type styledConcreteSignatureTabsPropsOrientation =
  | @as("horizontal") Horizontal
  | @as("vertical") Vertical
type jsxElement = {
  __brand: [#element],
}
type tabsProps = {
  value?: string,
  onValueChange?: string => unit,
  orientation?: styledConcreteSignatureTabsPropsOrientation,
  children?: jsxElement,
}
