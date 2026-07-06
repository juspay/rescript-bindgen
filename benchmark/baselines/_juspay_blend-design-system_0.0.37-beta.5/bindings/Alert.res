@module("@juspay/blend-design-system") @react.component
external make: (
  ~heading: string,
  ~description: string,
  ~variant: AlertTypes.alertVariant=?,
  ~style: AlertTypes.alertStyle=?,
  ~primaryAction: AlertTypes.alertAction=?,
  ~secondaryAction: AlertTypes.alertAction=?,
  ~onClose: unit => unit=?,
  ~icon: React.element=?,
  ~actionPlacement: AlertTypes.alertActionPlacement=?,
  ~maxWidth: string=?,
  ~minWidth: string=?,
  ~width: string=?,
  ~ref: React.ref<Nullable.t<Dom.element>>=?,
) => React.element = "Alert"
