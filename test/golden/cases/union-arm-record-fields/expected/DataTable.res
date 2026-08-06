type props = {
  animation?: UnionArmRecordFieldsTypes.rowAnimationConfig,
  settings?: UnionArmRecordFieldsTypes.tableSettings,
  column?: UnionArmRecordFieldsTypes.columnConfig,
  selection?: UnionArmRecordFieldsTypes.selectionConfig,
  label?: string,
}

@module("demo")
external make: React.component<props> = "DataTable"
