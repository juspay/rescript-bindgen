@module("@base-ui-components/react") @scope("Tooltip") @react.component
external make: (
  ~children: React.element=?,
  ~delay: float=?,
  ~closeDelay: float=?,
  ~timeout: float=?,
) => React.element = "Provider"
