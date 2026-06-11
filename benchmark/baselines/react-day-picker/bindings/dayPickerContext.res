@module("react-day-picker") @react.component
external make: (
  ~value: LocaleSharedTypes.dayPickerContext2,
  ~children: React.element=?,
) => React.element = "dayPickerContext"
