@module("demo") @react.component
external make: (
  ~badge: GadgetTypes.gadgetBadgeConfig=?,
) => React.element = "Gadget"
