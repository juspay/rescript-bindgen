type props = {
  foundationTokens?: TokensTypes.foundationTokenType,
  componentTokens?: MultiSelectV2SharedTypes.componentTokenType,
  breakpoints?: BreakpointsTypes.breakpointType,
  theme?: CommonTypes.themeOrString,
  children: React.element,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "ThemeProvider"
