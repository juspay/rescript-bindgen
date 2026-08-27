type chartType =
  | @as("line") Line
  | @as("bar") Bar
  | @as("lineBar") LineBar
  | @as("pie") Pie
  | @as("scatter") Scatter
  | @as("area") Area
  | @as("sankey") Sankey
  | @as("funnel") Funnel
type axisType =
  | @as("dateTime") DateTime
  | @as("currency") Currency
  | @as("percentage") Percentage
  | @as("number") Number
type chartLegendPosition =
  | @as("top") Top
  | @as("right") Right
type legendsChangeType =
  | @as("increase") Increase
  | @as("decrease") Decrease
type chartsTooltipPropsTrigger =
  | @as("hover") Hover
  | @as("click") Click
type chartsFunnelConfigPercentageBase =
  | @as("first") First
  | @as("previous") Previous
type chartsXAxisTitleOptionsPosition3d =
  | @as("offset") Offset
  | @as("chart") Chart
  | @as("flap") Flap
  | @as("ortho") Ortho
type chartsSeriesSetState =
  | @as("") Value
  | @as("normal") Normal
  | @as("inactive") Inactive
  | @as("hover") Hover
  | @as("select") Select
type chartsPointSetState =
  | @as("") Value
  | @as("normal") Normal
  | @as("inactive") Inactive
  | @as("hover") Hover
  | @as("select") Select
type chartsSeriesArcdiagramOptionsLinkColorMode =
  | @as("gradient") Gradient
  | @as("from") From
  | @as("to") To
type chartsBorderRadiusOptionsObjectScope =
  | @as("point") PointObjectScope
  | @as("stack") Stack
type chartsBorderRadiusOptionsObjectWhere =
  | @as("all") All
  | @as("end") End
type chartsSeriesOrganizationOptionsHangingSide =
  | @as("right") Right
  | @as("left") Left
type chartsPlotOrganizationLinkOptionsType =
  | @as("straight") Straight
  | @as("curved") Curved
  | @as("orthogonal") Orthogonal
type chartsSeriesOrganizationOptionsNodeAlignment =
  | @as("top") Top
  | @as("bottom") Bottom
  | @as("center") Center
