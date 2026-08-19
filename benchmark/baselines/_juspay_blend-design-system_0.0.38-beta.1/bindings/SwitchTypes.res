type switchSize =
  | @as("sm") Sm
  | @as("md") Md
type switch_SwitchTokensTypeSwitchContainerHeightConfig = {
  sm: string,
  md: string,
}
type switch_SwitchTokensTypeSwitchContainerBackgroundColorConfig = {
  active: string,  // ⚪ loose — was `{ disabled: BackgroundColor; default: BackgroundColor; hover: BackgroundColor; error: BackgroundColor; }`
  inactive: string,  // ⚪ loose — was `{ disabled: BackgroundColor; default: BackgroundColor; hover: BackgroundColor; error: BackgroundColor; }`
}
type switch_SwitchTokensTypeSwitchContainerThumbConfig = {
  backgroundColor: string,
  border: string,  // ⚪ loose — was `{ color: BorderColor; width: BorderWidth<number | (string & {})>; }`
  borderRadius: string,  // ⚪ loose — was `{ sm: BorderRadius<number | (string & {})>; md: BorderRadius<number | (string & {})>; }`
  size: string,  // ⚪ loose — was `{ sm: { width: Width<number | (string & {})>; height: Height<number | (string & {})>; top: Top<number | (strin`
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
  color: string,  // ⚪ loose — was `{ disabled: Color; default: Color; hover: Color; error: Color; }`
  fontSize: string,  // ⚪ loose — was `{ sm: FontSize<number | (string & {})>; md: FontSize<number | (string & {})>; }`
  fontWeight: string,  // ⚪ loose — was `{ sm: FontWeight; md: FontWeight; }`
  gap: string,
}
type switch_SwitchTokensTypeContentSubtextConfig = {
  color: string,  // ⚪ loose — was `{ disabled: Color; default: Color; hover: Color; error: Color; }`
  fontSize: string,  // ⚪ loose — was `{ sm: FontSize<number | (string & {})>; md: FontSize<number | (string & {})>; }`
  fontWeight: string,  // ⚪ loose — was `{ sm: FontWeight; md: FontWeight; }`
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
