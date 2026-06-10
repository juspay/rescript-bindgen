@module("@juspay/blend-design-system") @react.component
external make: (
  ~foundationTokens: TokensTypes.foundationTokenType=?,
  ~componentTokens: ContextMultiSelectV2Types.componentTokenType=?,
  ~breakpoints: BreakpointsTypes.breakpointType=?,
  ~theme: CommonTypes.themeOrString=?,
  ~children: React.element,
) => React.element = "ThemeProvider"
