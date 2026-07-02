type rootAccordionRootChangeEventDetailsReason =
  | @as("trigger-press") TriggerPress
  | @as("none") None
type rootAlertDialogRootChangeEventDetailsReason =
  | @as("trigger-press") TriggerPress
  | @as("none") None
  | @as("outside-press") OutsidePress
  | @as("close-press") ClosePress
  | @as("focus-out") FocusOut
  | @as("escape-key") EscapeKey
  | @as("imperative-action") ImperativeAction
type rootDialogStoreUseSyncedValue =
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
type rootFloatingRootStoreUseSyncedValue =
  | @as("open") Open
  | @as("domReferenceElement") DomReferenceElement
  | @as("referenceElement") ReferenceElement
  | @as("floatingElement") FloatingElement
  | @as("positionReference") PositionReference
  | @as("floatingId") FloatingId
type rootDialogStoreUseSyncedValuesRole =
  | @as("dialog") Dialog
  | @as("alertdialog") Alertdialog
type rootChangeEventDetailsReason =
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
type rootHighlightEventDetailsReason =
  | @as("none") None
  | @as("keyboard") Keyboard
  | @as("pointer") Pointer
type rootMode =
  | @as("none") None
  | @as("both") Both
  | @as("inline") Inline
  | @as("list") List
type imageLoadingStatus =
  | @as("idle") Idle
  | @as("loading") Loading
  | @as("loaded") Loaded
  | @as("error") Error
type rootContextMenuRootChangeEventDetailsReason =
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
type rootMenuStoreUseSyncedValue =
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
type rootMenuStoreUseSyncedValuesInstantType =
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
type rootDialogStoreUseSyncedValue2 =
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
type rootMenuStoreUseSyncedValue2 =
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
type rootNavigationMenuRootChangeEventDetailsReason =
  | @as("trigger-press") TriggerPress
  | @as("none") None
  | @as("trigger-hover") TriggerHover
  | @as("outside-press") OutsidePress
  | @as("link-press") LinkPress
  | @as("focus-out") FocusOut
  | @as("escape-key") EscapeKey
  | @as("list-navigation") ListNavigation
type rootOrientation =
  | @as("horizontal") Horizontal
  | @as("vertical") Vertical
type rootNumberFieldRootChangeEventDetailsReason =
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
type rootNumberFieldRootCommitEventDetailsReason =
  | @as("none") None
  | @as("increment-press") IncrementPress
  | @as("decrement-press") DecrementPress
  | @as("input-clear") InputClear
  | @as("input-blur") InputBlur
  | @as("keyboard") Keyboard
  | @as("wheel") Wheel
  | @as("scrub") Scrub
type rootPopoverRootChangeEventDetailsReason =
  | @as("trigger-press") TriggerPress
  | @as("none") None
  | @as("trigger-hover") TriggerHover
  | @as("trigger-focus") TriggerFocus
  | @as("outside-press") OutsidePress
  | @as("close-press") ClosePress
  | @as("focus-out") FocusOut
  | @as("escape-key") EscapeKey
  | @as("imperative-action") ImperativeAction
type rootPopoverStoreUseSyncedValue =
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
type rootPopoverStoreUseSyncedValuesInstantType =
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
type rootPreviewCardRootChangeEventDetailsReason =
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
type rootSelectRootChangeEventDetailsReason =
  | @as("trigger-press") TriggerPress
  | @as("none") None
  | @as("outside-press") OutsidePress
  | @as("item-press") ItemPress
  | @as("focus-out") FocusOut
  | @as("escape-key") EscapeKey
  | @as("list-navigation") ListNavigation
  | @as("cancel-open") CancelOpen
  | @as("window-resize") WindowResize
type rootThumbAlignment =
  | @as("center") Center
  | @as("edge") Edge
  | @as("edge-client-only") EdgeClientOnly
type rootThumbCollisionBehavior =
  | @as("none") None
  | @as("push") Push
  | @as("swap") Swap
type rootSliderRootChangeEventDetailsReason =
  | @as("none") None
  | @as("track-press") TrackPress
  | @as("input-change") InputChange
  | @as("keyboard") Keyboard
  | @as("drag") Drag
type rootToastRootToastObjectPriority =
  | @as("low") Low
  | @as("high") High
type rootToastRootToastObjectTransitionStatus =
  | @as("starting") Starting
  | @as("ending") Ending
