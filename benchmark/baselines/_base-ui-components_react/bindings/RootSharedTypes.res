type reason =
  | @as("trigger-press") TriggerPress
  | @as("none") None
type reason2 =
  | @as("trigger-press") TriggerPress
  | @as("none") None
  | @as("outside-press") OutsidePress
  | @as("close-press") ClosePress
  | @as("focus-out") FocusOut
  | @as("escape-key") EscapeKey
  | @as("imperative-action") ImperativeAction
type useSyncedValue =
  | @as("role") Role
  | @as("open") Open
  | @as("modal") Modal
  | @as("disablePointerDismissal") DisablePointerDismissal
  | @as("mounted") Mounted
  | @as("transitionStatus") TransitionStatus
  | @as("floatingRootContext") FloatingRootContext
  | @as("preventUnmountingOnClose") PreventUnmountingOnClose
  | @as("payload") Payload
  | @as("activeTriggerId") ActiveTriggerId
  | @as("activeTriggerElement") ActiveTriggerElement
  | @as("popupElement") PopupElement
  | @as("positionerElement") PositionerElement
  | @as("activeTriggerProps") ActiveTriggerProps
  | @as("inactiveTriggerProps") InactiveTriggerProps
  | @as("popupProps") PopupProps
  | @as("openMethod") OpenMethod
  | @as("nested") Nested
  | @as("nestedOpenDialogCount") NestedOpenDialogCount
  | @as("titleElementId") TitleElementId
  | @as("descriptionElementId") DescriptionElementId
  | @as("viewportElement") ViewportElement
type useSyncedValue2 =
  | @as("open") Open
  | @as("domReferenceElement") DomReferenceElement
  | @as("referenceElement") ReferenceElement
  | @as("floatingElement") FloatingElement
  | @as("positionReference") PositionReference
  | @as("floatingId") FloatingId
type role =
  | @as("dialog") Dialog
  | @as("alertdialog") Alertdialog
type reason3 =
  | @as("trigger-press") TriggerPress
  | @as("none") None
  | @as("outside-press") OutsidePress
  | @as("item-press") ItemPress
  | @as("clear-press") ClearPress
  | @as("chip-remove-press") ChipRemovePress
  | @as("input-change") InputChange
  | @as("input-clear") InputClear
  | @as("focus-out") FocusOut
  | @as("escape-key") EscapeKey
  | @as("list-navigation") ListNavigation
type reason4 =
  | @as("none") None
  | @as("keyboard") Keyboard
  | @as("pointer") Pointer
type mode =
  | @as("none") None
  | @as("both") Both
  | @as("inline") Inline
  | @as("list") List
type imageLoadingStatus =
  | @as("idle") Idle
  | @as("loading") Loading
  | @as("loaded") Loaded
  | @as("error") Error
type reason5 =
  | @as("trigger-press") TriggerPress
  | @as("none") None
  | @as("trigger-hover") TriggerHover
  | @as("trigger-focus") TriggerFocus
  | @as("outside-press") OutsidePress
  | @as("item-press") ItemPress
  | @as("close-press") ClosePress
  | @as("focus-out") FocusOut
  | @as("escape-key") EscapeKey
  | @as("list-navigation") ListNavigation
  | @as("cancel-open") CancelOpen
  | @as("sibling-open") SiblingOpen
  | @as("imperative-action") ImperativeAction
type useSyncedValue3 =
  | @as("disabled") Disabled
  | @as("open") Open
  | @as("modal") Modal
  | @as("mounted") Mounted
  | @as("transitionStatus") TransitionStatus
  | @as("floatingRootContext") FloatingRootContext
  | @as("preventUnmountingOnClose") PreventUnmountingOnClose
  | @as("payload") Payload
  | @as("activeTriggerId") ActiveTriggerId
  | @as("activeTriggerElement") ActiveTriggerElement
  | @as("popupElement") PopupElement
  | @as("positionerElement") PositionerElement
  | @as("activeTriggerProps") ActiveTriggerProps
  | @as("inactiveTriggerProps") InactiveTriggerProps
  | @as("popupProps") PopupProps
  | @as("closeDelay") CloseDelay
  | @as("allowMouseEnter") AllowMouseEnter
  | @as("parent") Parent
  | @as("rootId") RootId
  | @as("activeIndex") ActiveIndex
  | @as("hoverEnabled") HoverEnabled
  | @as("stickIfOpen") StickIfOpen
  | @as("instantType") InstantType
  | @as("openChangeReason") OpenChangeReason
  | @as("floatingTreeRoot") FloatingTreeRoot
  | @as("floatingNodeId") FloatingNodeId
  | @as("floatingParentNodeId") FloatingParentNodeId
  | @as("itemProps") ItemProps
  | @as("keyboardEventRelay") KeyboardEventRelay
type instantType =
  | @as("group") Group
  | @as("click") Click
  | @as("dismiss") Dismiss
type menuRootChangeEventReason =
  | @as("trigger-press") TriggerPress
  | @as("none") None
  | @as("trigger-hover") TriggerHover
  | @as("trigger-focus") TriggerFocus
  | @as("outside-press") OutsidePress
  | @as("item-press") ItemPress
  | @as("close-press") ClosePress
  | @as("focus-out") FocusOut
  | @as("escape-key") EscapeKey
  | @as("list-navigation") ListNavigation
  | @as("cancel-open") CancelOpen
  | @as("sibling-open") SiblingOpen
  | @as("imperative-action") ImperativeAction
type menuRootOrientation =
  | @as("horizontal") Horizontal
  | @as("vertical") Vertical
type useSyncedValue4 =
  | @as("role") Role
  | @as("open") Open
  | @as("modal") Modal
  | @as("disablePointerDismissal") DisablePointerDismissal
  | @as("mounted") Mounted
  | @as("transitionStatus") TransitionStatus
  | @as("floatingRootContext") FloatingRootContext
  | @as("preventUnmountingOnClose") PreventUnmountingOnClose
  | @as("payload") Payload
  | @as("activeTriggerId") ActiveTriggerId
  | @as("activeTriggerElement") ActiveTriggerElement
  | @as("popupElement") PopupElement
  | @as("positionerElement") PositionerElement
  | @as("activeTriggerProps") ActiveTriggerProps
  | @as("inactiveTriggerProps") InactiveTriggerProps
  | @as("popupProps") PopupProps
  | @as("openMethod") OpenMethod
  | @as("nested") Nested
  | @as("nestedOpenDialogCount") NestedOpenDialogCount
  | @as("titleElementId") TitleElementId
  | @as("descriptionElementId") DescriptionElementId
  | @as("viewportElement") ViewportElement
