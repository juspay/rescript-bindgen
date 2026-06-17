@module("demo") @react.component
external make: (
  ~badge: WidgetTypes.widgetBadgeConfig=?,
  ~icon: WidgetTypes.widgetBadgeConfig=?,
  ~choice: WidgetTypes.option2=?,
) => React.element = "Widget"
