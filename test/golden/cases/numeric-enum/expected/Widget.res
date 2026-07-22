type props = {
  orientation?: NumericEnumTypes.orientation,
  level?: CommonTypes.v1OrV2OrV3,
  size?: NumericEnumTypes.numericEnumSize,
}

@module("demo")
external make: React.component<props> = "Widget"
