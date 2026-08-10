type seriesInnerOptions<'a> = {
  data: array<'a>,
  name: string,
}
type trialRollbackHighchartsMemoBailConfigV1rtfs<'a> = {
  kind: [#a],
  series: seriesInnerOptions<'a>,
}
type trialRollbackHighchartsMemoBailConfigQ3izo = {
  kind: [#b],
  other: float,
}
type seriesLiveOptions<'a> = {
  data: array<'a>,
  label: string,
}
module Bail = {
  type t
  external fromTrialRollbackHighchartsMemoBailConfig: trialRollbackHighchartsMemoBailConfigV1rtfs<'a> => t = "%identity"
  external asTrialRollbackHighchartsMemoBailConfig: t => (trialRollbackHighchartsMemoBailConfigV1rtfs<'a>) = "%identity"
  external fromTrialRollbackHighchartsMemoBailConfig2: trialRollbackHighchartsMemoBailConfigQ3izo => t = "%identity"
  external asTrialRollbackHighchartsMemoBailConfig2: t => (trialRollbackHighchartsMemoBailConfigQ3izo) = "%identity"
}
