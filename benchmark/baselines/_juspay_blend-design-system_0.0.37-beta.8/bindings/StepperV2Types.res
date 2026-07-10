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
type stepperV2StepperV2TokensTypeContainerStepCircleDefaultConfig = {
  default: string,  // ⚪ loose — was `{ backgroundColor: BackgroundColor; borderColor: BorderColor; borderWidth: BorderWidth<number | (string & {})>`
  hover: string,  // ⚪ loose — was `{ backgroundColor: BackgroundColor; borderColor: BorderColor; borderWidth: BorderWidth<number | (string & {})>`
  disabled: string,  // ⚪ loose — was `{ backgroundColor: BackgroundColor; borderColor: BorderColor; borderWidth: BorderWidth<number | (string & {})>`
  focus: string,  // ⚪ loose — was `{ backgroundColor: BackgroundColor; borderColor: BorderColor; borderWidth: BorderWidth<number | (string & {})>`
}
type stepperV2StepperV2TokensTypeContainerStepCircleConfig = {
  default: stepperV2StepperV2TokensTypeContainerStepCircleDefaultConfig,
  completed: stepperV2StepperV2TokensTypeContainerStepCircleDefaultConfig,
  current: stepperV2StepperV2TokensTypeContainerStepCircleDefaultConfig,
  pending: stepperV2StepperV2TokensTypeContainerStepCircleDefaultConfig,
  disabled: stepperV2StepperV2TokensTypeContainerStepCircleDefaultConfig,
  skipped: stepperV2StepperV2TokensTypeContainerStepCircleDefaultConfig,
}
type stepperV2StepperV2TokensTypeContainerStepConfig = {
  circle: stepperV2StepperV2TokensTypeContainerStepCircleConfig,
  icon: stepperV2StepperV2TokensTypeContainerStepCircleConfig,
}
type stepperV2StepperV2TokensTypeContainerConnectorLineConfig = {
  color: string,
  height: string,
}
type stepperV2StepperV2TokensTypeContainerConnectorConfig = {
  line: stepperV2StepperV2TokensTypeContainerConnectorLineConfig,
}
type stepperV2StepperV2TokensTypeContainerSubConnectorDotConfig = {
  border: string,
  borderRadius: string,
  height: string,
  width: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
}
type stepperV2StepperV2TokensTypeContainerSubConnectorExpanderIconConfig = {
  color: string,
}
type stepperV2StepperV2TokensTypeContainerSubConnectorExpanderConfig = {
  icon: stepperV2StepperV2TokensTypeContainerSubConnectorExpanderIconConfig,
  width: string,
}
type stepperV2StepperV2TokensTypeContainerSubConnectorTextDefaultConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type stepperV2StepperV2TokensTypeContainerSubConnectorTextConfig = {
  default: stepperV2StepperV2TokensTypeContainerSubConnectorTextDefaultConfig,
  completed: stepperV2StepperV2TokensTypeContainerSubConnectorTextDefaultConfig,
  current: stepperV2StepperV2TokensTypeContainerSubConnectorTextDefaultConfig,
  pending: stepperV2StepperV2TokensTypeContainerSubConnectorTextDefaultConfig,
  disabled: stepperV2StepperV2TokensTypeContainerSubConnectorTextDefaultConfig,
  skipped: stepperV2StepperV2TokensTypeContainerSubConnectorTextDefaultConfig,
}
type stepperV2StepperV2TokensTypeContainerSubConnectorConfig = {
  line: stepperV2StepperV2TokensTypeContainerConnectorLineConfig,
  dot: stepperV2StepperV2TokensTypeContainerSubConnectorDotConfig,
  expander: stepperV2StepperV2TokensTypeContainerSubConnectorExpanderConfig,
  text: stepperV2StepperV2TokensTypeContainerSubConnectorTextConfig,
}
type stepperV2StepperV2TokensTypeContainerTitleConfig = {
  text: stepperV2StepperV2TokensTypeContainerStepCircleConfig,
}
type stepperV2StepperV2TokensTypeContainerDescriptionConfig = {
  text: stepperV2StepperV2TokensTypeContainerSubConnectorTextDefaultConfig,
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
