@module("demo") @react.component
external make: (
  @as("open") ~open_: bool=?,
) => React.element = "Menu"

// Compound statics — zero-cost aliases; use <Menu.Divider />
module Divider = MenuDivider
module Item = MenuItem
