type stepState =
  | @as("completed") Completed
  | @as("current") Current
  | @as("pending") Pending
  | @as("disabled") Disabled
  | @as("skipped") Skipped
type stepperType =
  | @as("horizontal") Horizontal
  | @as("vertical") Vertical
type stepperStepperTokensTypeContainerDefaultConfig = {
  gap: string,
}
type stepperStepperTokensTypeContainerConfig = {
  default: stepperStepperTokensTypeContainerDefaultConfig,
}
type stepperStepperTokensTypeStepCircleCompletedDefaultConfig = {
  backgroundColor: string,
  borderColor: string,
  borderWidth: string,
  borderRadius: string,
  size: string,
  transition: string,
  outline: string,
  outlineOffset: string,
}
type stepperStepperTokensTypeStepCircleCompletedConfig = {
  default: stepperStepperTokensTypeStepCircleCompletedDefaultConfig,
  hover: stepperStepperTokensTypeStepCircleCompletedDefaultConfig,
  disabled: stepperStepperTokensTypeStepCircleCompletedDefaultConfig,
  focus: stepperStepperTokensTypeStepCircleCompletedDefaultConfig,
}
type stepperStepperTokensTypeStepCircleConfig = {
  completed: stepperStepperTokensTypeStepCircleCompletedConfig,
  current: stepperStepperTokensTypeStepCircleCompletedConfig,
  pending: stepperStepperTokensTypeStepCircleCompletedConfig,
  disabled: stepperStepperTokensTypeStepCircleCompletedConfig,
  skipped: stepperStepperTokensTypeStepCircleCompletedConfig,
}
type stepperStepperTokensTypeStepIconCompletedDefaultConfig = {
  color: string,
}
type stepperStepperTokensTypeStepIconCompletedConfig = {
  default: stepperStepperTokensTypeStepIconCompletedDefaultConfig,
  hover: stepperStepperTokensTypeStepIconCompletedDefaultConfig,
  disabled: stepperStepperTokensTypeStepIconCompletedDefaultConfig,
  focus: stepperStepperTokensTypeStepIconCompletedDefaultConfig,
}
type stepperStepperTokensTypeStepIconConfig = {
  completed: stepperStepperTokensTypeStepIconCompletedConfig,
  current: stepperStepperTokensTypeStepIconCompletedConfig,
  pending: stepperStepperTokensTypeStepIconCompletedConfig,
  disabled: stepperStepperTokensTypeStepIconCompletedConfig,
  skipped: stepperStepperTokensTypeStepIconCompletedConfig,
}
type stepperStepperTokensTypeStepConfig = {
  circle: stepperStepperTokensTypeStepCircleConfig,
  icon: stepperStepperTokensTypeStepIconConfig,
}
type stepperStepperTokensTypeConnectorLineActiveDefaultConfig = {
  color: string,
  height: string,
}
type stepperStepperTokensTypeConnectorLineActiveConfig = {
  default: stepperStepperTokensTypeConnectorLineActiveDefaultConfig,
}
type stepperStepperTokensTypeConnectorLineConfig = {
  active: stepperStepperTokensTypeConnectorLineActiveConfig,
  inactive: stepperStepperTokensTypeConnectorLineActiveConfig,
}
type stepperStepperTokensTypeConnectorConfig = {
  line: stepperStepperTokensTypeConnectorLineConfig,
}
type stepperStepperTokensTypeTitleTextCompletedDefaultConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
  gap: string,
}
type stepperStepperTokensTypeTitleTextCompletedConfig = {
  default: stepperStepperTokensTypeTitleTextCompletedDefaultConfig,
  hover: stepperStepperTokensTypeTitleTextCompletedDefaultConfig,
  disabled: stepperStepperTokensTypeTitleTextCompletedDefaultConfig,
  focus: stepperStepperTokensTypeTitleTextCompletedDefaultConfig,
}
type stepperStepperTokensTypeTitleTextConfig = {
  completed: stepperStepperTokensTypeTitleTextCompletedConfig,
  current: stepperStepperTokensTypeTitleTextCompletedConfig,
  pending: stepperStepperTokensTypeTitleTextCompletedConfig,
  disabled: stepperStepperTokensTypeTitleTextCompletedConfig,
  skipped: stepperStepperTokensTypeTitleTextCompletedConfig,
}
type stepperStepperTokensTypeTitleConfig = {
  text: stepperStepperTokensTypeTitleTextConfig,
}
type stepperTokensType = {
  container: stepperStepperTokensTypeContainerConfig,
  step: stepperStepperTokensTypeStepConfig,
  connector: stepperStepperTokensTypeConnectorConfig,
  title: stepperStepperTokensTypeTitleConfig,
}
type responsiveStepperTokens = {
  sm: stepperTokensType,
  lg: stepperTokensType,
}
type subStep = {
  id: float,
  title: string,
  status?: stepState,
  disabled?: bool,
  slot?: React.element,
}
type step = {
  id: float,
  title: string,
  status?: stepState,
  disabled?: bool,
  description?: string,
  icon?: React.element,
  slot?: React.element,
  substeps?: array<subStep>,
  isExpandable?: bool,
  isExpanded?: bool,
}
