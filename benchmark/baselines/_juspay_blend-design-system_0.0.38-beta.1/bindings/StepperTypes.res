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
type stepperStepperTokensTypeStepCircleConfig = {
  completed: string,  // ⚪ loose — was `{ disabled: { backgroundColor: BackgroundColor; borderColor: BorderColor; borderWidth: BorderWidth<number | (s`
  current: string,  // ⚪ loose — was `{ disabled: { backgroundColor: BackgroundColor; borderColor: BorderColor; borderWidth: BorderWidth<number | (s`
  pending: string,  // ⚪ loose — was `{ disabled: { backgroundColor: BackgroundColor; borderColor: BorderColor; borderWidth: BorderWidth<number | (s`
  disabled: string,  // ⚪ loose — was `{ disabled: { backgroundColor: BackgroundColor; borderColor: BorderColor; borderWidth: BorderWidth<number | (s`
  skipped: string,  // ⚪ loose — was `{ disabled: { backgroundColor: BackgroundColor; borderColor: BorderColor; borderWidth: BorderWidth<number | (s`
}
type stepperStepperTokensTypeStepConfig = {
  circle: stepperStepperTokensTypeStepCircleConfig,
  icon: stepperStepperTokensTypeStepCircleConfig,
}
type stepperStepperTokensTypeConnectorLineConfig = {
  active: string,  // ⚪ loose — was `{ default: { color: Color; height: Height<number | (string & {})>; }; }`
  inactive: string,  // ⚪ loose — was `{ default: { color: Color; height: Height<number | (string & {})>; }; }`
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
