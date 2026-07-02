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
  | @as("decimal") Decimal
  | @as("percentage") Percentage
  | @as("integer") Integer
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
  | @as("secondary") Secondary
  | @as("success") Success
  | @as("warning") Warning
  | @as("neutral") Neutral
type dataTableTagColumnPropsSize =
  | @as("sm") Sm
  | @as("lg") Lg
  | @as("md") Md
type pROGRESS =
  | @as("progress") Progress
type dataTableProgressColumnPropsColor =
  | @as("error") Error
  | @as("primary") Primary
  | @as("secondary") Secondary
  | @as("success") Success
  | @as("warning") Warning
type dROPDOWN =
  | @as("dropdown") Dropdown
type dATE =
  | @as("date") Date
type sLIDER =
  | @as("slider") Slider
type dataTableSliderColumnPropsValueType =
  | @as("number") Number
  | @as("decimal") Decimal
  | @as("percentage") Percentage
type rEACT_ELEMENT =
  | @as("react_element") ReactElement
type dataTableColumnsFilterTypeType =
  | @as("select") Select
  | @as("multiselect") Multiselect
  | @as("date_range") DateRange
  | @as("custom") Custom
type sortDirection =
  | @as("none") None
  | @as("asc") Asc
  | @as("desc") Desc
type dataTableColumnFilterOperator =
  | @as("endsWith") EndsWith
  | @as("startsWith") StartsWith
  | @as("contains") Contains
  | @as("range") Range
  | @as("equals") Equals
  | @as("gt") Gt
  | @as("lt") Lt
  | @as("gte") Gte
  | @as("lte") Lte
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
type dataTableColumnTypeConfigFilterComponent =
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
type dataTableColumnsTextConfig<'a> = {
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
type dataTableColumnsNumberConfig<'a> = {
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
  format?: dataTableColumnsNumberFormat,
  precision?: float,
}
type avatarColumnProps = {
  src?: string,
  alt?: string,
  label: string,
  sublabel?: string,
  imageUrl?: string,
}
type dataTableColumnsAvatarConfig<'a> = {
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
  variant?: dataTableTagColumnPropsVariant,
  color?: dataTableTagColumnPropsColor,
  size?: dataTableTagColumnPropsSize,
  leftSlot?: React.element,
  rightSlot?: React.element,
}
type dataTableColumnsTagConfig<'a> = {
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
  color?: dataTableProgressColumnPropsColor,
}
type dataTableColumnsProgressConfig<'a> = {
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
type dataTableColumnsDropdownConfig<'a> = {
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
  dropdownOptions?: array<dataTableColumnsDropdownDropdownOptionsConfig>,
}
type dateColumnProps = {
  date: string,
  format?: string,
  showTime?: bool,
}
type dataTableColumnsDateConfig<'a> = {
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
  valueType?: dataTableSliderColumnPropsValueType,
  decimalPlaces?: float,
  prefix?: string,
  suffix?: string,
}
type dataTableColumnsSliderConfig<'a> = {
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
type dataTableColumnsReactElementConfig<'a> = {
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
type dataTableColumnsFilterTypeConfig<'a> = {
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
  @as("type") type_: dataTableColumnsFilterTypeType,
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
  disabled?: CommonTypes.dataTableRowActionConfigDisabled<'a>,
  hidden?: CommonTypes.dataTableRowActionConfigHidden<'a>,
  onClick: ('a, float) => unit,
}
type rowActionsConfig<'a> = {
  showEditAction?: bool,
  slot1?: rowActionConfig<'a>,
  slot2?: rowActionConfig<'a>,
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
type dataTableHeaderTypeActionIconsSearchIconConfig = {
  width: string,
  height: string,
}
type dataTableHeaderTypeActionIconsColumnManagerIconConfig = {
  width: string,
  height: string,
  color: string,
}
type dataTableHeaderTypeActionIconsColumnManagerTriggerFocusVisibleConfig = {
  outline: string,
  outlineOffset: string,
  borderRadius: string,
  boxShadow: string,
}
type dataTableHeaderTypeActionIconsColumnManagerTriggerConfig = {
  backgroundColor: string,
  opacity: string,
  focusVisible: dataTableHeaderTypeActionIconsColumnManagerTriggerFocusVisibleConfig,
}
type dataTableHeaderTypeActionIconsConfig = {
  gap: string,
  searchIcon: dataTableHeaderTypeActionIconsSearchIconConfig,
  filterIcon: dataTableHeaderTypeActionIconsSearchIconConfig,
  columnManagerIcon: dataTableHeaderTypeActionIconsColumnManagerIconConfig,
  columnManagerTrigger?: dataTableHeaderTypeActionIconsColumnManagerTriggerConfig,
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
type dataTableBulkActionsTypeSelectTextConfig = {
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
  selectText: dataTableBulkActionsTypeSelectTextConfig,
  height: string,
}
type dataTableTableTokenTypeDataTableTableHeaderRowConfig = {
  height: string,
  @as("&:hover") __hover: string,
}
type dataTableTableTokenTypeDataTableTableHeaderCellConfig = {
  padding: string,
  textAlign: string,
  fontWeight: string,
  color: string,
  fontSize: string,
  width?: string,
  backgroundColor?: string,
}
type dataTableTableTokenTypeDataTableTableHeaderSortableConfig = {
  cursor: string,
  userSelect: string,
}
type dataTableTableTokenTypeDataTableTableHeaderFilterConfig = {
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
type dataTableTableTokenTypeDataTableTableHeaderConfig = {
  backgroundColor: string,
  borderBottom: string,
  height: string,
  row: dataTableTableTokenTypeDataTableTableHeaderRowConfig,
  cell: dataTableTableTokenTypeDataTableTableHeaderCellConfig,
  sortable: dataTableTableTokenTypeDataTableTableHeaderSortableConfig,
  filter: dataTableTableTokenTypeDataTableTableHeaderFilterConfig,
}
type dataTableTableTokenTypeDataTableTableBodyRowConfig = {
  height: string,
  @as("&:hover") __hover: string,
  backgroundColor: string,
}
type dataTableTableTokenTypeDataTableTableBodyCellConfig = {
  padding: string,
  fontWeight: string,
  color: string,
  fontSize: string,
  borderTop: string,
  expandable: string,
}
type dataTableTableTokenTypeDataTableTableBodyConfig = {
  backgroundColor: string,
  borderTop: string,
  row: dataTableTableTokenTypeDataTableTableBodyRowConfig,
  cell: dataTableTableTokenTypeDataTableTableBodyCellConfig,
}
type dataTableTableTokenTypeDataTableTableFooterPaginationConfig = {
  pageText: string,
  pageSizeSelector: string,
  pageNavigation: string,
}
type dataTableTableTokenTypeDataTableTableFooterConfig = {
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
  pagination: dataTableTableTokenTypeDataTableTableFooterPaginationConfig,
}
type dataTableTableTokenTypeDataTableTableConfig = {
  width: string,
  tableLayout: string,
  borderCollapse: string,
  borderSpacing: string,
  position: string,
  minWidth: string,
  header: dataTableTableTokenTypeDataTableTableHeaderConfig,
  body: dataTableTableTokenTypeDataTableTableBodyConfig,
  footer: dataTableTableTokenTypeDataTableTableFooterConfig,
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
module ColumnDefinition = {
  type t
  external fromDataTableColumnsTextConfig: dataTableColumnsTextConfig<'a> => t = "%identity"
  external fromDataTableColumnsNumberConfig: dataTableColumnsNumberConfig<'a> => t = "%identity"
  external fromDataTableColumnsAvatarConfig: dataTableColumnsAvatarConfig<'a> => t = "%identity"
  external fromDataTableColumnsTagConfig: dataTableColumnsTagConfig<'a> => t = "%identity"
  external fromDataTableColumnsProgressConfig: dataTableColumnsProgressConfig<'a> => t = "%identity"
  external fromDataTableColumnsDropdownConfig: dataTableColumnsDropdownConfig<'a> => t = "%identity"
  external fromDataTableColumnsDateConfig: dataTableColumnsDateConfig<'a> => t = "%identity"
  external fromDataTableColumnsSliderConfig: dataTableColumnsSliderConfig<'a> => t = "%identity"
  external fromDataTableColumnsReactElementConfig: dataTableColumnsReactElementConfig<'a> => t = "%identity"
  external fromDataTableColumnsFilterTypeConfig: dataTableColumnsFilterTypeConfig<'a> => t = "%identity"
}
