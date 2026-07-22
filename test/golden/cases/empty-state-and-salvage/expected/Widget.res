type props<'a> = {
  className?: CommonTypes.emptyStateAndSalvageClassName,
  formAction?: CommonTypes.emptyStateAndSalvageFormAction<'a>,
  weirdCb?: CommonTypes.emptyStateAndSalvageWeirdCb<'a>,
}

@module("demo")
external make: React.component<props<'a>> = "Widget"
