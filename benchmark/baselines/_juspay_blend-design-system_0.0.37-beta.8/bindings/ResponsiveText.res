type props = {
  children: string,
  fontSize: string,
  color: string,
  className?: string,
  fontWeight?: string,
  textOverflow?: KeyValuePairV2Types.keyValuePairV2TextOverflowMode,
  maxLines?: float,
  showTooltipOnTruncate?: bool,
  @as("as") as_?: ReactTypes.ElementType.t,  // ⓘ was `ElementType<any, keyof IntrinsicElements>` — opaque; build with ElementType.fromTag / ElementType.fromComponentClass / ElementType.fromFunctionComponent
  id?: string,
  role?: string,
  slotPresent: bool,
  @as("aria-label") ariaLabel?: string,
  @as("aria-labelledby") ariaLabelledby?: string,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "ResponsiveText"
