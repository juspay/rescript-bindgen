type switchSize =
  | @as("sm") Sm
  | @as("md") Md
type switch_SwitchPropsMaxLengthConfig = {
  label?: float,
  subtext?: float,
}
type switchProps = {
  id?: string,
  checked?: bool,
  defaultChecked?: bool,
  onChange?: bool => unit,
  disabled?: bool,
  required?: bool,
  error?: bool,
  size?: switchSize,
  label?: string,
  subtext?: string,
  slot?: React.element,
  name?: string,
  value?: string,
  maxLength?: switch_SwitchPropsMaxLengthConfig,
}
type switchGroupProps = {
  id?: string,
  label?: string,
  name?: string,
  children: React.element,
  disabled?: bool,
  value?: array<string>,
  defaultValue?: array<string>,
  onChange?: array<string> => unit,
}
type switch_SwitchTokensTypeSwitchContainerHeightConfig = {
  sm: string,
  md: string,
}
type switch_SwitchTokensTypeSwitchContainerBackgroundColorActiveConfig = {
  disabled: string,
  default: string,
  hover: string,
  error: string,
}
type switch_SwitchTokensTypeSwitchContainerBackgroundColorConfig = {
  active: switch_SwitchTokensTypeSwitchContainerBackgroundColorActiveConfig,
  inactive: switch_SwitchTokensTypeSwitchContainerBackgroundColorActiveConfig,
}
type switch_SwitchTokensTypeSwitchContainerThumbBorderConfig = {
  color: string,
  width: string,
}
type switch_SwitchTokensTypeSwitchContainerThumbSizeSmConfig = {
  width: string,
  height: string,
  top: string,
  left: string,
  offset: string,  // ⚪ loose — was `{ active: Left<number | (string & {})>; inactive: Left<number | (string & {})>; }`
}
type switch_SwitchTokensTypeSwitchContainerThumbSizeConfig = {
  sm: switch_SwitchTokensTypeSwitchContainerThumbSizeSmConfig,
  md: switch_SwitchTokensTypeSwitchContainerThumbSizeSmConfig,
}
type switch_SwitchTokensTypeSwitchContainerThumbConfig = {
  backgroundColor: string,
  border: switch_SwitchTokensTypeSwitchContainerThumbBorderConfig,
  borderRadius: switch_SwitchTokensTypeSwitchContainerHeightConfig,
  size: switch_SwitchTokensTypeSwitchContainerThumbSizeConfig,
  outline: string,
  outlineOffset: string,
  boxShadow: string,
}
type switch_SwitchTokensTypeSwitchContainerConfig = {
  height: switch_SwitchTokensTypeSwitchContainerHeightConfig,
  width: switch_SwitchTokensTypeSwitchContainerHeightConfig,
  borderRadius: switch_SwitchTokensTypeSwitchContainerHeightConfig,
  backgroundColor: switch_SwitchTokensTypeSwitchContainerBackgroundColorConfig,
  thumb: switch_SwitchTokensTypeSwitchContainerThumbConfig,
}
type switch_SwitchTokensTypeContentLabelConfig = {
  color: switch_SwitchTokensTypeSwitchContainerBackgroundColorActiveConfig,
  fontSize: switch_SwitchTokensTypeSwitchContainerHeightConfig,
  fontWeight: switch_SwitchTokensTypeSwitchContainerHeightConfig,
  gap: string,
}
type switch_SwitchTokensTypeContentSubtextConfig = {
  color: switch_SwitchTokensTypeSwitchContainerBackgroundColorActiveConfig,
  fontSize: switch_SwitchTokensTypeSwitchContainerHeightConfig,
  fontWeight: switch_SwitchTokensTypeSwitchContainerHeightConfig,
}
type switch_SwitchTokensTypeContentConfig = {
  label: switch_SwitchTokensTypeContentLabelConfig,
  subtext: switch_SwitchTokensTypeContentSubtextConfig,
  gap: string,
}
type switch_SwitchTokensTypeRequiredConfig = {
  color: string,
}
type switch_SwitchTokensTypeSlotConfig = {
  width: switch_SwitchTokensTypeSwitchContainerHeightConfig,
  height: switch_SwitchTokensTypeSwitchContainerHeightConfig,
}
type switchTokensType = {
  gap: string,
  switchContainer: switch_SwitchTokensTypeSwitchContainerConfig,
  content: switch_SwitchTokensTypeContentConfig,
  required: switch_SwitchTokensTypeRequiredConfig,
  slot: switch_SwitchTokensTypeSlotConfig,
}
type responsiveSwitchTokens = {
  sm: switchTokensType,
  lg: switchTokensType,
}
