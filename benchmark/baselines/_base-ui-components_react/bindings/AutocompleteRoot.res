@module("@base-ui-components/react") @scope("Autocomplete") @react.component
external make: (
  ~defaultValue: CommonTypes.stringOrNumberOrStringArray=?,
  ~filter: Nullable.t<('b, string, option<'c>) => bool>=?,  // ⓘ a parameter type could not be modelled — received as a type variable; annotate at the call site
  ~id: string=?,
  ~children: React.element=?,
  ~disabled: bool=?,
  ~inline: bool=?,
  ~grid: bool=?,
  @as("open") ~open_: bool=?,
  ~name: string=?,
  ~value: CommonTypes.stringOrNumberOrStringArray=?,
  ~modal: bool=?,
  ~onOpenChange: (bool, RootSharedTypes.changeEventDetails) => unit=?,
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~defaultOpen: bool=?,
  ~onOpenChangeComplete: bool => unit=?,
  ~required: bool=?,
  ~readOnly: bool=?,
  ~openOnInputClick: bool=?,
  ~autoHighlight: CommonTypes.boolOrAlways=?,
  ~keepHighlight: bool=?,
  ~highlightItemOnHover: bool=?,
  ~onItemHighlighted: ('d, RootSharedTypes.highlightEventDetails) => unit=?,  // ⓘ a parameter type could not be modelled — received as a type variable; annotate at the call site
  ~inputRef: React.ref<Nullable.t<Dom.element>>=?,
  ~filteredItems: RootSharedTypes.readonlyArray=?,
  ~itemToStringValue: 'e => string=?,  // ⓘ a parameter type could not be modelled — received as a type variable; annotate at the call site
  ~virtualized: bool=?,
  ~limit: float=?,
  ~locale: string=?,  // ⓘ Intl.LocalesArgument — pass a BCP-47 tag ("en-US"); Intl.Locale objects not modelled
  ~submitOnItemClick: bool=?,
  ~mode: RootSharedTypes.mode=?,
  ~onValueChange: (string, RootSharedTypes.changeEventDetails) => unit=?,
  ~items: 'a,
) => React.element = "Root"