type useSyncedValue6 =
  | @as("disabled") Disabled
  | @as("open") Open
  | @as("modal") Modal
  | @as("mounted") Mounted
  | @as("transitionStatus") TransitionStatus
  | @as("floatingRootContext") FloatingRootContext
  | @as("preventUnmountingOnClose") PreventUnmountingOnClose
  | @as("payload") Payload
  | @as("activeTriggerId") ActiveTriggerId
  | @as("activeTriggerElement") ActiveTriggerElement
  | @as("popupElement") PopupElement
  | @as("positionerElement") PositionerElement
  | @as("activeTriggerProps") ActiveTriggerProps
  | @as("inactiveTriggerProps") InactiveTriggerProps
  | @as("popupProps") PopupProps
  | @as("closeDelay") CloseDelay
  | @as("allowMouseEnter") AllowMouseEnter
  | @as("parent") Parent
  | @as("rootId") RootId
  | @as("activeIndex") ActiveIndex
  | @as("hoverEnabled") HoverEnabled
  | @as("stickIfOpen") StickIfOpen
  | @as("instantType") InstantType
  | @as("openChangeReason") OpenChangeReason
  | @as("floatingTreeRoot") FloatingTreeRoot
  | @as("floatingNodeId") FloatingNodeId
  | @as("floatingParentNodeId") FloatingParentNodeId
  | @as("itemProps") ItemProps
  | @as("keyboardEventRelay") KeyboardEventRelay
type reason6 =
  | @as("trigger-press") TriggerPress
  | @as("none") None
  | @as("trigger-hover") TriggerHover
  | @as("outside-press") OutsidePress
  | @as("link-press") LinkPress
  | @as("focus-out") FocusOut
  | @as("escape-key") EscapeKey
  | @as("list-navigation") ListNavigation
type orientation2 =
  | @as("horizontal") Horizontal
  | @as("vertical") Vertical
type reason7 =
  | @as("none") None
  | @as("increment-press") IncrementPress
  | @as("decrement-press") DecrementPress
  | @as("input-change") InputChange
  | @as("input-clear") InputClear
  | @as("input-blur") InputBlur
  | @as("input-paste") InputPaste
  | @as("keyboard") Keyboard
  | @as("wheel") Wheel
  | @as("scrub") Scrub
type reason8 =
  | @as("none") None
  | @as("increment-press") IncrementPress
  | @as("decrement-press") DecrementPress
  | @as("input-clear") InputClear
  | @as("input-blur") InputBlur
  | @as("keyboard") Keyboard
  | @as("wheel") Wheel
  | @as("scrub") Scrub
type reason9 =
  | @as("trigger-press") TriggerPress
  | @as("none") None
  | @as("trigger-hover") TriggerHover
  | @as("trigger-focus") TriggerFocus
  | @as("outside-press") OutsidePress
  | @as("close-press") ClosePress
  | @as("focus-out") FocusOut
  | @as("escape-key") EscapeKey
  | @as("imperative-action") ImperativeAction
type useSyncedValue8 =
  | @as("disabled") Disabled
  | @as("open") Open
  | @as("modal") Modal
  | @as("mounted") Mounted
  | @as("transitionStatus") TransitionStatus
  | @as("floatingRootContext") FloatingRootContext
  | @as("preventUnmountingOnClose") PreventUnmountingOnClose
  | @as("payload") Payload
  | @as("activeTriggerId") ActiveTriggerId
  | @as("activeTriggerElement") ActiveTriggerElement
  | @as("popupElement") PopupElement
  | @as("positionerElement") PositionerElement
  | @as("activeTriggerProps") ActiveTriggerProps
  | @as("inactiveTriggerProps") InactiveTriggerProps
  | @as("popupProps") PopupProps
  | @as("openMethod") OpenMethod
  | @as("nested") Nested
  | @as("titleElementId") TitleElementId
  | @as("descriptionElementId") DescriptionElementId
  | @as("openOnHover") OpenOnHover
  | @as("closeDelay") CloseDelay
  | @as("stickIfOpen") StickIfOpen
  | @as("instantType") InstantType
  | @as("openChangeReason") OpenChangeReason
type instantType2 =
  | @as("click") Click
  | @as("dismiss") Dismiss
type popoverRootChangeEventReason =
  | @as("trigger-press") TriggerPress
  | @as("none") None
  | @as("trigger-hover") TriggerHover
  | @as("trigger-focus") TriggerFocus
  | @as("outside-press") OutsidePress
  | @as("close-press") ClosePress
  | @as("focus-out") FocusOut
  | @as("escape-key") EscapeKey
  | @as("imperative-action") ImperativeAction
type reason10 =
  | @as("trigger-press") TriggerPress
  | @as("none") None
  | @as("trigger-hover") TriggerHover
  | @as("trigger-focus") TriggerFocus
  | @as("outside-press") OutsidePress
  | @as("escape-key") EscapeKey
type progressStatus =
  | @as("indeterminate") Indeterminate
  | @as("progressing") Progressing
  | @as("complete") Complete
type reason11 =
  | @as("trigger-press") TriggerPress
  | @as("none") None
  | @as("outside-press") OutsidePress
  | @as("item-press") ItemPress
  | @as("focus-out") FocusOut
  | @as("escape-key") EscapeKey
  | @as("list-navigation") ListNavigation
  | @as("cancel-open") CancelOpen
  | @as("window-resize") WindowResize
type thumbAlignment =
  | @as("center") Center
  | @as("edge") Edge
  | @as("edge-client-only") EdgeClientOnly
type thumbCollisionBehavior =
  | @as("none") None
  | @as("push") Push
  | @as("swap") Swap
type reason12 =
  | @as("none") None
  | @as("track-press") TrackPress
  | @as("input-change") InputChange
  | @as("keyboard") Keyboard
  | @as("drag") Drag
type priority =
  | @as("low") Low
  | @as("high") High
type transitionStatus2 =
  | @as("starting") Starting
  | @as("ending") Ending
