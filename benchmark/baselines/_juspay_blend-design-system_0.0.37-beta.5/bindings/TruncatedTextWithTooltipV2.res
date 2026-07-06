@module("@juspay/blend-design-system") @react.component
external make: (
  ~text: string,
  ~className: string=?,
  ~style: JsxDOM.style=?,
  ~tooltipContent: string=?,
  ~side: TooltipV2Types.tooltipV2Side=?,
  ~align: TooltipV2Types.tooltipV2Align=?,
  ~size: TooltipV2Types.tooltipV2Size=?,
  ~delayDuration: float=?,
  ~offset: float=?,
  ~disabled: bool=?,
  @as("data-element") ~dataElement: string=?,
  @as("data-id") ~dataId: string=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "TruncatedTextWithTooltipV2"
