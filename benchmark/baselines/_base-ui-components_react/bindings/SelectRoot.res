@module("@base-ui-components/react") @scope("Select") @react.component
external make: (
  ~children: React.element=?,
  ~inputRef: React.ref<Nullable.t<Dom.element>>=?,
  ~name: string=?,
  ~id: string=?,
  ~required: bool=?,
  ~readOnly: bool=?,
  ~disabled: bool=?,
  ~multiple: 'b=?,
  ~highlightItemOnHover: bool=?,
  ~defaultOpen: bool=?,
  ~onOpenChange: string=?,  // ⚪ loose — was `(open: boolean, eventDetails: SelectRootChangeEventDetails) => void`
  ~onOpenChangeComplete: bool => unit=?,
  @as("open") ~open_: bool=?,
  ~modal: bool=?,
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  // ⚠️ REVIEW: `items` is `Record<string, ReactNode> | readonly { label: ReactNode; value: any; }[]` — couldn't be auto-typed exactly; emitted as `string` placeholder. Match the real type by hand.
  ~items: string=?,
  ~itemToStringLabel: 'a => string=?,
  ~itemToStringValue: 'a => string=?,
  ~isItemEqualToValue: ('a, 'a) => bool=?,
  ~defaultValue: string=?,  // ⚪ loose — was `SelectValueType<Value, Multiple>`
  ~value: string=?,  // ⚪ loose — was `SelectValueType<Value, Multiple>`
  ~onValueChange: string=?,  // ⚪ loose — was `(value: SelectValueType<Value, Multiple> | (Multiple extends true ? never : null), eventDetails: SelectRootCha`
) => React.element = "Root"
