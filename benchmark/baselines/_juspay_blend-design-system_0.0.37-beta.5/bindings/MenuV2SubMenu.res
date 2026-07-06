@module("@juspay/blend-design-system") @react.component
external make: (
  ~item: MenuV2Types.menuV2ItemType,
  ~index: int,
  ~maxHeight: string=?,
) => React.element = "MenuV2SubMenu"