type rootTooltipRootChangeEventDetailsReason =
  | @as("trigger-press") TriggerPress
  | @as("none") None
  | @as("trigger-hover") TriggerHover
  | @as("trigger-focus") TriggerFocus
  | @as("outside-press") OutsidePress
  | @as("escape-key") EscapeKey
  | @as("disabled") Disabled
  | @as("imperative-action") ImperativeAction
type rootTrackCursorAxis =
  | @as("none") None
  | @as("both") Both
  | @as("x") X
  | @as("y") Y
type rootTooltipStoreUseSyncedValue =
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
type rootTooltipStoreUseSyncedValuesInstantType =
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
  reason: rootAccordionRootChangeEventDetailsReason,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger?: Dom.element,
}
type accordionRootState = {
  value: array<string>,
  disabled: bool,
  orientation: PositionerSharedTypes.orientation,
}
type alertDialogRootChangeEventDetails = {
  reason: rootAlertDialogRootChangeEventDetailsReason,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger?: Dom.element,
  preventUnmountOnClose: unit => unit,
}
type rootDialogStoreSetOpenConfig = {
  reason: rootAlertDialogRootChangeEventDetailsReason,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger?: Dom.element,
}
type context = {
  triggerElements: PopupsTypes.popupTriggerMap,
  popupRef: React.ref<Nullable.t<Dom.element>>,
  onOpenChange?: (bool, alertDialogRootChangeEventDetails) => unit,
  onOpenChangeComplete?: bool => unit,
  backdropRef: React.ref<Nullable.t<Dom.htmlDivElement>>,
  internalBackdropRef: React.ref<Nullable.t<Dom.htmlDivElement>>,
  onNestedDialogOpen?: float => unit,
  onNestedDialogClose?: unit => unit,
}
type floatingRootStoreContext = {
  onOpenChange?: (string, string) => unit,
  dataRef: React.ref<Nullable.t<Dom.element>>,
  events: FloatingUiReactTypes.floatingEvents,
  nested: bool,
  noEmit: bool,
  triggerElements: PopupsTypes.popupTriggerMap,
}
type componentsFloatingRootStoreUseSyncedValuesConfig = {
  @as("open") open_?: string,
  domReferenceElement?: string,
  referenceElement?: string,
  floatingElement?: string,
  positionReference?: string,
  floatingId?: string,
}
type componentsFloatingRootStoreSetStateConfig = {
  @as("open") open_: string,
  domReferenceElement: string,
  referenceElement: string,
  floatingElement: string,
  positionReference: string,
  floatingId?: string,
}
type floatingRootStore = {
  setOpen: (bool, PositionerSharedTypes.utilsFloatingRootStoreSetOpenConfig) => unit,
  context: floatingRootStoreContext,
  controlledValues: string,
  selectors: string,
  useSyncedValue: (rootFloatingRootStoreUseSyncedValue, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: componentsFloatingRootStoreUseSyncedValuesConfig => unit,
  useControlledProp: (rootFloatingRootStoreUseSyncedValue, string, string) => unit,
  set: (rootFloatingRootStoreUseSyncedValue, string) => unit,
  update: componentsFloatingRootStoreUseSyncedValuesConfig => unit,
  setState: componentsFloatingRootStoreSetStateConfig => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (string, string) => unit) => unit,
  useStateSetter: rootFloatingRootStoreUseSyncedValue => string => unit,
  observe: string,
  state: componentsFloatingRootStoreSetStateConfig,
  listeners: string,
  updateTick: string,
  subscribe: string => unit => unit => unit,
  getSnapshot: unit => componentsFloatingRootStoreSetStateConfig,
  notifyAll: unit => unit,
}
type storeDialogStoreUseSyncedValuesConfig<'a> = {
  @as("open") open_?: bool,
  mounted?: bool,
  transitionStatus?: PositionerSharedTypes.transitionStatus,
  floatingRootContext?: floatingRootStore,
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
  role?: rootDialogStoreUseSyncedValuesRole,
}
type storeDialogStoreSetStateConfig<'a> = {
  @as("open") open_: bool,
  mounted: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
  floatingRootContext: floatingRootStore,
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
  role: rootDialogStoreUseSyncedValuesRole,
}
type dialogStore<'a> = {
  setOpen: (bool, rootDialogStoreSetOpenConfig) => unit,
  context: context,
  controlledValues: string,
  selectors: string,
  useSyncedValue: (rootDialogStoreUseSyncedValue, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: storeDialogStoreUseSyncedValuesConfig<'a> => unit,
  useControlledProp: (rootDialogStoreUseSyncedValue, string, string) => unit,
  set: (rootDialogStoreUseSyncedValue, string) => unit,
  update: storeDialogStoreUseSyncedValuesConfig<'a> => unit,
  setState: storeDialogStoreSetStateConfig<'a> => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (string, alertDialogRootChangeEventDetails) => unit) => unit,
  useStateSetter: rootDialogStoreUseSyncedValue => string => unit,
  observe: string,
  state: storeDialogStoreSetStateConfig<'a>,
  listeners: string,
  updateTick: string,
  subscribe: storeDialogStoreSetStateConfig<'a> => unit => unit => unit,
  getSnapshot: unit => storeDialogStoreSetStateConfig<'a>,
  notifyAll: unit => unit,
}
type dialogHandle<'a> = {
  store: dialogStore<'a>,
  @as("open") open_: Nullable.t<string> => unit,
  openWithPayload: 'a => unit,
  close: unit => unit,
  isOpen: bool,
}
type changeEventDetails = {
  reason: rootChangeEventDetailsReason,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger?: Dom.element,
}
type highlightEventDetails = {
  reason: rootHighlightEventDetailsReason,
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
  valid: Nullable.t<bool>,
  filled: bool,
  focused: bool,
}
type collapsibleRootState = {
  disabled: bool,
  @as("open") open_: bool,
}
type contextMenuRootChangeEventDetails = {
  reason: rootContextMenuRootChangeEventDetailsReason,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger?: Dom.element,
}
type menuRootChangeEventDetails = {
  reason: rootContextMenuRootChangeEventDetailsReason,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger?: Dom.element,
  preventUnmountOnClose: unit => unit,
}
type context2 = {
  triggerElements: PopupsTypes.popupTriggerMap,
  popupRef: React.ref<Nullable.t<Dom.element>>,
  onOpenChange?: (bool, menuRootChangeEventDetails) => unit,
  onOpenChangeComplete?: bool => unit,
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
type storeMenuStoreUseSyncedValuesConfig = {
  @as("open") open_?: bool,
  mounted?: bool,
  transitionStatus?: PositionerSharedTypes.transitionStatus,
  floatingRootContext?: floatingRootStore,
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
  parent?: string,
  rootId?: string,
  activeIndex?: Nullable.t<float>,
  hoverEnabled?: bool,
  stickIfOpen?: bool,
  instantType?: rootMenuStoreUseSyncedValuesInstantType,
  openChangeReason?: Nullable.t<menuRootChangeEventReason>,
  floatingTreeRoot?: floatingTreeStore,
  floatingNodeId?: string,
  floatingParentNodeId?: Nullable.t<string>,
  itemProps?: PositionerSharedTypes.htmlProps,
  closeDelay?: float,
  keyboardEventRelay?: ReactEvent.Keyboard.t => unit,
}
type storeMenuStoreSetStateConfig = {
  @as("open") open_: bool,
  mounted: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
  floatingRootContext: floatingRootStore,
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
  parent: string,
  rootId?: string,
  activeIndex: Nullable.t<float>,
  hoverEnabled: bool,
  stickIfOpen: bool,
  instantType?: rootMenuStoreUseSyncedValuesInstantType,
  openChangeReason: Nullable.t<menuRootChangeEventReason>,
  floatingTreeRoot: floatingTreeStore,
  floatingNodeId?: string,
  floatingParentNodeId: Nullable.t<string>,
  itemProps: PositionerSharedTypes.htmlProps,
  closeDelay: float,
  keyboardEventRelay?: ReactEvent.Keyboard.t => unit,
}
type menuStore = {
  setOpen: (bool, contextMenuRootChangeEventDetails) => unit,
  unsubscribeParentListener: string,
  context: context2,
  controlledValues: string,
  selectors: string,
  useSyncedValue: (rootMenuStoreUseSyncedValue, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: storeMenuStoreUseSyncedValuesConfig => unit,
  useControlledProp: (rootMenuStoreUseSyncedValue, string, string) => unit,
  set: (rootMenuStoreUseSyncedValue, string) => unit,
  update: storeMenuStoreUseSyncedValuesConfig => unit,
  setState: storeMenuStoreSetStateConfig => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (bool, menuRootChangeEventDetails) => unit) => unit,
  useStateSetter: rootMenuStoreUseSyncedValue => string => unit,
  observe: string,
  state: storeMenuStoreSetStateConfig,
  listeners: string,
  updateTick: string,
  subscribe: storeMenuStoreSetStateConfig => unit => unit => unit,
  getSnapshot: unit => storeMenuStoreSetStateConfig,
  notifyAll: unit => unit,
}
type menuHandle = {
  store: menuStore,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
type rootMenuStoreUseSyncedValuesParentConfig = {
  @as("type") type_: string,
  store: menuStore,
}
type menubarContext = {
  modal: bool,
  disabled: bool,
  contentElement: Nullable.t<Dom.element>,
  setContentElement: Nullable.t<Dom.element> => unit,
  hasSubmenuOpen: bool,
  setHasSubmenuOpen: bool => unit,
  orientation: menuRootOrientation,
  allowMouseUpTriggerRef: React.ref<Nullable.t<Dom.element>>,
  rootId?: string,
}
type rootMenuStoreUseSyncedValuesParentConfig2 = {
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
  rootId?: string,
}
type rootMenuStoreUseSyncedValuesParentConfig3 = {
  @as("type") type_: string,
  context: contextMenuRootContext,
}
type menuRootContext = {
  store: menuStore,
  parent: string,
}
type rootMenuStoreUseSyncedValuesParentConfig4 = {
  @as("type") type_: string,
  context: contextMenuRootContext,
  menuContext: menuRootContext,
}
type rootMenuStoreUseSyncedValuesParentConfig5 = {
  @as("type") type_: string,
}
type dialogStore2<'a> = {
  setOpen: (bool, rootDialogStoreSetOpenConfig) => unit,
  context: context,
  controlledValues: string,
  selectors: string,
  useSyncedValue: (rootDialogStoreUseSyncedValue2, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: storeDialogStoreUseSyncedValuesConfig<'a> => unit,
  useControlledProp: (rootDialogStoreUseSyncedValue2, string, string) => unit,
  set: (rootDialogStoreUseSyncedValue2, string) => unit,
  update: storeDialogStoreUseSyncedValuesConfig<'a> => unit,
  setState: storeDialogStoreSetStateConfig<'a> => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (string, alertDialogRootChangeEventDetails) => unit) => unit,
  useStateSetter: rootDialogStoreUseSyncedValue2 => string => unit,
  observe: string,
  state: storeDialogStoreSetStateConfig<'a>,
  listeners: string,
  updateTick: string,
  subscribe: storeDialogStoreSetStateConfig<'a> => unit => unit => unit,
  getSnapshot: unit => storeDialogStoreSetStateConfig<'a>,
  notifyAll: unit => unit,
}
type dialogHandle2<'a> = {
  store: dialogStore2<'a>,
  @as("open") open_: Nullable.t<string> => unit,
  openWithPayload: 'a => unit,
  close: unit => unit,
  isOpen: bool,
}
type dialogStore3<'a> = {
  setOpen: (bool, rootDialogStoreSetOpenConfig) => unit,
  context: context,
  controlledValues: string,
  selectors: string,
  useSyncedValue: (TriggerTypes.triggerDialogStoreUseSyncedValue, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: storeDialogStoreUseSyncedValuesConfig<'a> => unit,
  useControlledProp: (TriggerTypes.triggerDialogStoreUseSyncedValue, string, string) => unit,
  set: (TriggerTypes.triggerDialogStoreUseSyncedValue, string) => unit,
  update: storeDialogStoreUseSyncedValuesConfig<'a> => unit,
  setState: storeDialogStoreSetStateConfig<'a> => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (string, alertDialogRootChangeEventDetails) => unit) => unit,
  useStateSetter: TriggerTypes.triggerDialogStoreUseSyncedValue => string => unit,
  observe: string,
  state: storeDialogStoreSetStateConfig<'a>,
  listeners: string,
  updateTick: string,
  subscribe: storeDialogStoreSetStateConfig<'a> => unit => unit => unit,
  getSnapshot: unit => storeDialogStoreSetStateConfig<'a>,
  notifyAll: unit => unit,
}
type dialogHandle3<'a> = {
  store: dialogStore3<'a>,
  @as("open") open_: Nullable.t<string> => unit,
  openWithPayload: 'a => unit,
  close: unit => unit,
  isOpen: bool,
}
type fieldRootState = {
  disabled: bool,
  touched: bool,
  dirty: bool,
  valid: Nullable.t<bool>,
  filled: bool,
  focused: bool,
}
type rootFieldValidityStateValidityConfig = {
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
  valid: Nullable.t<bool>,
}
type fieldsetRootState = {
  disabled: bool,
}
type storeMenuStoreUseSyncedValuesConfig2<'a> = {
  @as("open") open_?: bool,
  mounted?: bool,
  transitionStatus?: PositionerSharedTypes.transitionStatus,
  floatingRootContext?: floatingRootStore,
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
  parent?: string,
  rootId?: string,
  activeIndex?: Nullable.t<float>,
  hoverEnabled?: bool,
  stickIfOpen?: bool,
  instantType?: rootMenuStoreUseSyncedValuesInstantType,
  openChangeReason?: Nullable.t<menuRootChangeEventReason>,
  floatingTreeRoot?: floatingTreeStore,
  floatingNodeId?: string,
  floatingParentNodeId?: Nullable.t<string>,
  itemProps?: PositionerSharedTypes.htmlProps,
  closeDelay?: float,
  keyboardEventRelay?: ReactEvent.Keyboard.t => unit,
}
type storeMenuStoreSetStateConfig2<'a> = {
  @as("open") open_: bool,
  mounted: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
  floatingRootContext: floatingRootStore,
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
  parent: string,
  rootId?: string,
  activeIndex: Nullable.t<float>,
  hoverEnabled: bool,
  stickIfOpen: bool,
  instantType?: rootMenuStoreUseSyncedValuesInstantType,
  openChangeReason: Nullable.t<menuRootChangeEventReason>,
  floatingTreeRoot: floatingTreeStore,
  floatingNodeId?: string,
  floatingParentNodeId: Nullable.t<string>,
  itemProps: PositionerSharedTypes.htmlProps,
  closeDelay: float,
  keyboardEventRelay?: ReactEvent.Keyboard.t => unit,
}
type menuStore2<'a> = {
  setOpen: (bool, contextMenuRootChangeEventDetails) => unit,
  unsubscribeParentListener: string,
  context: context2,
  controlledValues: string,
  selectors: string,
  useSyncedValue: (rootMenuStoreUseSyncedValue2, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: storeMenuStoreUseSyncedValuesConfig2<'a> => unit,
  useControlledProp: (rootMenuStoreUseSyncedValue2, string, string) => unit,
  set: (rootMenuStoreUseSyncedValue2, string) => unit,
  update: storeMenuStoreUseSyncedValuesConfig2<'a> => unit,
  setState: storeMenuStoreSetStateConfig2<'a> => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (bool, menuRootChangeEventDetails) => unit) => unit,
  useStateSetter: rootMenuStoreUseSyncedValue2 => string => unit,
  observe: string,
  state: storeMenuStoreSetStateConfig2<'a>,
  listeners: string,
  updateTick: string,
  subscribe: storeMenuStoreSetStateConfig2<'a> => unit => unit => unit,
  getSnapshot: unit => storeMenuStoreSetStateConfig2<'a>,
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
  useSyncedValue: (TriggerTypes.triggerMenuStoreUseSyncedValue, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: storeMenuStoreUseSyncedValuesConfig2<'a> => unit,
  useControlledProp: (TriggerTypes.triggerMenuStoreUseSyncedValue, string, string) => unit,
  set: (TriggerTypes.triggerMenuStoreUseSyncedValue, string) => unit,
  update: storeMenuStoreUseSyncedValuesConfig2<'a> => unit,
  setState: storeMenuStoreSetStateConfig2<'a> => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (bool, menuRootChangeEventDetails) => unit) => unit,
  useStateSetter: TriggerTypes.triggerMenuStoreUseSyncedValue => string => unit,
  observe: string,
  state: storeMenuStoreSetStateConfig2<'a>,
  listeners: string,
  updateTick: string,
  subscribe: storeMenuStoreSetStateConfig2<'a> => unit => unit => unit,
  getSnapshot: unit => storeMenuStoreSetStateConfig2<'a>,
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
  reason: rootNavigationMenuRootChangeEventDetailsReason,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger?: Dom.element,
}
type navigationMenuRootState = {
  @as("open") open_: bool,
  nested: bool,
}
type numberFieldRootChangeEventDetails = {
  reason: rootNumberFieldRootChangeEventDetailsReason,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger?: Dom.element,
  direction?: CommonTypes.v1OrV1,
}
type numberFieldRootCommitEventDetails = {
  reason: rootNumberFieldRootCommitEventDetailsReason,
  event: Dom.event,
}
type numberFieldRootState = {
  value: Nullable.t<float>,
  inputValue: string,
  required: bool,
  disabled: bool,
  readOnly: bool,
  scrubbing: bool,
  touched: bool,
  dirty: bool,
  valid: Nullable.t<bool>,
  filled: bool,
  focused: bool,
}
type popoverRootChangeEventDetails = {
  reason: rootPopoverRootChangeEventDetailsReason,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger?: Dom.element,
  preventUnmountOnClose: unit => unit,
}
type rootPopoverStoreSetOpenConfig = {
  reason: rootPopoverRootChangeEventDetailsReason,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger?: Dom.element,
}
type context3 = {
  triggerElements: PopupsTypes.popupTriggerMap,
  popupRef: React.ref<Nullable.t<Dom.element>>,
  onOpenChange?: (bool, popoverRootChangeEventDetails) => unit,
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
  floatingRootContext?: floatingRootStore,
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
  instantType?: rootPopoverStoreUseSyncedValuesInstantType,
  modal?: CommonTypes.boolOrTrapFocus,
  openMethod?: Nullable.t<PositionerSharedTypes.interactionType>,
  openChangeReason?: Nullable.t<popoverRootChangeEventReason>,
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
  floatingRootContext: floatingRootStore,
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
  instantType?: rootPopoverStoreUseSyncedValuesInstantType,
  modal: CommonTypes.boolOrTrapFocus,
  openMethod: Nullable.t<PositionerSharedTypes.interactionType>,
  openChangeReason: Nullable.t<popoverRootChangeEventReason>,
  stickIfOpen: bool,
  nested: bool,
  titleElementId?: string,
  descriptionElementId?: string,
  openOnHover: bool,
  closeDelay: float,
}
type popoverStore<'a> = {
  setOpen: (bool, rootPopoverStoreSetOpenConfig) => unit,
  disposeEffect: string,
  context: context3,
  controlledValues: string,
  selectors: string,
  useSyncedValue: (rootPopoverStoreUseSyncedValue, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: storePopoverStoreUseSyncedValuesConfig<'a> => unit,
  useControlledProp: (rootPopoverStoreUseSyncedValue, string, string) => unit,
  set: (rootPopoverStoreUseSyncedValue, string) => unit,
  update: storePopoverStoreUseSyncedValuesConfig<'a> => unit,
  setState: storePopoverStoreSetStateConfig<'a> => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (bool, popoverRootChangeEventDetails) => unit) => unit,
  useStateSetter: rootPopoverStoreUseSyncedValue => string => unit,
  observe: string,
  state: storePopoverStoreSetStateConfig<'a>,
  listeners: string,
  updateTick: string,
  subscribe: storePopoverStoreSetStateConfig<'a> => unit => unit => unit,
  getSnapshot: unit => storePopoverStoreSetStateConfig<'a>,
  notifyAll: unit => unit,
}
type popoverHandle<'a> = {
  store: popoverStore<'a>,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
type popoverStore2<'a> = {
  setOpen: (bool, rootPopoverStoreSetOpenConfig) => unit,
  disposeEffect: string,
  context: context3,
  controlledValues: string,
  selectors: string,
  useSyncedValue: (TriggerTypes.triggerPopoverStoreUseSyncedValue, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: storePopoverStoreUseSyncedValuesConfig<'a> => unit,
  useControlledProp: (TriggerTypes.triggerPopoverStoreUseSyncedValue, string, string) => unit,
  set: (TriggerTypes.triggerPopoverStoreUseSyncedValue, string) => unit,
  update: storePopoverStoreUseSyncedValuesConfig<'a> => unit,
  setState: storePopoverStoreSetStateConfig<'a> => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (bool, popoverRootChangeEventDetails) => unit) => unit,
  useStateSetter: TriggerTypes.triggerPopoverStoreUseSyncedValue => string => unit,
  observe: string,
  state: storePopoverStoreSetStateConfig<'a>,
  listeners: string,
  updateTick: string,
  subscribe: storePopoverStoreSetStateConfig<'a> => unit => unit => unit,
  getSnapshot: unit => storePopoverStoreSetStateConfig<'a>,
  notifyAll: unit => unit,
}
type popoverHandle2<'a> = {
  store: popoverStore2<'a>,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
type previewCardRootChangeEventDetails = {
  reason: rootPreviewCardRootChangeEventDetailsReason,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger?: Dom.element,
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
  valid: Nullable.t<bool>,
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
  reason: rootSelectRootChangeEventDetailsReason,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger?: Dom.element,
}
type rootItemsConfig<'c> = {
  label: React.element,
  value: 'c,
}
type sliderRootChangeEventDetails = {
  reason: rootSliderRootChangeEventDetailsReason,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger?: Dom.element,
  activeThumbIndex: float,
}
type sliderRootCommitEventDetails = {
  reason: rootSliderRootChangeEventDetailsReason,
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
  valid: Nullable.t<bool>,
  filled: bool,
  focused: bool,
}
type tabsRootState = {
  orientation: PositionerSharedTypes.orientation,
  tabActivationDirection: PositionerSharedTypes.tabsTabActivationDirection,
}
type toastManagerPositionerProps = {
  anchor?: Nullable.t<Dom.element>,
  className?: PositionerSharedTypes.toastPositionerClassName,
  sticky?: bool,
  render?: React.element,
  side?: PositionerSharedTypes.side,
  positionMethod?: PositionerSharedTypes.positionerPositionMethod,
  sideOffset?: PositionerSharedTypes.utilsSideOffsetConfigSideOffset,
  align?: PositionerSharedTypes.align,
  alignOffset?: PositionerSharedTypes.utilsSideOffsetConfigAlignOffset,
  collisionBoundary?: DistTypes.Boundary.t,
  collisionPadding?: string,
  arrowPadding?: float,
  disableAnchorTracking?: bool,
  collisionAvoidance?: PositionerSharedTypes.CollisionAvoidance.t,
}
type toastRootToastObject = {
  id: string,
  ref?: React.ref<Nullable.t<Dom.element>>,
  title?: React.element,
  @as("type") type_?: string,
  description?: React.element,
  timeout?: float,
  priority?: rootToastRootToastObjectPriority,
  transitionStatus?: rootToastRootToastObjectTransitionStatus,
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
  @as("type") type_?: string,
  swiping: bool,
  swipeDirection?: ContentTypes.contentNavigationMenuContentStateActivationDirection,
}
type toastManagerEvent = {
  action: ProviderTypes.providerToastManagerEventAction,
  options: string,
}
type toastManagerAddOptions = {
  id?: string,
  data?: string,
  title?: React.element,
  @as("type") type_?: string,
  transitionStatus?: rootToastRootToastObjectTransitionStatus,
  description?: React.element,
  timeout?: float,
  priority?: rootToastRootToastObjectPriority,
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
type toastObject = {
  id: string,
  ref?: React.ref<Nullable.t<Dom.element>>,
  title?: React.element,
  @as("type") type_?: string,
  description?: React.element,
  timeout?: float,
  priority?: rootToastRootToastObjectPriority,
  transitionStatus?: rootToastRootToastObjectTransitionStatus,
  limited?: bool,
  height?: float,
  onClose?: unit => unit,
  onRemove?: unit => unit,
  actionProps?: string,
  positionerProps?: toastManagerPositionerProps,
  data?: string,
}
type useToastManagerReturnValue = {
  toasts: array<toastObject>,
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
  reason: rootTooltipRootChangeEventDetailsReason,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger?: Dom.element,
  preventUnmountOnClose: unit => unit,
}
type rootTooltipStoreSetOpenConfig = {
  reason: rootTooltipRootChangeEventDetailsReason,
  event: Dom.event,
  cancel: unit => unit,
  allowPropagation: unit => unit,
  isCanceled: bool,
  isPropagationAllowed: bool,
  trigger?: Dom.element,
}
type context4 = {
  triggerElements: PopupsTypes.popupTriggerMap,
  popupRef: React.ref<Nullable.t<Dom.element>>,
  onOpenChange?: (bool, tooltipRootChangeEventDetails) => unit,
  onOpenChangeComplete?: bool => unit,
}
type storeTooltipStoreUseSyncedValuesConfig<'a> = {
  @as("open") open_?: bool,
  mounted?: bool,
  transitionStatus?: PositionerSharedTypes.transitionStatus,
  floatingRootContext?: floatingRootStore,
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
  instantType?: rootTooltipStoreUseSyncedValuesInstantType,
  isInstantPhase?: bool,
  trackCursorAxis?: rootTrackCursorAxis,
  disableHoverablePopup?: bool,
  openChangeReason?: Nullable.t<tooltipRootChangeEventReason>,
  closeDelay?: float,
}
type storeTooltipStoreSetStateConfig<'a> = {
  @as("open") open_: bool,
  mounted: bool,
  transitionStatus: PositionerSharedTypes.transitionStatus,
  floatingRootContext: floatingRootStore,
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
  instantType?: rootTooltipStoreUseSyncedValuesInstantType,
  isInstantPhase: bool,
  trackCursorAxis: rootTrackCursorAxis,
  disableHoverablePopup: bool,
  openChangeReason: Nullable.t<tooltipRootChangeEventReason>,
  closeDelay: float,
}
type tooltipStore<'a> = {
  setOpen: (bool, rootTooltipStoreSetOpenConfig) => unit,
  context: context4,
  controlledValues: string,
  selectors: string,
  useSyncedValue: (rootTooltipStoreUseSyncedValue, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: storeTooltipStoreUseSyncedValuesConfig<'a> => unit,
  useControlledProp: (rootTooltipStoreUseSyncedValue, string, string) => unit,
  set: (rootTooltipStoreUseSyncedValue, string) => unit,
  update: storeTooltipStoreUseSyncedValuesConfig<'a> => unit,
  setState: storeTooltipStoreSetStateConfig<'a> => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (bool, tooltipRootChangeEventDetails) => unit) => unit,
  useStateSetter: rootTooltipStoreUseSyncedValue => string => unit,
  observe: string,
  state: storeTooltipStoreSetStateConfig<'a>,
  listeners: string,
  updateTick: string,
  subscribe: storeTooltipStoreSetStateConfig<'a> => unit => unit => unit,
  getSnapshot: unit => storeTooltipStoreSetStateConfig<'a>,
  notifyAll: unit => unit,
}
type tooltipHandle<'a> = {
  store: tooltipStore<'a>,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
