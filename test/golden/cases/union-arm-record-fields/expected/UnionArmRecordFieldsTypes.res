type unionArmRecordFieldsRowAnimationConfigTransitionType =
  | @as("bezier") Bezier
  | @as("spring") Spring
type unionArmRecordFieldsColumnConfigKind =
  | @as("number") Number
  | @as("text") Text
  | @as("date") Date
type unionArmRecordFieldsSelectionConfigMode =
  | @as("single") Single
  | @as("multi") Multi
  | @as("none") None
type rowAnimationConfig = {
  enterDuration: float,
  enterOffset: float,
  transitionType: unionArmRecordFieldsRowAnimationConfigTransitionType,
  duration?: float,
  bezier?: (float, float, float, float),
  stiffness?: float,
  damping?: float,
  mass?: float,
}
type tableSettings = {
  rowAnimation?: rowAnimationConfig,
  sticky?: bool,
}
type columnConfig = {
  field: string,
  kind: unionArmRecordFieldsColumnConfigKind,
  maxChars?: float,
  stagger?: float,
  precision?: float,
  format?: string,
}
type selectionConfig = {
  autoFocus?: bool,
  mode: unionArmRecordFieldsSelectionConfigMode,
  selected?: CommonTypes.stringOrStringArray,
  onSelect?: string,  // ⚠️ REVIEW — match the real type by hand
}
