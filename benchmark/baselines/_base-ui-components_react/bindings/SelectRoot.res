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
  ~onOpenChange: (bool, RootSharedTypes.selectRootChangeEventDetails) => unit=?,
  ~onOpenChangeComplete: bool => unit=?,
  @as("open") ~open_: bool=?,
  ~modal: bool=?,
  ~actionsRef: React.ref<Nullable.t<Dom.element>>=?,
  ~items: RootSharedTypes.valueOrRootItemsConfigArray<'c>=?,
  ~itemToStringLabel: 'a => string=?,
  ~itemToStringValue: 'a => string=?,
  ~isItemEqualToValue: ('a, 'a) => bool=?,
  ~defaultValue: string=?,  // ⚪ loose — was `SelectValueType<Value, Multiple>`
  ~value: string=?,  // ⚪ loose — was `SelectValueType<Value, Multiple>`
  ~onValueChange: ('d, RootSharedTypes.selectRootChangeEventDetails) => unit=?,  // ⓘ a parameter type could not be modelled — received as a type variable; annotate at the call site
) => React.element = "Root"
