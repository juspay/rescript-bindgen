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
type stepperProps = {
  steps: array<step>,
  onStepClick?: float => unit,
  onSubstepClick?: (float, float) => unit,
  clickable?: bool,
  stepperType?: stepperType,
}
type stepperStepperTokensTypeContainerDefaultConfig = {
  gap: string,
}
type stepperStepperTokensTypeContainerConfig = {
  default: stepperStepperTokensTypeContainerDefaultConfig,
}
type stepperStepperTokensTypeStepCircleCompletedDisabledConfig = {
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
  disabled: stepperStepperTokensTypeStepCircleCompletedDisabledConfig,
  default: stepperStepperTokensTypeStepCircleCompletedDisabledConfig,
  hover: stepperStepperTokensTypeStepCircleCompletedDisabledConfig,
  focus: stepperStepperTokensTypeStepCircleCompletedDisabledConfig,
}
type stepperStepperTokensTypeStepCircleConfig = {
  completed: stepperStepperTokensTypeStepCircleCompletedConfig,
  current: stepperStepperTokensTypeStepCircleCompletedConfig,
  pending: stepperStepperTokensTypeStepCircleCompletedConfig,
  disabled: stepperStepperTokensTypeStepCircleCompletedConfig,
  skipped: stepperStepperTokensTypeStepCircleCompletedConfig,
}
type stepperStepperTokensTypeStepIconCompletedDisabledConfig = {
  color: string,
}
type stepperStepperTokensTypeStepIconCompletedConfig = {
  disabled: stepperStepperTokensTypeStepIconCompletedDisabledConfig,
  default: stepperStepperTokensTypeStepIconCompletedDisabledConfig,
  hover: stepperStepperTokensTypeStepIconCompletedDisabledConfig,
  focus: stepperStepperTokensTypeStepIconCompletedDisabledConfig,
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
type stepperStepperTokensTypeTitleTextCompletedDisabledConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
  gap: string,
}
type stepperStepperTokensTypeTitleTextCompletedConfig = {
  disabled: stepperStepperTokensTypeTitleTextCompletedDisabledConfig,
  default: stepperStepperTokensTypeTitleTextCompletedDisabledConfig,
  hover: stepperStepperTokensTypeTitleTextCompletedDisabledConfig,
  focus: stepperStepperTokensTypeTitleTextCompletedDisabledConfig,
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
