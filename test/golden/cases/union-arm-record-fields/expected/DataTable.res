type props = {
  animation?: UnionArmRecordFieldsTypes.rowAnimationConfig,
  settings?: UnionArmRecordFieldsTypes.tableSettings,
  column?: UnionArmRecordFieldsTypes.columnConfig,
  label?: string,
}

@module("demo")
external make: React.component<props> = "DataTable"
