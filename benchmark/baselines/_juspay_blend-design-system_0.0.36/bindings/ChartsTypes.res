type chartType =
  | @as("line") Line
  | @as("bar") Bar
  | @as("lineBar") LineBar
  | @as("pie") Pie
  | @as("scatter") Scatter
  | @as("area") Area
  | @as("sankey") Sankey
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
type chartsConstructorType =
  | @as("color") Color
  | @as("end") End
  | @as("start") Start
  | @as("width") Width
  | @as("height") Height
  | @as("animate") Animate
  | @as("circle") Circle
  | @as("rect") Rect
  | @as("stop") Stop
  | @as("find") Find
  | @as("backgroundSize") BackgroundSize
  | @as("wrap") Wrap
  | @as("open") Open
  | @as("addEvent") AddEvent
  | @as("animObject") AnimObject
  | @as("arrayMax") ArrayMax
  | @as("arrayMin") ArrayMin
  | @as("attr") Attr
  | @as("chart") Chart
  | @as("correctFloat") CorrectFloat
  | @as("createElement") CreateElement
  | @as("css") Css
  | @as("dateFormat") DateFormat
  | @as("defined") Defined
  | @as("destroyObjectProperties") DestroyObjectProperties
  | @as("discardElement") DiscardElement
  | @as("erase") Erase
  | @as("error") Error
  | @as("extend") Extend
  | @as("extendClass") ExtendClass
  | @as("fireEvent") FireEvent
  | @as("format") Format
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
  | @as("offset") Offset
  | @as("pad") Pad
  | @as("pick") Pick
  | @as("relativeLength") RelativeLength
  | @as("removeEvent") RemoveEvent
  | @as("seriesType") SeriesType
  | @as("setAnimation") SetAnimation
  | @as("setOptions") SetOptions
  | @as("splat") Splat
  | @as("stableSort") StableSort
  | @as("syncTimeout") SyncTimeout
  | @as("uniqueKey") UniqueKey
  | @as("useSerialIds") UseSerialIds
  | @as("arc") Arc
  | @as("callout") Callout
  | @as("centerImage") CenterImage
  | @as("dateTimeFormat") DateTimeFormat
  | @as("deleteRows") DeleteRows
  | @as("diamond") Diamond
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
  | @as("triangle") Triangle
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
  | @as("Point") Point
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
  | @as("theme") Theme
  | @as("anchorX") AnchorX
  | @as("anchorY") AnchorY
  | @as("clockwise") Clockwise
  | @as("context") Context
  | @as("innerR") InnerR
  | @as("longArc") LongArc
  | @as("r") R
  | @as("x") X
  | @as("y") Y
type chartsDateTimeFormatOptionsDay =
  | @as("numeric") Numeric
  | @as("2-digit") V2Digit
type chartsDateTimeFormatOptionsEra =
  | @as("long") Long
  | @as("narrow") Narrow
  | @as("short") Short
type chartsDateTimeFormatOptionsHour12 =
  | @as("auto") Auto
  | @as("always") Always
  | @as("never") Never
type chartsDateTimeFormatOptionsMonth =
  | @as("numeric") Numeric
  | @as("2-digit") V2Digit
  | @as("long") Long
  | @as("narrow") Narrow
  | @as("short") Short
type chartsDateTimeFormatOptionsTimeZoneName =
  | @as("long") Long
  | @as("short") Short
type chartsXAxisTitleOptionsPosition3d =
  | @as("chart") Chart
  | @as("offset") Offset
  | @as("flap") Flap
  | @as("ortho") Ortho
type chartsSeriesSetState =
  | @as("") Value
  | @as("normal") Normal
  | @as("select") Select
  | @as("hover") Hover
  | @as("inactive") Inactive
type chartsPointSetState =
  | @as("") Value
  | @as("normal") Normal
  | @as("select") Select
  | @as("hover") Hover
  | @as("inactive") Inactive
type chartsSeriesArcdiagramOptionsLinkColorMode =
  | @as("from") From
  | @as("to") To
  | @as("gradient") Gradient
type chartsBorderRadiusOptionsObjectScope =
  | @as("point") Point
  | @as("stack") Stack
type chartsBorderRadiusOptionsObjectWhere =
  | @as("end") End
  | @as("all") All
type chartsPlotOrganizationLinkOptionsType =
  | @as("straight") Straight
  | @as("curved") Curved
  | @as("orthogonal") Orthogonal
type chartsSeriesOrganizationOptionsNodeAlignment =
  | @as("center") Center
  | @as("bottom") Bottom
  | @as("top") Top
type chartsAxisPointBreakEventObjectType =
  | @as("pointBreak") PointBreak
  | @as("pointInBreak") PointInBreak
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
type tooltipConfig = {
  position?: chartsTooltipConfigPositionConfig,
  allowEscapeViewBox?: chartsTooltipConfigAllowEscapeViewBoxConfig,
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
type chartsChartTokensTypeContentLegendDropdownConfig = {
  maxHeight: string,
}
type chartsChartTokensTypeContentLegendItemColorConfig = {
  default: string,
  hover: string,
  active: string,
  total: string,
}
type chartsChartTokensTypeContentLegendItemConfig = {
  gap: string,
  color: chartsChartTokensTypeContentLegendItemColorConfig,
  fontSize: string,
  fontWeight: string,
}
type chartsChartTokensTypeContentLegendConfig = {
  gap: string,
  dropdown: chartsChartTokensTypeContentLegendDropdownConfig,
  item: chartsChartTokensTypeContentLegendItemConfig,
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
@unboxed type stringOrChartsColorsConfig = Str(string) | ChartsColorsConfig(chartsColorsConfig)
