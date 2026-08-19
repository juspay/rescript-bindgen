type props = {
  title?: React.element,
  subtitle?: React.element,
  eyebrow?: React.element,
  truncateTitle?: bool,
  centered?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "CardV2Meta"
