type selectorV2Size =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type selectorV2GetCheckboxLabelStylesCursor =
  | @as("not-allowed") NotAllowed
  | @as("pointer") Pointer
type checkboxV2CheckedState =
  | @as("checked") Checked
  | @as("unchecked") Unchecked
  | @as("indeterminate") Indeterminate
type selectorV2SwitchV2TokensTypeSwitchHeightConfig = {
  sm: string,
  md: string,
  lg: string,
}
type selectorV2SwitchV2TokensTypeSwitchBackgroundColorConfig = {
  checked: string,  // ⚪ loose — was `{ default: BackgroundColor; hover: BackgroundColor; focus: BackgroundColor; error: BackgroundColor; disabled: `
  unchecked: string,  // ⚪ loose — was `{ default: BackgroundColor; hover: BackgroundColor; focus: BackgroundColor; error: BackgroundColor; disabled: `
}
type selectorV2SwitchV2TokensTypeSwitchThumbConfig = {
  backgroundColor: string,
  border: string,
  width: string,  // ⚪ loose — was `{ sm: Width<number | (string & {})>; md: Width<number | (string & {})>; lg: Width<number | (string & {})>; }`
  height: string,  // ⚪ loose — was `{ sm: Height<number | (string & {})>; md: Height<number | (string & {})>; lg: Height<number | (string & {})>; `
  outline: string,
}
type selectorV2SwitchV2TokensTypeSwitchConfig = {
  height: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  width: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  backgroundColor: selectorV2SwitchV2TokensTypeSwitchBackgroundColorConfig,
  thumb: selectorV2SwitchV2TokensTypeSwitchThumbConfig,
}
type selectorV2SwitchV2TokensTypeContentLabelConfig = {
  gap: string,
  color: string,  // ⚪ loose — was `{ default: Color; hover: Color; focus: Color; error: Color; disabled: Color; }`
  fontSize: string,  // ⚪ loose — was `{ sm: FontSize<number | (string & {})>; md: FontSize<number | (string & {})>; lg: FontSize<number | (string & `
  fontWeight: string,  // ⚪ loose — was `{ sm: FontWeight; md: FontWeight; lg: FontWeight; }`
  lineHeight: string,  // ⚪ loose — was `{ sm: LineHeight<number | (string & {})>; md: LineHeight<number | (string & {})>; lg: LineHeight<number | (str`
  slot: string,  // ⚪ loose — was `{ maxHeight: { sm: MaxHeight<number | (string & {})>; md: MaxHeight<number | (string & {})>; lg: MaxHeight<num`
}
type selectorV2SwitchV2TokensTypeContentSubLabelConfig = {
  color: string,  // ⚪ loose — was `{ default: Color; hover: Color; focus: Color; error: Color; disabled: Color; }`
  fontSize: string,  // ⚪ loose — was `{ sm: FontSize<number | (string & {})>; md: FontSize<number | (string & {})>; lg: FontSize<number | (string & `
  fontWeight: string,  // ⚪ loose — was `{ sm: FontWeight; md: FontWeight; lg: FontWeight; }`
  lineHeight: string,  // ⚪ loose — was `{ sm: LineHeight<number | (string & {})>; md: LineHeight<number | (string & {})>; lg: LineHeight<number | (str`
}
type selectorV2SwitchV2TokensTypeContentRequiredConfig = {
  color: string,
}
type selectorV2SwitchV2TokensTypeContentConfig = {
  gap: string,
  label: selectorV2SwitchV2TokensTypeContentLabelConfig,
  subLabel: selectorV2SwitchV2TokensTypeContentSubLabelConfig,
  required: selectorV2SwitchV2TokensTypeContentRequiredConfig,
}
type switchV2TokensType = {
  gap: string,
  @as("switch") switch_: selectorV2SwitchV2TokensTypeSwitchConfig,
  content: selectorV2SwitchV2TokensTypeContentConfig,
}
type responsiveSwitchV2Tokens = {
  sm: switchV2TokensType,
  lg: switchV2TokensType,
}
type selectorV2CheckboxV2TokensTypeCheckboxBackgroundColorConfig = {
  checked?: string,  // ⚪ loose — was `{ default?: BackgroundColor; hover?: BackgroundColor; focus?: BackgroundColor; error?: BackgroundColor; disabl`
  unchecked?: string,  // ⚪ loose — was `{ default?: BackgroundColor; hover?: BackgroundColor; focus?: BackgroundColor; error?: BackgroundColor; disabl`
  indeterminate?: string,  // ⚪ loose — was `{ default?: BackgroundColor; hover?: BackgroundColor; focus?: BackgroundColor; error?: BackgroundColor; disabl`
}
type selectorV2CheckboxV2TokensTypeCheckboxIconConfig = {
  color: string,  // ⚪ loose — was `{ checked?: { default?: Color; disabled?: Color; }; unchecked?: { default?: Color; disabled?: Color; }; indete`
  width: string,  // ⚪ loose — was `{ sm: Width<number | (string & {})>; md: Width<number | (string & {})>; lg: Width<number | (string & {})>; }`
  height: string,  // ⚪ loose — was `{ sm: Height<number | (string & {})>; md: Height<number | (string & {})>; lg: Height<number | (string & {})>; `
  strokeWidth: string,  // ⚪ loose — was `{ sm: StrokeWidth<number | (string & {})>; md: StrokeWidth<number | (string & {})>; lg: StrokeWidth<number | (`
}
type selectorV2CheckboxV2TokensTypeCheckboxConfig = {
  height: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  width: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  opacity: string,
  backgroundColor: selectorV2CheckboxV2TokensTypeCheckboxBackgroundColorConfig,
  borderRadius: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  border: selectorV2CheckboxV2TokensTypeCheckboxBackgroundColorConfig,
  outline: string,
  outlineOffset: string,
  boxShadow: string,
  icon: selectorV2CheckboxV2TokensTypeCheckboxIconConfig,
}
type checkboxV2TokensType = {
  gap: string,
  checkbox: selectorV2CheckboxV2TokensTypeCheckboxConfig,
  content: selectorV2SwitchV2TokensTypeContentConfig,
}
type responsiveCheckboxV2Tokens = {
  sm: checkboxV2TokensType,
  lg: checkboxV2TokensType,
}
type selectorV2RadioV2TokensTypeGroupConfig = {
  gap: string,
}
type selectorV2RadioV2TokensTypeRadioIndicatorConfig = {
  active: string,  // ⚪ loose — was `{ backgroundColor: { default: BackgroundColor; hover: BackgroundColor; focus: BackgroundColor; error: Backgrou`
  inactive: string,  // ⚪ loose — was `{ backgroundColor: { default: BackgroundColor; hover: BackgroundColor; focus: BackgroundColor; error: Backgrou`
}
type selectorV2RadioV2TokensTypeRadioActiveIndicatorConfig = {
  active: string,  // ⚪ loose — was `{ backgroundColor: { default: BackgroundColor; focus: BackgroundColor; disabled: BackgroundColor; }; }`
}
type selectorV2RadioV2TokensTypeRadioConfig = {
  indicator: selectorV2RadioV2TokensTypeRadioIndicatorConfig,
  activeIndicator: selectorV2RadioV2TokensTypeRadioActiveIndicatorConfig,
  height: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  borderWidth: selectorV2RadioV2TokensTypeRadioIndicatorConfig,
}
type radioV2TokensType = {
  gap: string,
  group: selectorV2RadioV2TokensTypeGroupConfig,
  radio: selectorV2RadioV2TokensTypeRadioConfig,
  content: selectorV2SwitchV2TokensTypeContentConfig,
}
type responsiveRadioV2Tokens = {
  sm: radioV2TokensType,
  lg: radioV2TokensType,
}
type selectorV2SlotConfig = {
  slot: React.element,
  maxHeight?: string,
}
type selectorV2MaxLengthConfig = {
  label?: float,
  subLabel?: float,
}
type selectorV2AsConfig = {
  ...JsxDOM.domProps,
}
type selectorV2GetCheckboxTextPropsConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type selectorV2GetCheckboxSubtextPropsConfig = {
  fontSize: string,
  color: string,
}
type selectorV2GetCheckboxLabelStylesConfig = {
  cursor: selectorV2GetCheckboxLabelStylesCursor,
  display: [#"flex"],
  alignItems: [#"center"],
  margin: float,
  padding: float,
}
type selectorV2GetAccessibilityAttributesConfig = {
  role: string,
  @as("aria-checked") ariaChecked?: string,
  @as("aria-labelledby") ariaLabelledby: string,
  @as("aria-describedby") ariaDescribedby: string,
}
module WebTarget = {
  type t
  external fromTag: [#"symbol" | #"object" | #"body" | #"small" | #"code" | #"slot" | #"form" | #"pattern" | #"text" | #"search" | #"sub" | #"sup" | #"label" | #"button" | #"input" | #"header" | #"footer" | #"option" | #"menu" | #"ruby" | #"table" | #"clipPath" | #"filter" | #"marker" | #"mask" | #"map" | #"meter" | #"textarea" | #"progress" | #"circle" | #"embed" | #"pre" | #"caption" | #"line" | #"area" | #"legend" | #"section" | #"time" | #"switch" | #"image" | #"article" | #"dialog" | #"figure" | #"img" | #"main" | #"path" | #"polygon" | #"linearGradient" | #"radialGradient" | #"select" | #"a" | #"q" | #"s" | #"textPath" | #"data" | #"rect" | #"stop" | #"html" | #"div" | #"h2" | #"h3" | #"li" | #"nav" | #"ol" | #"p" | #"span" | #"svg" | #"ul" | #"abbr" | #"address" | #"aside" | #"audio" | #"b" | #"bdi" | #"bdo" | #"blockquote" | #"br" | #"canvas" | #"cite" | #"col" | #"colgroup" | #"datalist" | #"dd" | #"del" | #"details" | #"dfn" | #"dl" | #"dt" | #"em" | #"fieldset" | #"figcaption" | #"h1" | #"h4" | #"h5" | #"h6" | #"hgroup" | #"hr" | #"i" | #"iframe" | #"ins" | #"kbd" | #"mark" | #"optgroup" | #"output" | #"picture" | #"rp" | #"rt" | #"samp" | #"strong" | #"summary" | #"template" | #"tbody" | #"td" | #"tfoot" | #"th" | #"thead" | #"tr" | #"u" | #"var" | #"video" | #"wbr" | #"defs" | #"ellipse" | #"feBlend" | #"feColorMatrix" | #"feComponentTransfer" | #"feComposite" | #"feConvolveMatrix" | #"feDiffuseLighting" | #"feDisplacementMap" | #"feDistantLight" | #"feDropShadow" | #"feFlood" | #"feFuncA" | #"feFuncB" | #"feFuncG" | #"feFuncR" | #"feGaussianBlur" | #"feImage" | #"feMerge" | #"feMergeNode" | #"feMorphology" | #"feOffset" | #"fePointLight" | #"feSpecularLighting" | #"feSpotLight" | #"feTile" | #"feTurbulence" | #"foreignObject" | #"g" | #"polyline" | #"tspan" | #"use"] => t = "%identity"
  external fromSelectorV2AsConfig: selectorV2AsConfig => t = "%identity"
  external asSelectorV2AsConfig: t => (selectorV2AsConfig) = "%identity"
  external fromExoticComponentWithDisplayName: ('a => React.element) => t = "%identity"
  external asExoticComponentWithDisplayName: t => ('a => React.element) = "%identity"
  external fromComponentClass: React.component<'b> => t = "%identity"
  external asComponentClass: t => (React.component<'b>) = "%identity"
  external fromFunctionComponent: React.component<'b> => t = "%identity"
  external asFunctionComponent: t => (React.component<'b>) = "%identity"
}
