type contextZe4l1 = {
  triggerElements: PopupsTypes.popupTriggerMap,
  popupRef: React.ref<Nullable.t<Dom.element>>,
  onOpenChange?: (bool, RootSharedTypes.alertDialogRootChangeEventDetails) => unit,
  onOpenChangeComplete?: bool => unit,
  backdropRef: React.ref<Nullable.t<Dom.htmlDivElement>>,
  internalBackdropRef: React.ref<Nullable.t<Dom.htmlDivElement>>,
  onNestedDialogOpen?: float => unit,
  onNestedDialogClose?: unit => unit,
}
type storeDialogStoreUseSyncedValuesConfig<'a> = {
  @as("open") open_?: bool,
  mounted?: bool,
  transitionStatus?: PositionerSharedTypes.transitionStatus,
  floatingRootContext?: ComponentsTypes.floatingRootStore,
  preventUnmountingOnClose?: bool,
  payload?: 'a,
  activeTriggerId?: Nullable.t<string>,
  activeTriggerElement?: Nullable.t<Dom.element>,
  popupElement?: Nullable.t<Dom.element>,
  positionerElement?: Nullable.t<Dom.element>,
  activeTriggerProps?: PositionerSharedTypes.htmlProps,
  inactiveTriggerProps?: PositionerSharedTypes.htmlProps,
  popupProps?: PositionerSharedTypes.htmlProps,
  modal?: CommonTypes.boolOrTrapFocus,
  disablePointerDismissal?: bool,
  openMethod?: Nullable.t<PositionerSharedTypes.interactionType>,
  nested?: bool,
  nestedOpenDialogCount?: float,
  titleElementId?: string,
  descriptionElementId?: string,
  viewportElement?: Nullable.t<Dom.element>,
  role?: RootSharedTypes.rootDialogStoreUseSyncedValuesRole,
}
type storeDialogStoreSetStateConfig<'a> = {
  @as("open") open_: bool,
  mounted: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
  floatingRootContext: ComponentsTypes.floatingRootStore,
  preventUnmountingOnClose: bool,
  payload?: 'a,
  activeTriggerId: Nullable.t<string>,
  activeTriggerElement: Nullable.t<Dom.element>,
  popupElement: Nullable.t<Dom.element>,
  positionerElement: Nullable.t<Dom.element>,
  activeTriggerProps: PositionerSharedTypes.htmlProps,
  inactiveTriggerProps: PositionerSharedTypes.htmlProps,
  popupProps: PositionerSharedTypes.htmlProps,
  modal: CommonTypes.boolOrTrapFocus,
  disablePointerDismissal: bool,
  openMethod: Nullable.t<PositionerSharedTypes.interactionType>,
  nested: bool,
  nestedOpenDialogCount: float,
  titleElementId?: string,
  descriptionElementId?: string,
  viewportElement: Nullable.t<Dom.element>,
  role: RootSharedTypes.rootDialogStoreUseSyncedValuesRole,
}
type dialogStoreV824rm<'a> = {
  setOpen: (bool, RootSharedTypes.rootDialogStoreSetOpenConfig) => unit,
  context: contextZe4l1,
  controlledValues: string,  // 🛑 BROKEN — contains `any`
  selectors: string,  // 🛑 BROKEN — contains `any`
  useSyncedValue: (RootSharedTypes.rootDialogStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  useSyncedValueWithCleanup: (string, string) => unit,  // 🛑 BROKEN — contains `unknown` — was `Readonly<State<Payload>>[Key]`
  useSyncedValues: storeDialogStoreUseSyncedValuesConfig<'a> => unit,
  useControlledProp: (RootSharedTypes.rootDialogStoreUseSyncedValue, option<string>, string) => unit,  // 🛑 BROKEN — contains `unknown`
  set: (RootSharedTypes.rootDialogStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: storeDialogStoreUseSyncedValuesConfig<'a> => unit,
  setState: storeDialogStoreSetStateConfig<'a> => unit,
  select: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ modal: (state: State<unknown>) => boolean | "trap-focus"; nested: (state: State<unknown>) => bool`
  useState: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ modal: (state: State<unknown>) => boolean | "trap-focus"; nested: (state: State<unknown>) => bool`
  useContextCallback: (string, option<(string, RootSharedTypes.alertDialogRootChangeEventDetails) => unit>) => unit,  // 🛑 BROKEN — contains `unknown` — was `never`
  useStateSetter: RootSharedTypes.rootDialogStoreUseSyncedValue => string => unit,  // 🛑 BROKEN — contains `unknown`
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: storeDialogStoreSetStateConfig<'a>,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: storeDialogStoreSetStateConfig<'a> => unit => unit => unit,
  getSnapshot: unit => storeDialogStoreSetStateConfig<'a>,
  notifyAll: unit => unit,
}
type dialogHandleV1ctr5<'a> = {
  store: dialogStoreV824rm<'a>,
  @as("open") open_: Nullable.t<string> => unit,
  openWithPayload: 'a => unit,
  close: unit => unit,
  isOpen: bool,
}
type contextIbuwy = {
  triggerElements: PopupsTypes.popupTriggerMap,
  popupRef: React.ref<Nullable.t<Dom.element>>,
  onOpenChange?: (bool, RootSharedTypes.menuRootChangeEventDetails) => unit,
  onOpenChangeComplete?: bool => unit,
  positionerRef: React.ref<Nullable.t<Dom.element>>,
  typingRef: React.ref<Nullable.t<Dom.element>>,
  itemDomElements: React.ref<Nullable.t<array<Dom.element>>>,
  itemLabels: React.ref<Nullable.t<array<string>>>,
  allowMouseUpTriggerRef: React.ref<Nullable.t<Dom.element>>,
  triggerFocusTargetRef: React.ref<Nullable.t<Dom.element>>,
  beforeContentFocusGuardRef: React.ref<Nullable.t<Dom.element>>,
}
type storeMenuStoreUseSyncedValuesConfigV848b9 = {
  @as("open") open_?: bool,
  mounted?: bool,
  transitionStatus?: PositionerSharedTypes.transitionStatus,
  floatingRootContext?: ComponentsTypes.floatingRootStore,
  preventUnmountingOnClose?: bool,
  payload?: JSON.t,
  activeTriggerId?: Nullable.t<string>,
  activeTriggerElement?: Nullable.t<Dom.element>,
  popupElement?: Nullable.t<Dom.element>,
  positionerElement?: Nullable.t<Dom.element>,
  activeTriggerProps?: PositionerSharedTypes.htmlProps,
  inactiveTriggerProps?: PositionerSharedTypes.htmlProps,
  popupProps?: PositionerSharedTypes.htmlProps,
  disabled?: bool,
  modal?: bool,
  allowMouseEnter?: bool,
  parent?: string,  // ⚪ loose — was `MenuParent`
  rootId?: string,
  activeIndex?: Nullable.t<float>,
  hoverEnabled?: bool,
  stickIfOpen?: bool,
  instantType?: RootSharedTypes.rootMenuStoreUseSyncedValuesInstantType,
  openChangeReason?: Nullable.t<RootSharedTypes.menuRootChangeEventReason>,
  floatingTreeRoot?: ComponentsTypes.floatingTreeStore,
  floatingNodeId?: string,
  floatingParentNodeId?: Nullable.t<string>,
  itemProps?: PositionerSharedTypes.htmlProps,
  closeDelay?: float,
  keyboardEventRelay?: ReactEvent.Keyboard.t => unit,
}
type storeMenuStoreSetStateConfigV1wew4 = {
  @as("open") open_: bool,
  mounted: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
  floatingRootContext: ComponentsTypes.floatingRootStore,
  preventUnmountingOnClose: bool,
  payload?: JSON.t,
  activeTriggerId: Nullable.t<string>,
  activeTriggerElement: Nullable.t<Dom.element>,
  popupElement: Nullable.t<Dom.element>,
  positionerElement: Nullable.t<Dom.element>,
  activeTriggerProps: PositionerSharedTypes.htmlProps,
  inactiveTriggerProps: PositionerSharedTypes.htmlProps,
  popupProps: PositionerSharedTypes.htmlProps,
  disabled: bool,
  modal: bool,
  allowMouseEnter: bool,
  parent: string,  // ⚪ loose — was `MenuParent`
  rootId?: string,
  activeIndex: Nullable.t<float>,
  hoverEnabled: bool,
  stickIfOpen: bool,
  instantType?: RootSharedTypes.rootMenuStoreUseSyncedValuesInstantType,
  openChangeReason: Nullable.t<RootSharedTypes.menuRootChangeEventReason>,
  floatingTreeRoot: ComponentsTypes.floatingTreeStore,
  floatingNodeId?: string,
  floatingParentNodeId: Nullable.t<string>,
  itemProps: PositionerSharedTypes.htmlProps,
  closeDelay: float,
  keyboardEventRelay?: ReactEvent.Keyboard.t => unit,
}
type menuStoreV1rari = {
  setOpen: (bool, RootSharedTypes.contextMenuRootChangeEventDetails) => unit,
  unsubscribeParentListener: string,  // 🛑 BROKEN — contains `any`
  context: contextIbuwy,
  controlledValues: string,  // 🛑 BROKEN — contains `any`
  selectors: string,  // 🛑 BROKEN — contains `any`
  useSyncedValue: (RootSharedTypes.rootMenuStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  useSyncedValueWithCleanup: (string, string) => unit,  // 🛑 BROKEN — contains `unknown` — was `Readonly<State<unknown>>[Key]`
  useSyncedValues: storeMenuStoreUseSyncedValuesConfigV848b9 => unit,
  useControlledProp: (RootSharedTypes.rootMenuStoreUseSyncedValue, option<string>, string) => unit,  // 🛑 BROKEN — contains `unknown`
  set: (RootSharedTypes.rootMenuStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: storeMenuStoreUseSyncedValuesConfigV848b9 => unit,
  setState: storeMenuStoreSetStateConfigV1wew4 => unit,
  select: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; modal: (state: State<unknown>) => boolean; allowMou`
  useState: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; modal: (state: State<unknown>) => boolean; allowMou`
  useContextCallback: (string, option<(bool, RootSharedTypes.menuRootChangeEventDetails) => unit>) => unit,  // 🛑 BROKEN — contains `unknown`
  useStateSetter: RootSharedTypes.rootMenuStoreUseSyncedValue => string => unit,  // 🛑 BROKEN — contains `unknown`
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: storeMenuStoreSetStateConfigV1wew4,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: storeMenuStoreSetStateConfigV1wew4 => unit => unit => unit,
  getSnapshot: unit => storeMenuStoreSetStateConfigV1wew4,
  notifyAll: unit => unit,
}
type menuHandleV1s9ss = {
  store: menuStoreV1rari,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
type dialogStoreV824rm2<'a> = {
  setOpen: (bool, RootSharedTypes.rootDialogStoreSetOpenConfig) => unit,
  context: contextZe4l1,
  controlledValues: string,  // 🛑 BROKEN — contains `any`
  selectors: string,  // 🛑 BROKEN — contains `any`
  useSyncedValue: (RootSharedTypes.rootDialogStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  useSyncedValueWithCleanup: (string, string) => unit,  // 🛑 BROKEN — contains `unknown` — was `Readonly<State<Payload>>[Key]`
  useSyncedValues: storeDialogStoreUseSyncedValuesConfig<'a> => unit,
  useControlledProp: (RootSharedTypes.rootDialogStoreUseSyncedValue, option<string>, string) => unit,  // 🛑 BROKEN — contains `unknown`
  set: (RootSharedTypes.rootDialogStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: storeDialogStoreUseSyncedValuesConfig<'a> => unit,
  setState: storeDialogStoreSetStateConfig<'a> => unit,
  select: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ modal: (state: State<unknown>) => boolean | "trap-focus"; nested: (state: State<unknown>) => bool`
  useState: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ modal: (state: State<unknown>) => boolean | "trap-focus"; nested: (state: State<unknown>) => bool`
  useContextCallback: (string, option<(string, RootSharedTypes.alertDialogRootChangeEventDetails) => unit>) => unit,  // 🛑 BROKEN — contains `unknown` — was `never`
  useStateSetter: RootSharedTypes.rootDialogStoreUseSyncedValue => string => unit,  // 🛑 BROKEN — contains `unknown`
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: storeDialogStoreSetStateConfig<'a>,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: storeDialogStoreSetStateConfig<'a> => unit => unit => unit,
  getSnapshot: unit => storeDialogStoreSetStateConfig<'a>,
  notifyAll: unit => unit,
}
type dialogHandleV1ctr52<'a> = {
  store: dialogStoreV824rm2<'a>,
  @as("open") open_: Nullable.t<string> => unit,
  openWithPayload: 'a => unit,
  close: unit => unit,
  isOpen: bool,
}
type dialogStoreV15eul<'a> = {
  setOpen: (bool, RootSharedTypes.rootDialogStoreSetOpenConfig) => unit,
  context: contextZe4l1,
  controlledValues: string,  // 🛑 BROKEN — contains `any`
  selectors: string,  // 🛑 BROKEN — contains `any`
  useSyncedValue: (TriggerTypes.triggerDialogStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  useSyncedValueWithCleanup: (string, string) => unit,  // 🛑 BROKEN — contains `unknown` — was `Readonly<State<Payload>>[Key]`
  useSyncedValues: storeDialogStoreUseSyncedValuesConfig<'a> => unit,
  useControlledProp: (TriggerTypes.triggerDialogStoreUseSyncedValue, option<string>, string) => unit,  // 🛑 BROKEN — contains `unknown`
  set: (TriggerTypes.triggerDialogStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: storeDialogStoreUseSyncedValuesConfig<'a> => unit,
  setState: storeDialogStoreSetStateConfig<'a> => unit,
  select: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ modal: (state: State<unknown>) => boolean | "trap-focus"; nested: (state: State<unknown>) => bool`
  useState: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ modal: (state: State<unknown>) => boolean | "trap-focus"; nested: (state: State<unknown>) => bool`
  useContextCallback: (string, option<(string, RootSharedTypes.alertDialogRootChangeEventDetails) => unit>) => unit,  // 🛑 BROKEN — contains `unknown` — was `never`
  useStateSetter: TriggerTypes.triggerDialogStoreUseSyncedValue => string => unit,  // 🛑 BROKEN — contains `unknown`
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: storeDialogStoreSetStateConfig<'a>,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: storeDialogStoreSetStateConfig<'a> => unit => unit => unit,
  getSnapshot: unit => storeDialogStoreSetStateConfig<'a>,
  notifyAll: unit => unit,
}
type dialogHandleGnv26<'a> = {
  store: dialogStoreV15eul<'a>,
  @as("open") open_: Nullable.t<string> => unit,
  openWithPayload: 'a => unit,
  close: unit => unit,
  isOpen: bool,
}
type storeMenuStoreUseSyncedValuesConfigV352zh<'a> = {
  @as("open") open_?: bool,
  mounted?: bool,
  transitionStatus?: PositionerSharedTypes.transitionStatus,
  floatingRootContext?: ComponentsTypes.floatingRootStore,
  preventUnmountingOnClose?: bool,
  payload?: 'a,
  activeTriggerId?: Nullable.t<string>,
  activeTriggerElement?: Nullable.t<Dom.element>,
  popupElement?: Nullable.t<Dom.element>,
  positionerElement?: Nullable.t<Dom.element>,
  activeTriggerProps?: PositionerSharedTypes.htmlProps,
  inactiveTriggerProps?: PositionerSharedTypes.htmlProps,
  popupProps?: PositionerSharedTypes.htmlProps,
  disabled?: bool,
  modal?: bool,
  allowMouseEnter?: bool,
  parent?: string,  // ⚪ loose — was `MenuParent`
  rootId?: string,
  activeIndex?: Nullable.t<float>,
  hoverEnabled?: bool,
  stickIfOpen?: bool,
  instantType?: RootSharedTypes.rootMenuStoreUseSyncedValuesInstantType,
  openChangeReason?: Nullable.t<RootSharedTypes.menuRootChangeEventReason>,
  floatingTreeRoot?: ComponentsTypes.floatingTreeStore,
  floatingNodeId?: string,
  floatingParentNodeId?: Nullable.t<string>,
  itemProps?: PositionerSharedTypes.htmlProps,
  closeDelay?: float,
  keyboardEventRelay?: ReactEvent.Keyboard.t => unit,
}
type storeMenuStoreSetStateConfigAdt2x<'a> = {
  @as("open") open_: bool,
  mounted: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
  floatingRootContext: ComponentsTypes.floatingRootStore,
  preventUnmountingOnClose: bool,
  payload?: 'a,
  activeTriggerId: Nullable.t<string>,
  activeTriggerElement: Nullable.t<Dom.element>,
  popupElement: Nullable.t<Dom.element>,
  positionerElement: Nullable.t<Dom.element>,
  activeTriggerProps: PositionerSharedTypes.htmlProps,
  inactiveTriggerProps: PositionerSharedTypes.htmlProps,
  popupProps: PositionerSharedTypes.htmlProps,
  disabled: bool,
  modal: bool,
  allowMouseEnter: bool,
  parent: string,  // ⚪ loose — was `MenuParent`
  rootId?: string,
  activeIndex: Nullable.t<float>,
  hoverEnabled: bool,
  stickIfOpen: bool,
  instantType?: RootSharedTypes.rootMenuStoreUseSyncedValuesInstantType,
  openChangeReason: Nullable.t<RootSharedTypes.menuRootChangeEventReason>,
  floatingTreeRoot: ComponentsTypes.floatingTreeStore,
  floatingNodeId?: string,
  floatingParentNodeId: Nullable.t<string>,
  itemProps: PositionerSharedTypes.htmlProps,
  closeDelay: float,
  keyboardEventRelay?: ReactEvent.Keyboard.t => unit,
}
type menuStoreV1evh3<'a> = {
  setOpen: (bool, RootSharedTypes.contextMenuRootChangeEventDetails) => unit,
  unsubscribeParentListener: string,  // 🛑 BROKEN — contains `any`
  context: contextIbuwy,
  controlledValues: string,  // 🛑 BROKEN — contains `any`
  selectors: string,  // 🛑 BROKEN — contains `any`
  useSyncedValue: (RootSharedTypes.rootMenuStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  useSyncedValueWithCleanup: (string, string) => unit,  // 🛑 BROKEN — contains `unknown` — was `Readonly<State<Payload>>[Key]`
  useSyncedValues: storeMenuStoreUseSyncedValuesConfigV352zh<'a> => unit,
  useControlledProp: (RootSharedTypes.rootMenuStoreUseSyncedValue, option<string>, string) => unit,  // 🛑 BROKEN — contains `unknown`
  set: (RootSharedTypes.rootMenuStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: storeMenuStoreUseSyncedValuesConfigV352zh<'a> => unit,
  setState: storeMenuStoreSetStateConfigAdt2x<'a> => unit,
  select: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; modal: (state: State<unknown>) => boolean; allowMou`
  useState: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; modal: (state: State<unknown>) => boolean; allowMou`
  useContextCallback: (string, option<(bool, RootSharedTypes.menuRootChangeEventDetails) => unit>) => unit,  // 🛑 BROKEN — contains `unknown`
  useStateSetter: RootSharedTypes.rootMenuStoreUseSyncedValue => string => unit,  // 🛑 BROKEN — contains `unknown`
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: storeMenuStoreSetStateConfigAdt2x<'a>,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: storeMenuStoreSetStateConfigAdt2x<'a> => unit => unit => unit,
  getSnapshot: unit => storeMenuStoreSetStateConfigAdt2x<'a>,
  notifyAll: unit => unit,
}
type menuHandleV1vz96<'a> = {
  store: menuStoreV1evh3<'a>,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
type menuStoreV15ogo<'a> = {
  setOpen: (bool, RootSharedTypes.contextMenuRootChangeEventDetails) => unit,
  unsubscribeParentListener: string,  // 🛑 BROKEN — contains `any`
  context: contextIbuwy,
  controlledValues: string,  // 🛑 BROKEN — contains `any`
  selectors: string,  // 🛑 BROKEN — contains `any`
  useSyncedValue: (TriggerTypes.triggerMenuStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  useSyncedValueWithCleanup: (string, string) => unit,  // 🛑 BROKEN — contains `unknown` — was `Readonly<State<Payload>>[Key]`
  useSyncedValues: storeMenuStoreUseSyncedValuesConfigV352zh<'a> => unit,
  useControlledProp: (TriggerTypes.triggerMenuStoreUseSyncedValue, option<string>, string) => unit,  // 🛑 BROKEN — contains `unknown`
  set: (TriggerTypes.triggerMenuStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: storeMenuStoreUseSyncedValuesConfigV352zh<'a> => unit,
  setState: storeMenuStoreSetStateConfigAdt2x<'a> => unit,
  select: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; modal: (state: State<unknown>) => boolean; allowMou`
  useState: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; modal: (state: State<unknown>) => boolean; allowMou`
  useContextCallback: (string, option<(bool, RootSharedTypes.menuRootChangeEventDetails) => unit>) => unit,  // 🛑 BROKEN — contains `unknown`
  useStateSetter: TriggerTypes.triggerMenuStoreUseSyncedValue => string => unit,  // 🛑 BROKEN — contains `unknown`
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: storeMenuStoreSetStateConfigAdt2x<'a>,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: storeMenuStoreSetStateConfigAdt2x<'a> => unit => unit => unit,
  getSnapshot: unit => storeMenuStoreSetStateConfigAdt2x<'a>,
  notifyAll: unit => unit,
}
type menuHandleV1u4zy<'a> = {
  store: menuStoreV15ogo<'a>,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
type contextO5g1z = {
  triggerElements: PopupsTypes.popupTriggerMap,
  popupRef: React.ref<Nullable.t<Dom.element>>,
  onOpenChange?: (bool, RootSharedTypes.popoverRootChangeEventDetails) => unit,
  onOpenChangeComplete?: bool => unit,
  backdropRef: React.ref<Nullable.t<Dom.htmlDivElement>>,
  internalBackdropRef: React.ref<Nullable.t<Dom.htmlDivElement>>,
  triggerFocusTargetRef: React.ref<Nullable.t<Dom.element>>,
  beforeContentFocusGuardRef: React.ref<Nullable.t<Dom.element>>,
  stickIfOpenTimeout: PositionerSharedTypes.timeout,
}
type storePopoverStoreUseSyncedValuesConfig<'a> = {
  @as("open") open_?: bool,
  mounted?: bool,
  transitionStatus?: PositionerSharedTypes.transitionStatus,
  floatingRootContext?: ComponentsTypes.floatingRootStore,
  preventUnmountingOnClose?: bool,
  payload?: 'a,
  activeTriggerId?: Nullable.t<string>,
  activeTriggerElement?: Nullable.t<Dom.element>,
  popupElement?: Nullable.t<Dom.element>,
  positionerElement?: Nullable.t<Dom.element>,
  activeTriggerProps?: PositionerSharedTypes.htmlProps,
  inactiveTriggerProps?: PositionerSharedTypes.htmlProps,
  popupProps?: PositionerSharedTypes.htmlProps,
  disabled?: bool,
  instantType?: RootSharedTypes.rootPopoverStoreUseSyncedValuesInstantType,
  modal?: CommonTypes.boolOrTrapFocus,
  openMethod?: Nullable.t<PositionerSharedTypes.interactionType>,
  openChangeReason?: Nullable.t<RootSharedTypes.popoverRootChangeEventReason>,
  stickIfOpen?: bool,
  nested?: bool,
  titleElementId?: string,
  descriptionElementId?: string,
  openOnHover?: bool,
  closeDelay?: float,
}
type storePopoverStoreSetStateConfig<'a> = {
  @as("open") open_: bool,
  mounted: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
  floatingRootContext: ComponentsTypes.floatingRootStore,
  preventUnmountingOnClose: bool,
  payload?: 'a,
  activeTriggerId: Nullable.t<string>,
  activeTriggerElement: Nullable.t<Dom.element>,
  popupElement: Nullable.t<Dom.element>,
  positionerElement: Nullable.t<Dom.element>,
  activeTriggerProps: PositionerSharedTypes.htmlProps,
  inactiveTriggerProps: PositionerSharedTypes.htmlProps,
  popupProps: PositionerSharedTypes.htmlProps,
  disabled: bool,
  instantType?: RootSharedTypes.rootPopoverStoreUseSyncedValuesInstantType,
  modal: CommonTypes.boolOrTrapFocus,
  openMethod: Nullable.t<PositionerSharedTypes.interactionType>,
  openChangeReason: Nullable.t<RootSharedTypes.popoverRootChangeEventReason>,
  stickIfOpen: bool,
  nested: bool,
  titleElementId?: string,
  descriptionElementId?: string,
  openOnHover: bool,
  closeDelay: float,
}
type popoverStoreV1m3xv<'a> = {
  setOpen: (bool, RootSharedTypes.rootPopoverStoreSetOpenConfig) => unit,
  disposeEffect: string,  // 🛑 BROKEN — contains `any`
  context: contextO5g1z,
  controlledValues: string,  // 🛑 BROKEN — contains `any`
  selectors: string,  // 🛑 BROKEN — contains `any`
  useSyncedValue: (RootSharedTypes.rootPopoverStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  useSyncedValueWithCleanup: (string, string) => unit,  // 🛑 BROKEN — contains `unknown` — was `Readonly<State<Payload>>[Key]`
  useSyncedValues: storePopoverStoreUseSyncedValuesConfig<'a> => unit,
  useControlledProp: (RootSharedTypes.rootPopoverStoreUseSyncedValue, option<string>, string) => unit,  // 🛑 BROKEN — contains `unknown`
  set: (RootSharedTypes.rootPopoverStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: storePopoverStoreUseSyncedValuesConfig<'a> => unit,
  setState: storePopoverStoreSetStateConfig<'a> => unit,
  select: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; instantType: (state: State<unknown>) => "click" | "`
  useState: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; instantType: (state: State<unknown>) => "click" | "`
  useContextCallback: (string, option<(bool, RootSharedTypes.popoverRootChangeEventDetails) => unit>) => unit,  // 🛑 BROKEN — contains `unknown`
  useStateSetter: RootSharedTypes.rootPopoverStoreUseSyncedValue => string => unit,  // 🛑 BROKEN — contains `unknown`
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: storePopoverStoreSetStateConfig<'a>,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: storePopoverStoreSetStateConfig<'a> => unit => unit => unit,
  getSnapshot: unit => storePopoverStoreSetStateConfig<'a>,
  notifyAll: unit => unit,
}
type popoverHandleT0unn<'a> = {
  store: popoverStoreV1m3xv<'a>,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
type popoverStoreFsya3<'a> = {
  setOpen: (bool, RootSharedTypes.rootPopoverStoreSetOpenConfig) => unit,
  disposeEffect: string,  // 🛑 BROKEN — contains `any`
  context: contextO5g1z,
  controlledValues: string,  // 🛑 BROKEN — contains `any`
  selectors: string,  // 🛑 BROKEN — contains `any`
  useSyncedValue: (TriggerTypes.triggerPopoverStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  useSyncedValueWithCleanup: (string, string) => unit,  // 🛑 BROKEN — contains `unknown` — was `Readonly<State<Payload>>[Key]`
  useSyncedValues: storePopoverStoreUseSyncedValuesConfig<'a> => unit,
  useControlledProp: (TriggerTypes.triggerPopoverStoreUseSyncedValue, option<string>, string) => unit,  // 🛑 BROKEN — contains `unknown`
  set: (TriggerTypes.triggerPopoverStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: storePopoverStoreUseSyncedValuesConfig<'a> => unit,
  setState: storePopoverStoreSetStateConfig<'a> => unit,
  select: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; instantType: (state: State<unknown>) => "click" | "`
  useState: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; instantType: (state: State<unknown>) => "click" | "`
  useContextCallback: (string, option<(bool, RootSharedTypes.popoverRootChangeEventDetails) => unit>) => unit,  // 🛑 BROKEN — contains `unknown`
  useStateSetter: TriggerTypes.triggerPopoverStoreUseSyncedValue => string => unit,  // 🛑 BROKEN — contains `unknown`
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: storePopoverStoreSetStateConfig<'a>,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: storePopoverStoreSetStateConfig<'a> => unit => unit => unit,
  getSnapshot: unit => storePopoverStoreSetStateConfig<'a>,
  notifyAll: unit => unit,
}
type popoverHandleV19d3c<'a> = {
  store: popoverStoreFsya3<'a>,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
type contextV1ctw4 = {
  triggerElements: PopupsTypes.popupTriggerMap,
  popupRef: React.ref<Nullable.t<Dom.element>>,
  onOpenChange?: (bool, RootSharedTypes.tooltipRootChangeEventDetails) => unit,
  onOpenChangeComplete?: bool => unit,
}
type storeTooltipStoreUseSyncedValuesConfig<'a> = {
  @as("open") open_?: bool,
  mounted?: bool,
  transitionStatus?: PositionerSharedTypes.transitionStatus,
  floatingRootContext?: ComponentsTypes.floatingRootStore,
  preventUnmountingOnClose?: bool,
  payload?: 'a,
  activeTriggerId?: Nullable.t<string>,
  activeTriggerElement?: Nullable.t<Dom.element>,
  popupElement?: Nullable.t<Dom.element>,
  positionerElement?: Nullable.t<Dom.element>,
  activeTriggerProps?: PositionerSharedTypes.htmlProps,
  inactiveTriggerProps?: PositionerSharedTypes.htmlProps,
  popupProps?: PositionerSharedTypes.htmlProps,
  disabled?: bool,
  instantType?: RootSharedTypes.rootTooltipStoreUseSyncedValuesInstantType,
  isInstantPhase?: bool,
  trackCursorAxis?: RootSharedTypes.rootTrackCursorAxis,
  disableHoverablePopup?: bool,
  openChangeReason?: Nullable.t<RootSharedTypes.tooltipRootChangeEventReason>,
  closeDelay?: float,
}
type storeTooltipStoreSetStateConfig<'a> = {
  @as("open") open_: bool,
  mounted: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
  floatingRootContext: ComponentsTypes.floatingRootStore,
  preventUnmountingOnClose: bool,
  payload?: 'a,
  activeTriggerId: Nullable.t<string>,
  activeTriggerElement: Nullable.t<Dom.element>,
  popupElement: Nullable.t<Dom.element>,
  positionerElement: Nullable.t<Dom.element>,
  activeTriggerProps: PositionerSharedTypes.htmlProps,
  inactiveTriggerProps: PositionerSharedTypes.htmlProps,
  popupProps: PositionerSharedTypes.htmlProps,
  disabled: bool,
  instantType?: RootSharedTypes.rootTooltipStoreUseSyncedValuesInstantType,
  isInstantPhase: bool,
  trackCursorAxis: RootSharedTypes.rootTrackCursorAxis,
  disableHoverablePopup: bool,
  openChangeReason: Nullable.t<RootSharedTypes.tooltipRootChangeEventReason>,
  closeDelay: float,
}
type tooltipStoreV2pe6c<'a> = {
  setOpen: (bool, RootSharedTypes.rootTooltipStoreSetOpenConfig) => unit,
  context: contextV1ctw4,
  controlledValues: string,  // 🛑 BROKEN — contains `any`
  selectors: string,  // 🛑 BROKEN — contains `any`
  useSyncedValue: (RootSharedTypes.rootTooltipStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  useSyncedValueWithCleanup: (string, string) => unit,  // 🛑 BROKEN — contains `unknown` — was `Readonly<State<Payload>>[Key]`
  useSyncedValues: storeTooltipStoreUseSyncedValuesConfig<'a> => unit,
  useControlledProp: (RootSharedTypes.rootTooltipStoreUseSyncedValue, option<string>, string) => unit,  // 🛑 BROKEN — contains `unknown`
  set: (RootSharedTypes.rootTooltipStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: storeTooltipStoreUseSyncedValuesConfig<'a> => unit,
  setState: storeTooltipStoreSetStateConfig<'a> => unit,
  select: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; instantType: (state: State<unknown>) => "focus" | "`
  useState: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; instantType: (state: State<unknown>) => "focus" | "`
  useContextCallback: (string, option<(bool, RootSharedTypes.tooltipRootChangeEventDetails) => unit>) => unit,  // 🛑 BROKEN — contains `unknown`
  useStateSetter: RootSharedTypes.rootTooltipStoreUseSyncedValue => string => unit,  // 🛑 BROKEN — contains `unknown`
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: storeTooltipStoreSetStateConfig<'a>,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: storeTooltipStoreSetStateConfig<'a> => unit => unit => unit,
  getSnapshot: unit => storeTooltipStoreSetStateConfig<'a>,
  notifyAll: unit => unit,
}
type tooltipHandleV5cuhd<'a> = {
  store: tooltipStoreV2pe6c<'a>,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
type tooltipStoreQrimr<'a> = {
  setOpen: (bool, RootSharedTypes.rootTooltipStoreSetOpenConfig) => unit,
  context: contextV1ctw4,
  controlledValues: string,  // 🛑 BROKEN — contains `any`
  selectors: string,  // 🛑 BROKEN — contains `any`
  useSyncedValue: (TriggerTypes.triggerTooltipStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  useSyncedValueWithCleanup: (string, string) => unit,  // 🛑 BROKEN — contains `unknown` — was `Readonly<State<Payload>>[Key]`
  useSyncedValues: storeTooltipStoreUseSyncedValuesConfig<'a> => unit,
  useControlledProp: (TriggerTypes.triggerTooltipStoreUseSyncedValue, option<string>, string) => unit,  // 🛑 BROKEN — contains `unknown`
  set: (TriggerTypes.triggerTooltipStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: storeTooltipStoreUseSyncedValuesConfig<'a> => unit,
  setState: storeTooltipStoreSetStateConfig<'a> => unit,
  select: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; instantType: (state: State<unknown>) => "focus" | "`
  useState: (string, string) => string,  // 🛑 BROKEN — contains `unknown` — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; instantType: (state: State<unknown>) => "focus" | "`
  useContextCallback: (string, option<(bool, RootSharedTypes.tooltipRootChangeEventDetails) => unit>) => unit,  // 🛑 BROKEN — contains `unknown`
  useStateSetter: TriggerTypes.triggerTooltipStoreUseSyncedValue => string => unit,  // 🛑 BROKEN — contains `unknown`
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: storeTooltipStoreSetStateConfig<'a>,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: storeTooltipStoreSetStateConfig<'a> => unit => unit => unit,
  getSnapshot: unit => storeTooltipStoreSetStateConfig<'a>,
  notifyAll: unit => unit,
}
type tooltipHandleD7wiz<'a> = {
  store: tooltipStoreQrimr<'a>,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
