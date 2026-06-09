@module("demo") @react.component
external make: (
  ~locale: UnboxedInRecordCycleTypes.calLocale=?,
  ~options: UnboxedInRecordCycleTypes.dateLibOptions=?,
) => React.element = "Calendar"
