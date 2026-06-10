@module("@base-ui-components/react") @react.component
external make: (
  ~filter: ('a, string, option<'a => string>) => bool=?,
  ~id: string=?,
  ~children: React.element=?,
  ~disabled: bool=?,
  ~grid: bool=?,
  ~name: string=?,
  ~modal: bool=?,
  @as("open") ~open_: bool=?,
  ~defaultOpen: bool=?,
  ~onOpenChangeComplete: bool => unit=?,
  ~items: array<JSON.t>=?,
  ~required: bool=?,
  ~readOnly: bool=?,
  ~openOnInputClick: bool=?,
  ~inputValue: CommonTypes.stringOrNumberOrStringArray=?,
  ~defaultInputValue: CommonTypes.stringOrNumberOrStringArray=?,
  ~inputRef: React.ref<Nullable.t<Dom.element>>=?,
  ~filteredItems: array<JSON.t>=?,
  ~virtualized: bool=?,
  ~inline: bool=?,
  ~limit: float=?,
  // ⚠️ REVIEW: `locale` is `LocalesArgument` — couldn't be auto-typed exactly; emitted as `string` placeholder. Match the real type by hand.
  ~locale: string=?,
  ~multiple: 'b=?,
  ~autoHighlight: bool=?,
  ~highlightItemOnHover: bool=?,
  ~itemToStringLabel: 'a => string=?,
  ~itemToStringValue: 'a => string=?,
  ~isItemEqualToValue: ('a, 'a) => bool=?,
  ~defaultValue: string=?,  // ⚪ loose — was `ComboboxValueType<Value, Multiple>`
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~onOpenChange: string=?,  // ⚪ loose — was `(open: boolean, eventDetails: ChangeEventDetails) => void`
  ~onInputValueChange: string=?,  // ⚪ loose — was `(inputValue: string, eventDetails: ChangeEventDetails) => void`
  ~onItemHighlighted: string=?,  // ⚪ loose — was `(highlightedValue: Value, eventDetails: HighlightEventDetails) => void`
  ~value: string=?,  // ⚪ loose — was `ComboboxValueType<Value, Multiple>`
  ~onValueChange: string=?,  // ⚪ loose — was `(value: ComboboxValueType<Value, Multiple> | (Multiple extends true ? never : null), eventDetails: ChangeEvent`
) => React.element = "ComboboxRoot"
