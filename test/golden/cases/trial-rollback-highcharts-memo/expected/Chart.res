type props<'b, 'a> = {
  bail?: string,  // ⚪ loose — was `Bail`
  later?: 'b,
  live?: TrialRollbackHighchartsMemoTypes.seriesLiveOptions<'a>,
}

@module("demo")
external make: React.component<props<'b, 'a>> = "Chart"