type reason13 =
  | @as("trigger-press") TriggerPress
  | @as("none") None
  | @as("trigger-hover") TriggerHover
  | @as("trigger-focus") TriggerFocus
  | @as("outside-press") OutsidePress
  | @as("escape-key") EscapeKey
  | @as("disabled") Disabled
  | @as("imperative-action") ImperativeAction
type trackCursorAxis =
  | @as("none") None
  | @as("both") Both
  | @as("x") X
  | @as("y") Y
type useSyncedValue10 =
  | @as("disabled") Disabled
  | @as("open") Open
  | @as("mounted") Mounted
  | @as("transitionStatus") TransitionStatus
  | @as("floatingRootContext") FloatingRootContext
  | @as("preventUnmountingOnClose") PreventUnmountingOnClose
  | @as("payload") Payload
  | @as("activeTriggerId") ActiveTriggerId
  | @as("activeTriggerElement") ActiveTriggerElement
  | @as("popupElement") PopupElement
  | @as("positionerElement") PositionerElement
  | @as("activeTriggerProps") ActiveTriggerProps
  | @as("inactiveTriggerProps") InactiveTriggerProps
  | @as("popupProps") PopupProps
  | @as("closeDelay") CloseDelay
  | @as("instantType") InstantType
  | @as("openChangeReason") OpenChangeReason
  | @as("isInstantPhase") IsInstantPhase
  | @as("trackCursorAxis") TrackCursorAxis
  | @as("disableHoverablePopup") DisableHoverablePopup
type instantType3 =
  | @as("focus") Focus
  | @as("delay") Delay
  | @as("dismiss") Dismiss
type tooltipRootChangeEventReason =
  | @as("trigger-press") TriggerPress
  | @as("none") None
  | @as("trigger-hover") TriggerHover
  | @as("trigger-focus") TriggerFocus
  | @as("outside-press") OutsidePress
  | @as("escape-key") EscapeKey
  | @as("disabled") Disabled
  | @as("imperative-action") ImperativeAction
