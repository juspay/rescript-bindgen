type props = {
  badge?: WidgetTypes.widgetBadgeConfig,
  icon?: WidgetTypes.widgetBadgeConfig,
  choice?: WidgetTypes.option2,
}

@module("demo")
external make: React.component<props> = "Widget"
