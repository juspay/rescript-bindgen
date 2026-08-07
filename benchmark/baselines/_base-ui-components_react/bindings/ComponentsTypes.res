type floatingRootStoreContext = {
  onOpenChange?: (bool, PositionerSharedTypes.utilsFloatingRootStoreSetOpenConfig) => unit,
  dataRef: React.ref<Nullable.t<Dom.element>>,
  events: FloatingUiReactTypes.floatingEvents,
  nested: bool,
  noEmit: bool,
  triggerElements: PopupsTypes.popupTriggerMap,
}
type componentsFloatingRootStoreUseSyncedValuesConfig = {
  @as("open") open_?: bool,
  domReferenceElement?: string,  // ⚪ loose — was `Element`
  referenceElement?: string,  // ⚪ loose — was `ReferenceType`
  floatingElement?: string,  // ⚪ loose — was `HTMLElement`
  positionReference?: string,  // ⚪ loose — was `ReferenceType`
  floatingId?: string,
}
type componentsFloatingRootStoreSetStateConfig = {
  @as("open") open_: bool,
  domReferenceElement: string,  // ⚪ loose — was `Element`
  referenceElement: string,  // ⚪ loose — was `ReferenceType`
  floatingElement: string,  // ⚪ loose — was `HTMLElement`
  positionReference: string,  // ⚪ loose — was `ReferenceType`
  floatingId?: string,
}
type floatingRootStore = {
  setOpen: (bool, PositionerSharedTypes.utilsFloatingRootStoreSetOpenConfig) => unit,
  context: floatingRootStoreContext,
  controlledValues: string,  // 🛑 BROKEN — contains `any`
  selectors: string,  // 🛑 BROKEN — contains `any`
  useSyncedValue: (RootSharedTypes.rootFloatingRootStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  useSyncedValueWithCleanup: (string, string) => unit,  // 🛑 BROKEN — contains `unknown` — was `Readonly<FloatingRootState>[Key]`
  useSyncedValues: componentsFloatingRootStoreUseSyncedValuesConfig => unit,
  useControlledProp: (RootSharedTypes.rootFloatingRootStoreUseSyncedValue, option<string>, string) => unit,  // 🛑 BROKEN — contains `unknown`
  set: (RootSharedTypes.rootFloatingRootStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: componentsFloatingRootStoreUseSyncedValuesConfig => unit,
  setState: componentsFloatingRootStoreSetStateConfig => unit,
  select: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ open: (state: FloatingRootState) => boolean; domReferenceElement: (state: FloatingRootState) => E`
  useState: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ open: (state: FloatingRootState) => boolean; domReferenceElement: (state: FloatingRootState) => E`
  useContextCallback: (string, option<(bool, PositionerSharedTypes.utilsFloatingRootStoreSetOpenConfig) => unit>) => unit,  // 🛑 BROKEN — contains `unknown`
  useStateSetter: RootSharedTypes.rootFloatingRootStoreUseSyncedValue => string => unit,  // ⚪ loose — was `Value`
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: componentsFloatingRootStoreSetStateConfig,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: componentsFloatingRootStoreSetStateConfig => unit => unit => unit,
  getSnapshot: unit => componentsFloatingRootStoreSetStateConfig,
  notifyAll: unit => unit,
}
type floatingTreeStore = {
  nodesRef: React.ref<Nullable.t<Dom.element>>,
  events: FloatingUiReactTypes.floatingEvents,
  addNode: FloatingUiReactTypes.floatingNodeType => unit,
  removeNode: FloatingUiReactTypes.floatingNodeType => unit,
}
