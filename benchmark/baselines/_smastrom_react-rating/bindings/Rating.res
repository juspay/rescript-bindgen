@module("@smastrom/react-rating") @react.component
external make: (
  ~value: float,
  ~items: CommonTypes.v1OrV2OrV3OrV4OrV5OrV6OrV7OrV8OrV9OrV10=?,
  ~readOnly: bool=?,
  ~highlightOnlySelected: bool=?,
  ~orientation: DistTypes.orientation=?,
  ~spaceInside: DistTypes.spacings=?,
  ~spaceBetween: DistTypes.spacings=?,
  ~radius: DistTypes.sizes=?,
  ~itemStyles: DistTypes.itemStyles=?,
  ~id: string=?,
  ~className: string=?,
  ~style: JsxDOM.style=?,
  ~halfFillMode: DistTypes.hF=?,
  ~onChange: float => 'a=?,
  // ⚠️ REVIEW: `onHoverChange` is `HoverChange` — couldn't be auto-typed exactly; emitted as `string` placeholder. Match the real type by hand.
  ~onHoverChange: string=?,
  ~onBlur: option<'a> => unit=?,  // ⓘ a parameter type could not be modelled — received as a type variable; annotate at the call site
  ~onFocus: option<'b> => unit=?,  // ⓘ a parameter type could not be modelled — received as a type variable; annotate at the call site
  ~isDisabled: bool=?,
  ~resetOnSecondClick: bool=?,
  ~transition: DistTypes.transitions=?,
  ~isRequired: bool=?,
  ~invisibleLabel: string=?,
  ~invisibleItemLabels: array<string>=?,
  ~visibleLabelId: string=?,
  ~visibleItemLabelIds: array<string>=?,
  ~resetLabel: string=?,
  ~preventDefault: DistTypes.preventDefault=?,
) => React.element = "Rating"
