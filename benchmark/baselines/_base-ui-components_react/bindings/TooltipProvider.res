type props = {
  children?: React.element,
  delay?: float,
  closeDelay?: float,
  timeout?: float,
}

@module("@base-ui-components/react") @scope("Tooltip")
external make: React.component<props> = "Provider"
