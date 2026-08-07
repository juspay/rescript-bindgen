type props<'b, 'a> = {
  bail?: TrialRollbackHighchartsMemoTypes.Bail.t,  // ⓘ was `Bail` — opaque; build with Bail.fromTrialRollbackHighchartsMemoBailConfig / Bail.fromTrialRollbackHighchartsMemoBailConfig2
  later?: 'b,
  live?: TrialRollbackHighchartsMemoTypes.seriesLiveOptions<'a>,
}

@module("demo")
external make: React.component<props<'b, 'a>> = "Chart"
