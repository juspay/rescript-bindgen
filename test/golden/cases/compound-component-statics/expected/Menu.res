type props = {
  @as("open") open_?: bool,
}

@module("demo")
external make: React.component<props> = "Menu"

// Compound statics — zero-cost aliases; use <Menu.Divider />
module Divider = MenuDivider
module Item = MenuItem
