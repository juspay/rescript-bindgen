type props = {
  ...CardV2Types.cardV2SectionProps,
  actions?: ButtonV2Types.CardV2Actions.t,  // ⓘ was `ButtonV2Props | ButtonV2Props[]` — opaque; build with CardV2Actions.fromButtonV2Props / CardV2Actions.fromButtonV2Propss
  centered?: bool,
  divider?: bool,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "CardV2Footer"
