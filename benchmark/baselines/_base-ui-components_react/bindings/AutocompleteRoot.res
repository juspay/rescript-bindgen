@module("@base-ui-components/react") @scope("Autocomplete") @react.component
external make: (
  ~defaultValue: CommonTypes.stringOrNumberOrStringArray=?,
  ~filter: string=?,  // ⚪ loose — was `(itemValue: Items[number]["items"][number], query: string, itemToString?: (itemValue: Items[number]["items"][n`
  ~id: string=?,
  ~children: React.element=?,
  ~disabled: bool=?,
  ~grid: bool=?,
  ~name: string=?,
  ~value: CommonTypes.stringOrNumberOrStringArray=?,
  ~modal: bool=?,
  ~onOpenChange: string=?,  // ⚪ loose — was `(open: boolean, eventDetails: ChangeEventDetails) => void`
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  @as("open") ~open_: bool=?,
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
  ~filteredItems: array<JSON.t>=?,
  ~itemToStringValue: string=?,  // ⚪ loose — was `(itemValue: Items[number]["items"][number]) => string`
  ~virtualized: bool=?,
  ~inline: bool=?,
  ~limit: float=?,
  // ⚠️ REVIEW: `locale` is `LocalesArgument` — couldn't be auto-typed exactly; emitted as `string` placeholder. Match the real type by hand.
  ~locale: string=?,
  ~submitOnItemClick: bool=?,
  ~mode: ComponentsMenubarRootStoreToastTypes.mode=?,
  ~onValueChange: string=?,  // ⚪ loose — was `(value: string, eventDetails: ChangeEventDetails) => void`
  ~items: 'a,
) => React.element = "Root"
