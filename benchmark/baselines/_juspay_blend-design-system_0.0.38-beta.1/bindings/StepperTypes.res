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
type stepperUseThemeCompletedDisabledConfig = {
  backgroundColor: string,
  borderColor: string,
  borderWidth: string,
  borderRadius: string,
  size: string,
  transition: string,
  outline: string,
  outlineOffset: string,
}
type stepperUseThemeCompletedConfig = {
  disabled: stepperUseThemeCompletedDisabledConfig,
  default: stepperUseThemeCompletedDisabledConfig,
  hover: stepperUseThemeCompletedDisabledConfig,
  focus: stepperUseThemeCompletedDisabledConfig,
}
type stepperStepperTokensTypeStepCircleConfig = {
  completed: stepperUseThemeCompletedConfig,
  current: stepperUseThemeCompletedConfig,
  pending: stepperUseThemeCompletedConfig,
  disabled: stepperUseThemeCompletedConfig,
  skipped: stepperUseThemeCompletedConfig,
}
type stepperStepperTokensTypeStepConfig = {
  circle: stepperStepperTokensTypeStepCircleConfig,
  icon: stepperStepperTokensTypeStepCircleConfig,
}
type __typeV103g7 = {
  color: string,
  height: string,
}
type __typeV4pel9 = {
  default: __typeV103g7,
}
type stepperStepperTokensTypeConnectorLineConfig = {
  active: __typeV4pel9,
  inactive: __typeV4pel9,
}
type stepperStepperTokensTypeConnectorConfig = {
  line: stepperStepperTokensTypeConnectorLineConfig,
}
type stepperStepperTokensTypeTitleConfig = {
  text: stepperStepperTokensTypeStepCircleConfig,
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
type stepperProps = {
  steps: array<step>,
  onStepClick?: float => unit,
  onSubstepClick?: (float, float) => unit,
  clickable?: bool,
  stepperType?: stepperType,
}