type tooltipStore2<'a> = {
  setOpen: (bool, rootTooltipStoreSetOpenConfig) => unit,
  context: context4,
  controlledValues: string,
  selectors: string,
  useSyncedValue: (TriggerTypes.triggerTooltipStoreUseSyncedValue, string) => unit,
  useSyncedValueWithCleanup: (string, string) => unit,
  useSyncedValues: storeTooltipStoreUseSyncedValuesConfig<'a> => unit,
  useControlledProp: (TriggerTypes.triggerTooltipStoreUseSyncedValue, string, string) => unit,
  set: (TriggerTypes.triggerTooltipStoreUseSyncedValue, string) => unit,
  update: storeTooltipStoreUseSyncedValuesConfig<'a> => unit,
  setState: storeTooltipStoreSetStateConfig<'a> => unit,
  select: (string, string) => string,
  useState: (string, string) => string,
  useContextCallback: (string, (bool, tooltipRootChangeEventDetails) => unit) => unit,
  useStateSetter: TriggerTypes.triggerTooltipStoreUseSyncedValue => string => unit,
  observe: string,
  state: storeTooltipStoreSetStateConfig<'a>,
  listeners: string,
  updateTick: string,
  subscribe: storeTooltipStoreSetStateConfig<'a> => unit => unit => unit,
  getSnapshot: unit => storeTooltipStoreSetStateConfig<'a>,
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
@unboxed type fieldRootStyle = Style(JsxDOM.style) | Fn(fieldRootState => JsxDOM.style)
@unboxed type fieldRootClassName = Str(string) | Fn(fieldRootState => string)
@unboxed type fieldsetRootStyle = Style(JsxDOM.style) | Fn(fieldsetRootState => JsxDOM.style)
@unboxed type fieldsetRootClassName = Str(string) | Fn(fieldsetRootState => string)
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
@unboxed type valueOrRootItemsConfigArray<'c> = Dict(Dict.t<React.element>) | RootItemsConfigArr(array<rootItemsConfig<'c>>)
@unboxed type sliderRootStyle = Style(JsxDOM.style) | Fn(sliderRootState => JsxDOM.style)
@unboxed type sliderRootClassName = Str(string) | Fn(sliderRootState => string)
@unboxed type tabsRootStyle = Style(JsxDOM.style) | Fn(tabsRootState => JsxDOM.style)
@unboxed type tabsRootClassName = Str(string) | Fn(tabsRootState => string)
@unboxed type toastRootStyle = Style(JsxDOM.style) | Fn(toastRootState => JsxDOM.style)
@unboxed type toastRootClassName = Str(string) | Fn(toastRootState => string)
@unboxed type toolbarRootStyle = Style(JsxDOM.style) | Fn(toolbarRootState => JsxDOM.style)
@unboxed type toolbarRootClassName = Str(string) | Fn(toolbarRootState => string)