type chartsBlendChartPropsConstructorType =
  | @as("width") Width
  | @as("height") Height
  | @as("color") Color
  | @as("x") X
  | @as("y") Y
  | @as("error") Error
  | @as("offset") Offset
  | @as("open") Open
  | @as("end") End
  | @as("start") Start
  | @as("backgroundSize") BackgroundSize
  | @as("r") R
  | @as("find") Find
  | @as("wrap") Wrap
  | @as("circle") Circle
  | @as("triangle") Triangle
  | @as("chart") Chart
  | @as("theme") Theme
  | @as("format") Format
  | @as("animate") Animate
  | @as("arc") Arc
  | @as("callout") Callout
  | @as("diamond") Diamond
  | @as("rect") Rect
  | @as("addEvent") AddEvent
  | @as("animObject") AnimObject
  | @as("arrayMax") ArrayMax
  | @as("arrayMin") ArrayMin
  | @as("attr") Attr
  | @as("correctFloat") CorrectFloat
  | @as("createElement") CreateElement
  | @as("css") Css
  | @as("dateFormat") DateFormat
  | @as("defined") Defined
  | @as("destroyObjectProperties") DestroyObjectProperties
  | @as("discardElement") DiscardElement
  | @as("erase") Erase
  | @as("extend") Extend
  | @as("extendClass") ExtendClass
  | @as("fireEvent") FireEvent
  | @as("getDeferredAnimation") GetDeferredAnimation
  | @as("getMagnitude") GetMagnitude
  | @as("getOptions") GetOptions
  | @as("getStyle") GetStyle
  | @as("isArray") IsArray
  | @as("isClass") IsClass
  | @as("isDOMElement") IsDOMElement
  | @as("isFunction") IsFunction
  | @as("isNumber") IsNumber
  | @as("isObject") IsObject
  | @as("isString") IsString
  | @as("merge") Merge
  | @as("normalizeTickInterval") NormalizeTickInterval
  | @as("numberFormat") NumberFormat
  | @as("objectEach") ObjectEach
  | @as("pad") Pad
  | @as("pick") Pick
  | @as("relativeLength") RelativeLength
  | @as("removeEvent") RemoveEvent
  | @as("seriesType") SeriesType
  | @as("setAnimation") SetAnimation
  | @as("setOptions") SetOptions
  | @as("splat") Splat
  | @as("stableSort") StableSort
  | @as("stop") Stop
  | @as("syncTimeout") SyncTimeout
  | @as("uniqueKey") UniqueKey
  | @as("useSerialIds") UseSerialIds
  | @as("centerImage") CenterImage
  | @as("dateTimeFormat") DateTimeFormat
  | @as("deleteRows") DeleteRows
  | @as("getColumn") GetColumn
  | @as("getColumns") GetColumns
  | @as("getLogTickPositions") GetLogTickPositions
  | @as("getModified") GetModified
  | @as("getRendererType") GetRendererType
  | @as("getRow") GetRow
  | @as("modifyTree") ModifyTree
  | @as("registerRendererType") RegisterRendererType
  | @as("registerSeriesType") RegisterSeriesType
  | @as("roundedRect") RoundedRect
  | @as("setColumn") SetColumn
  | @as("setColumns") SetColumns
  | @as("setRow") SetRow
  | @as("str2dtf") Str2dtf
  | @as("triangleDown") TriangleDown
  | @as("unescapeEntities") UnescapeEntities
  | @as("Annotation") Annotation
  | @as("AnnotationControlPoint") AnnotationControlPoint
  | @as("AST") AST
  | @as("Axis") Axis
  | @as("Chart") Chart2
  | @as("Color") Color2
  | @as("DataTable") DataTable
  | @as("DataTableCore") DataTableCore
  | @as("Legend") Legend
  | @as("PlotLineOrBand") PlotLineOrBand
  | @as("Point") PointConstructorType
  | @as("Pointer") Pointer
  | @as("Series") Series
  | @as("StackItem") StackItem
  | @as("SVGElement") SVGElement
  | @as("SVGLabel") SVGLabel
  | @as("SVGRenderer") SVGRenderer
  | @as("Tick") Tick
  | @as("Time") Time
  | @as("Tooltip") Tooltip
  | @as("charts") Charts
  | @as("dateFormats") DateFormats
  | @as("defaultOptions") DefaultOptions
  | @as("anchorX") AnchorX
  | @as("anchorY") AnchorY
  | @as("clockwise") Clockwise
  | @as("context") Context
  | @as("innerR") InnerR
  | @as("longArc") LongArc
type chartsDay =
  | @as("numeric") Numeric
  | @as("2-digit") V2Digit
type chartsEra =
  | @as("long") Long
  | @as("short") Short
  | @as("narrow") Narrow
type chartsMonth =
  | @as("long") Long
  | @as("short") Short
  | @as("narrow") Narrow
  | @as("numeric") Numeric
  | @as("2-digit") V2Digit
type chartsTimeZoneName =
  | @as("long") Long
  | @as("short") Short
type chartsAxisPointBreakEventObjectType =
  | @as("pointBreak") PointBreak
  | @as("pointInBreak") PointInBreak
