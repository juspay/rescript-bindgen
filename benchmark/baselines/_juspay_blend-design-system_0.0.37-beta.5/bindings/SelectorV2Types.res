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
type selectorV2SwitchV2TokensTypeSwitchBackgroundColorCheckedConfig = {
  default: string,
  hover: string,
  focus: string,
  error: string,
  disabled: string,
}
type selectorV2SwitchV2TokensTypeSwitchBackgroundColorConfig = {
  checked: selectorV2SwitchV2TokensTypeSwitchBackgroundColorCheckedConfig,
  unchecked: selectorV2SwitchV2TokensTypeSwitchBackgroundColorCheckedConfig,
}
type selectorV2SwitchV2TokensTypeSwitchThumbConfig = {
  backgroundColor: string,
  border: string,
  width: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  height: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  outline: string,
}
type selectorV2SwitchV2TokensTypeSwitchConfig = {
  height: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  width: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  backgroundColor: selectorV2SwitchV2TokensTypeSwitchBackgroundColorConfig,
  thumb: selectorV2SwitchV2TokensTypeSwitchThumbConfig,
}
type selectorV2SwitchV2TokensTypeContentLabelSlotConfig = {
  maxHeight: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
}
type selectorV2SwitchV2TokensTypeContentLabelConfig = {
  gap: string,
  color: selectorV2SwitchV2TokensTypeSwitchBackgroundColorCheckedConfig,
  fontSize: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  fontWeight: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  lineHeight: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  slot: selectorV2SwitchV2TokensTypeContentLabelSlotConfig,
}
type selectorV2SwitchV2TokensTypeContentSubLabelConfig = {
  color: selectorV2SwitchV2TokensTypeSwitchBackgroundColorCheckedConfig,
  fontSize: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  fontWeight: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  lineHeight: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
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
type selectorV2CheckboxV2TokensTypeCheckboxBackgroundColorCheckedConfig = {
  default?: string,
  hover?: string,
  focus?: string,
  error?: string,
  disabled?: string,
}
type selectorV2CheckboxV2TokensTypeCheckboxBackgroundColorConfig = {
  checked?: selectorV2CheckboxV2TokensTypeCheckboxBackgroundColorCheckedConfig,
  unchecked?: selectorV2CheckboxV2TokensTypeCheckboxBackgroundColorCheckedConfig,
  indeterminate?: selectorV2CheckboxV2TokensTypeCheckboxBackgroundColorCheckedConfig,
}
type selectorV2CheckboxV2TokensTypeCheckboxIconColorCheckedConfig = {
  default?: string,
  disabled?: string,
}
type selectorV2CheckboxV2TokensTypeCheckboxIconColorConfig = {
  checked?: selectorV2CheckboxV2TokensTypeCheckboxIconColorCheckedConfig,
  unchecked?: selectorV2CheckboxV2TokensTypeCheckboxIconColorCheckedConfig,
  indeterminate?: selectorV2CheckboxV2TokensTypeCheckboxIconColorCheckedConfig,
}
type selectorV2CheckboxV2TokensTypeCheckboxIconConfig = {
  color: selectorV2CheckboxV2TokensTypeCheckboxIconColorConfig,
  width: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  height: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  strokeWidth: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
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
type selectorV2RadioV2TokensTypeRadioIndicatorActiveConfig = {
  backgroundColor: selectorV2SwitchV2TokensTypeSwitchBackgroundColorCheckedConfig,
  borderColor: selectorV2SwitchV2TokensTypeSwitchBackgroundColorCheckedConfig,
}
type selectorV2RadioV2TokensTypeRadioIndicatorConfig = {
  active: selectorV2RadioV2TokensTypeRadioIndicatorActiveConfig,
  inactive: selectorV2RadioV2TokensTypeRadioIndicatorActiveConfig,
}
type selectorV2RadioV2TokensTypeRadioActiveIndicatorActiveBackgroundColorConfig = {
  default: string,
  focus: string,
  disabled: string,
}
type selectorV2RadioV2TokensTypeRadioActiveIndicatorActiveConfig = {
  backgroundColor: selectorV2RadioV2TokensTypeRadioActiveIndicatorActiveBackgroundColorConfig,
}
type selectorV2RadioV2TokensTypeRadioActiveIndicatorConfig = {
  active: selectorV2RadioV2TokensTypeRadioActiveIndicatorActiveConfig,
}
type selectorV2RadioV2TokensTypeRadioBorderWidthActiveConfig = {
  default: float,
  hover: float,
  focus: float,
  error: float,
  disabled: float,
}
type selectorV2RadioV2TokensTypeRadioBorderWidthConfig = {
  active: selectorV2RadioV2TokensTypeRadioBorderWidthActiveConfig,
  inactive: selectorV2RadioV2TokensTypeRadioBorderWidthActiveConfig,
}
type selectorV2RadioV2TokensTypeRadioConfig = {
  indicator: selectorV2RadioV2TokensTypeRadioIndicatorConfig,
  activeIndicator: selectorV2RadioV2TokensTypeRadioActiveIndicatorConfig,
  height: selectorV2SwitchV2TokensTypeSwitchHeightConfig,
  borderWidth: selectorV2RadioV2TokensTypeRadioBorderWidthConfig,
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
  display: string,  // ⚪ loose — was `"flex"`
  alignItems: string,  // ⚪ loose — was `"center"`
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
  external fromTag: [#"symbol" | #"object" | #"text" | #"small" | #"slot" | #"ruby" | #"table" | #"search" | #"sub" | #"sup" | #"map" | #"filter" | #"button" | #"meter" | #"textarea" | #"progress" | #"circle" | #"embed" | #"pre" | #"caption" | #"menu" | #"body" | #"code" | #"article" | #"dialog" | #"figure" | #"form" | #"img" | #"main" | #"option" | #"switch" | #"time" | #"stop" | #"rect" | #"linearGradient" | #"radialGradient" | #"area" | #"line" | #"polygon" | #"label" | #"marker" | #"a" | #"q" | #"s" | #"select" | #"textPath" | #"data" | #"image" | #"html" | #"div" | #"h2" | #"h3" | #"input" | #"li" | #"nav" | #"ol" | #"p" | #"span" | #"svg" | #"ul" | #"abbr" | #"address" | #"aside" | #"audio" | #"b" | #"bdi" | #"bdo" | #"blockquote" | #"br" | #"canvas" | #"cite" | #"col" | #"colgroup" | #"datalist" | #"dd" | #"del" | #"details" | #"dfn" | #"dl" | #"dt" | #"em" | #"fieldset" | #"figcaption" | #"footer" | #"h1" | #"h4" | #"h5" | #"h6" | #"header" | #"hgroup" | #"hr" | #"i" | #"iframe" | #"ins" | #"kbd" | #"legend" | #"mark" | #"optgroup" | #"output" | #"picture" | #"rp" | #"rt" | #"samp" | #"section" | #"strong" | #"summary" | #"template" | #"tbody" | #"td" | #"tfoot" | #"th" | #"thead" | #"tr" | #"u" | #"var" | #"video" | #"wbr" | #"clipPath" | #"defs" | #"ellipse" | #"feBlend" | #"feColorMatrix" | #"feComponentTransfer" | #"feComposite" | #"feConvolveMatrix" | #"feDiffuseLighting" | #"feDisplacementMap" | #"feDistantLight" | #"feDropShadow" | #"feFlood" | #"feFuncA" | #"feFuncB" | #"feFuncG" | #"feFuncR" | #"feGaussianBlur" | #"feImage" | #"feMerge" | #"feMergeNode" | #"feMorphology" | #"feOffset" | #"fePointLight" | #"feSpecularLighting" | #"feSpotLight" | #"feTile" | #"feTurbulence" | #"foreignObject" | #"g" | #"mask" | #"path" | #"pattern" | #"polyline" | #"tspan" | #"use"] => t = "%identity"
  external fromSelectorV2AsConfig: selectorV2AsConfig => t = "%identity"
  external fromExoticComponentWithDisplayName: ('a => React.element) => t = "%identity"
  external fromComponentClass: React.component<'b> => t = "%identity"
  external fromFunctionComponent: React.component<'b> => t = "%identity"
}
