type props = {
  ...StyledConcreteSignatureTypes.tabsProps,
  @as("as") as_?: string,
  forwardedAs?: string,
}

@module("demo")
external make: React.component<props> = "StyledTabs"
