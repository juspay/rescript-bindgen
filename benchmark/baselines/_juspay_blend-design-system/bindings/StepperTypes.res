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
type containerConfig6 = {
  default: ChartsTypes.slotsConfig,
}
type disabledConfig3 = {
  backgroundColor: string,
  borderColor: string,
  borderWidth: string,
  borderRadius: string,
  size: string,
  transition: string,
  outline: string,
  outlineOffset: string,
}
type completedConfig = {
  disabled: disabledConfig3,
  default: disabledConfig3,
  hover: disabledConfig3,
  focus: disabledConfig3,
}
type circleConfig = {
  completed: completedConfig,
  current: completedConfig,
  pending: completedConfig,
  disabled: completedConfig,
  skipped: completedConfig,
}
type disabledConfig4 = {
  color: string,
}
type completedConfig2 = {
  disabled: disabledConfig4,
  default: disabledConfig4,
  hover: disabledConfig4,
  focus: disabledConfig4,
}
type iconConfig4 = {
  completed: completedConfig2,
  current: completedConfig2,
  pending: completedConfig2,
  disabled: completedConfig2,
  skipped: completedConfig2,
}
type stepConfig = {
  circle: circleConfig,
  icon: iconConfig4,
}
type defaultConfig7 = {
  color: string,
  height: string,
}
type activeConfig2 = {
  default: defaultConfig7,
}
type lineConfig3 = {
  active: activeConfig2,
  inactive: activeConfig2,
}
type connectorConfig = {
  line: lineConfig3,
}
type disabledConfig5 = {
  color: string,
  fontSize: string,
  fontWeight: string,
  gap: string,
}
type completedConfig3 = {
  disabled: disabledConfig5,
  default: disabledConfig5,
  hover: disabledConfig5,
  focus: disabledConfig5,
}
type textConfig16 = {
  completed: completedConfig3,
  current: completedConfig3,
  pending: completedConfig3,
  disabled: completedConfig3,
  skipped: completedConfig3,
}
type titleConfig6 = {
  text: textConfig16,
}
type stepperTokensType = {
  container: containerConfig6,
  step: stepConfig,
  connector: connectorConfig,
  title: titleConfig6,
}
type responsiveStepperTokens = {
  sm: stepperTokensType,
  lg: stepperTokensType,
}