type accordionRootChangeEventDetails = {
  reason: reason,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger: Dom.element,
}
type accordionRootState = {
  value: array<string>,
  disabled: bool,
  orientation: PositionerSharedTypes.orientation,
}
type alertDialogRootChangeEventDetails = {
  reason: reason2,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger: Dom.element,
  preventUnmountOnClose: unit => unit,
}
type setOpenConfig = {
  reason: reason2,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger: Dom.element,
}
type context = {
  triggerElements: PopupsTypes.popupTriggerMap,
  popupRef: React.ref<Nullable.t<Dom.element>>,
  onOpenChange?: (bool, alertDialogRootChangeEventDetails) => unit,
  onOpenChangeComplete: bool => unit,
  backdropRef: React.ref<Nullable.t<Dom.htmlDivElement>>,
  internalBackdropRef: React.ref<Nullable.t<Dom.htmlDivElement>>,
  onNestedDialogOpen?: float => unit,
  onNestedDialogClose?: unit => unit,
}
type floatingRootStoreContext = {
  onOpenChange: (string, string) => unit,
  dataRef: React.ref<Nullable.t<Dom.element>>,
  events: FloatingUiReactTypes.floatingEvents,
  nested: bool,
  noEmit: bool,
  triggerElements: PopupsTypes.popupTriggerMap,
}
type useSyncedValuesConfig2 = {
  @as("open") open_?: string,
  domReferenceElement?: string,
  referenceElement?: string,
  floatingElement?: string,
  positionReference?: string,
  floatingId?: string,
}
type setStateConfig = {
  @as("open") open_: string,
  domReferenceElement: string,
  referenceElement: string,
  floatingElement: string,
  positionReference: string,
  floatingId: string,
}
type floatingRootStore = {
  setOpen: (bool, PositionerSharedTypes.setOpenConfig2) => unit,
  context: floatingRootStoreContext,
  controlledValues: string,
  selectors: string,
  useSyncedValue: (useSyncedValue2, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: useSyncedValuesConfig2 => unit,
  useControlledProp: (useSyncedValue2, string, string) => unit,
  set: (useSyncedValue2, string) => unit,
  update: useSyncedValuesConfig2 => unit,
  setState: setStateConfig => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (string, string) => unit) => unit,
  useStateSetter: useSyncedValue2 => string => unit,
  observe: string,
  state: setStateConfig,
  listeners: string,
  updateTick: string,
  subscribe: string => unit => unit => unit,
  getSnapshot: unit => setStateConfig,
  notifyAll: unit => unit,
}
type useSyncedValuesConfig<'a> = {
  @as("open") open_?: bool,
  mounted?: bool,
  transitionStatus?: PositionerSharedTypes.transitionStatus,
  floatingRootContext?: floatingRootStore,
  preventUnmountingOnClose?: bool,
  payload?: 'a,
  activeTriggerId?: string,
  activeTriggerElement?: Dom.element,
  popupElement?: Dom.element,
  positionerElement?: Dom.element,
  activeTriggerProps?: PositionerSharedTypes.htmlProps,
  inactiveTriggerProps?: PositionerSharedTypes.htmlProps,
  popupProps?: PositionerSharedTypes.htmlProps,
  modal?: CommonTypes.boolOrTrapFocus,
  disablePointerDismissal?: bool,
  openMethod?: PositionerSharedTypes.interactionType,
  nested?: bool,
  nestedOpenDialogCount?: float,
  titleElementId?: string,
  descriptionElementId?: string,
  viewportElement?: Dom.element,
  role?: role,
}
type setStateConfig2<'a> = {
  @as("open") open_: bool,
  mounted: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
  floatingRootContext: floatingRootStore,
  preventUnmountingOnClose: bool,
  payload: 'a,
  activeTriggerId: string,
  activeTriggerElement: Dom.element,
  popupElement: Dom.element,
  positionerElement: Dom.element,
  activeTriggerProps: PositionerSharedTypes.htmlProps,
  inactiveTriggerProps: PositionerSharedTypes.htmlProps,
  popupProps: PositionerSharedTypes.htmlProps,
  modal: CommonTypes.boolOrTrapFocus,
  disablePointerDismissal: bool,
  openMethod: PositionerSharedTypes.interactionType,
  nested: bool,
  nestedOpenDialogCount: float,
  titleElementId: string,
  descriptionElementId: string,
  viewportElement: Dom.element,
  role: role,
}
type dialogStore<'a> = {
  setOpen: (bool, setOpenConfig) => unit,
  context: context,
  controlledValues: string,
  selectors: string,
  useSyncedValue: (useSyncedValue, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: useSyncedValuesConfig<'a> => unit,
  useControlledProp: (useSyncedValue, string, string) => unit,
  set: (useSyncedValue, string) => unit,
  update: useSyncedValuesConfig<'a> => unit,
  setState: setStateConfig2<'a> => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (string, alertDialogRootChangeEventDetails) => unit) => unit,
  useStateSetter: useSyncedValue => string => unit,
  observe: string,
  state: setStateConfig2<'a>,
  listeners: string,
  updateTick: string,
  subscribe: setStateConfig2<'a> => unit => unit => unit,
  getSnapshot: unit => setStateConfig2<'a>,
  notifyAll: unit => unit,
}
type dialogHandle<'a> = {
  store: dialogStore<'a>,
  @as("open") open_: string => unit,
  openWithPayload: 'a => unit,
  close: unit => unit,
  isOpen: bool,
}
type changeEventDetails = {
  reason: reason3,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger: Dom.element,
}
type highlightEventDetails = {
  reason: reason4,
  event: Dom.event,
  index: int,
}
type avatarRootState = {
  imageLoadingStatus: imageLoadingStatus,
}
type checkboxRootState = {
  checked: bool,
  disabled: bool,
  readOnly: bool,
  required: bool,
  indeterminate: bool,
  touched: bool,
  dirty: bool,
  valid: bool,
  filled: bool,
  focused: bool,
}
type collapsibleRootState = {
  disabled: bool,
  @as("open") open_: bool,
}
type contextMenuRootChangeEventDetails = {
  reason: reason5,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger: Dom.element,
}
type menuRootChangeEventDetails = {
  reason: reason5,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger: Dom.element,
  preventUnmountOnClose: unit => unit,
}
type context2 = {
  triggerElements: PopupsTypes.popupTriggerMap,
  popupRef: React.ref<Nullable.t<Dom.element>>,
  onOpenChange?: (bool, menuRootChangeEventDetails) => unit,
  onOpenChangeComplete: bool => unit,
  positionerRef: React.ref<Nullable.t<Dom.element>>,
  typingRef: React.ref<Nullable.t<Dom.element>>,
  itemDomElements: React.ref<Nullable.t<Dom.element>>,
  itemLabels: React.ref<Nullable.t<Dom.element>>,
  allowMouseUpTriggerRef: React.ref<Nullable.t<Dom.element>>,
  triggerFocusTargetRef: React.ref<Nullable.t<Dom.element>>,
  beforeContentFocusGuardRef: React.ref<Nullable.t<Dom.element>>,
}
type floatingTreeStore = {
  nodesRef: React.ref<Nullable.t<Dom.element>>,
  events: FloatingUiReactTypes.floatingEvents,
  addNode: FloatingUiReactTypes.floatingNodeType => unit,
  removeNode: FloatingUiReactTypes.floatingNodeType => unit,
}
type useSyncedValuesConfig3 = {
  @as("open") open_?: bool,
  mounted?: bool,
  transitionStatus?: PositionerSharedTypes.transitionStatus,
  floatingRootContext?: floatingRootStore,
  preventUnmountingOnClose?: bool,
  payload?: JSON.t,
  activeTriggerId?: string,
  activeTriggerElement?: Dom.element,
  popupElement?: Dom.element,
  positionerElement?: Dom.element,
  activeTriggerProps?: PositionerSharedTypes.htmlProps,
  inactiveTriggerProps?: PositionerSharedTypes.htmlProps,
  popupProps?: PositionerSharedTypes.htmlProps,
  disabled?: bool,
  modal?: bool,
  allowMouseEnter?: bool,
  parent?: string,
  rootId?: string,
  activeIndex?: float,
  hoverEnabled?: bool,
  stickIfOpen?: bool,
  instantType?: instantType,
  openChangeReason?: menuRootChangeEventReason,
  floatingTreeRoot?: floatingTreeStore,
  floatingNodeId?: string,
  floatingParentNodeId?: string,
  itemProps?: PositionerSharedTypes.htmlProps,
  closeDelay?: float,
  keyboardEventRelay?: ReactEvent.Keyboard.t => unit,
}
type setStateConfig3 = {
  @as("open") open_: bool,
  mounted: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
  floatingRootContext: floatingRootStore,
  preventUnmountingOnClose: bool,
  payload: JSON.t,
  activeTriggerId: string,
  activeTriggerElement: Dom.element,
  popupElement: Dom.element,
  positionerElement: Dom.element,
  activeTriggerProps: PositionerSharedTypes.htmlProps,
  inactiveTriggerProps: PositionerSharedTypes.htmlProps,
  popupProps: PositionerSharedTypes.htmlProps,
  disabled: bool,
  modal: bool,
  allowMouseEnter: bool,
  parent: string,
  rootId: string,
  activeIndex: float,
  hoverEnabled: bool,
  stickIfOpen: bool,
  instantType: instantType,
  openChangeReason: menuRootChangeEventReason,
  floatingTreeRoot: floatingTreeStore,
  floatingNodeId: string,
  floatingParentNodeId: string,
  itemProps: PositionerSharedTypes.htmlProps,
  closeDelay: float,
  keyboardEventRelay: ReactEvent.Keyboard.t => unit,
}
type menuStore = {
  setOpen: (bool, contextMenuRootChangeEventDetails) => unit,
  unsubscribeParentListener: string,
  context: context2,
  controlledValues: string,
  selectors: string,
  useSyncedValue: (useSyncedValue3, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: useSyncedValuesConfig3 => unit,
  useControlledProp: (useSyncedValue3, string, string) => unit,
  set: (useSyncedValue3, string) => unit,
  update: useSyncedValuesConfig3 => unit,
  setState: setStateConfig3 => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (bool, menuRootChangeEventDetails) => unit) => unit,
  useStateSetter: useSyncedValue3 => string => unit,
  observe: string,
  state: setStateConfig3,
  listeners: string,
  updateTick: string,
  subscribe: setStateConfig3 => unit => unit => unit,
  getSnapshot: unit => setStateConfig3,
  notifyAll: unit => unit,
}
type menuHandle = {
  store: menuStore,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
type parentConfig = {
  @as("type") type_: string,
  store: menuStore,
}
type menubarContext = {
  modal: bool,
  disabled: bool,
  contentElement: Dom.element,
  setContentElement: Dom.element => unit,
  hasSubmenuOpen: bool,
  setHasSubmenuOpen: bool => unit,
  orientation: menuRootOrientation,
  allowMouseUpTriggerRef: React.ref<Nullable.t<Dom.element>>,
  rootId: string,
}
type parentConfig2 = {
  @as("type") type_: string,
  context: menubarContext,
}
type contextMenuRootContext = {
  anchor: string,
  setAnchor: string,
  backdropRef: string,
  internalBackdropRef: string,
  actionsRef: string,
  positionerRef: string,
  allowMouseUpTriggerRef: string,
  initialCursorPointRef: string,
  rootId: string,
}
type parentConfig3 = {
  @as("type") type_: string,
  context: contextMenuRootContext,
}
type menuRootContext = {
  store: menuStore,
  parent: string,
}
type parentConfig4 = {
  @as("type") type_: string,
  context: contextMenuRootContext,
  menuContext: menuRootContext,
}
type parentConfig5 = {
  @as("type") type_: string,
}
type dialogStore2<'a> = {
  setOpen: (bool, setOpenConfig) => unit,
  context: context,
  controlledValues: string,
  selectors: string,
  useSyncedValue: (useSyncedValue4, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: useSyncedValuesConfig<'a> => unit,
  useControlledProp: (useSyncedValue4, string, string) => unit,
  set: (useSyncedValue4, string) => unit,
  update: useSyncedValuesConfig<'a> => unit,
  setState: setStateConfig2<'a> => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (string, alertDialogRootChangeEventDetails) => unit) => unit,
  useStateSetter: useSyncedValue4 => string => unit,
  observe: string,
  state: setStateConfig2<'a>,
  listeners: string,
  updateTick: string,
  subscribe: setStateConfig2<'a> => unit => unit => unit,
  getSnapshot: unit => setStateConfig2<'a>,
  notifyAll: unit => unit,
}
type dialogHandle2<'a> = {
  store: dialogStore2<'a>,
  @as("open") open_: string => unit,
  openWithPayload: 'a => unit,
  close: unit => unit,
  isOpen: bool,
}
type dialogStore3<'a> = {
  setOpen: (bool, setOpenConfig) => unit,
  context: context,
  controlledValues: string,
  selectors: string,
  useSyncedValue: (TriggerTypes.useSyncedValue5, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: useSyncedValuesConfig<'a> => unit,
  useControlledProp: (TriggerTypes.useSyncedValue5, string, string) => unit,
  set: (TriggerTypes.useSyncedValue5, string) => unit,
  update: useSyncedValuesConfig<'a> => unit,
  setState: setStateConfig2<'a> => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (string, alertDialogRootChangeEventDetails) => unit) => unit,
  useStateSetter: TriggerTypes.useSyncedValue5 => string => unit,
  observe: string,
  state: setStateConfig2<'a>,
  listeners: string,
  updateTick: string,
  subscribe: setStateConfig2<'a> => unit => unit => unit,
  getSnapshot: unit => setStateConfig2<'a>,
  notifyAll: unit => unit,
}
type dialogHandle3<'a> = {
  store: dialogStore3<'a>,
  @as("open") open_: string => unit,
  openWithPayload: 'a => unit,
  close: unit => unit,
  isOpen: bool,
}
type validityConfig = {
  badInput: bool,
  customError: bool,
  patternMismatch: bool,
  rangeOverflow: bool,
  rangeUnderflow: bool,
  stepMismatch: bool,
  tooLong: bool,
  tooShort: bool,
  typeMismatch: bool,
  valueMissing: bool,
  valid: bool,
}
type useSyncedValuesConfig4<'a> = {
  @as("open") open_?: bool,
  mounted?: bool,
  transitionStatus?: PositionerSharedTypes.transitionStatus,
  floatingRootContext?: floatingRootStore,
  preventUnmountingOnClose?: bool,
  payload?: 'a,
  activeTriggerId?: string,
  activeTriggerElement?: Dom.element,
  popupElement?: Dom.element,
  positionerElement?: Dom.element,
  activeTriggerProps?: PositionerSharedTypes.htmlProps,
  inactiveTriggerProps?: PositionerSharedTypes.htmlProps,
  popupProps?: PositionerSharedTypes.htmlProps,
  disabled?: bool,
  modal?: bool,
  allowMouseEnter?: bool,
  parent?: string,
  rootId?: string,
  activeIndex?: float,
  hoverEnabled?: bool,
  stickIfOpen?: bool,
  instantType?: instantType,
  openChangeReason?: menuRootChangeEventReason,
  floatingTreeRoot?: floatingTreeStore,
  floatingNodeId?: string,
  floatingParentNodeId?: string,
  itemProps?: PositionerSharedTypes.htmlProps,
  closeDelay?: float,
  keyboardEventRelay?: ReactEvent.Keyboard.t => unit,
}
type setStateConfig4<'a> = {
  @as("open") open_: bool,
  mounted: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
  floatingRootContext: floatingRootStore,
  preventUnmountingOnClose: bool,
  payload: 'a,
  activeTriggerId: string,
  activeTriggerElement: Dom.element,
  popupElement: Dom.element,
  positionerElement: Dom.element,
  activeTriggerProps: PositionerSharedTypes.htmlProps,
  inactiveTriggerProps: PositionerSharedTypes.htmlProps,
  popupProps: PositionerSharedTypes.htmlProps,
  disabled: bool,
  modal: bool,
  allowMouseEnter: bool,
  parent: string,
  rootId: string,
  activeIndex: float,
  hoverEnabled: bool,
  stickIfOpen: bool,
  instantType: instantType,
  openChangeReason: menuRootChangeEventReason,
  floatingTreeRoot: floatingTreeStore,
  floatingNodeId: string,
  floatingParentNodeId: string,
  itemProps: PositionerSharedTypes.htmlProps,
  closeDelay: float,
  keyboardEventRelay: ReactEvent.Keyboard.t => unit,
}
type menuStore2<'a> = {
  setOpen: (bool, contextMenuRootChangeEventDetails) => unit,
  unsubscribeParentListener: string,
  context: context2,
  controlledValues: string,
  selectors: string,
  useSyncedValue: (useSyncedValue6, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: useSyncedValuesConfig4<'a> => unit,
  useControlledProp: (useSyncedValue6, string, string) => unit,
  set: (useSyncedValue6, string) => unit,
  update: useSyncedValuesConfig4<'a> => unit,
  setState: setStateConfig4<'a> => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (bool, menuRootChangeEventDetails) => unit) => unit,
  useStateSetter: useSyncedValue6 => string => unit,
  observe: string,
  state: setStateConfig4<'a>,
  listeners: string,
  updateTick: string,
  subscribe: setStateConfig4<'a> => unit => unit => unit,
  getSnapshot: unit => setStateConfig4<'a>,
  notifyAll: unit => unit,
}
type menuHandle2<'a> = {
  store: menuStore2<'a>,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
