type props = {
  ...EditorSharedTypes.singleSelectV2SkeletonComponentProps,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "SingleSelectV2Skeleton"
