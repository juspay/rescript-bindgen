// A class ⇄ shared-type CIRCULAR dependency — the exact shape that breaks without the
// `InstanceTypes` sink. `Registry` is a shared record (pulled in because `Store`'s methods
// reference it) AND it has a field typed as the `Store` class. So:
//   RegistryTypes ──uses Store.t──▶ Store.res ──uses Registry──▶ RegistryTypes   (cycle!)
// ReScript rejects cross-file cycles. The sink breaks it: `Registry.active` points at the
// dependency-free `InstanceTypes.store`, not at `Store.res`. This case locks that in CI.
interface Registry {
  active: Store
  label: string
}

export declare class Store {
  constructor(label: string)
  register(reg: Registry): void
  snapshot(): Registry
}
