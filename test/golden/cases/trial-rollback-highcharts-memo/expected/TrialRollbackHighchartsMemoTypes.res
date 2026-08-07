type seriesInnerOptions<'a> = {
  data: array<'a>,
  name: string,
}
type trialRollbackHighchartsMemoBailConfigV1qt8b<'a> = {
  kind: string,  // ⚪ loose — was `"a"`
  series: seriesInnerOptions<'a>,
}
type trialRollbackHighchartsMemoBailConfigRvfzs = {
  kind: string,  // ⚪ loose — was `"b"`
  other: float,
}
type seriesLiveOptions<'a> = {
  data: array<'a>,
  label: string,
}
module Bail = {
  type t
  external fromTrialRollbackHighchartsMemoBailConfig: trialRollbackHighchartsMemoBailConfigV1qt8b<'a> => t = "%identity"
  external asTrialRollbackHighchartsMemoBailConfig: t => (trialRollbackHighchartsMemoBailConfigV1qt8b<'a>) = "%identity"
  external fromTrialRollbackHighchartsMemoBailConfig2: trialRollbackHighchartsMemoBailConfigRvfzs => t = "%identity"
  external asTrialRollbackHighchartsMemoBailConfig2: t => (trialRollbackHighchartsMemoBailConfigRvfzs) = "%identity"
}
