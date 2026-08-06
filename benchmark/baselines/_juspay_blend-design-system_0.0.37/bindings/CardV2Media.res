type props = {
  ...CardV2Types.cardV2SectionProps,
  orientation?: CardV2Types.cardV2Orientation,
  width?: string,
  height?: string,
  minHeight?: string,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "CardV2Media"