type menuStore3<'a> = {
  setOpen: (bool, contextMenuRootChangeEventDetails) => unit,
  unsubscribeParentListener: string,
  context: context2,
  controlledValues: string,
  selectors: string,
  useSyncedValue: (TriggerTypes.useSyncedValue7, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: useSyncedValuesConfig4<'a> => unit,
  useControlledProp: (TriggerTypes.useSyncedValue7, string, string) => unit,
  set: (TriggerTypes.useSyncedValue7, string) => unit,
  update: useSyncedValuesConfig4<'a> => unit,
  setState: setStateConfig4<'a> => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (bool, menuRootChangeEventDetails) => unit) => unit,
  useStateSetter: TriggerTypes.useSyncedValue7 => string => unit,
  observe: string,
  state: setStateConfig4<'a>,
  listeners: string,
  updateTick: string,
  subscribe: setStateConfig4<'a> => unit => unit => unit,
  getSnapshot: unit => setStateConfig4<'a>,
  notifyAll: unit => unit,
}
type menuHandle3<'a> = {
  store: menuStore3<'a>,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
type menubarState = {
  orientation: menuRootOrientation,
  modal: bool,
  hasSubmenuOpen: bool,
}
type navigationMenuRootChangeEventDetails = {
  reason: reason6,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger: Dom.element,
}
type navigationMenuRootState = {
  @as("open") open_: bool,
  nested: bool,
}
type numberFieldRootChangeEventDetails = {
  reason: reason7,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger: Dom.element,
  direction?: CommonTypes.v1OrV1,
}
type numberFieldRootCommitEventDetails = {
  reason: reason8,
  event: Dom.event,
}
type numberFieldRootState = {
  value: float,
  inputValue: string,
  required: bool,
  disabled: bool,
  readOnly: bool,
  scrubbing: bool,
  touched: bool,
  dirty: bool,
  valid: bool,
  filled: bool,
  focused: bool,
}
type popoverRootChangeEventDetails = {
  reason: reason9,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger: Dom.element,
  preventUnmountOnClose: unit => unit,
}
type setOpenConfig3 = {
  reason: reason9,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger: Dom.element,
}
type context3 = {
  triggerElements: PopupsTypes.popupTriggerMap,
  popupRef: React.ref<Nullable.t<Dom.element>>,
  onOpenChange?: (bool, popoverRootChangeEventDetails) => unit,
  onOpenChangeComplete: bool => unit,
  backdropRef: React.ref<Nullable.t<Dom.htmlDivElement>>,
  internalBackdropRef: React.ref<Nullable.t<Dom.htmlDivElement>>,
  triggerFocusTargetRef: React.ref<Nullable.t<Dom.element>>,
  beforeContentFocusGuardRef: React.ref<Nullable.t<Dom.element>>,
  stickIfOpenTimeout: PositionerSharedTypes.timeout,
}
type useSyncedValuesConfig5<'a> = {
  @as("open") open_?: bool,
  mounted?: bool,
  transitionStatus?: PositionerSharedTypes.transitionStatus,
  floatingRootContext?: floatingRootStore,
  preventUnmountingOnClose?: bool,
  payload?: 'a,
  activeTriggerId?: string,
  activeTriggerElement?: Dom.element,
  popupElement?: Dom.element,
  positionerElement?: Dom.element,
  activeTriggerProps?: PositionerSharedTypes.htmlProps,
  inactiveTriggerProps?: PositionerSharedTypes.htmlProps,
  popupProps?: PositionerSharedTypes.htmlProps,
  disabled?: bool,
  instantType?: instantType2,
  modal?: CommonTypes.boolOrTrapFocus,
  openMethod?: PositionerSharedTypes.interactionType,
  openChangeReason?: popoverRootChangeEventReason,
  stickIfOpen?: bool,
  nested?: bool,
  titleElementId?: string,
  descriptionElementId?: string,
  openOnHover?: bool,
  closeDelay?: float,
}
type setStateConfig5<'a> = {
  @as("open") open_: bool,
  mounted: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
  floatingRootContext: floatingRootStore,
  preventUnmountingOnClose: bool,
  payload: 'a,
  activeTriggerId: string,
  activeTriggerElement: Dom.element,
  popupElement: Dom.element,
  positionerElement: Dom.element,
  activeTriggerProps: PositionerSharedTypes.htmlProps,
  inactiveTriggerProps: PositionerSharedTypes.htmlProps,
  popupProps: PositionerSharedTypes.htmlProps,
  disabled: bool,
  instantType: instantType2,
  modal: CommonTypes.boolOrTrapFocus,
  openMethod: PositionerSharedTypes.interactionType,
  openChangeReason: popoverRootChangeEventReason,
  stickIfOpen: bool,
  nested: bool,
  titleElementId: string,
  descriptionElementId: string,
  openOnHover: bool,
  closeDelay: float,
}
type popoverStore<'a> = {
  setOpen: (bool, setOpenConfig3) => unit,
  disposeEffect: string,
  context: context3,
  controlledValues: string,
  selectors: string,
  useSyncedValue: (useSyncedValue8, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: useSyncedValuesConfig5<'a> => unit,
  useControlledProp: (useSyncedValue8, string, string) => unit,
  set: (useSyncedValue8, string) => unit,
  update: useSyncedValuesConfig5<'a> => unit,
  setState: setStateConfig5<'a> => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (bool, popoverRootChangeEventDetails) => unit) => unit,
  useStateSetter: useSyncedValue8 => string => unit,
  observe: string,
  state: setStateConfig5<'a>,
  listeners: string,
  updateTick: string,
  subscribe: setStateConfig5<'a> => unit => unit => unit,
  getSnapshot: unit => setStateConfig5<'a>,
  notifyAll: unit => unit,
}
type popoverHandle<'a> = {
  store: popoverStore<'a>,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
