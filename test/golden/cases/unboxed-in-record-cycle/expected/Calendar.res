type props = {
  locale?: UnboxedInRecordCycleTypes.calLocale,
  options?: UnboxedInRecordCycleTypes.dateLibOptions,
}

@module("demo")
external make: React.component<props> = "Calendar"
