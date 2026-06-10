@module("@base-ui-components/react") @react.component
external make: (
  ~children: React.element=?,
  ~delay: float=?,
  ~closeDelay: float=?,
  ~timeout: float=?,
) => React.element = "TooltipProvider"
