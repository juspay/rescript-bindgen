@module("@base-ui-components/react") @react.component
external make: (
  ~children: React.element=?,
  ~timeout: float=?,
  ~limit: float=?,
  ~toastManager: ComponentsMenubarRootStoreToastTypes.toastManager=?,
) => React.element = "ToastProvider"
