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
type stepperV2StepperV2TokensTypeContainerStepConfig = {
  circle: string,  // ⚪ loose — was `{ default: { disabled: { backgroundColor: BackgroundColor; borderColor: BorderColor; borderWidth: BorderWidth<`
  icon: string,  // ⚪ loose — was `{ default: { disabled: { color: Color; }; default: { color: Color; }; hover: { color: Color; }; focus: { color`
}
type stepperV2StepperV2TokensTypeContainerConnectorConfig = {
  line: string,  // ⚪ loose — was `{ color: Color; height: Height<number | (string & {})>; }`
}
type stepperV2StepperV2TokensTypeContainerSubConnectorConfig = {
  line: string,  // ⚪ loose — was `{ color: Color; height: Height<number | (string & {})>; }`
  dot: string,  // ⚪ loose — was `{ border: Border<number | (string & {})>; borderRadius: BorderRadius<number | (string & {})>; height: Height<n`
  expander: string,  // ⚪ loose — was `{ icon: { color: Color; }; width: Width<number | (string & {})>; }`
  text: string,  // ⚪ loose — was `{ default: { color: Color; fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; }; completed: {`
}
type stepperV2StepperV2TokensTypeContainerTitleConfig = {
  text: string,  // ⚪ loose — was `{ default: { disabled: { color: Color; fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; gap`
}
type stepperV2StepperV2TokensTypeContainerConfig = {
  gap: string,
  step: stepperV2StepperV2TokensTypeContainerStepConfig,
  connector: stepperV2StepperV2TokensTypeContainerConnectorConfig,
  subConnector: stepperV2StepperV2TokensTypeContainerSubConnectorConfig,
  title: stepperV2StepperV2TokensTypeContainerTitleConfig,
  description: stepperV2StepperV2TokensTypeContainerTitleConfig,
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
