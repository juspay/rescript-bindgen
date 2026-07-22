type props<'a> = {
  isOpen: bool,
  onClose: unit => unit,
  data: array<'a>,
  columns: array<DataTableTypes.ColumnDefinition2.t>,  // ⓘ was `ColumnDefinition<T>` — opaque; build with ColumnDefinition2.fromDataTableColumnsTextConfig / ColumnDefinition2.fromDataTableColumnsNumberConfig / ColumnDefinition2.fromDataTableColumnsAvatarConfig / ColumnDefinition2.fromDataTableColumnsTagConfig / ColumnDefinition2.fromDataTableColumnsProgressConfig / ColumnDefinition2.fromDataTableColumnsDropdownConfig / ColumnDefinition2.fromDataTableColumnsDateConfig / ColumnDefinition2.fromDataTableColumnsSliderConfig / ColumnDefinition2.fromDataTableColumnsReactElementConfig / ColumnDefinition2.fromDataTableColumnsFilterTypeConfig
  title?: string,
  description?: string,
  showExport?: bool,
  initialConfig?: DataTableTypes.dataTablePivotTableConfigInitialConfigConfig,
  previewColumns?: array<DataTableTypes.dataTablePivotTableConfigPreviewColumnsConfig>,
  previewRows?: array<DataTableTypes.pivotPreviewRow>,
  onConfigChange?: DataTableTypes.dataTablePivotTableConfigOnConfigChangeConfig => unit,
  onExport?: DataTableTypes.dataTablePivotTableConfigOnConfigChangeConfig => unit,
  trigger?: React.element,
  onTriggerClick?: unit => unit,
  availableAggregations?: array<DataTableTypes.pivotAggregationType>,
}

@module("@juspay/blend-design-system")
external make: React.component<props<'a>> = "PivotTableModal"
