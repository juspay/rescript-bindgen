type switchSize =
  | @as("sm") Sm
  | @as("md") Md
type switch_MaxLengthConfig = {
  label?: float,
  subtext?: float,
}
type switch_HeightConfig = {
  sm: string,
  md: string,
}
type switch_ActiveConfig = {
  disabled: string,
  default: string,
  hover: string,
  error: string,
}
type switch_BackgroundColorConfig = {
  active: switch_ActiveConfig,
  inactive: switch_ActiveConfig,
}
type switch_BorderConfig = {
  color?: string,
  width?: string,
}
type switch_SmConfig = {
  width?: string,
  height?: string,
  top?: string,
  left?: string,
  offset: string,
}
type switch_SizeConfig = {
  sm: switch_SmConfig,
  md: switch_SmConfig,
}
type switch_ThumbConfig = {
  backgroundColor?: string,
  border: switch_BorderConfig,
  borderRadius: switch_HeightConfig,
  size: switch_SizeConfig,
  outline?: string,
  outlineOffset?: string,
  boxShadow?: string,
}
type switch_SwitchContainerConfig = {
  height: switch_HeightConfig,
  width: switch_HeightConfig,
  borderRadius: switch_HeightConfig,
  backgroundColor: switch_BackgroundColorConfig,
  thumb: switch_ThumbConfig,
}
type switch_LabelConfig = {
  color: switch_ActiveConfig,
  fontSize: switch_HeightConfig,
  fontWeight: switch_HeightConfig,
  gap?: string,
}
type switch_SubtextConfig = {
  color: switch_ActiveConfig,
  fontSize: switch_HeightConfig,
  fontWeight: switch_HeightConfig,
}
type switch_ContentConfig = {
  label: switch_LabelConfig,
  subtext: switch_SubtextConfig,
  gap?: string,
}
type switch_RequiredConfig = {
  color?: string,
}
type switch_SlotConfig = {
  width: switch_HeightConfig,
  height: switch_HeightConfig,
}
type switchTokensType = {
  gap?: string,
  switchContainer: switch_SwitchContainerConfig,
  content: switch_ContentConfig,
  required: switch_RequiredConfig,
  slot: switch_SlotConfig,
}
type responsiveSwitchTokens = {
  sm: switchTokensType,
  lg: switchTokensType,
}
