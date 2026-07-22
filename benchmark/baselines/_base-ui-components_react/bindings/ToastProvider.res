type props = {
  children?: React.element,
  timeout?: float,
  limit?: float,
  toastManager?: RootSharedTypes.toastManager,
}

@module("@base-ui-components/react") @scope("Toast")
external make: React.component<props> = "Provider"
