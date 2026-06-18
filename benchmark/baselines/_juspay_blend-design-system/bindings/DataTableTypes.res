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
type format =
  | @as("decimal") Decimal
  | @as("integer") Integer
  | @as("currency") Currency
  | @as("percentage") Percentage
type aVATAR =
  | @as("avatar") Avatar
type tAG =
  | @as("tag") Tag
type variant2 =
  | @as("filled") Filled
  | @as("subtle") Subtle
  | @as("outlined") Outlined
  | @as("no_fill") NoFill
type color2 =
  | @as("primary") Primary
  | @as("secondary") Secondary
  | @as("success") Success
  | @as("warning") Warning
  | @as("error") Error
  | @as("neutral") Neutral
type size2 =
  | @as("sm") Sm
  | @as("lg") Lg
  | @as("md") Md
type pROGRESS =
  | @as("progress") Progress
type color3 =
  | @as("primary") Primary
  | @as("secondary") Secondary
  | @as("success") Success
  | @as("warning") Warning
  | @as("error") Error
type dROPDOWN =
  | @as("dropdown") Dropdown
type dATE =
  | @as("date") Date
type sLIDER =
  | @as("slider") Slider
type valueType =
  | @as("number") Number
  | @as("decimal") Decimal
  | @as("percentage") Percentage
type rEACT_ELEMENT =
  | @as("react_element") ReactElement
type type_2 =
  | @as("select") Select
  | @as("multiselect") Multiselect
  | @as("date_range") DateRange
  | @as("custom") Custom
type sortDirection =
  | @as("none") None
  | @as("asc") Asc
  | @as("desc") Desc
type operator =
  | @as("endsWith") EndsWith
  | @as("startsWith") StartsWith
  | @as("contains") Contains
  | @as("equals") Equals
  | @as("gt") Gt
  | @as("lt") Lt
  | @as("gte") Gte
  | @as("lte") Lte
  | @as("range") Range
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
  | @as("date_range") DateRange
  | @as("slider") Slider
  | @as("custom") Custom
type filterComponent =
  | @as("search") Search
  | @as("select") Select
  | @as("slider") Slider
  | @as("multiselect") Multiselect
  | @as("dateRange") DateRange
  | @as("numberRange") NumberRange
