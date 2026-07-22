type props = {
  children?: React.element,
  direction?: DirectionProviderTypes.textDirection,
}

@module("@base-ui-components/react")
external make: React.component<props> = "DirectionProvider"
