@@warning("-30")

type filterType =
  | @as("text") Text
  | @as("number") Number
  | @as("select") Select
  | @as("multiselect") Multiselect
  | @as("date") Date
  | @as("boolean") Boolean
  | @as("slider") Slider
type tEXT =
  | @as("text") Text
type nUMBER =
  | @as("number") Number
type dataTableColumnsNumberFormat =
  | @as("percentage") Percentage
  | @as("integer") Integer
  | @as("decimal") Decimal
  | @as("currency") Currency
type aVATAR =
  | @as("avatar") Avatar
type tAG =
  | @as("tag") Tag
type dataTableTagColumnPropsVariant =
  | @as("filled") Filled
  | @as("subtle") Subtle
  | @as("outlined") Outlined
  | @as("no_fill") NoFill
type dataTableTagColumnPropsColor =
  | @as("error") Error
  | @as("primary") Primary
  | @as("success") Success
  | @as("secondary") Secondary
  | @as("warning") Warning
  | @as("neutral") Neutral
type dataTableTagColumnPropsSize =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type pROGRESS =
  | @as("progress") Progress
type dataTableProgressColumnPropsColor =
  | @as("error") Error
  | @as("primary") Primary
  | @as("success") Success
  | @as("secondary") Secondary
  | @as("warning") Warning
type dROPDOWN =
  | @as("dropdown") Dropdown
type dATE =
  | @as("date") Date
type dateFormat =
  | @as("DD MMM YYYY") DDMMMYYYY
  | @as("DD/MM/YYYY") DDMMYYYY
  | @as("MM/DD/YYYY") MMDDYYYY
  | @as("YYYY-MM-DD") YYYYMMDD
  | @as("DD MMM YYYY, hh:mm A") DDMMMYYYYHhMmA
  | @as("DD MMM YYYY, HH:mm") DDMMMYYYYHHMm
  | @as("MMM DD, YYYY") MMMDDYYYY
  | @as("YYYY/MM/DD HH:mm") YYYYMMDDHHMm
  | @as("HH:mm:ss") HHMmSs
type sLIDER =
  | @as("slider") Slider
type dataTableSliderColumnPropsValueType =
  | @as("number") Number
  | @as("percentage") Percentage
  | @as("decimal") Decimal
type rEACT_ELEMENT =
  | @as("react_element") ReactElement
type dataTableColumnsFilterTypeType =
  | @as("select") Select
  | @as("multiselect") Multiselect
  | @as("date_range") DateRangeTypeType
  | @as("custom") Custom
type sortDirection =
  | @as("none") None
  | @as("asc") Asc
  | @as("desc") Desc
type dataTableColumnFilterOperator =
  | @as("endsWith") EndsWith
  | @as("startsWith") StartsWith
  | @as("range") Range
  | @as("contains") Contains
  | @as("equals") Equals
  | @as("gt") Gt
  | @as("lt") Lt
  | @as("gte") Gte
  | @as("lte") Lte
type dataTableExportFormat =
  | @as("csv") Csv
  | @as("xlsx") Xlsx
type dataTableExportScope =
  | @as("currentPage") CurrentPage
  | @as("allLoaded") AllLoaded
type pivotAggregationType =
  | @as("sum") Sum
  | @as("count") Count
  | @as("average") Average
  | @as("mean") Mean
  | @as("median") Median
  | @as("min") Min
  | @as("max") Max
type columnType =
  | @as("text") Text
  | @as("number") Number
  | @as("avatar") Avatar
  | @as("tag") Tag
  | @as("progress") Progress
  | @as("dropdown") Dropdown
  | @as("react_element") ReactElement
  | @as("select") Select
  | @as("multiselect") Multiselect
  | @as("date") Date
  | @as("date_range") DateRangeColumnType
  | @as("slider") Slider
  | @as("custom") Custom
type dataTableColumnTypeConfigFilterComponent =
  | @as("search") Search
  | @as("slider") Slider
  | @as("select") Select
  | @as("multiselect") Multiselect
  | @as("dateRange") DateRangeFilterComponent
  | @as("numberRange") NumberRange
type dataTablePivotPreviewRowPivotRowType =
  | @as("data") Data
  | @as("subtotal") Subtotal
  | @as("grand_total") GrandTotal
type dataTableHeaderTypeTitleConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type dataTableHeaderTypeDescriptionConfig = {
  fontSize: string,
  color: string,
  lineHeight: string,
  maxWidth: string,
}
type dataTableHeaderTypeHeaderSlot1Config = {
  maxHeight: string,
  flexShrink: string,
}
type dataTableHeaderTypeTitleRowConfig = {
  gap: string,
  marginBottom: string,
  justifyContent: string,
  alignItems: string,
}
type dataTableHeaderTypeDescriptionRowConfig = {
  marginTop: string,
}
type __typeV44l1h = {
  width: string,
  height: string,
}
type __typeC0bwm = {
  width: string,
  height: string,
  color: string,
}
type dataTableHeaderTypeActionIconsConfig = {
  gap: string,
  searchIcon: __typeV44l1h,
  filterIcon: __typeV44l1h,
  columnManagerIcon: __typeC0bwm,
  columnManagerTrigger?: string,  // ⚪ loose — was `{ backgroundColor: BackgroundColor; opacity: string | number | RuleSet<any> | StyledObject<BaseObject> | Style`
}
type headerType = {
  display: string,
  justifyContent: string,
  alignItems: string,
  marginBottom: string,
  gap: string,
  maxWidth: string,
  overflowX: string,
  overflowY: string,
  title: dataTableHeaderTypeTitleConfig,
  description: dataTableHeaderTypeDescriptionConfig,
  headerSlot1: dataTableHeaderTypeHeaderSlot1Config,
  headerSlot2: dataTableHeaderTypeHeaderSlot1Config,
  headerSlot3: dataTableHeaderTypeHeaderSlot1Config,
  titleRow: dataTableHeaderTypeTitleRowConfig,
  descriptionRow: dataTableHeaderTypeDescriptionRowConfig,
  actionIcons: dataTableHeaderTypeActionIconsConfig,
}
type __typeF0sm8 = {
  fontSize: string,
  fontWeight: string,
  flex?: string,
  color: string,
}
type bulkActionsType = {
  top: string,
  left: string,
  transform: string,
  zIndex: string,
  backgroundColor: string,
  color: string,
  borderRadius: string,
  padding: string,
  boxShadow: string,
  display: string,
  alignItems: string,
  gap: string,
  minWidth?: string,
  width?: string,
  maxWidth?: string,
  border: string,
  selectText: __typeF0sm8,
  height: string,
}
type __typeV139hr = {
  backgroundColor: string,
}
type __typeV1dql9 = {
  height: string,
  @as("&:hover") __hover: __typeV139hr,
}
type __typeCwezu = {
  padding: string,
  textAlign: string,
  fontWeight: string,
  color: string,
  fontSize: string,
  width?: string,
  backgroundColor?: string,
}
type __typeV9f1li = {
  cursor: string,
  userSelect: string,
}
type __typeV182le = {
  padding: string,
  borderRadius: string,
  hoverBackground: string,
  iconColor: string,
  textColor: string,
  fontSize: string,
  fontWeight: string,
}
type __typeH87hy = {
  backgroundColor: string,
  borderRadius: string,
  border: string,
  cursor: string,
  textColor: string,
  maxHeight: string,
  overflowY: string,
  gap: string,
  sortOption: __typeV182le,
  selectedBackground: string,
  hoverBackground: string,
  selectedTextColor: string,
  normalTextColor: string,
  selectedFontWeight: string,
  normalFontWeight: string,
  itemPadding: string,
  itemGap: string,
  itemBorderRadius: string,
  itemFontSize: string,
  groupLabelFontSize: string,
  groupLabelFontWeight: string,
  groupLabelColor: string,
  groupLabelPadding: string,
  groupLabelTextTransform: string,
  separatorHeight: string,
  separatorColor: string,
}
type __typeV1v8bo = {
  backgroundColor: string,
  borderBottom: string,
  height: string,
  row: __typeV1dql9,
  cell: __typeCwezu,
  sortable: __typeV9f1li,
  filter: __typeH87hy,
}
type __typeYye8b = {
  fontSize: string,
  color: string,
}
type __typeAn4co = {
  gap: string,
  padding: string,
  borderRadius: string,
  display: string,
  alignItems: string,
  backgroundColor: string,
  border: string,
  background: string,
  cursor: string,
  color: string,
  fontSize: string,
  hoverColor: string,
}
type __typeV17xsx = {
  gap: string,
}
type __typeAthka = {
  pageText: __typeYye8b,
  pageSizeSelector: __typeAn4co,
  pageNavigation: __typeV17xsx,
}
type __typeKoc7l = {
  display: string,
  justifyContent: string,
  alignItems: string,
  padding: string,
  borderTop: string,
  height: string,
  position: string,
  bottom: string,
  backgroundColor: string,
  zIndex: string,
  flexShrink: string,
  pagination: __typeAthka,
}
type dataTableTableTokenTypeDataTableTableConfig = {
  width: string,
  tableLayout: string,
  borderCollapse: string,
  borderSpacing: string,
  position: string,
  minWidth: string,
  header: __typeV1v8bo,
  body: string,  // ⚪ loose — was `{ backgroundColor: BackgroundColor; borderTop: BorderTop<number | (string & {})>; row: { height: Height<number`
  footer: __typeKoc7l,
}
type dataTableTableTokenTypeDataTableConfig = {
  borderRadius: string,
  border: string,
  maxHeight: string,
  minHeight?: string,
  bulkActions: bulkActionsType,
  table: dataTableTableTokenTypeDataTableTableConfig,
}
type tableTokenType = {
  padding?: string,
  width?: string,
  height?: string,
  display?: string,
  flexDirection?: string,
  position?: string,
  header: headerType,
  dataTable: dataTableTableTokenTypeDataTableConfig,
}
type responsiveTableTokens = {
  sm: tableTokenType,
  lg: tableTokenType,
}
type filterOption = {
  id: string,
  label: string,
  value: string,
}
type avatarColumnProps = {
  src?: string,
  alt?: string,
  label: string,
  sublabel?: string,
  imageUrl?: string,
}
type tagColumnProps = {
  text: string,
  variant?: dataTableTagColumnPropsVariant,
  color?: dataTableTagColumnPropsColor,
  size?: dataTableTagColumnPropsSize,
  leftSlot?: React.element,
  rightSlot?: React.element,
}
type progressColumnProps = {
  value: float,
  max?: float,
  label?: string,
  showPercentage?: bool,
  color?: dataTableProgressColumnPropsColor,
}
type dataTableDropdownColumnPropsOptionsConfig = {
  id: string,
  label: string,
  value: JSON.t,
  icon?: React.element,
}
type dropdownColumnProps = {
  options: array<dataTableDropdownColumnPropsOptionsConfig>,
  selectedValue?: JSON.t,
  placeholder?: string,
  onSelect?: JSON.t => unit,
}
type dataTableColumnsDropdownDropdownOptionsConfig = {
  id: string,
  label: string,
  value: JSON.t,
}
type dateColumnProps = {
  date: string,  // ⚠️ REVIEW — was `string | Date` — match the real type by hand
  format?: dateFormat,
  showTime?: bool,
  dateLabel?: string,
}
type sliderColumnProps = {
  min: float,
  max: float,
  step?: float,
  valueType?: dataTableSliderColumnPropsValueType,
  decimalPlaces?: float,
  prefix?: string,
  suffix?: string,
}
type columnDefinition_t
type rec dataTableColumnsFilterTypeConfigD3aey<'a> = {
  field: string,
  header: string,
  headerSubtext?: string,
  minWidth?: string,
  maxWidth?: string,
  width?: string,
  isVisible?: bool,
  isSortable?: bool,
  isEditable?: bool,
  filterOptions?: array<filterOption>,
  canHide?: bool,
  frozen?: bool,
  className?: string,
  filterType?: filterType,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  getSortField?: option<string> => string,
  isDeltaSortable?: bool,
  sortValueFormatter?: (JSON.t, 'a, columnDefinition_t, option<string>) => JSON.t,
  @as("type") type_: dataTableColumnsFilterTypeType,
  renderCell?: (JSON.t, 'a, option<float>) => React.element,
}
and dataTableColumnsReactElementConfigPge2t<'a> = {
  field: string,
  header: string,
  headerSubtext?: string,
  minWidth?: string,
  maxWidth?: string,
  width?: string,
  isVisible?: bool,
  isSortable: bool,
  isEditable?: bool,
  filterOptions?: array<filterOption>,
  canHide?: bool,
  frozen?: bool,
  className?: string,
  filterType?: filterType,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  getSortField?: option<string> => string,
  isDeltaSortable?: bool,
  sortValueFormatter?: (JSON.t, 'a, columnDefinition_t, option<string>) => JSON.t,
  @as("type") type_: rEACT_ELEMENT,
  renderCell: (JSON.t, 'a, float) => React.element,
}
and dataTableColumnsSliderConfigC071l<'a> = {
  field: string,
  header: string,
  headerSubtext?: string,
  minWidth?: string,
  maxWidth?: string,
  width?: string,
  isVisible?: bool,
  isSortable?: bool,
  isEditable?: bool,
  filterOptions?: array<filterOption>,
  canHide?: bool,
  frozen?: bool,
  className?: string,
  filterType?: filterType,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  getSortField?: option<string> => string,
  isDeltaSortable?: bool,
  sortValueFormatter?: (JSON.t, 'a, columnDefinition_t, option<string>) => JSON.t,
  @as("type") type_: sLIDER,
  renderCell?: (float, 'a, float) => React.element,
  sliderConfig: sliderColumnProps,
}
and dataTableColumnsDateConfigSgn7d<'a> = {
  field: string,
  header: string,
  headerSubtext?: string,
  minWidth?: string,
  maxWidth?: string,
  width?: string,
  isVisible?: bool,
  isSortable?: bool,
  isEditable?: bool,
  filterOptions?: array<filterOption>,
  canHide?: bool,
  frozen?: bool,
  className?: string,
  filterType?: filterType,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  getSortField?: option<string> => string,
  isDeltaSortable?: bool,
  sortValueFormatter?: (JSON.t, 'a, columnDefinition_t, option<string>) => JSON.t,
  @as("type") type_: dATE,
  renderCell?: (dateColumnProps, 'a, float) => React.element,
  dateFormat?: dateFormat,
  showTime?: bool,
  dateLabel?: string,
}
and dataTableColumnsDropdownConfigV16eou<'a> = {
  field: string,
  header: string,
  headerSubtext?: string,
  minWidth?: string,
  maxWidth?: string,
  width?: string,
  isVisible?: bool,
  isSortable?: bool,
  isEditable?: bool,
  filterOptions?: array<filterOption>,
  canHide?: bool,
  frozen?: bool,
  className?: string,
  filterType?: filterType,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  getSortField?: option<string> => string,
  isDeltaSortable?: bool,
  sortValueFormatter?: (JSON.t, 'a, columnDefinition_t, option<string>) => JSON.t,
  @as("type") type_: dROPDOWN,
  renderCell?: (dropdownColumnProps, 'a, float) => React.element,
  dropdownOptions?: array<dataTableColumnsDropdownDropdownOptionsConfig>,
}
and dataTableColumnsProgressConfigMox82<'a> = {
  field: string,
  header: string,
  headerSubtext?: string,
  minWidth?: string,
  maxWidth?: string,
  width?: string,
  isVisible?: bool,
  isSortable?: bool,
  isEditable?: bool,
  filterOptions?: array<filterOption>,
  canHide?: bool,
  frozen?: bool,
  className?: string,
  filterType?: filterType,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  getSortField?: option<string> => string,
  isDeltaSortable?: bool,
  sortValueFormatter?: (JSON.t, 'a, columnDefinition_t, option<string>) => JSON.t,
  @as("type") type_: pROGRESS,
  renderCell?: (progressColumnProps, 'a, float) => React.element,
}
and dataTableColumnsTagConfigV1aqch<'a> = {
  field: string,
  header: string,
  headerSubtext?: string,
  minWidth?: string,
  maxWidth?: string,
  width?: string,
  isVisible?: bool,
  isSortable?: bool,
  isEditable?: bool,
  filterOptions?: array<filterOption>,
  canHide?: bool,
  frozen?: bool,
  className?: string,
  filterType?: filterType,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  getSortField?: option<string> => string,
  isDeltaSortable?: bool,
  sortValueFormatter?: (JSON.t, 'a, columnDefinition_t, option<string>) => JSON.t,
  @as("type") type_: tAG,
  renderCell?: (tagColumnProps, 'a, float) => React.element,
}
and dataTableColumnsAvatarConfigD5gy6<'a> = {
  field: string,
  header: string,
  headerSubtext?: string,
  minWidth?: string,
  maxWidth?: string,
  width?: string,
  isVisible?: bool,
  isSortable?: bool,
  isEditable?: bool,
  filterOptions?: array<filterOption>,
  canHide?: bool,
  frozen?: bool,
  className?: string,
  filterType?: filterType,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  getSortField?: option<string> => string,
  isDeltaSortable?: bool,
  sortValueFormatter?: (JSON.t, 'a, columnDefinition_t, option<string>) => JSON.t,
  @as("type") type_: aVATAR,
  renderCell?: (avatarColumnProps, 'a, float) => React.element,
}
and dataTableColumnsNumberConfigV8gewe<'a> = {
  field: string,
  header: string,
  headerSubtext?: string,
  minWidth?: string,
  maxWidth?: string,
  width?: string,
  isVisible?: bool,
  isSortable?: bool,
  isEditable?: bool,
  filterOptions?: array<filterOption>,
  canHide?: bool,
  frozen?: bool,
  className?: string,
  filterType?: filterType,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  getSortField?: option<string> => string,
  isDeltaSortable?: bool,
  sortValueFormatter?: (JSON.t, 'a, columnDefinition_t, option<string>) => JSON.t,
  @as("type") type_: nUMBER,
  renderCell?: (float, 'a, float) => React.element,
  format?: dataTableColumnsNumberFormat,
  precision?: float,
}
and dataTableColumnsTextConfigV1rwhh<'a> = {
  field: string,
  header: string,
  headerSubtext?: string,
  minWidth?: string,
  maxWidth?: string,
  width?: string,
  isVisible?: bool,
  isSortable?: bool,
  isEditable?: bool,
  filterOptions?: array<filterOption>,
  canHide?: bool,
  frozen?: bool,
  className?: string,
  filterType?: filterType,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  getSortField?: option<string> => string,
  isDeltaSortable?: bool,
  sortValueFormatter?: (JSON.t, 'a, columnDefinition_t, option<string>) => JSON.t,
  @as("type") type_: tEXT,
  renderCell?: (string, 'a, float) => React.element,
}
module ColumnDefinition = {
  type t = columnDefinition_t
  external fromDataTableColumnsTextConfig: dataTableColumnsTextConfigV1rwhh<'a> => t = "%identity"
  external asDataTableColumnsTextConfig: t => (dataTableColumnsTextConfigV1rwhh<'a>) = "%identity"
  external fromDataTableColumnsNumberConfig: dataTableColumnsNumberConfigV8gewe<'a> => t = "%identity"
  external asDataTableColumnsNumberConfig: t => (dataTableColumnsNumberConfigV8gewe<'a>) = "%identity"
  external fromDataTableColumnsAvatarConfig: dataTableColumnsAvatarConfigD5gy6<'a> => t = "%identity"
  external asDataTableColumnsAvatarConfig: t => (dataTableColumnsAvatarConfigD5gy6<'a>) = "%identity"
  external fromDataTableColumnsTagConfig: dataTableColumnsTagConfigV1aqch<'a> => t = "%identity"
  external asDataTableColumnsTagConfig: t => (dataTableColumnsTagConfigV1aqch<'a>) = "%identity"
  external fromDataTableColumnsProgressConfig: dataTableColumnsProgressConfigMox82<'a> => t = "%identity"
  external asDataTableColumnsProgressConfig: t => (dataTableColumnsProgressConfigMox82<'a>) = "%identity"
  external fromDataTableColumnsDropdownConfig: dataTableColumnsDropdownConfigV16eou<'a> => t = "%identity"
  external asDataTableColumnsDropdownConfig: t => (dataTableColumnsDropdownConfigV16eou<'a>) = "%identity"
  external fromDataTableColumnsDateConfig: dataTableColumnsDateConfigSgn7d<'a> => t = "%identity"
  external asDataTableColumnsDateConfig: t => (dataTableColumnsDateConfigSgn7d<'a>) = "%identity"
  external fromDataTableColumnsSliderConfig: dataTableColumnsSliderConfigC071l<'a> => t = "%identity"
  external asDataTableColumnsSliderConfig: t => (dataTableColumnsSliderConfigC071l<'a>) = "%identity"
  external fromDataTableColumnsReactElementConfig: dataTableColumnsReactElementConfigPge2t<'a> => t = "%identity"
  external asDataTableColumnsReactElementConfig: t => (dataTableColumnsReactElementConfigPge2t<'a>) = "%identity"
  external fromDataTableColumnsFilterTypeConfig: dataTableColumnsFilterTypeConfigD3aey<'a> => t = "%identity"
  external asDataTableColumnsFilterTypeConfig: t => (dataTableColumnsFilterTypeConfigD3aey<'a>) = "%identity"
}
type dataTableDescriptionTooltipPropsConfig = {
  side?: TooltipTypes.tooltipSide,
  align?: TooltipTypes.tooltipAlign,
  size?: TooltipTypes.tooltipSize,
  showArrow?: bool,
  delayDuration?: float,
  offset?: float,
}
type sortConfig = {
  field: string,
  direction: sortDirection,
  sortType?: string,
}
type searchConfig = {
  query: string,
  caseSensitive?: bool,
  searchFields?: array<string>,
}
type advancedFilterProps = {
  filters: array<JSON.t>,
  onFiltersChange: array<JSON.t> => unit,
  onClearFilters: unit => unit,
}
type dataTableColumnFilterValueConfig = {
  min: float,
  max: float,
}
@unboxed type stringOrStringArrayOrDataTableColumnFilterValueConfig = Str(string) | StrArr(array<string>) | DataTableColumnFilterValueConfig(dataTableColumnFilterValueConfig)
type columnFilter = {
  field: string,
  @as("type") type_: filterType,
  value: stringOrStringArrayOrDataTableColumnFilterValueConfig,
  operator: dataTableColumnFilterOperator,
}
type dataTableColumnManagerPrimaryActionConfig = {
  text: string,
  onClick: array<string> => unit,
  disabled?: bool,
  loading?: bool,
}
type dataTableColumnManagerSecondaryActionConfig = {
  text: string,
  onClick: unit => unit,
  disabled?: bool,
  loading?: bool,
}
type paginationConfig = {
  currentPage: float,
  pageSize: float,
  totalRows: float,
  pageSizeOptions?: array<float>,
}
type dataTableRenderExpandedRowConfig<'a> = {
  row: 'a,
  index: int,
  isExpanded: bool,
  toggleExpansion: unit => unit,
}
type rowSelectionConfig<'a> = {
  isDisabled?: ('a, float) => bool,
  disabledText?: ('a, float) => string,
}
type bulkActionsConfig = {
  showSelectAll?: bool,
  showDeselectAll?: bool,
  onSelectAll?: unit => unit,
  onDeselectAll?: unit => unit,
  customActions?: React.element,
  showExport?: bool,
}
type dataTableExportContext = {
  visibleColumns: array<ColumnDefinition.t>,
  filters: array<columnFilter>,
  advancedFilters: array<JSON.t>,
  search: searchConfig,
  sort: Nullable.t<sortConfig>,
  scope: dataTableExportScope,
}
type dataTableExportConfig<'a> = {
  enabled: bool,
  fileName?: string,
  formats?: array<dataTableExportFormat>,
  scope?: dataTableExportScope,
  onExport?: dataTableExportContext => 'a,
}
type rowActionConfig<'a> = {
  id: string,
  text?: string,
  buttonType?: ButtonTypes.buttonType,
  size?: ButtonTypes.buttonSize,
  subType?: ButtonTypes.buttonSubType,
  leadingIcon?: React.element,
  trailingIcon?: React.element,
  disabled?: CommonTypes.dataTableRowActionConfigDisabled<'a>,
  hidden?: CommonTypes.dataTableRowActionConfigHidden<'a>,
  onClick: ('a, float) => unit,
}
type rowActionsConfig<'a> = {
  showEditAction?: bool,
  slot1?: rowActionConfig<'a>,
  slot2?: rowActionConfig<'a>,
}
// #167: discriminated union — each branch keeps its OWN required fields.
//       Build with Bezier({…}); `transitionType` is auto-filled by @tag.
@tag("transitionType")
type rowAnimationConfig =
  | @as("bezier") Bezier({enterDuration: float, enterOffset: float, duration: float, bezier: (float, float, float, float)})
  | @as("spring") Spring({enterDuration: float, enterOffset: float, stiffness: float, damping: float, mass: float})
type dataTablePivotTableConfigInitialConfigValuesConfig = {
  field: string,
  aggregation: pivotAggregationType,
}
type dataTablePivotTableConfigInitialConfigConfig = {
  rows?: array<string>,
  columns?: array<string>,
  values?: array<dataTablePivotTableConfigInitialConfigValuesConfig>,
}
type dataTablePivotTableConfigPreviewColumnsConfig = {
  key: string,
  label: string,
}
type dataTablePivotTableConfigPreviewRowsConfig = {
  __pivotId: string,
}
@set_index external dataTablePivotTableConfigPreviewRowsConfigSet: (dataTablePivotTableConfigPreviewRowsConfig, string, JSON.t) => unit = ""
type dataTablePivotTableConfigOnConfigChangeConfig = {
  rows: array<string>,
  columns: array<string>,
  values: array<dataTablePivotTableConfigInitialConfigValuesConfig>,
}
type dataTablePivotTableConfigConfig = {
  triggerButton?: React.element,
  triggerSlot?: CommonTypes.v1OrV2OrV3,
  title?: string,
  description?: string,
  showExport?: bool,
  initialConfig?: dataTablePivotTableConfigInitialConfigConfig,
  previewColumns?: array<dataTablePivotTableConfigPreviewColumnsConfig>,
  previewRows?: array<dataTablePivotTableConfigPreviewRowsConfig>,
  availableAggregations?: array<pivotAggregationType>,
  onConfigChange?: dataTablePivotTableConfigOnConfigChangeConfig => unit,
  onExport?: dataTablePivotTableConfigOnConfigChangeConfig => unit,
}
type dataTableValidateColumnDataConfig = {
  text: JSON.t => bool,
  number: JSON.t => bool,
  select: JSON.t => bool,
  multiselect: JSON.t => bool,
  date: JSON.t => bool,
  date_range: JSON.t => bool,
  avatar: JSON.t => bool,
  tag: JSON.t => bool,
  slider: JSON.t => bool,
  custom: JSON.t => bool,
  progress: JSON.t => bool,
  dropdown: JSON.t => bool,
  react_element: JSON.t => bool,
}
type columnTypeConfig = {
  @as("type") type_: columnType,
  filterType: filterType,
  filterOptions?: array<filterOption>,
  supportsSorting: bool,
  supportsFiltering: bool,
  enableSearch?: bool,
  filterComponent?: dataTableColumnTypeConfigFilterComponent,
}
type columnDefinition2_t
type rec dataTableColumnsFilterTypeConfigVgv03<'a> = {
  field: string,
  header: string,
  headerSubtext?: string,
  minWidth?: string,
  maxWidth?: string,
  width?: string,
  isVisible?: bool,
  isSortable?: bool,
  isEditable?: bool,
  filterOptions?: array<filterOption>,
  canHide?: bool,
  frozen?: bool,
  className?: string,
  filterType?: filterType,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  getSortField?: option<string> => string,
  isDeltaSortable?: bool,
  sortValueFormatter?: (JSON.t, 'a, columnDefinition2_t, option<string>) => JSON.t,
  @as("type") type_: dataTableColumnsFilterTypeType,
  renderCell?: (JSON.t, 'a, option<float>) => React.element,
}
and dataTableColumnsReactElementConfigV1b1dd<'a> = {
  field: string,
  header: string,
  headerSubtext?: string,
  minWidth?: string,
  maxWidth?: string,
  width?: string,
  isVisible?: bool,
  isSortable: bool,
  isEditable?: bool,
  filterOptions?: array<filterOption>,
  canHide?: bool,
  frozen?: bool,
  className?: string,
  filterType?: filterType,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  getSortField?: option<string> => string,
  isDeltaSortable?: bool,
  sortValueFormatter?: (JSON.t, 'a, columnDefinition2_t, option<string>) => JSON.t,
  @as("type") type_: rEACT_ELEMENT,
  renderCell: (JSON.t, 'a, float) => React.element,
}
and dataTableColumnsSliderConfigOx3tn<'a> = {
  field: string,
  header: string,
  headerSubtext?: string,
  minWidth?: string,
  maxWidth?: string,
  width?: string,
  isVisible?: bool,
  isSortable?: bool,
  isEditable?: bool,
  filterOptions?: array<filterOption>,
  canHide?: bool,
  frozen?: bool,
  className?: string,
  filterType?: filterType,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  getSortField?: option<string> => string,
  isDeltaSortable?: bool,
  sortValueFormatter?: (JSON.t, 'a, columnDefinition2_t, option<string>) => JSON.t,
  @as("type") type_: sLIDER,
  renderCell?: (float, 'a, float) => React.element,
  sliderConfig: sliderColumnProps,
}
and dataTableColumnsDateConfigV1r9jm<'a> = {
  field: string,
  header: string,
  headerSubtext?: string,
  minWidth?: string,
  maxWidth?: string,
  width?: string,
  isVisible?: bool,
  isSortable?: bool,
  isEditable?: bool,
  filterOptions?: array<filterOption>,
  canHide?: bool,
  frozen?: bool,
  className?: string,
  filterType?: filterType,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  getSortField?: option<string> => string,
  isDeltaSortable?: bool,
  sortValueFormatter?: (JSON.t, 'a, columnDefinition2_t, option<string>) => JSON.t,
  @as("type") type_: dATE,
  renderCell?: (dateColumnProps, 'a, float) => React.element,
  dateFormat?: dateFormat,
  showTime?: bool,
  dateLabel?: string,
}
and dataTableColumnsDropdownConfigV1oyvy<'a> = {
  field: string,
  header: string,
  headerSubtext?: string,
  minWidth?: string,
  maxWidth?: string,
  width?: string,
  isVisible?: bool,
  isSortable?: bool,
  isEditable?: bool,
  filterOptions?: array<filterOption>,
  canHide?: bool,
  frozen?: bool,
  className?: string,
  filterType?: filterType,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  getSortField?: option<string> => string,
  isDeltaSortable?: bool,
  sortValueFormatter?: (JSON.t, 'a, columnDefinition2_t, option<string>) => JSON.t,
  @as("type") type_: dROPDOWN,
  renderCell?: (dropdownColumnProps, 'a, float) => React.element,
  dropdownOptions?: array<dataTableColumnsDropdownDropdownOptionsConfig>,
}
and dataTableColumnsProgressConfigV1i5w7<'a> = {
  field: string,
  header: string,
  headerSubtext?: string,
  minWidth?: string,
  maxWidth?: string,
  width?: string,
  isVisible?: bool,
  isSortable?: bool,
  isEditable?: bool,
  filterOptions?: array<filterOption>,
  canHide?: bool,
  frozen?: bool,
  className?: string,
  filterType?: filterType,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  getSortField?: option<string> => string,
  isDeltaSortable?: bool,
  sortValueFormatter?: (JSON.t, 'a, columnDefinition2_t, option<string>) => JSON.t,
  @as("type") type_: pROGRESS,
  renderCell?: (progressColumnProps, 'a, float) => React.element,
}
and dataTableColumnsTagConfigV6gt3k<'a> = {
  field: string,
  header: string,
  headerSubtext?: string,
  minWidth?: string,
  maxWidth?: string,
  width?: string,
  isVisible?: bool,
  isSortable?: bool,
  isEditable?: bool,
  filterOptions?: array<filterOption>,
  canHide?: bool,
  frozen?: bool,
  className?: string,
  filterType?: filterType,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  getSortField?: option<string> => string,
  isDeltaSortable?: bool,
  sortValueFormatter?: (JSON.t, 'a, columnDefinition2_t, option<string>) => JSON.t,
  @as("type") type_: tAG,
  renderCell?: (tagColumnProps, 'a, float) => React.element,
}
and dataTableColumnsAvatarConfigV5zt3<'a> = {
  field: string,
  header: string,
  headerSubtext?: string,
  minWidth?: string,
  maxWidth?: string,
  width?: string,
  isVisible?: bool,
  isSortable?: bool,
  isEditable?: bool,
  filterOptions?: array<filterOption>,
  canHide?: bool,
  frozen?: bool,
  className?: string,
  filterType?: filterType,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  getSortField?: option<string> => string,
  isDeltaSortable?: bool,
  sortValueFormatter?: (JSON.t, 'a, columnDefinition2_t, option<string>) => JSON.t,
  @as("type") type_: aVATAR,
  renderCell?: (avatarColumnProps, 'a, float) => React.element,
}
and dataTableColumnsNumberConfigIpgvx<'a> = {
  field: string,
  header: string,
  headerSubtext?: string,
  minWidth?: string,
  maxWidth?: string,
  width?: string,
  isVisible?: bool,
  isSortable?: bool,
  isEditable?: bool,
  filterOptions?: array<filterOption>,
  canHide?: bool,
  frozen?: bool,
  className?: string,
  filterType?: filterType,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  getSortField?: option<string> => string,
  isDeltaSortable?: bool,
  sortValueFormatter?: (JSON.t, 'a, columnDefinition2_t, option<string>) => JSON.t,
  @as("type") type_: nUMBER,
  renderCell?: (float, 'a, float) => React.element,
  format?: dataTableColumnsNumberFormat,
  precision?: float,
}
and dataTableColumnsTextConfigV15r4z<'a> = {
  field: string,
  header: string,
  headerSubtext?: string,
  minWidth?: string,
  maxWidth?: string,
  width?: string,
  isVisible?: bool,
  isSortable?: bool,
  isEditable?: bool,
  filterOptions?: array<filterOption>,
  canHide?: bool,
  frozen?: bool,
  className?: string,
  filterType?: filterType,
  showSkeleton?: bool,
  skeletonVariant?: SkeletonTypes.skeletonVariant,
  getSortField?: option<string> => string,
  isDeltaSortable?: bool,
  sortValueFormatter?: (JSON.t, 'a, columnDefinition2_t, option<string>) => JSON.t,
  @as("type") type_: tEXT,
  renderCell?: (string, 'a, float) => React.element,
}
module ColumnDefinition2 = {
  type t = columnDefinition2_t
  external fromDataTableColumnsTextConfig2: dataTableColumnsTextConfigV15r4z<'a> => t = "%identity"
  external asDataTableColumnsTextConfig2: t => (dataTableColumnsTextConfigV15r4z<'a>) = "%identity"
  external fromDataTableColumnsNumberConfig2: dataTableColumnsNumberConfigIpgvx<'a> => t = "%identity"
  external asDataTableColumnsNumberConfig2: t => (dataTableColumnsNumberConfigIpgvx<'a>) = "%identity"
  external fromDataTableColumnsAvatarConfig2: dataTableColumnsAvatarConfigV5zt3<'a> => t = "%identity"
  external asDataTableColumnsAvatarConfig2: t => (dataTableColumnsAvatarConfigV5zt3<'a>) = "%identity"
  external fromDataTableColumnsTagConfig2: dataTableColumnsTagConfigV6gt3k<'a> => t = "%identity"
  external asDataTableColumnsTagConfig2: t => (dataTableColumnsTagConfigV6gt3k<'a>) = "%identity"
  external fromDataTableColumnsProgressConfig2: dataTableColumnsProgressConfigV1i5w7<'a> => t = "%identity"
  external asDataTableColumnsProgressConfig2: t => (dataTableColumnsProgressConfigV1i5w7<'a>) = "%identity"
  external fromDataTableColumnsDropdownConfig2: dataTableColumnsDropdownConfigV1oyvy<'a> => t = "%identity"
  external asDataTableColumnsDropdownConfig2: t => (dataTableColumnsDropdownConfigV1oyvy<'a>) = "%identity"
  external fromDataTableColumnsDateConfig2: dataTableColumnsDateConfigV1r9jm<'a> => t = "%identity"
  external asDataTableColumnsDateConfig2: t => (dataTableColumnsDateConfigV1r9jm<'a>) = "%identity"
  external fromDataTableColumnsSliderConfig2: dataTableColumnsSliderConfigOx3tn<'a> => t = "%identity"
  external asDataTableColumnsSliderConfig2: t => (dataTableColumnsSliderConfigOx3tn<'a>) = "%identity"
  external fromDataTableColumnsReactElementConfig2: dataTableColumnsReactElementConfigV1b1dd<'a> => t = "%identity"
  external asDataTableColumnsReactElementConfig2: t => (dataTableColumnsReactElementConfigV1b1dd<'a>) = "%identity"
  external fromDataTableColumnsFilterTypeConfig2: dataTableColumnsFilterTypeConfigVgv03<'a> => t = "%identity"
  external asDataTableColumnsFilterTypeConfig2: t => (dataTableColumnsFilterTypeConfigVgv03<'a>) = "%identity"
}
type pivotPreviewRow = {
  __pivotId: string,
  __pivotRowType?: dataTablePivotPreviewRowPivotRowType,
}
@set_index external pivotPreviewRowSet: (pivotPreviewRow, string, JSON.t) => unit = ""
