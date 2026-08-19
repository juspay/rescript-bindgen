type props = {
  foundationTokens?: TokensTypes.foundationTokenType,
  componentTokens?: ContextSharedTypes.contextComponentTokensConfig,
  breakpoints?: BreakpointsTypes.breakpointType,
  theme?: CommonTypes.themeOrString,
  children: React.element,
  target?: Dom.element,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "ThemeProvider"