type popoverStore2<'a> = {
  setOpen: (bool, setOpenConfig3) => unit,
  disposeEffect: string,
  context: context3,
  controlledValues: string,
  selectors: string,
  useSyncedValue: (TriggerTypes.useSyncedValue9, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: useSyncedValuesConfig5<'a> => unit,
  useControlledProp: (TriggerTypes.useSyncedValue9, string, string) => unit,
  set: (TriggerTypes.useSyncedValue9, string) => unit,
  update: useSyncedValuesConfig5<'a> => unit,
  setState: setStateConfig5<'a> => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (bool, popoverRootChangeEventDetails) => unit) => unit,
  useStateSetter: TriggerTypes.useSyncedValue9 => string => unit,
  observe: string,
  state: setStateConfig5<'a>,
  listeners: string,
  updateTick: string,
  subscribe: setStateConfig5<'a> => unit => unit => unit,
  getSnapshot: unit => setStateConfig5<'a>,
  notifyAll: unit => unit,
}
type popoverHandle2<'a> = {
  store: popoverStore2<'a>,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
type previewCardRootChangeEventDetails = {
  reason: reason10,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger: Dom.element,
}
type progressRootState = {
  status: progressStatus,
}
type radioRootState = {
  checked: bool,
  disabled: bool,
  readOnly: bool,
  required: bool,
  touched: bool,
  dirty: bool,
  valid: bool,
  filled: bool,
  focused: bool,
}
type scrollAreaRootState = {
  hasOverflowX: bool,
  hasOverflowY: bool,
  overflowXStart: bool,
  overflowXEnd: bool,
  overflowYStart: bool,
  overflowYEnd: bool,
  cornerHidden: bool,
}
type selectRootChangeEventDetails = {
  reason: reason11,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger: Dom.element,
}
type itemsConfig<'c> = {
  label: React.element,
  value: 'c,
}
type sliderRootChangeEventDetails = {
  reason: reason12,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger: Dom.element,
  activeThumbIndex: float,
}
type sliderRootCommitEventDetails = {
  reason: reason12,
  event: Dom.event,
}
type sliderRootState = {
  activeThumbIndex: float,
  disabled: bool,
  dragging: bool,
  max: float,
  min: float,
  minStepsBetweenValues: float,
  orientation: PositionerSharedTypes.orientation,
  step: float,
  values: array<float>,
  touched: bool,
  dirty: bool,
  valid: bool,
  filled: bool,
  focused: bool,
}
type tabsRootState = {
  orientation: PositionerSharedTypes.orientation,
  tabActivationDirection: PositionerSharedTypes.tabsTabActivationDirection,
}
type toastManagerPositionerProps = {
  ...JsxDOM.domProps,
  anchor?: Dom.element,
  sticky?: bool,
  render?: React.element,
  side?: PositionerSharedTypes.side,
  positionMethod?: PositionerSharedTypes.positionMethod,
  sideOffset?: PositionerSharedTypes.sideOffsetConfigSideOffset,
  align?: PositionerSharedTypes.align,
  alignOffset?: PositionerSharedTypes.sideOffsetConfigAlignOffset,
  collisionBoundary?: DistTypes.Boundary.t,
  collisionPadding?: string,
  arrowPadding?: float,
  disableAnchorTracking?: bool,
  collisionAvoidance?: PositionerSharedTypes.CollisionAvoidance.t,
}
type toastRootToastObject = {
  id: string,
  title?: React.element,
  @as("type") type_?: string,
  description?: React.element,
  timeout?: float,
  priority?: priority,
  transitionStatus?: transitionStatus2,
  limited?: bool,
  height?: float,
  onClose?: unit => unit,
  onRemove?: unit => unit,
  actionProps?: string,
  positionerProps?: toastManagerPositionerProps,
  data?: string,
}
type toastRootState = {
  transitionStatus: PositionerSharedTypes.transitionStatus,
  expanded: bool,
  limited: bool,
  @as("type") type_: string,
  swiping: bool,
  swipeDirection: ContentTypes.activationDirection,
}
type toastManagerEvent = {
  action: ProviderTypes.action,
  options: string,
}
type toastManagerAddOptions = {
  id?: string,
  data?: string,
  title?: React.element,
  @as("type") type_?: string,
  transitionStatus?: transitionStatus2,
  description?: React.element,
  timeout?: float,
  priority?: priority,
  onClose?: unit => unit,
  onRemove?: unit => unit,
  actionProps?: string,
  positionerProps?: toastManagerPositionerProps,
}
type toastManagerPromiseOptions = {
  loading: string,
  success: string,
  error: string,
}
type toastManager = {
  @as(" subscribe") _subscribe: toastManagerEvent => unit => unit => unit,
  add: toastManagerAddOptions => string,
  close: string => unit,
  update: (string, toastManagerAddOptions) => unit,
  promise: (promise<string>, toastManagerPromiseOptions) => promise<string>,
}
type useToastManagerReturnValue = {
  toasts: array<toastRootToastObject>,
  add: toastManagerAddOptions => string,
  close: string => unit,
  update: (string, toastManagerAddOptions) => unit,
  promise: (promise<string>, toastManagerPromiseOptions) => promise<string>,
}
type toolbarRootState = {
  disabled: bool,
  orientation: PositionerSharedTypes.orientation,
}
type tooltipRootChangeEventDetails = {
  reason: reason13,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger: Dom.element,
  preventUnmountOnClose: unit => unit,
}
type setOpenConfig4 = {
  reason: reason13,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger: Dom.element,
}
type context4 = {
  triggerElements: PopupsTypes.popupTriggerMap,
  popupRef: React.ref<Nullable.t<Dom.element>>,
  onOpenChange?: (bool, tooltipRootChangeEventDetails) => unit,
  onOpenChangeComplete: bool => unit,
}
type useSyncedValuesConfig6<'a> = {
  @as("open") open_?: bool,
  mounted?: bool,
  transitionStatus?: PositionerSharedTypes.transitionStatus,
  floatingRootContext?: floatingRootStore,
  preventUnmountingOnClose?: bool,
  payload?: 'a,
  activeTriggerId?: string,
  activeTriggerElement?: Dom.element,
  popupElement?: Dom.element,
  positionerElement?: Dom.element,
  activeTriggerProps?: PositionerSharedTypes.htmlProps,
  inactiveTriggerProps?: PositionerSharedTypes.htmlProps,
  popupProps?: PositionerSharedTypes.htmlProps,
  disabled?: bool,
  instantType?: instantType3,
  isInstantPhase?: bool,
  trackCursorAxis?: trackCursorAxis,
  disableHoverablePopup?: bool,
  openChangeReason?: tooltipRootChangeEventReason,
  closeDelay?: float,
}
type setStateConfig6<'a> = {
  @as("open") open_: bool,
  mounted: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
  floatingRootContext: floatingRootStore,
  preventUnmountingOnClose: bool,
  payload: 'a,
  activeTriggerId: string,
  activeTriggerElement: Dom.element,
  popupElement: Dom.element,
  positionerElement: Dom.element,
  activeTriggerProps: PositionerSharedTypes.htmlProps,
  inactiveTriggerProps: PositionerSharedTypes.htmlProps,
  popupProps: PositionerSharedTypes.htmlProps,
  disabled: bool,
  instantType: instantType3,
  isInstantPhase: bool,
  trackCursorAxis: trackCursorAxis,
  disableHoverablePopup: bool,
  openChangeReason: tooltipRootChangeEventReason,
  closeDelay: float,
}
type tooltipStore<'a> = {
  setOpen: (bool, setOpenConfig4) => unit,
  context: context4,
  controlledValues: string,
  selectors: string,
  useSyncedValue: (useSyncedValue10, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: useSyncedValuesConfig6<'a> => unit,
  useControlledProp: (useSyncedValue10, string, string) => unit,
  set: (useSyncedValue10, string) => unit,
  update: useSyncedValuesConfig6<'a> => unit,
  setState: setStateConfig6<'a> => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (bool, tooltipRootChangeEventDetails) => unit) => unit,
  useStateSetter: useSyncedValue10 => string => unit,
  observe: string,
  state: setStateConfig6<'a>,
  listeners: string,
  updateTick: string,
  subscribe: setStateConfig6<'a> => unit => unit => unit,
  getSnapshot: unit => setStateConfig6<'a>,
  notifyAll: unit => unit,
}
type tooltipHandle<'a> = {
  store: tooltipStore<'a>,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
