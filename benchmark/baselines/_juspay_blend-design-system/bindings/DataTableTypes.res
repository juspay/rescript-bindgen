type filterType =
  | @as("text") Text
  | @as("number") Number
  | @as("select") Select
  | @as("multiselect") Multiselect
  | @as("date") Date
  | @as("boolean") Boolean
  | @as("slider") Slider
type type_2 =
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
type rec columnDefinition<'a> = {
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
  skeletonVariant?: ButtonSkeletonTypes.skeletonVariant,
  getSortField?: option<string> => string,
  isDeltaSortable?: bool,
  sortValueFormatter?: (JSON.t, 'a, columnDefinition, option<string>) => JSON.t,
  @as("type") type_: type_2,
  renderCell?: (string, 'a, float) => React.element,
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
type valueConfig2 = {
  min: float,
  max: float,
}
@unboxed type stringOrStringArrayOrValueConfig2 = Str(string) | StrArr(array<string>) | ValueConfig2(valueConfig2)
type columnFilter = {
  field: string,
  @as("type") type_: filterType,
  value: stringOrStringArrayOrValueConfig2,
  operator: operator,
}
type columnManagerPrimaryActionConfig = {
  text: string,
  onClick: array<string> => unit,
  disabled?: bool,
  loading?: bool,
}
type columnManagerSecondaryActionConfig = {
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
type renderExpandedRowConfig<'a> = {
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
  buttonType?: ButtonSkeletonTypes.buttonType,
  size?: ButtonSkeletonTypes.buttonSize,
  subType?: ButtonSkeletonTypes.buttonSubType,
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
type descriptionConfig = {
  fontSize: string,
  color: string,
  lineHeight: string,
  maxWidth: string,
}
type headerSlot1Config = {
  maxHeight: string,
  flexShrink: string,
}
type titleRowConfig = {
  gap: string,
  marginBottom: string,
  justifyContent: string,
  alignItems: string,
}
type columnManagerIconConfig = {
  width: string,
  height: string,
  color: string,
}
type focusVisibleConfig = {
  outline: string,
  outlineOffset: string,
  borderRadius: string,
  boxShadow: string,
}
type columnManagerTriggerConfig = {
  backgroundColor: string,
  opacity: string,
  focusVisible: focusVisibleConfig,
}
type actionIconsConfig = {
  gap: string,
  searchIcon: AvatarTypes.smConfig4,
  filterIcon: AvatarTypes.smConfig4,
  columnManagerIcon: columnManagerIconConfig,
  columnManagerTrigger?: columnManagerTriggerConfig,
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
  title: StatCardTypes.titleConfig3,
  description: descriptionConfig,
  headerSlot1: headerSlot1Config,
  headerSlot2: headerSlot1Config,
  headerSlot3: headerSlot1Config,
  titleRow: titleRowConfig,
  descriptionRow: AvatarGroupTypes.menuConfig,
  actionIcons: actionIconsConfig,
}
type selectTextConfig = {
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
  selectText: selectTextConfig,
  height: string,
}
type rowConfig2 = {
  height: string,
  @as("&:hover") __hover: string,
}
type cellConfig2 = {
  padding: string,
  textAlign: string,
  fontWeight: string,
  color: string,
  fontSize: string,
  width?: string,
  backgroundColor?: string,
}
type sortableConfig = {
  cursor: string,
  userSelect: string,
}
type filterConfig = {
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
type headerConfig8 = {
  backgroundColor: string,
  borderBottom: string,
  height: string,
  row: rowConfig2,
  cell: cellConfig2,
  sortable: sortableConfig,
  filter: filterConfig,
}
type rowConfig3 = {
  height: string,
  @as("&:hover") __hover: string,
  backgroundColor: string,
}
type cellConfig3 = {
  padding: string,
  fontWeight: string,
  color: string,
  fontSize: string,
  borderTop: string,
  expandable: string,
}
type bodyConfig4 = {
  backgroundColor: string,
  borderTop: string,
  row: rowConfig3,
  cell: cellConfig3,
}
type paginationConfig2 = {
  pageText: string,
  pageSizeSelector: string,
  pageNavigation: string,
}
type footerConfig4 = {
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
  pagination: paginationConfig2,
}
type tableConfig = {
  width: string,
  tableLayout: string,
  borderCollapse: string,
  borderSpacing: string,
  position: string,
  minWidth: string,
  header: headerConfig8,
  body: bodyConfig4,
  footer: footerConfig4,
}
type dataTableConfig = {
  borderRadius: string,
  border: string,
  maxHeight: string,
  minHeight?: string,
  bulkActions: bulkActionsType,
  table: tableConfig,
}
type tableTokenType = {
  padding?: string,
  width?: string,
  height?: string,
  display?: string,
  flexDirection?: string,
  position?: string,
  header: headerType,
  dataTable: dataTableConfig,
}
type responsiveTableTokens = {
  sm: tableTokenType,
  lg: tableTokenType,
}
