type props<'a> = {
  isOpen: bool,
  onClose: unit => unit,
  data: array<'a>,
  columns: array<DataTableTypes.ColumnDefinition.t>,  // ⓘ was `ColumnDefinition<T>` — opaque; build with ColumnDefinition.fromDataTableColumnsTextConfig / ColumnDefinition.fromDataTableColumnsNumberConfig / ColumnDefinition.fromDataTableColumnsAvatarConfig / ColumnDefinition.fromDataTableColumnsTagConfig / ColumnDefinition.fromDataTableColumnsProgressConfig / ColumnDefinition.fromDataTableColumnsDropdownConfig / ColumnDefinition.fromDataTableColumnsDateConfig / ColumnDefinition.fromDataTableColumnsSliderConfig / ColumnDefinition.fromDataTableColumnsReactElementConfig / ColumnDefinition.fromDataTableColumnsFilterTypeConfig
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
