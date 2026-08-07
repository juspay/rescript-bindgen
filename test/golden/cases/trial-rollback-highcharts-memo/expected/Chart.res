type props<'a, 'b> = {
  bail?: string,  // ⚪ loose — was `Bail`
  later?: 'a,
  live?: TrialRollbackHighchartsMemoTypes.seriesLiveOptions<'b>,
}

@module("demo")
external make: React.component<props<'a, 'b>> = "Chart"
