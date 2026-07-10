@module("@juspay/blend-design-system") @react.component
external make: (
  ~foundationTokens: TokensTypes.foundationTokenType=?,
  ~componentTokens: EditorSharedTypes.componentTokenType=?,
  ~breakpoints: BreakpointsTypes.breakpointType=?,
  ~theme: CommonTypes.themeOrString=?,
  ~children: React.element,
  ~target: Dom.element=?,
) => React.element = "ThemeProvider"
