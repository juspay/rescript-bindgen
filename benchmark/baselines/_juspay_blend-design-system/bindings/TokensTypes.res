type tokensFoundationTokenTypeShadowsConfig = {
  xs: string,
  sm: string,
  md: string,
  lg: string,
  xl: string,
  @as("2xl") _2xl: string,
  full: string,
  focusPrimary: string,
  focusError: string,
}
type tokensFoundationTokenTypeBorderWidthConfig = {
  @as("0") _0: string,
  @as("1") _1: string,
  @as("1.5") _1_5: string,
  @as("2") _2: string,
  @as("3") _3: string,
  @as("4") _4: string,
}
type tokensFoundationTokenTypeBorderRadiusConfig = {
  @as("0") _0: string,
  @as("2") _2: string,
  @as("4") _4: string,
  @as("6") _6: string,
  @as("8") _8: string,
  @as("10") _10: string,
  @as("12") _12: string,
  @as("16") _16: string,
  @as("20") _20: string,
  full: string,
}
type tokensFoundationTokenTypeBorderConfig = {
  width: tokensFoundationTokenTypeBorderWidthConfig,
  radius: tokensFoundationTokenTypeBorderRadiusConfig,
}
type tokensFoundationTokenTypeFontFamilyConfig = {
  display: string,
  body: string,
  heading: string,
  mono: string,
}
type tokensFoundationTokenTypeFontWeightConfig = {
  @as("100") _100: string,
  @as("200") _200: string,
  @as("300") _300: string,
  @as("400") _400: string,
  @as("500") _500: string,
  @as("600") _600: string,
  @as("700") _700: string,
  @as("800") _800: string,
  @as("900") _900: string,
}
type tokensFoundationTokenTypeFontLetterSpacingConfig = {
  compressed: string,
  condensed: string,
  normal: string,
  expanded: string,
  extended: string,
}
type tokensFoundationTokenTypeFontFontSizeConfig = {
  @as("10") _10: string,
  @as("12") _12: string,
  @as("14") _14: string,
  @as("16") _16: string,
  @as("18") _18: string,
  @as("20") _20: string,
  @as("24") _24: string,
  @as("28") _28: string,
  @as("32") _32: string,
  @as("36") _36: string,
  @as("40") _40: string,
  @as("44") _44: string,
  @as("48") _48: string,
  @as("52") _52: string,
  @as("56") _56: string,
  @as("60") _60: string,
  @as("64") _64: string,
  @as("68") _68: string,
  @as("72") _72: string,
  @as("76") _76: string,
  @as("80") _80: string,
  @as("84") _84: string,
  @as("88") _88: string,
  @as("92") _92: string,
  @as("96") _96: string,
  @as("100") _100: string,
}
type tokensFoundationTokenTypeFontLineHeightConfig = {
  @as("12") _12: string,
  @as("14") _14: string,
  @as("16") _16: string,
  @as("18") _18: string,
  @as("20") _20: string,
  @as("24") _24: string,
  @as("28") _28: string,
  @as("32") _32: string,
  @as("36") _36: string,
  @as("40") _40: string,
  @as("44") _44: string,
  @as("48") _48: string,
  @as("52") _52: string,
  @as("56") _56: string,
  @as("60") _60: string,
  @as("64") _64: string,
  @as("68") _68: string,
  @as("72") _72: string,
  @as("76") _76: string,
  @as("80") _80: string,
  @as("84") _84: string,
  @as("88") _88: string,
  @as("92") _92: string,
  @as("96") _96: string,
  @as("100") _100: string,
}
type tokensFoundationTokenTypeFontSizeBodyXsConfig = {
  fontSize: string,
  lineHeight: string,
  letterSpacing: string,
}
type tokensFoundationTokenTypeFontSizeBodyConfig = {
  xs: tokensFoundationTokenTypeFontSizeBodyXsConfig,
  sm: tokensFoundationTokenTypeFontSizeBodyXsConfig,
  md: tokensFoundationTokenTypeFontSizeBodyXsConfig,
  lg: tokensFoundationTokenTypeFontSizeBodyXsConfig,
}
type tokensFoundationTokenTypeFontSizeHeadingConfig = {
  sm: tokensFoundationTokenTypeFontSizeBodyXsConfig,
  md: tokensFoundationTokenTypeFontSizeBodyXsConfig,
  lg: tokensFoundationTokenTypeFontSizeBodyXsConfig,
  xl: tokensFoundationTokenTypeFontSizeBodyXsConfig,
  @as("2xl") _2xl: tokensFoundationTokenTypeFontSizeBodyXsConfig,
}
type tokensFoundationTokenTypeFontSizeDisplayConfig = {
  sm: tokensFoundationTokenTypeFontSizeBodyXsConfig,
  md: tokensFoundationTokenTypeFontSizeBodyXsConfig,
  lg: tokensFoundationTokenTypeFontSizeBodyXsConfig,
  xl: tokensFoundationTokenTypeFontSizeBodyXsConfig,
}
type tokensFoundationTokenTypeFontSizeCodeConfig = {
  sm: tokensFoundationTokenTypeFontSizeBodyXsConfig,
  md: tokensFoundationTokenTypeFontSizeBodyXsConfig,
  lg: tokensFoundationTokenTypeFontSizeBodyXsConfig,
}
type tokensFoundationTokenTypeFontSizeConfig = {
  base: string,
  body: tokensFoundationTokenTypeFontSizeBodyConfig,
  heading: tokensFoundationTokenTypeFontSizeHeadingConfig,
  display: tokensFoundationTokenTypeFontSizeDisplayConfig,
  code: tokensFoundationTokenTypeFontSizeCodeConfig,
}
type tokensFoundationTokenTypeFontConfig = {
  family: tokensFoundationTokenTypeFontFamilyConfig,
  weight: tokensFoundationTokenTypeFontWeightConfig,
  letterSpacing: tokensFoundationTokenTypeFontLetterSpacingConfig,
  fontSize: tokensFoundationTokenTypeFontFontSizeConfig,
  lineHeight: tokensFoundationTokenTypeFontLineHeightConfig,
  size: tokensFoundationTokenTypeFontSizeConfig,
}
type tokensFoundationTokenTypeOpacityConfig = {
  @as("0") _0: string,
  @as("5") _5: string,
  @as("10") _10: string,
  @as("20") _20: string,
  @as("30") _30: string,
  @as("40") _40: string,
  @as("50") _50: string,
  @as("60") _60: string,
  @as("70") _70: string,
  @as("80") _80: string,
  @as("90") _90: string,
  @as("100") _100: string,
}
type tokensFoundationTokenTypeUnitConfig = {
  @as("0") _0: string,  // ⚪ loose — was `UnitType`
  @as("0.5") _0_5: string,  // ⚪ loose — was `UnitType`
  @as("1") _1: string,  // ⚪ loose — was `UnitType`
  @as("1.5") _1_5: string,  // ⚪ loose — was `UnitType`
  @as("2") _2: string,  // ⚪ loose — was `UnitType`
  @as("3") _3: string,  // ⚪ loose — was `UnitType`
  @as("4") _4: string,  // ⚪ loose — was `UnitType`
  @as("5") _5: string,  // ⚪ loose — was `UnitType`
  @as("6") _6: string,  // ⚪ loose — was `UnitType`
  @as("7") _7: string,  // ⚪ loose — was `UnitType`
  @as("8") _8: string,  // ⚪ loose — was `UnitType`
  @as("9") _9: string,  // ⚪ loose — was `UnitType`
  @as("10") _10: string,  // ⚪ loose — was `UnitType`
  @as("12") _12: string,  // ⚪ loose — was `UnitType`
  @as("14") _14: string,  // ⚪ loose — was `UnitType`
  @as("15") _15: string,  // ⚪ loose — was `UnitType`
  @as("16") _16: string,  // ⚪ loose — was `UnitType`
  @as("18") _18: string,  // ⚪ loose — was `UnitType`
  @as("18.5") _18_5: string,  // ⚪ loose — was `UnitType`
  @as("20") _20: string,  // ⚪ loose — was `UnitType`
  @as("22") _22: string,  // ⚪ loose — was `UnitType`
  @as("24") _24: string,  // ⚪ loose — was `UnitType`
  @as("28") _28: string,  // ⚪ loose — was `UnitType`
  @as("32") _32: string,  // ⚪ loose — was `UnitType`
  @as("36") _36: string,  // ⚪ loose — was `UnitType`
  @as("40") _40: string,  // ⚪ loose — was `UnitType`
  @as("48") _48: string,  // ⚪ loose — was `UnitType`
  @as("52") _52: string,  // ⚪ loose — was `UnitType`
  @as("56") _56: string,  // ⚪ loose — was `UnitType`
  @as("64") _64: string,  // ⚪ loose — was `UnitType`
  @as("80") _80: string,  // ⚪ loose — was `UnitType`
  @as("100") _100: string,  // ⚪ loose — was `UnitType`
  @as("120") _120: string,  // ⚪ loose — was `UnitType`
  @as("144") _144: string,  // ⚪ loose — was `UnitType`
  auto: string,  // ⚪ loose — was `UnitType`
}
type colorTokensType = {
  gray: Dict.t<string>,
  primary: Dict.t<string>,
  purple: Dict.t<string>,
  orange: Dict.t<string>,
  red: Dict.t<string>,
  green: Dict.t<string>,
  yellow: Dict.t<string>,
}
type tokensFoundationTokenTypeZIndexConfig = {
  @as("0") _0: string,
  @as("9999") _9999: string,
  @as("1000") _1000: string,
  @as("1100") _1100: string,
  @as("1200") _1200: string,
}
type foundationTokenType = {
  shadows: tokensFoundationTokenTypeShadowsConfig,
  border: tokensFoundationTokenTypeBorderConfig,
  font: tokensFoundationTokenTypeFontConfig,
  opacity: tokensFoundationTokenTypeOpacityConfig,
  unit: tokensFoundationTokenTypeUnitConfig,
  colors: colorTokensType,
  zIndex: tokensFoundationTokenTypeZIndexConfig,
}
