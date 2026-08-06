type props = {
  title?: React.element,
  truncateTitle?: bool,
  subtitle?: React.element,
  eyebrow?: React.element,
  leadingSlot?: React.element,
  trailingSlot?: React.element,
  centered?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "CardV2Header"
