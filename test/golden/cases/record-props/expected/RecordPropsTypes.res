type recordPropsType =
  | @as("line") Line
  | @as("filled") Filled
type recordPropsWeirdConfigV3w34y = {
  a: string,  // ⚪ loose — was `1`
}
type recordPropsWeirdConfigWcv1r = {
  b: string,  // ⚪ loose — was `2`
}
module RecordPropsWeird = {
  type t
  external fromString: string => t = "%identity"
  external fromRecordPropsWeirdConfig: recordPropsWeirdConfigV3w34y => t = "%identity"
  external asRecordPropsWeirdConfig: t => (recordPropsWeirdConfigV3w34y) = "%identity"
  external fromRecordPropsWeirdConfig2: recordPropsWeirdConfigWcv1r => t = "%identity"
  external asRecordPropsWeirdConfig2: t => (recordPropsWeirdConfigWcv1r) = "%identity"
}
