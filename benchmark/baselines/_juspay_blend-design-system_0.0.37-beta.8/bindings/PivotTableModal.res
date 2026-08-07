type props<'a> = {
  isOpen: bool,
  onClose: unit => unit,
  data: array<'a>,
  columns: array<DataTableTypes.ColumnDefinition2.t>,  // ⓘ was `ColumnDefinition<T>` — opaque; build with ColumnDefinition2.fromDataTableColumnsTextConfig2 / ColumnDefinition2.fromDataTableColumnsNumberConfig2 / ColumnDefinition2.fromDataTableColumnsAvatarConfig2 / ColumnDefinition2.fromDataTableColumnsTagConfig2 / ColumnDefinition2.fromDataTableColumnsProgressConfig2 / ColumnDefinition2.fromDataTableColumnsDropdownConfig2 / ColumnDefinition2.fromDataTableColumnsDateConfig2 / ColumnDefinition2.fromDataTableColumnsSliderConfig2 / ColumnDefinition2.fromDataTableColumnsReactElementConfig2 / ColumnDefinition2.fromDataTableColumnsFilterTypeConfig2
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
