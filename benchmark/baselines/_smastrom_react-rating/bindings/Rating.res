type props<'a, 'b> = {
  ...DistTypes.sharedProps,
  ...DistTypes.readOnlyProps,
  ref?: React.ref<Nullable.t<Dom.element>>,
  onChange?: float => 'a,
  onHoverChange?: float => unit => unit,
  onBlur?: option<'a> => unit,  // ⓘ a parameter type could not be modelled — received as a type variable; annotate at the call site
  onFocus?: option<'b> => unit,  // ⓘ a parameter type could not be modelled — received as a type variable; annotate at the call site
  isDisabled?: bool,
  resetOnSecondClick?: bool,
  transition?: DistTypes.transitions,
  isRequired?: bool,
  invisibleLabel?: string,
  invisibleItemLabels?: array<string>,
  visibleLabelId?: string,
  visibleItemLabelIds?: array<string>,
  resetLabel?: string,
  preventDefault?: DistTypes.distInputPropsPreventDefault,
}

@module("@smastrom/react-rating")
external make: React.component<props<'a, 'b>> = "Rating"
