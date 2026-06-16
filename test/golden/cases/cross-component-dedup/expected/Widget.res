@module("demo") @react.component
external make: (
  ~badge: WidgetTypes.badgeConfig=?,
  ~icon: WidgetTypes.badgeConfig=?,
  ~choice: WidgetTypes.option2=?,
) => React.element = "Widget"
