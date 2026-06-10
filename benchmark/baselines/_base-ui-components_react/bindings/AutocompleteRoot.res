@module("@base-ui-components/react") @scope("Autocomplete") @react.component
external make: (
  ~defaultValue: CommonTypes.stringOrNumberOrStringArray=?,
  ~filter: string=?,  // ⚪ loose — was `(itemValue: Items[number]["items"][number], query: string, itemToString?: (itemValue: Items[number]["items"][n`
  ~id: string=?,
  ~children: React.element=?,
  ~disabled: bool=?,
  ~inline: bool=?,
  ~grid: bool=?,
  @as("open") ~open_: bool=?,
  ~name: string=?,
  ~value: CommonTypes.stringOrNumberOrStringArray=?,
  ~modal: bool=?,
  ~onOpenChange: (bool, ComponentsMenubarRootStoreToastTypes.changeEventDetails) => unit=?,
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~defaultOpen: bool=?,
  ~onOpenChangeComplete: bool => unit=?,
  ~required: bool=?,
  ~readOnly: bool=?,
  ~openOnInputClick: bool=?,
  ~autoHighlight: CommonTypes.boolOrAlways=?,
  ~keepHighlight: bool=?,
  ~highlightItemOnHover: bool=?,
  ~onItemHighlighted: string=?,  // ⚪ loose — was `(highlightedValue: Items[number]["items"][number], eventDetails: HighlightEventDetails) => void`
  ~inputRef: React.ref<Nullable.t<Dom.element>>=?,
  ~filteredItems: PositionerTabUtilsTypes.htmlProps=?,
  ~itemToStringValue: string=?,  // ⚪ loose — was `(itemValue: Items[number]["items"][number]) => string`
  ~virtualized: bool=?,
  ~limit: float=?,
  // ⚠️ REVIEW: `locale` is `LocalesArgument` — couldn't be auto-typed exactly; emitted as `string` placeholder. Match the real type by hand.
  ~locale: string=?,
  ~submitOnItemClick: bool=?,
  ~mode: ComponentsMenubarRootStoreToastTypes.mode=?,
  ~onValueChange: (string, ComponentsMenubarRootStoreToastTypes.changeEventDetails) => unit=?,
  ~items: 'a,
) => React.element = "Root"