type tooltipStore2<'a> = {
  setOpen: (bool, setOpenConfig4) => unit,
  context: context4,
  controlledValues: string,
  selectors: string,
  useSyncedValue: (TriggerTypes.useSyncedValue11, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: useSyncedValuesConfig6<'a> => unit,
  useControlledProp: (TriggerTypes.useSyncedValue11, string, string) => unit,
  set: (TriggerTypes.useSyncedValue11, string) => unit,
  update: useSyncedValuesConfig6<'a> => unit,
  setState: setStateConfig6<'a> => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (bool, tooltipRootChangeEventDetails) => unit) => unit,
  useStateSetter: TriggerTypes.useSyncedValue11 => string => unit,
  observe: string,
  state: setStateConfig6<'a>,
  listeners: string,
  updateTick: string,
  subscribe: setStateConfig6<'a> => unit => unit => unit,
  getSnapshot: unit => setStateConfig6<'a>,
  notifyAll: unit => unit,
}
type tooltipHandle2<'a> = {
  store: tooltipStore2<'a>,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
@unboxed type accordionRootStyle = Style(JsxDOM.style) | Fn(accordionRootState => JsxDOM.style)
@unboxed type accordionRootClassName = Str(string) | Fn(accordionRootState => string)
@unboxed type avatarRootStyle = Style(JsxDOM.style) | Fn(avatarRootState => JsxDOM.style)
@unboxed type avatarRootClassName = Str(string) | Fn(avatarRootState => string)
@unboxed type checkboxRootClassName = Str(string) | Fn(checkboxRootState => string)
@unboxed type checkboxRootStyle = Style(JsxDOM.style) | Fn(checkboxRootState => JsxDOM.style)
@unboxed type collapsibleRootStyle = Style(JsxDOM.style) | Fn(collapsibleRootState => JsxDOM.style)
@unboxed type collapsibleRootClassName = Str(string) | Fn(collapsibleRootState => string)
@unboxed type menubarStyle = Style(JsxDOM.style) | Fn(menubarState => JsxDOM.style)
@unboxed type menubarClassName = Str(string) | Fn(menubarState => string)
@unboxed type navigationMenuRootStyle = Style(JsxDOM.style) | Fn(navigationMenuRootState => JsxDOM.style)
@unboxed type navigationMenuRootClassName = Str(string) | Fn(navigationMenuRootState => string)
@unboxed type numberFieldRootClassName = Str(string) | Fn(numberFieldRootState => string)
@unboxed type numberFieldRootStyle = Style(JsxDOM.style) | Fn(numberFieldRootState => JsxDOM.style)
@unboxed type progressRootStyle = Style(JsxDOM.style) | Fn(progressRootState => JsxDOM.style)
@unboxed type progressRootClassName = Str(string) | Fn(progressRootState => string)
@unboxed type radioRootClassName = Str(string) | Fn(radioRootState => string)
@unboxed type radioRootStyle = Style(JsxDOM.style) | Fn(radioRootState => JsxDOM.style)
@unboxed type scrollAreaRootStyle = Style(JsxDOM.style) | Fn(scrollAreaRootState => JsxDOM.style)
@unboxed type scrollAreaRootClassName = Str(string) | Fn(scrollAreaRootState => string)
@unboxed type valueOrItemsConfigArray<'c> = Dict(Dict.t<React.element>) | ItemsConfigArr(array<itemsConfig<'c>>)
@unboxed type sliderRootStyle = Style(JsxDOM.style) | Fn(sliderRootState => JsxDOM.style)
@unboxed type sliderRootClassName = Str(string) | Fn(sliderRootState => string)
@unboxed type tabsRootStyle = Style(JsxDOM.style) | Fn(tabsRootState => JsxDOM.style)
@unboxed type tabsRootClassName = Str(string) | Fn(tabsRootState => string)
@unboxed type toastRootStyle = Style(JsxDOM.style) | Fn(toastRootState => JsxDOM.style)
@unboxed type toastRootClassName = Str(string) | Fn(toastRootState => string)
@unboxed type toolbarRootStyle = Style(JsxDOM.style) | Fn(toolbarRootState => JsxDOM.style)
@unboxed type toolbarRootClassName = Str(string) | Fn(toolbarRootState => string)