type chartsChartTokensTypeHeaderPaddingConfig = {
  x: string,
  y: string,
}
type chartsChartTokensTypeHeaderSlotsConfig = {
  gap: string,
}
type chartsChartTokensTypeHeaderConfig = {
  padding: chartsChartTokensTypeHeaderPaddingConfig,
  backgroundColor: string,
  borderBottom: string,
  borderRadius: string,
  slots: chartsChartTokensTypeHeaderSlotsConfig,
}
type __typeSfat4 = {
  maxHeight: string,
}
type chartsUseThemeItemColorConfig = {
  active: string,
  default: string,
  hover: string,
  total: string,
}
type chartsUseThemeItemConfig = {
  gap: string,
  color: chartsUseThemeItemColorConfig,
  fontSize: string,
  fontWeight: string,
}
type chartsChartTokensTypeContentLegendConfig = {
  gap: string,
  dropdown: __typeSfat4,
  item: chartsUseThemeItemConfig,
}
type chartsChartTokensTypeContentPaddingConfig = {
  top: string,
  right: string,
  bottom: string,
  left: string,
}
type chartsChartTokensTypeContentConfig = {
  legend: chartsChartTokensTypeContentLegendConfig,
  padding: chartsChartTokensTypeContentPaddingConfig,
  gap: string,
  backgroundColor: string,
}
type chartTokensType = {
  border: string,
  borderRadius: string,
  header: chartsChartTokensTypeHeaderConfig,
  content: chartsChartTokensTypeContentConfig,
}
type responsiveChartTokens = {
  sm: chartTokensType,
  lg: chartTokensType,
}
type chartsDataPointPrimaryConfig = {
  label: string,
  val: float,
}
type chartsDataPointAuxConfig = {
  label: string,
  val: float,
  @as("type") type_?: axisType,
  dateOnly?: bool,
  smart?: bool,
  timeZone?: string,
  hour12?: bool,
}
type chartsDataPointErrorErrorDataConfig = {
  label: string,
  value: string,
}
type chartsDataPointErrorConfig = {
  title: string,
  errorData?: array<chartsDataPointErrorErrorDataConfig>,
}
type dataPoint = {
  primary: chartsDataPointPrimaryConfig,
  aux?: array<chartsDataPointAuxConfig>,
  error?: chartsDataPointErrorConfig,
}
type newNestedDataPoint = {
  name: string,
  data: Dict.t<dataPoint>,
}
type chartsColorsConfig = {
  key: string,
  color: string,
}
type stackedLegendsDataPoint = {
  value: float,
  delta: float,
  changeType: legendsChangeType,
}
type chartsTickPropsPayloadConfig = {
  value: CommonTypes.stringOrNumber,
  index?: int,
  coordinate?: float,
}
type tickProps = {
  x?: float,
  y?: float,
  payload?: chartsTickPropsPayloadConfig,
}
@set_index external tickPropsSet: (tickProps, string, JSON.t) => unit = ""
type axisConfig = {
  label?: string,
  showLabel?: bool,
  interval?: CommonTypes.preserveStartOrPreserveEndOrPreserveStartEndOrNumber,
  show?: bool,
  @as("type") type_?: axisType,
  tickFormatter?: CommonTypes.stringOrNumber => string,
  customTick?: React.component<tickProps>,
  dateOnly?: bool,
  useUTC?: bool,
  formatString?: string,
  timeOnly?: bool,
  showYear?: bool,
  ticks?: array<CommonTypes.stringOrNumber>,
  autoConsistentTicks?: bool,
  maxTicks?: float,
  smartDateTimeFormat?: bool,
}
type chartsTooltipConfigPositionConfig = {
  x?: float,
  y?: float,
}
type chartsTooltipConfigAllowEscapeViewBoxConfig = {
  x?: bool,
  y?: bool,
}
type rec payload = {
  @as("type") type_?: [#"none"],
  color?: string,
  formatter?: (CommonTypes.stringOrNumberOrStringOrNumberArray, CommonTypes.stringOrNumber, payload, float, array<payload>) => React.element,
  name?: CommonTypes.stringOrNumber,
  value?: CommonTypes.stringOrNumberOrStringOrNumberArray,
  unit?: React.element,
  dataKey?: CommonTypes.stringOrNumber,
  payload?: string,  // 🛑 BROKEN — contains `any`
  chartType?: string,
  stroke?: string,
  strokeDasharray?: CommonTypes.stringOrNumber,
  strokeWidth?: CommonTypes.stringOrNumber,
  className?: string,
  hide?: bool,
}
@unboxed type payloadPayloadUniqBy = Bool(bool) | Fn(payload => JSON.t)
type tooltipContentProps = {
  separator?: string,
  wrapperClassName?: string,
  labelClassName?: string,
  formatter?: (CommonTypes.stringOrNumberOrStringOrNumberArray, CommonTypes.stringOrNumber, payload, float, array<payload>) => React.element,
  contentStyle?: JsxDOM.style,
  itemStyle?: JsxDOM.style,
  labelStyle?: JsxDOM.style,
  labelFormatter?: (string, array<payload>) => React.element,  // 🛑 BROKEN — contains `any`
  label?: string,  // 🛑 BROKEN — contains `any`
  payload?: array<payload>,
  itemSorter?: payload => CommonTypes.stringOrNumber,
  accessibilityLayer?: bool,
  active?: bool,
  includeHidden?: bool,
  allowEscapeViewBox?: UtilTypes.allowInDimension,
  animationDuration?: float,
  animationEasing?: UtilTypes.animationTiming,
  content?: React.element,
  coordinate?: UtilTypes.utilTooltipPropsCoordinateConfig,
  cursor?: React.element,
  filterNull?: bool,
  defaultIndex?: float,
  isAnimationActive?: bool,
  offset?: float,
  payloadUniqBy?: payloadPayloadUniqBy,
  position?: UtilTypes.utilTooltipPropsCoordinateConfig,
  reverseDirection?: UtilTypes.allowInDimension,
  shared?: bool,
  trigger?: chartsTooltipPropsTrigger,
  useTranslate3d?: bool,
  viewBox?: UtilTypes.cartesianViewBox,
  wrapperStyle?: JsxDOM.style,
  originalData: array<newNestedDataPoint>,
  chartType: chartType,
  selectedKeys: array<string>,
  xAxis?: axisConfig,
  yAxis?: axisConfig,
}
type tooltipFormatterParams = {
  seriesName: CommonTypes.stringOrNumber,
  value: CommonTypes.stringOrNumberOrStringOrNumberArray,
  dataIndex: float,
  color: string,
  payload: JSON.t,
}
type tooltipConfig = {
  position?: chartsTooltipConfigPositionConfig,
  allowEscapeViewBox?: chartsTooltipConfigAllowEscapeViewBoxConfig,
  content?: tooltipContentProps => React.element,
  formatter?: tooltipFormatterParams => React.element,
  labelFormatter?: CommonTypes.stringOrNumber => React.element,
}
type tooltipProps = {
  separator?: string,
  wrapperClassName?: string,
  labelClassName?: string,
  formatter?: (CommonTypes.stringOrNumberOrStringOrNumberArray, CommonTypes.stringOrNumber, payload, float, array<payload>) => React.element,
  contentStyle?: JsxDOM.style,
  itemStyle?: JsxDOM.style,
  labelStyle?: JsxDOM.style,
  labelFormatter?: (string, array<payload>) => React.element,  // 🛑 BROKEN — contains `any`
  label?: string,  // 🛑 BROKEN — contains `any`
  payload?: array<payload>,
  itemSorter?: payload => CommonTypes.stringOrNumber,
  accessibilityLayer?: bool,
  active?: bool,
  includeHidden?: bool,
  allowEscapeViewBox?: UtilTypes.allowInDimension,
  animationDuration?: float,
  animationEasing?: UtilTypes.animationTiming,
  content?: JSON.t,
  coordinate?: UtilTypes.utilTooltipPropsCoordinateConfig,
  cursor?: React.element,
  filterNull?: bool,
  defaultIndex?: float,
  isAnimationActive?: bool,
  offset?: float,
  payloadUniqBy?: payloadPayloadUniqBy,
  position?: UtilTypes.utilTooltipPropsCoordinateConfig,
  reverseDirection?: UtilTypes.allowInDimension,
  shared?: bool,
  trigger?: chartsTooltipPropsTrigger,
  useTranslate3d?: bool,
  viewBox?: UtilTypes.cartesianViewBox,
  wrapperStyle?: JsxDOM.style,
}
type funnelConfig = {
  percentageBase?: chartsFunnelConfigPercentageBase,
  showLabels?: bool,
}
type noDataProps = {
  title?: string,
  subtitle?: string,
  slot?: React.element,
  button?: ButtonTypes.buttonProps,
}
type chartsSkeletonProps = {
  show: bool,
  variant: SkeletonTypes.skeletonVariant,
}
type chartsLegendsConfig = {
  title: string,
  total?: string,
}
type chartsDotItemDotPropsPayloadConfig = {
  name?: string,
}
type dotItemDotProps = {
  cx?: float,
  cy?: float,
  value?: float,
  payload?: chartsDotItemDotPropsPayloadConfig,
}
type chartsPayloadConfig = {
  name: string,
  id?: string,
  color?: string,
  value?: float,
}
type chartsSankeyTooltipDataPayloadConfig = {
  name?: string,
  value?: float,
  source?: CommonTypes.stringOrNumber,
  target?: CommonTypes.stringOrNumber,
  sourceName?: string,
  targetName?: string,
  color?: string,
  hoverColor?: string,
}
type sankeyTooltipData = {
  payload: chartsSankeyTooltipDataPayloadConfig,
}
type sankeyLink = {
  source: CommonTypes.stringOrNumber,
  target: CommonTypes.stringOrNumber,
  value: float,
  color?: string,
  hoverColor?: string,
}
@unboxed type stringOrChartsColorsConfig = Str(string) | ChartsColorsConfig(chartsColorsConfig)
