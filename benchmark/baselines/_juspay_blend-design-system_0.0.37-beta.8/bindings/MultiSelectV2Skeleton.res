type props = {
  ...EditorSharedTypes.multiSelectV2SkeletonComponentProps,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "MultiSelectV2Skeleton"
