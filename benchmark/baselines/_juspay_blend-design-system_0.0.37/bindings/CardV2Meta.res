type props = {
  title?: React.element,
  subtitle?: React.element,
  truncateTitle?: bool,
  eyebrow?: React.element,
  centered?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "CardV2Meta"
