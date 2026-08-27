type stepperV2StepStatus =
  | @as("default") Default
  | @as("completed") Completed
  | @as("current") Current
  | @as("pending") Pending
  | @as("disabled") Disabled
  | @as("skipped") Skipped
type stepperV2Type =
  | @as("horizontal") Horizontal
  | @as("vertical") Vertical
type stepperV2UseThemeCircleDefaultDisabledConfig = {
  backgroundColor: string,
  borderColor: string,
  borderWidth: string,
  borderRadius: string,
  size: string,
  transition: string,
  outline: string,
  outlineOffset: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
}
type stepperV2UseThemeCircleDefaultConfig = {
  disabled: stepperV2UseThemeCircleDefaultDisabledConfig,
  default: stepperV2UseThemeCircleDefaultDisabledConfig,
  hover: stepperV2UseThemeCircleDefaultDisabledConfig,
  focus: stepperV2UseThemeCircleDefaultDisabledConfig,
}
type stepperV2UseThemeCircleConfig = {
  default: stepperV2UseThemeCircleDefaultConfig,
  completed: stepperV2UseThemeCircleDefaultConfig,
  current: stepperV2UseThemeCircleDefaultConfig,
  pending: stepperV2UseThemeCircleDefaultConfig,
  disabled: stepperV2UseThemeCircleDefaultConfig,
  skipped: stepperV2UseThemeCircleDefaultConfig,
}
type __typeV12ovp3 = {
  color: string,
}
type stepperV2UseThemeIconDefaultConfig = {
  disabled: __typeV12ovp3,
  default: __typeV12ovp3,
  hover: __typeV12ovp3,
  focus: __typeV12ovp3,
}
type stepperV2UseThemeIconConfig = {
  default: stepperV2UseThemeIconDefaultConfig,
  completed: stepperV2UseThemeIconDefaultConfig,
  current: stepperV2UseThemeIconDefaultConfig,
  pending: stepperV2UseThemeIconDefaultConfig,
  disabled: stepperV2UseThemeIconDefaultConfig,
  skipped: stepperV2UseThemeIconDefaultConfig,
}
type stepperV2StepperV2TokensTypeContainerStepConfig = {
  circle: stepperV2UseThemeCircleConfig,
  icon: stepperV2UseThemeIconConfig,
}
type __typeV103g72 = {
  color: string,
  height: string,
}
type stepperV2StepperV2TokensTypeContainerConnectorConfig = {
  line: __typeV103g72,
}
type __typeE1x6s = {
  border: string,
  borderRadius: string,
  height: string,
  width: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
}
type __typeXq4kl = {
  icon: __typeV12ovp3,
  width: string,
}
type __typeV1y6we5 = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type stepperV2UseThemeTextConfigV7oi3d = {
  default: __typeV1y6we5,
  completed: __typeV1y6we5,
  current: __typeV1y6we5,
  pending: __typeV1y6we5,
  disabled: __typeV1y6we5,
  skipped: __typeV1y6we5,
}
type stepperV2StepperV2TokensTypeContainerSubConnectorConfig = {
  line: __typeV103g72,
  dot: __typeE1x6s,
  expander: __typeXq4kl,
  text: stepperV2UseThemeTextConfigV7oi3d,
}
type stepperV2UseThemeTextDefaultDisabledConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
  gap: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
}
type stepperV2UseThemeTextDefaultConfig = {
  disabled: stepperV2UseThemeTextDefaultDisabledConfig,
  default: stepperV2UseThemeTextDefaultDisabledConfig,
  hover: stepperV2UseThemeTextDefaultDisabledConfig,
  focus: stepperV2UseThemeTextDefaultDisabledConfig,
}
type stepperV2UseThemeTextConfigV1tr37 = {
  default: stepperV2UseThemeTextDefaultConfig,
  completed: stepperV2UseThemeTextDefaultConfig,
  current: stepperV2UseThemeTextDefaultConfig,
  pending: stepperV2UseThemeTextDefaultConfig,
  disabled: stepperV2UseThemeTextDefaultConfig,
  skipped: stepperV2UseThemeTextDefaultConfig,
}
type stepperV2StepperV2TokensTypeContainerTitleConfig = {
  text: stepperV2UseThemeTextConfigV1tr37,
}
type stepperV2StepperV2TokensTypeContainerDescriptionConfig = {
  text: __typeV1y6we5,
}
type stepperV2StepperV2TokensTypeContainerConfig = {
  gap: string,
  step: stepperV2StepperV2TokensTypeContainerStepConfig,
  connector: stepperV2StepperV2TokensTypeContainerConnectorConfig,
  subConnector: stepperV2StepperV2TokensTypeContainerSubConnectorConfig,
  title: stepperV2StepperV2TokensTypeContainerTitleConfig,
  description: stepperV2StepperV2TokensTypeContainerDescriptionConfig,
}
type stepperV2TokensType = {
  container: stepperV2StepperV2TokensTypeContainerConfig,
}
type responsiveStepperV2Tokens = {
  sm: stepperV2TokensType,
  lg: stepperV2TokensType,
}
type stepperV2SubStep = {
  id: float,
  title: string,
  status?: stepperV2StepStatus,
  disabled?: bool,
}
type stepperV2Step = {
  id: float,
  title: string,
  status?: stepperV2StepStatus,
  disabled?: bool,
  description?: string,
  icon?: React.element,
  substeps?: array<stepperV2SubStep>,
  isExpandable?: bool,
  isExpanded?: bool,
}
