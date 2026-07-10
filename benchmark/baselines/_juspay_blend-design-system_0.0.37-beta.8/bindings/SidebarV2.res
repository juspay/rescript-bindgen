type props = {
  ...SidebarV2Types.sidebarV2Props,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SidebarV2"
