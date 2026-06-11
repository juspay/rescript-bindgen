@module("@base-ui-components/react") @scope("Toast") @react.component
external make: (
  ~children: React.element=?,
  ~timeout: float=?,
  ~limit: float=?,
  ~toastManager: RootSharedTypes.toastManager=?,
) => React.element = "Provider"
