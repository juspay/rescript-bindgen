@module("@base-ui-components/react") @scope("Combobox") @react.component
external make: (
  ~filter: Nullable.t<('a, string, option<'a => string>) => bool>=?,
  ~id: string=?,
  ~children: React.element=?,
  ~disabled: bool=?,
  ~inline: bool=?,
  ~grid: bool=?,
  @as("open") ~open_: bool=?,
  ~name: string=?,
  ~modal: bool=?,
  ~defaultOpen: bool=?,
  ~onOpenChangeComplete: bool => unit=?,
  ~items: RootSharedTypes.readonlyArray=?,
  ~required: bool=?,
  ~readOnly: bool=?,
  ~openOnInputClick: bool=?,
  ~inputValue: CommonTypes.stringOrNumberOrStringArray=?,
  ~defaultInputValue: CommonTypes.stringOrNumberOrStringArray=?,
  ~inputRef: React.ref<Nullable.t<Dom.element>>=?,
  ~filteredItems: RootSharedTypes.readonlyArray=?,
  ~virtualized: bool=?,
  ~limit: float=?,
  ~locale: string=?,  // ⓘ Intl.LocalesArgument — pass a BCP-47 tag ("en-US"); Intl.Locale objects not modelled
  ~multiple: 'b=?,
  ~autoHighlight: bool=?,
  ~highlightItemOnHover: bool=?,
  ~itemToStringLabel: 'a => string=?,
  ~itemToStringValue: 'a => string=?,
  ~isItemEqualToValue: ('a, 'a) => bool=?,
  ~defaultValue: string=?,  // ⚪ loose — was `ComboboxValueType<Value, Multiple>`
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~onOpenChange: (bool, RootSharedTypes.changeEventDetails) => unit=?,
  ~onInputValueChange: (string, RootSharedTypes.changeEventDetails) => unit=?,
  ~onItemHighlighted: ('a, RootSharedTypes.highlightEventDetails) => unit=?,
  ~value: string=?,  // ⚪ loose — was `ComboboxValueType<Value, Multiple>`
  ~onValueChange: ('c, RootSharedTypes.changeEventDetails) => unit=?,  // ⓘ a parameter type could not be modelled — received as a type variable; annotate at the call site
) => React.element = "Root"
