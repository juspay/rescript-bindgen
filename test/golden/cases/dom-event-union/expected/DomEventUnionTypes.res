type fieldChangeDetails = {
  reason: string,
  event: Dom.event,
  cancel: unit => unit,
  isCanceled: bool,
}
