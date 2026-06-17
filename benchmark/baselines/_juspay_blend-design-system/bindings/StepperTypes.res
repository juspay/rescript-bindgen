type stepState =
  | @as("completed") Completed
  | @as("current") Current
  | @as("pending") Pending
  | @as("disabled") Disabled
  | @as("skipped") Skipped
type stepperType =
  | @as("horizontal") Horizontal
  | @as("vertical") Vertical
type subStep = {
  id: float,
  title: string,
  status?: stepState,
  disabled?: bool,
}
type step = {
  id: float,
  title: string,
  status?: stepState,
  disabled?: bool,
  description?: string,
  icon?: React.element,
  substeps?: array<subStep>,
  isExpandable?: bool,
  isExpanded?: bool,
}
type stepperDefaultConfig = {
  gap: string,
}
type stepperContainerConfig = {
  default: stepperDefaultConfig,
}
type stepperDisabledConfig = {
  backgroundColor: string,
  borderColor: string,
  borderWidth: string,
  borderRadius: string,
  size: string,
  transition: string,
  outline: string,
  outlineOffset: string,
}
type stepperCompletedConfig = {
  disabled: stepperDisabledConfig,
  default: stepperDisabledConfig,
  hover: stepperDisabledConfig,
  focus: stepperDisabledConfig,
}
type stepperCircleConfig = {
  completed: stepperCompletedConfig,
  current: stepperCompletedConfig,
  pending: stepperCompletedConfig,
  disabled: stepperCompletedConfig,
  skipped: stepperCompletedConfig,
}
type stepperDisabledConfig2 = {
  color: string,
}
type stepperCompletedConfig2 = {
  disabled: stepperDisabledConfig2,
  default: stepperDisabledConfig2,
  hover: stepperDisabledConfig2,
  focus: stepperDisabledConfig2,
}
type stepperIconConfig = {
  completed: stepperCompletedConfig2,
  current: stepperCompletedConfig2,
  pending: stepperCompletedConfig2,
  disabled: stepperCompletedConfig2,
  skipped: stepperCompletedConfig2,
}
type stepperStepConfig = {
  circle: stepperCircleConfig,
  icon: stepperIconConfig,
}
type stepperDefaultConfig2 = {
  color: string,
  height: string,
}
type stepperActiveConfig = {
  default: stepperDefaultConfig2,
}
type stepperLineConfig = {
  active: stepperActiveConfig,
  inactive: stepperActiveConfig,
}
type stepperConnectorConfig = {
  line: stepperLineConfig,
}
type stepperDisabledConfig3 = {
  color: string,
  fontSize: string,
  fontWeight: string,
  gap: string,
}
type stepperCompletedConfig3 = {
  disabled: stepperDisabledConfig3,
  default: stepperDisabledConfig3,
  hover: stepperDisabledConfig3,
  focus: stepperDisabledConfig3,
}
type stepperTextConfig = {
  completed: stepperCompletedConfig3,
  current: stepperCompletedConfig3,
  pending: stepperCompletedConfig3,
  disabled: stepperCompletedConfig3,
  skipped: stepperCompletedConfig3,
}
type stepperTitleConfig = {
  text: stepperTextConfig,
}
type stepperTokensType = {
  container: stepperContainerConfig,
  step: stepperStepConfig,
  connector: stepperConnectorConfig,
  title: stepperTitleConfig,
}
type responsiveStepperTokens = {
  sm: stepperTokensType,
  lg: stepperTokensType,
}
