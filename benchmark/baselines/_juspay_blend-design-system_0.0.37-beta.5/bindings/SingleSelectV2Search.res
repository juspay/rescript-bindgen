@module("@juspay/blend-design-system") @react.component
external make: (
  ~enabled: bool=?,
  ~hasItems: bool,
  ~backgroundColor: string,
  ~searchPlaceholder: string,
  ~searchText: string,
  ~onSearchTextChange: string => unit,
  ~searchInputRef: React.ref<Nullable.t<Dom.element>>,
  ~containerRef: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "SingleSelectV2Search"