type filterOption = {
  id: string,
  label: string,
  value: string,
}
type dataTableColumnsConfig<'a> = {
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
  sortValueFormatter?: (JSON.t, 'a, string, option<string>) => JSON.t,
  @as("type") type_: tEXT,
  renderCell?: (string, 'a, float) => React.element,
}
type dataTableColumnsConfig2<'a> = {
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
  sortValueFormatter?: (JSON.t, 'a, string, option<string>) => JSON.t,
  @as("type") type_: nUMBER,
  renderCell?: (float, 'a, float) => React.element,
  format?: format,
  precision?: float,
}
type avatarColumnProps = {
  src?: string,
  alt?: string,
  label: string,
  sublabel?: string,
  imageUrl?: string,
}
type dataTableColumnsConfig3<'a> = {
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
  sortValueFormatter?: (JSON.t, 'a, string, option<string>) => JSON.t,
  @as("type") type_: aVATAR,
  renderCell?: (avatarColumnProps, 'a, float) => React.element,
}
type tagColumnProps = {
  text: string,
  variant?: variant2,
  color?: color2,
  size?: size2,
  leftSlot?: React.element,
  rightSlot?: React.element,
}
type dataTableColumnsConfig4<'a> = {
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
  sortValueFormatter?: (JSON.t, 'a, string, option<string>) => JSON.t,
  @as("type") type_: tAG,
  renderCell?: (tagColumnProps, 'a, float) => React.element,
}
type progressColumnProps = {
  value: float,
  max?: float,
  label?: string,
  showPercentage?: bool,
  color?: color3,
}
type dataTableColumnsConfig5<'a> = {
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
  sortValueFormatter?: (JSON.t, 'a, string, option<string>) => JSON.t,
  @as("type") type_: pROGRESS,
  renderCell?: (progressColumnProps, 'a, float) => React.element,
}
type dataTableOptionsConfig = {
  id: string,
  label: string,
  value: JSON.t,
  icon?: React.element,
}
type dropdownColumnProps = {
  options: array<dataTableOptionsConfig>,
  selectedValue?: JSON.t,
  placeholder?: string,
  onSelect?: JSON.t => unit,
}
type dataTableDropdownOptionsConfig = {
  id: string,
  label: string,
  value: JSON.t,
}
type dataTableColumnsConfig6<'a> = {
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
  sortValueFormatter?: (JSON.t, 'a, string, option<string>) => JSON.t,
  @as("type") type_: dROPDOWN,
  renderCell?: (dropdownColumnProps, 'a, float) => React.element,
  dropdownOptions?: array<dataTableDropdownOptionsConfig>,
}
type dateColumnProps = {
  date: string,
  format?: string,
  showTime?: bool,
}
type dataTableColumnsConfig7<'a> = {
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
  sortValueFormatter?: (JSON.t, 'a, string, option<string>) => JSON.t,
  @as("type") type_: dATE,
  renderCell?: (dateColumnProps, 'a, float) => React.element,
  dateFormat?: string,
  showTime?: bool,
}
type sliderColumnProps = {
  min: float,
  max: float,
  step?: float,
  valueType?: valueType,
  decimalPlaces?: float,
  prefix?: string,
  suffix?: string,
}
type dataTableColumnsConfig8<'a> = {
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
  sortValueFormatter?: (JSON.t, 'a, string, option<string>) => JSON.t,
  @as("type") type_: sLIDER,
  renderCell?: (float, 'a, float) => React.element,
  sliderConfig: sliderColumnProps,
}
type dataTableColumnsConfig9<'a> = {
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
  sortValueFormatter?: (JSON.t, 'a, string, option<string>) => JSON.t,
  @as("type") type_: rEACT_ELEMENT,
  renderCell: (JSON.t, 'a, float) => React.element,
}
type dataTableColumnsConfig10<'a> = {
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
  sortValueFormatter?: (JSON.t, 'a, string, option<string>) => JSON.t,
  @as("type") type_: type_2,
  renderCell?: (JSON.t, 'a, option<float>) => React.element,
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
type dataTableValueConfig = {
  min: float,
  max: float,
}
@unboxed type stringOrStringArrayOrDataTableValueConfig = Str(string) | StrArr(array<string>) | DataTableValueConfig(dataTableValueConfig)
type columnFilter = {
  field: string,
  @as("type") type_: filterType,
  value: stringOrStringArrayOrDataTableValueConfig,
  operator: operator,
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
type bulkActionsConfig = {
  showSelectAll?: bool,
  showDeselectAll?: bool,
  onSelectAll?: unit => unit,
  onDeselectAll?: unit => unit,
  customActions?: React.element,
  showExport?: bool,
}
type rowActionConfig<'a> = {
  id: string,
  text?: string,
  buttonType?: ButtonTypes.buttonType,
  size?: ButtonTypes.buttonSize,
  subType?: ButtonTypes.buttonSubType,
  leadingIcon?: React.element,
  trailingIcon?: React.element,
  disabled?: CommonTypes.disabled<'a>,
  hidden?: CommonTypes.hidden<'a>,
  onClick: ('a, float) => unit,
}
type rowActionsConfig<'a> = {
  showEditAction?: bool,
  slot1?: rowActionConfig<'a>,
  slot2?: rowActionConfig<'a>,
}
type columnTypeConfig = {
  @as("type") type_: columnType,
  filterType: filterType,
  filterOptions?: array<filterOption>,
  supportsSorting: bool,
  supportsFiltering: bool,
  enableSearch?: bool,
  filterComponent?: filterComponent,
}
type dataTableTitleConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type dataTableDescriptionConfig = {
  fontSize: string,
  color: string,
  lineHeight: string,
  maxWidth: string,
}
type dataTableHeaderSlot1Config = {
  maxHeight: string,
  flexShrink: string,
}
type dataTableTitleRowConfig = {
  gap: string,
  marginBottom: string,
  justifyContent: string,
  alignItems: string,
}
type dataTableDescriptionRowConfig = {
  marginTop: string,
}
type dataTableSearchIconConfig = {
  width: string,
  height: string,
}
type dataTableColumnManagerIconConfig = {
  width: string,
  height: string,
  color: string,
}
type dataTableFocusVisibleConfig = {
  outline: string,
  outlineOffset: string,
  borderRadius: string,
  boxShadow: string,
}
type dataTableColumnManagerTriggerConfig = {
  backgroundColor: string,
  opacity: string,
  focusVisible: dataTableFocusVisibleConfig,
}
type dataTableActionIconsConfig = {
  gap: string,
  searchIcon: dataTableSearchIconConfig,
  filterIcon: dataTableSearchIconConfig,
  columnManagerIcon: dataTableColumnManagerIconConfig,
  columnManagerTrigger?: dataTableColumnManagerTriggerConfig,
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
  title: dataTableTitleConfig,
  description: dataTableDescriptionConfig,
  headerSlot1: dataTableHeaderSlot1Config,
  headerSlot2: dataTableHeaderSlot1Config,
  headerSlot3: dataTableHeaderSlot1Config,
  titleRow: dataTableTitleRowConfig,
  descriptionRow: dataTableDescriptionRowConfig,
  actionIcons: dataTableActionIconsConfig,
}
type dataTableSelectTextConfig = {
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
  selectText: dataTableSelectTextConfig,
  height: string,
}
type dataTableRowConfig = {
  height: string,
  @as("&:hover") __hover: string,
}
type dataTableCellConfig = {
  padding: string,
  textAlign: string,
  fontWeight: string,
  color: string,
  fontSize: string,
  width?: string,
  backgroundColor?: string,
}
type dataTableSortableConfig = {
  cursor: string,
  userSelect: string,
}
type dataTableFilterConfig = {
  backgroundColor: string,
  borderRadius: string,
  border: string,
  cursor: string,
  textColor: string,
  maxHeight: string,
  overflowY: string,
  gap: string,
  sortOption: string,
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
type dataTableHeaderConfig = {
  backgroundColor: string,
  borderBottom: string,
  height: string,
  row: dataTableRowConfig,
  cell: dataTableCellConfig,
  sortable: dataTableSortableConfig,
  filter: dataTableFilterConfig,
}
type dataTableRowConfig2 = {
  height: string,
  @as("&:hover") __hover: string,
  backgroundColor: string,
}
type dataTableCellConfig2 = {
  padding: string,
  fontWeight: string,
  color: string,
  fontSize: string,
  borderTop: string,
  expandable: string,
}
type dataTableBodyConfig = {
  backgroundColor: string,
  borderTop: string,
  row: dataTableRowConfig2,
  cell: dataTableCellConfig2,
}
type dataTablePaginationConfig = {
  pageText: string,
  pageSizeSelector: string,
  pageNavigation: string,
}
type dataTableFooterConfig = {
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
  pagination: dataTablePaginationConfig,
}
type dataTableTableConfig = {
  width: string,
  tableLayout: string,
  borderCollapse: string,
  borderSpacing: string,
  position: string,
  minWidth: string,
  header: dataTableHeaderConfig,
  body: dataTableBodyConfig,
  footer: dataTableFooterConfig,
}
type dataTableDataTableConfig = {
  borderRadius: string,
  border: string,
  maxHeight: string,
  minHeight?: string,
  bulkActions: bulkActionsType,
  table: dataTableTableConfig,
}
type tableTokenType = {
  padding?: string,
  width?: string,
  height?: string,
  display?: string,
  flexDirection?: string,
  position?: string,
  header: headerType,
  dataTable: dataTableDataTableConfig,
}
type responsiveTableTokens = {
  sm: tableTokenType,
  lg: tableTokenType,
}
module ColumnDefinition = {
  type t
  external fromDataTableColumnsConfig: dataTableColumnsConfig<'a> => t = "%identity"
  external fromDataTableColumnsConfig2: dataTableColumnsConfig2<'a> => t = "%identity"
  external fromDataTableColumnsConfig3: dataTableColumnsConfig3<'a> => t = "%identity"
  external fromDataTableColumnsConfig4: dataTableColumnsConfig4<'a> => t = "%identity"
  external fromDataTableColumnsConfig5: dataTableColumnsConfig5<'a> => t = "%identity"
  external fromDataTableColumnsConfig6: dataTableColumnsConfig6<'a> => t = "%identity"
  external fromDataTableColumnsConfig7: dataTableColumnsConfig7<'a> => t = "%identity"
  external fromDataTableColumnsConfig8: dataTableColumnsConfig8<'a> => t = "%identity"
  external fromDataTableColumnsConfig9: dataTableColumnsConfig9<'a> => t = "%identity"
  external fromDataTableColumnsConfig10: dataTableColumnsConfig10<'a> => t = "%identity"
}
