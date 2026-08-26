@@warning("-30")

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
type rootDialogStoreUseSyncedValueWithCleanup =
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
type keysAllowingUndefinedOzc1l =
  | @as("open") Open
  | @as("domReferenceElement") DomReferenceElement
  | @as("referenceElement") ReferenceElement
  | @as("floatingElement") FloatingElement
  | @as("positionReference") PositionReference
  | @as("floatingId") FloatingId
type rootFloatingRootStoreSelect =
  | @as("open") Open
  | @as("domReferenceElement") DomReferenceElement
  | @as("referenceElement") ReferenceElement
  | @as("floatingElement") FloatingElement
  | @as("floatingId") FloatingId
type rootDialogStoreUseSyncedValuesRole =
  | @as("dialog") Dialog
  | @as("alertdialog") Alertdialog
type rootDialogStoreSelect =
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
  | @as("popupProps") PopupProps
  | @as("openMethod") OpenMethod
  | @as("nested") Nested
  | @as("nestedOpenDialogCount") NestedOpenDialogCount
  | @as("titleElementId") TitleElementId
  | @as("descriptionElementId") DescriptionElementId
  | @as("viewportElement") ViewportElement
  | @as("isTriggerActive") IsTriggerActive
  | @as("isOpenedByTrigger") IsOpenedByTrigger
  | @as("isMountedByTrigger") IsMountedByTrigger
  | @as("triggerProps") TriggerProps
type contextFunctionKeysV17tkj =
  | @as("onOpenChange") OnOpenChange
  | @as("onOpenChangeComplete") OnOpenChangeComplete
  | @as("onNestedDialogOpen") OnNestedDialogOpen
  | @as("onNestedDialogClose") OnNestedDialogClose
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
type imageLoadingStatusRoot =
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
type keysAllowingUndefinedN516p =
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
type menuRootOrientation =
  | @as("horizontal") Horizontal
  | @as("vertical") Vertical
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
type rootMenuStoreSelect =
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
  | @as("popupProps") PopupProps
  | @as("isTriggerActive") IsTriggerActive
  | @as("isOpenedByTrigger") IsOpenedByTrigger
  | @as("isMountedByTrigger") IsMountedByTrigger
  | @as("triggerProps") TriggerProps
  | @as("closeDelay") CloseDelay
  | @as("allowMouseEnter") AllowMouseEnter
  | @as("parent") Parent
  | @as("rootId") RootId
  | @as("activeIndex") ActiveIndex
  | @as("hoverEnabled") HoverEnabled
  | @as("stickIfOpen") StickIfOpen
  | @as("instantType") InstantType
  | @as("floatingTreeRoot") FloatingTreeRoot
  | @as("floatingNodeId") FloatingNodeId
  | @as("floatingParentNodeId") FloatingParentNodeId
  | @as("itemProps") ItemProps
  | @as("keyboardEventRelay") KeyboardEventRelay
  | @as("isActive") IsActive
  | @as("lastOpenChangeReason") LastOpenChangeReason
type contextFunctionKeysLup87 =
  | @as("onOpenChange") OnOpenChange
  | @as("onOpenChangeComplete") OnOpenChangeComplete
type rootMenuStoreUseSyncedValueWithCleanup =
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
type rootPopoverStoreUseSyncedValueWithCleanup =
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
type rootPopoverStoreSelect =
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
  | @as("popupProps") PopupProps
  | @as("openMethod") OpenMethod
  | @as("titleElementId") TitleElementId
  | @as("descriptionElementId") DescriptionElementId
  | @as("isTriggerActive") IsTriggerActive
  | @as("isOpenedByTrigger") IsOpenedByTrigger
  | @as("isMountedByTrigger") IsMountedByTrigger
  | @as("triggerProps") TriggerProps
  | @as("openOnHover") OpenOnHover
  | @as("closeDelay") CloseDelay
  | @as("stickIfOpen") StickIfOpen
  | @as("instantType") InstantType
  | @as("openChangeReason") OpenChangeReason
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
type rootTooltipStoreUseSyncedValueWithCleanup =
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
type rootTooltipStoreSelect =
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
  | @as("popupProps") PopupProps
  | @as("isTriggerActive") IsTriggerActive
  | @as("isOpenedByTrigger") IsOpenedByTrigger
  | @as("isMountedByTrigger") IsMountedByTrigger
  | @as("triggerProps") TriggerProps
  | @as("closeDelay") CloseDelay
  | @as("instantType") InstantType
  | @as("lastOpenChangeReason") LastOpenChangeReason
  | @as("isInstantPhase") IsInstantPhase
  | @as("trackCursorAxis") TrackCursorAxis
  | @as("disableHoverablePopup") DisableHoverablePopup
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
  value: array<string>,  // 🛑 BROKEN — contains `any`
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
type dialogRootActions = {
  unmount: unit => unit,
  close: unit => unit,
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
type contextZe4l1 = {
  triggerElements: PopupsTypes.popupTriggerMap,
  popupRef: React.ref<Nullable.t<Dom.element>>,
  onOpenChange?: (bool, alertDialogRootChangeEventDetails) => unit,
  onOpenChangeComplete?: bool => unit,
  backdropRef: React.ref<Nullable.t<Dom.htmlDivElement>>,
  internalBackdropRef: React.ref<Nullable.t<Dom.htmlDivElement>>,
  onNestedDialogOpen?: float => unit,
  onNestedDialogClose?: unit => unit,
}
type floatingEvents = {
  emit: (string, option<string>) => unit,  // ⚪ loose — was `T`
  on: (string, string => unit) => unit,  // ⚪ loose — was `any`
  off: (string, string => unit) => unit,  // ⚪ loose — was `any`
}
type floatingRootStoreContext = {
  onOpenChange?: (bool, PositionerSharedTypes.utilsFloatingRootStoreSetOpenConfig) => unit,
  dataRef: React.ref<Nullable.t<Dom.element>>,
  events: floatingEvents,
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
  useSyncedValue: (rootFloatingRootStoreUseSyncedValue, string) => unit,  // ⚠️ REVIEW — was `string | boolean | HTMLElement | ReferenceType` — match the real type by hand
  useSyncedValueWithCleanup: (keysAllowingUndefinedOzc1l, string) => unit,  // ⚪ loose — was `Readonly<FloatingRootState>[Key]`
  useSyncedValues: componentsFloatingRootStoreUseSyncedValuesConfig => unit,
  useControlledProp: (rootFloatingRootStoreUseSyncedValue, option<string>, string) => unit,  // ⚠️ REVIEW — was `string | boolean | HTMLElement | ReferenceType` — match the real type by hand
  set: (rootFloatingRootStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: componentsFloatingRootStoreUseSyncedValuesConfig => unit,
  setState: componentsFloatingRootStoreSetStateConfig => unit,
  select: (rootFloatingRootStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ open: (state: FloatingRootState) => boolean; domReferenceElement: (state: FloatingRootState) => E`
  useState: (rootFloatingRootStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ open: (state: FloatingRootState) => boolean; domReferenceElement: (state: FloatingRootState) => E`
  useContextCallback: ([#"onOpenChange"], option<(bool, PositionerSharedTypes.utilsFloatingRootStoreSetOpenConfig) => unit>) => unit,
  useStateSetter: rootFloatingRootStoreUseSyncedValue => string => unit,  // ⚪ loose — was `Value`
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: componentsFloatingRootStoreSetStateConfig,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: componentsFloatingRootStoreSetStateConfig => unit => unit => unit,
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
type dialogStoreV1cpzz<'a> = {
  setOpen: (bool, rootDialogStoreSetOpenConfig) => unit,
  context: contextZe4l1,
  controlledValues: string,  // 🛑 BROKEN — contains `any`
  selectors: string,  // 🛑 BROKEN — contains `any`
  useSyncedValue: (rootDialogStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  useSyncedValueWithCleanup: (rootDialogStoreUseSyncedValueWithCleanup, string) => unit,  // ⚪ loose — was `Readonly<State<Payload>>[Key]`
  useSyncedValues: storeDialogStoreUseSyncedValuesConfig<'a> => unit,
  useControlledProp: (rootDialogStoreUseSyncedValue, option<string>, string) => unit,  // 🛑 BROKEN — contains `unknown`
  set: (rootDialogStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: storeDialogStoreUseSyncedValuesConfig<'a> => unit,
  setState: storeDialogStoreSetStateConfig<'a> => unit,
  select: (rootDialogStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ modal: (state: State<unknown>) => boolean | "trap-focus"; nested: (state: State<unknown>) => bool`
  useState: (rootDialogStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ modal: (state: State<unknown>) => boolean | "trap-focus"; nested: (state: State<unknown>) => bool`
  useContextCallback: (contextFunctionKeysV17tkj, option<(string, alertDialogRootChangeEventDetails) => unit>) => unit,  // ⚪ loose — was `never`
  useStateSetter: rootDialogStoreUseSyncedValue => string => unit,  // 🛑 BROKEN — contains `unknown`
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: storeDialogStoreSetStateConfig<'a>,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: storeDialogStoreSetStateConfig<'a> => unit => unit => unit,
  getSnapshot: unit => storeDialogStoreSetStateConfig<'a>,
  notifyAll: unit => unit,
}
type dialogHandleV1kviv<'a> = {
  store: dialogStoreV1cpzz<'a>,
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
type autocompleteRootActions = {
  unmount: unit => unit,
}
type highlightEventDetails = {
  reason: rootHighlightEventDetailsReason,
  event: Dom.event,
  index: int,
}
type avatarRootState = {
  imageLoadingStatus: imageLoadingStatusRoot,
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
type contextV767qg = {
  triggerElements: PopupsTypes.popupTriggerMap,
  popupRef: React.ref<Nullable.t<Dom.element>>,
  onOpenChange?: (bool, menuRootChangeEventDetails) => unit,
  onOpenChangeComplete?: bool => unit,
  positionerRef: React.ref<Nullable.t<Dom.element>>,
  typingRef: React.ref<Nullable.t<Dom.element>>,
  itemDomElements: React.ref<Nullable.t<array<Dom.element>>>,
  itemLabels: React.ref<Nullable.t<array<string>>>,
  allowMouseUpTriggerRef: React.ref<Nullable.t<Dom.element>>,
  triggerFocusTargetRef: React.ref<Nullable.t<Dom.element>>,
  beforeContentFocusGuardRef: React.ref<Nullable.t<Dom.element>>,
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
type rootMenuStoreUseSyncedValuesParentConfigV12o4e = {
  @as("type") type_: [#"menubar"],
  context: menubarContext,
}
type __typeF6ioq = {
  getBoundingClientRect: unit => LibTypes.event,
}
@unboxed type typeSetAnchor = Type(__typeF6ioq) | Fn(__typeF6ioq => __typeF6ioq)
type contextMenuRootContext = {
  anchor: __typeF6ioq,
  setAnchor: typeSetAnchor => unit,
  backdropRef: string,  // ⚪ loose — was `RefObject<HTMLDivElement>`
  internalBackdropRef: string,  // ⚪ loose — was `RefObject<HTMLDivElement>`
  actionsRef: ReactTypes.refObject,
  positionerRef: string,  // ⚪ loose — was `RefObject<HTMLElement>`
  allowMouseUpTriggerRef: ReactTypes.refObject,
  initialCursorPointRef: ReactTypes.refObject,
  rootId?: string,
}
type rootMenuStoreUseSyncedValuesParentConfigV4ouqf = {
  @as("type") type_: [#"context-menu"],
  context: contextMenuRootContext,
}
type __typeV104c1 = {
  @as("type") type_: unit,
}
type extendedRefs = {
  reference: React.ref<Nullable.t<Dom.element>>,
  floating: React.ref<Nullable.t<Dom.element>>,
  domReference: React.ref<Nullable.t<Dom.element>>,
  setReference: DistTypes.ReferenceType.t => unit,
  setFloating: Nullable.t<Dom.element> => unit,
  setPositionReference: DistTypes.ReferenceType.t => unit,
}
type extendedElements = {
  reference: DistTypes.ReferenceType.t,
  floating: Nullable.t<Dom.element>,
  domReference: Nullable.t<Dom.element>,
}
type rec contextData = {
  openEvent?: Dom.event,
  floatingContext?: floatingContext,
  typing?: bool,
}
and floatingContext = {
  x: float,
  y: float,
  placement: DistTypes.placement,
  strategy: DistTypes.strategy,
  middlewareData: string,  // ⚪ loose — was `MiddlewareData`
  isPositioned: bool,
  update: unit => unit,
  floatingStyles: JsxDOM.style,
  @as("open") open_: bool,
  onOpenChange: (bool, PositionerSharedTypes.utilsFloatingRootStoreSetOpenConfig) => unit,
  events: floatingEvents,
  dataRef: React.ref<Nullable.t<contextData>>,
  nodeId?: string,
  floatingId?: string,
  refs: extendedRefs,
  elements: extendedElements,
  rootStore: floatingRootStore,
}
@set_index external contextDataSet: (contextData, string, JSON.t) => unit = ""
type floatingNodeType = {
  id?: string,
  parentId: Nullable.t<string>,
  context?: floatingContext,
}
type floatingTreeStore = {
  nodesRef: React.ref<Nullable.t<Dom.element>>,
  events: floatingEvents,
  addNode: floatingNodeType => unit,
  removeNode: floatingNodeType => unit,
}
type menuParent_t
type rec storeMenuStoreSetStateConfigEdk0j = {
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
  parent: menuParent_t,
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
and menuRootContext = {
  store: menuStoreV17hkr,
  parent: menuParent_t,
}
and rootMenuStoreUseSyncedValuesParentConfigV11pte = {
  @as("type") type_: [#"nested-context-menu"],
  context: contextMenuRootContext,
  menuContext: menuRootContext,
}
and rootMenuStoreUseSyncedValuesParentConfigV1xv8m = {
  @as("type") type_: [#"menu"],
  store: menuStoreV17hkr,
}
and storeMenuStoreUseSyncedValuesConfigV15w22 = {
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
  parent?: menuParent_t,
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
and menuStoreV17hkr = {
  setOpen: (bool, contextMenuRootChangeEventDetails) => unit,
  unsubscribeParentListener: string,  // 🛑 BROKEN — contains `any`
  context: contextV767qg,
  controlledValues: string,  // 🛑 BROKEN — contains `any`
  selectors: string,  // 🛑 BROKEN — contains `any`
  useSyncedValue: (rootMenuStoreUseSyncedValue, JSON.t) => unit,
  useSyncedValueWithCleanup: (keysAllowingUndefinedN516p, string) => unit,  // ⚪ loose — was `Readonly<State<unknown>>[Key]`
  useSyncedValues: storeMenuStoreUseSyncedValuesConfigV15w22 => unit,
  useControlledProp: (rootMenuStoreUseSyncedValue, option<JSON.t>, JSON.t) => unit,
  set: (rootMenuStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: storeMenuStoreUseSyncedValuesConfigV15w22 => unit,
  setState: storeMenuStoreSetStateConfigEdk0j => unit,
  select: (rootMenuStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; modal: (state: State<unknown>) => boolean; allowMou`
  useState: (rootMenuStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; modal: (state: State<unknown>) => boolean; allowMou`
  useContextCallback: (contextFunctionKeysLup87, option<(bool, menuRootChangeEventDetails) => unit>) => unit,
  useStateSetter: rootMenuStoreUseSyncedValue => JSON.t => unit,
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: storeMenuStoreSetStateConfigEdk0j,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: storeMenuStoreSetStateConfigEdk0j => unit => unit => unit,
  getSnapshot: unit => storeMenuStoreSetStateConfigEdk0j,
  notifyAll: unit => unit,
}
module MenuParent = {
  type t = menuParent_t
  external fromRootMenuStoreUseSyncedValuesParentConfig: rootMenuStoreUseSyncedValuesParentConfigV1xv8m => t = "%identity"
  external asRootMenuStoreUseSyncedValuesParentConfig: t => (rootMenuStoreUseSyncedValuesParentConfigV1xv8m) = "%identity"
  external fromRootMenuStoreUseSyncedValuesParentConfig2: rootMenuStoreUseSyncedValuesParentConfigV12o4e => t = "%identity"
  external asRootMenuStoreUseSyncedValuesParentConfig2: t => (rootMenuStoreUseSyncedValuesParentConfigV12o4e) = "%identity"
  external fromRootMenuStoreUseSyncedValuesParentConfig3: rootMenuStoreUseSyncedValuesParentConfigV4ouqf => t = "%identity"
  external asRootMenuStoreUseSyncedValuesParentConfig3: t => (rootMenuStoreUseSyncedValuesParentConfigV4ouqf) = "%identity"
  external fromRootMenuStoreUseSyncedValuesParentConfig4: rootMenuStoreUseSyncedValuesParentConfigV11pte => t = "%identity"
  external asRootMenuStoreUseSyncedValuesParentConfig4: t => (rootMenuStoreUseSyncedValuesParentConfigV11pte) = "%identity"
  external fromType2: __typeV104c1 => t = "%identity"
  external asType2: t => (__typeV104c1) = "%identity"
}
type menuHandleV1vz2h = {
  store: menuStoreV17hkr,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
type dialogStoreV1cpzz2<'a> = {
  setOpen: (bool, rootDialogStoreSetOpenConfig) => unit,
  context: contextZe4l1,
  controlledValues: string,  // 🛑 BROKEN — contains `any`
  selectors: string,  // 🛑 BROKEN — contains `any`
  useSyncedValue: (rootDialogStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  useSyncedValueWithCleanup: (rootDialogStoreUseSyncedValueWithCleanup, string) => unit,  // ⚪ loose — was `Readonly<State<Payload>>[Key]`
  useSyncedValues: storeDialogStoreUseSyncedValuesConfig<'a> => unit,
  useControlledProp: (rootDialogStoreUseSyncedValue, option<string>, string) => unit,  // 🛑 BROKEN — contains `unknown`
  set: (rootDialogStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: storeDialogStoreUseSyncedValuesConfig<'a> => unit,
  setState: storeDialogStoreSetStateConfig<'a> => unit,
  select: (rootDialogStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ modal: (state: State<unknown>) => boolean | "trap-focus"; nested: (state: State<unknown>) => bool`
  useState: (rootDialogStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ modal: (state: State<unknown>) => boolean | "trap-focus"; nested: (state: State<unknown>) => bool`
  useContextCallback: (contextFunctionKeysV17tkj, option<(string, alertDialogRootChangeEventDetails) => unit>) => unit,  // ⚪ loose — was `never`
  useStateSetter: rootDialogStoreUseSyncedValue => string => unit,  // 🛑 BROKEN — contains `unknown`
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: storeDialogStoreSetStateConfig<'a>,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: storeDialogStoreSetStateConfig<'a> => unit => unit => unit,
  getSnapshot: unit => storeDialogStoreSetStateConfig<'a>,
  notifyAll: unit => unit,
}
type dialogHandleV1kviv2<'a> = {
  store: dialogStoreV1cpzz2<'a>,
  @as("open") open_: Nullable.t<string> => unit,
  openWithPayload: 'a => unit,
  close: unit => unit,
  isOpen: bool,
}
type dialogStoreV9tmgy<'a> = {
  setOpen: (bool, rootDialogStoreSetOpenConfig) => unit,
  context: contextZe4l1,
  controlledValues: string,  // 🛑 BROKEN — contains `any`
  selectors: string,  // 🛑 BROKEN — contains `any`
  useSyncedValue: (TriggerTypes.triggerDialogStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  useSyncedValueWithCleanup: (rootDialogStoreUseSyncedValueWithCleanup, string) => unit,  // ⚪ loose — was `Readonly<State<Payload>>[Key]`
  useSyncedValues: storeDialogStoreUseSyncedValuesConfig<'a> => unit,
  useControlledProp: (TriggerTypes.triggerDialogStoreUseSyncedValue, option<string>, string) => unit,  // 🛑 BROKEN — contains `unknown`
  set: (TriggerTypes.triggerDialogStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: storeDialogStoreUseSyncedValuesConfig<'a> => unit,
  setState: storeDialogStoreSetStateConfig<'a> => unit,
  select: (rootDialogStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ modal: (state: State<unknown>) => boolean | "trap-focus"; nested: (state: State<unknown>) => bool`
  useState: (rootDialogStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ modal: (state: State<unknown>) => boolean | "trap-focus"; nested: (state: State<unknown>) => bool`
  useContextCallback: (contextFunctionKeysV17tkj, option<(string, alertDialogRootChangeEventDetails) => unit>) => unit,  // ⚪ loose — was `never`
  useStateSetter: TriggerTypes.triggerDialogStoreUseSyncedValue => string => unit,  // 🛑 BROKEN — contains `unknown`
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: storeDialogStoreSetStateConfig<'a>,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: storeDialogStoreSetStateConfig<'a> => unit => unit => unit,
  getSnapshot: unit => storeDialogStoreSetStateConfig<'a>,
  notifyAll: unit => unit,
}
type dialogHandleV1c7wn<'a> = {
  store: dialogStoreV9tmgy<'a>,
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
type storeMenuStoreUseSyncedValuesConfigV1jkd8<'a> = {
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
  parent?: MenuParent.t,
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
type storeMenuStoreSetStateConfigRz1we<'a> = {
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
  parent: MenuParent.t,
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
type menuStoreV15aym<'a> = {
  setOpen: (bool, contextMenuRootChangeEventDetails) => unit,
  unsubscribeParentListener: string,  // 🛑 BROKEN — contains `any`
  context: contextV767qg,
  controlledValues: string,  // 🛑 BROKEN — contains `any`
  selectors: string,  // 🛑 BROKEN — contains `any`
  useSyncedValue: (rootMenuStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  useSyncedValueWithCleanup: (rootMenuStoreUseSyncedValueWithCleanup, string) => unit,  // ⚪ loose — was `Readonly<State<Payload>>[Key]`
  useSyncedValues: storeMenuStoreUseSyncedValuesConfigV1jkd8<'a> => unit,
  useControlledProp: (rootMenuStoreUseSyncedValue, option<string>, string) => unit,  // 🛑 BROKEN — contains `unknown`
  set: (rootMenuStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: storeMenuStoreUseSyncedValuesConfigV1jkd8<'a> => unit,
  setState: storeMenuStoreSetStateConfigRz1we<'a> => unit,
  select: (rootMenuStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; modal: (state: State<unknown>) => boolean; allowMou`
  useState: (rootMenuStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; modal: (state: State<unknown>) => boolean; allowMou`
  useContextCallback: (contextFunctionKeysLup87, option<(bool, menuRootChangeEventDetails) => unit>) => unit,
  useStateSetter: rootMenuStoreUseSyncedValue => string => unit,  // 🛑 BROKEN — contains `unknown`
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: storeMenuStoreSetStateConfigRz1we<'a>,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: storeMenuStoreSetStateConfigRz1we<'a> => unit => unit => unit,
  getSnapshot: unit => storeMenuStoreSetStateConfigRz1we<'a>,
  notifyAll: unit => unit,
}
type menuHandleV1grop<'a> = {
  store: menuStoreV15aym<'a>,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
type menuStoreCmh23<'a> = {
  setOpen: (bool, contextMenuRootChangeEventDetails) => unit,
  unsubscribeParentListener: string,  // 🛑 BROKEN — contains `any`
  context: contextV767qg,
  controlledValues: string,  // 🛑 BROKEN — contains `any`
  selectors: string,  // 🛑 BROKEN — contains `any`
  useSyncedValue: (TriggerTypes.triggerMenuStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  useSyncedValueWithCleanup: (rootMenuStoreUseSyncedValueWithCleanup, string) => unit,  // ⚪ loose — was `Readonly<State<Payload>>[Key]`
  useSyncedValues: storeMenuStoreUseSyncedValuesConfigV1jkd8<'a> => unit,
  useControlledProp: (TriggerTypes.triggerMenuStoreUseSyncedValue, option<string>, string) => unit,  // 🛑 BROKEN — contains `unknown`
  set: (TriggerTypes.triggerMenuStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: storeMenuStoreUseSyncedValuesConfigV1jkd8<'a> => unit,
  setState: storeMenuStoreSetStateConfigRz1we<'a> => unit,
  select: (rootMenuStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; modal: (state: State<unknown>) => boolean; allowMou`
  useState: (rootMenuStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; modal: (state: State<unknown>) => boolean; allowMou`
  useContextCallback: (contextFunctionKeysLup87, option<(bool, menuRootChangeEventDetails) => unit>) => unit,
  useStateSetter: TriggerTypes.triggerMenuStoreUseSyncedValue => string => unit,  // 🛑 BROKEN — contains `unknown`
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: storeMenuStoreSetStateConfigRz1we<'a>,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: storeMenuStoreSetStateConfigRz1we<'a> => unit => unit => unit,
  getSnapshot: unit => storeMenuStoreSetStateConfigRz1we<'a>,
  notifyAll: unit => unit,
}
type menuHandleRikds<'a> = {
  store: menuStoreCmh23<'a>,
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
type contextO5g1z = {
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
type popoverStoreV18r19<'a> = {
  setOpen: (bool, rootPopoverStoreSetOpenConfig) => unit,
  disposeEffect: string,  // 🛑 BROKEN — contains `any`
  context: contextO5g1z,
  controlledValues: string,  // 🛑 BROKEN — contains `any`
  selectors: string,  // 🛑 BROKEN — contains `any`
  useSyncedValue: (rootPopoverStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  useSyncedValueWithCleanup: (rootPopoverStoreUseSyncedValueWithCleanup, string) => unit,  // ⚪ loose — was `Readonly<State<Payload>>[Key]`
  useSyncedValues: storePopoverStoreUseSyncedValuesConfig<'a> => unit,
  useControlledProp: (rootPopoverStoreUseSyncedValue, option<string>, string) => unit,  // 🛑 BROKEN — contains `unknown`
  set: (rootPopoverStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: storePopoverStoreUseSyncedValuesConfig<'a> => unit,
  setState: storePopoverStoreSetStateConfig<'a> => unit,
  select: (rootPopoverStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; instantType: (state: State<unknown>) => "click" | "`
  useState: (rootPopoverStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; instantType: (state: State<unknown>) => "click" | "`
  useContextCallback: (contextFunctionKeysLup87, option<(bool, popoverRootChangeEventDetails) => unit>) => unit,
  useStateSetter: rootPopoverStoreUseSyncedValue => string => unit,  // 🛑 BROKEN — contains `unknown`
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: storePopoverStoreSetStateConfig<'a>,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: storePopoverStoreSetStateConfig<'a> => unit => unit => unit,
  getSnapshot: unit => storePopoverStoreSetStateConfig<'a>,
  notifyAll: unit => unit,
}
type popoverHandleV1evpk<'a> = {
  store: popoverStoreV18r19<'a>,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
type popoverStoreNxgp0<'a> = {
  setOpen: (bool, rootPopoverStoreSetOpenConfig) => unit,
  disposeEffect: string,  // 🛑 BROKEN — contains `any`
  context: contextO5g1z,
  controlledValues: string,  // 🛑 BROKEN — contains `any`
  selectors: string,  // 🛑 BROKEN — contains `any`
  useSyncedValue: (TriggerTypes.triggerPopoverStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  useSyncedValueWithCleanup: (rootPopoverStoreUseSyncedValueWithCleanup, string) => unit,  // ⚪ loose — was `Readonly<State<Payload>>[Key]`
  useSyncedValues: storePopoverStoreUseSyncedValuesConfig<'a> => unit,
  useControlledProp: (TriggerTypes.triggerPopoverStoreUseSyncedValue, option<string>, string) => unit,  // 🛑 BROKEN — contains `unknown`
  set: (TriggerTypes.triggerPopoverStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: storePopoverStoreUseSyncedValuesConfig<'a> => unit,
  setState: storePopoverStoreSetStateConfig<'a> => unit,
  select: (rootPopoverStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; instantType: (state: State<unknown>) => "click" | "`
  useState: (rootPopoverStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; instantType: (state: State<unknown>) => "click" | "`
  useContextCallback: (contextFunctionKeysLup87, option<(bool, popoverRootChangeEventDetails) => unit>) => unit,
  useStateSetter: TriggerTypes.triggerPopoverStoreUseSyncedValue => string => unit,  // 🛑 BROKEN — contains `unknown`
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: storePopoverStoreSetStateConfig<'a>,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: storePopoverStoreSetStateConfig<'a> => unit => unit => unit,
  getSnapshot: unit => storePopoverStoreSetStateConfig<'a>,
  notifyAll: unit => unit,
}
type popoverHandleFukmt<'a> = {
  store: popoverStoreNxgp0<'a>,
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
  collisionPadding?: string,  // ⚪ loose — was `Padding`
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
  actionProps?: string,  // ⚪ loose — was `Omit<DetailedHTMLProps<ButtonHTMLAttributes<HTMLButtonElement>, HTMLButtonElement>, "ref">`
  positionerProps?: toastManagerPositionerProps,
  data?: string,  // 🛑 BROKEN — contains `any`
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
  options: string,  // 🛑 BROKEN — contains `any`
}
type toastManagerAddOptions = {
  id?: string,
  data?: JSON.t,
  title?: React.element,
  @as("type") type_?: string,
  transitionStatus?: rootToastRootToastObjectTransitionStatus,
  description?: React.element,
  timeout?: float,
  priority?: rootToastRootToastObjectPriority,
  onClose?: unit => unit,
  onRemove?: unit => unit,
  actionProps?: string,  // ⚪ loose — was `Omit<DetailedHTMLProps<ButtonHTMLAttributes<HTMLButtonElement>, HTMLButtonElement>, "ref">`
  positionerProps?: toastManagerPositionerProps,
}
type toastManagerPromiseOptions = {
  loading: string,  // ⚠️ REVIEW — was `string | ToastManagerUpdateOptions<Data>` — match the real type by hand
  success: string,  // ⚠️ REVIEW — was `string | ToastManagerUpdateOptions<Data> | ((result: Value) => string | ToastManagerUpdateOptions<Data>)` — match the real type by hand
  error: string,  // ⚠️ REVIEW — was `string | ToastManagerUpdateOptions<Data> | ((error: any) => string | ToastManagerUpdateOptions<Data>)` — match the real type by hand
}
type toastManager = {
  @as(" subscribe") _subscribe: toastManagerEvent => unit => unit => unit,
  add: toastManagerAddOptions => string,
  close: string => unit,
  update: (string, toastManagerAddOptions) => unit,
  promise: (promise<string>, toastManagerPromiseOptions) => promise<string>,  // 🛑 BROKEN — contains `unknown`
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
  actionProps?: string,  // ⚪ loose — was `Omit<DetailedHTMLProps<ButtonHTMLAttributes<HTMLButtonElement>, HTMLButtonElement>, "ref">`
  positionerProps?: toastManagerPositionerProps,
  data?: string,  // 🛑 BROKEN — contains `any`
}
type useToastManagerReturnValue = {
  toasts: array<toastObject>,
  add: toastManagerAddOptions => string,
  close: string => unit,
  update: (string, toastManagerAddOptions) => unit,
  promise: (promise<string>, toastManagerPromiseOptions) => promise<string>,  // 🛑 BROKEN — contains `unknown`
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
type contextV1ctw4 = {
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
type tooltipStoreLyqeh<'a> = {
  setOpen: (bool, rootTooltipStoreSetOpenConfig) => unit,
  context: contextV1ctw4,
  controlledValues: string,  // 🛑 BROKEN — contains `any`
  selectors: string,  // 🛑 BROKEN — contains `any`
  useSyncedValue: (rootTooltipStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  useSyncedValueWithCleanup: (rootTooltipStoreUseSyncedValueWithCleanup, string) => unit,  // ⚪ loose — was `Readonly<State<Payload>>[Key]`
  useSyncedValues: storeTooltipStoreUseSyncedValuesConfig<'a> => unit,
  useControlledProp: (rootTooltipStoreUseSyncedValue, option<string>, string) => unit,  // 🛑 BROKEN — contains `unknown`
  set: (rootTooltipStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: storeTooltipStoreUseSyncedValuesConfig<'a> => unit,
  setState: storeTooltipStoreSetStateConfig<'a> => unit,
  select: (rootTooltipStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; instantType: (state: State<unknown>) => "focus" | "`
  useState: (rootTooltipStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; instantType: (state: State<unknown>) => "focus" | "`
  useContextCallback: (contextFunctionKeysLup87, option<(bool, tooltipRootChangeEventDetails) => unit>) => unit,
  useStateSetter: rootTooltipStoreUseSyncedValue => string => unit,  // 🛑 BROKEN — contains `unknown`
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: storeTooltipStoreSetStateConfig<'a>,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: storeTooltipStoreSetStateConfig<'a> => unit => unit => unit,
  getSnapshot: unit => storeTooltipStoreSetStateConfig<'a>,
  notifyAll: unit => unit,
}
type tooltipHandleBiyhb<'a> = {
  store: tooltipStoreLyqeh<'a>,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
type tooltipStoreV17v53<'a> = {
  setOpen: (bool, rootTooltipStoreSetOpenConfig) => unit,
  context: contextV1ctw4,
  controlledValues: string,  // 🛑 BROKEN — contains `any`
  selectors: string,  // 🛑 BROKEN — contains `any`
  useSyncedValue: (TriggerTypes.triggerTooltipStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  useSyncedValueWithCleanup: (rootTooltipStoreUseSyncedValueWithCleanup, string) => unit,  // ⚪ loose — was `Readonly<State<Payload>>[Key]`
  useSyncedValues: storeTooltipStoreUseSyncedValuesConfig<'a> => unit,
  useControlledProp: (TriggerTypes.triggerTooltipStoreUseSyncedValue, option<string>, string) => unit,  // 🛑 BROKEN — contains `unknown`
  set: (TriggerTypes.triggerTooltipStoreUseSyncedValue, string) => unit,  // 🛑 BROKEN — contains `unknown`
  update: storeTooltipStoreUseSyncedValuesConfig<'a> => unit,
  setState: storeTooltipStoreSetStateConfig<'a> => unit,
  select: (rootTooltipStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; instantType: (state: State<unknown>) => "focus" | "`
  useState: (rootTooltipStoreSelect, string) => string,  // ⚪ loose — was `ReturnType<{ disabled: (state: State<unknown>) => boolean; instantType: (state: State<unknown>) => "focus" | "`
  useContextCallback: (contextFunctionKeysLup87, option<(bool, tooltipRootChangeEventDetails) => unit>) => unit,
  useStateSetter: TriggerTypes.triggerTooltipStoreUseSyncedValue => string => unit,  // 🛑 BROKEN — contains `unknown`
  observe: string,  // ⚠️ REVIEW — match the real type by hand
  state: storeTooltipStoreSetStateConfig<'a>,
  listeners: string,  // 🛑 BROKEN — contains `any`
  updateTick: string,  // 🛑 BROKEN — contains `any`
  subscribe: storeTooltipStoreSetStateConfig<'a> => unit => unit => unit,
  getSnapshot: unit => storeTooltipStoreSetStateConfig<'a>,
  notifyAll: unit => unit,
}
type tooltipHandleV1u90t<'a> = {
  store: tooltipStoreV17v53<'a>,
  @as("open") open_: string => unit,
  close: unit => unit,
  isOpen: bool,
}
@unboxed type accordionRootStyle = Style(JsxDOM.style) | Fn(accordionRootState => option<JsxDOM.style>)
@unboxed type accordionRootClassName = Str(string) | Fn(accordionRootState => option<string>)
@unboxed type avatarRootStyle = Style(JsxDOM.style) | Fn(avatarRootState => option<JsxDOM.style>)
@unboxed type avatarRootClassName = Str(string) | Fn(avatarRootState => option<string>)
@unboxed type checkboxRootClassName = Str(string) | Fn(checkboxRootState => option<string>)
@unboxed type checkboxRootStyle = Style(JsxDOM.style) | Fn(checkboxRootState => option<JsxDOM.style>)
@unboxed type collapsibleRootStyle = Style(JsxDOM.style) | Fn(collapsibleRootState => option<JsxDOM.style>)
@unboxed type collapsibleRootClassName = Str(string) | Fn(collapsibleRootState => option<string>)
@unboxed type fieldRootStyle = Style(JsxDOM.style) | Fn(fieldRootState => option<JsxDOM.style>)
@unboxed type fieldRootClassName = Str(string) | Fn(fieldRootState => option<string>)
@unboxed type fieldsetRootStyle = Style(JsxDOM.style) | Fn(fieldsetRootState => option<JsxDOM.style>)
@unboxed type fieldsetRootClassName = Str(string) | Fn(fieldsetRootState => option<string>)
@unboxed type menubarStyle = Style(JsxDOM.style) | Fn(menubarState => option<JsxDOM.style>)
@unboxed type menubarClassName = Str(string) | Fn(menubarState => option<string>)
@unboxed type navigationMenuRootStyle = Style(JsxDOM.style) | Fn(navigationMenuRootState => option<JsxDOM.style>)
@unboxed type navigationMenuRootClassName = Str(string) | Fn(navigationMenuRootState => option<string>)
@unboxed type numberFieldRootClassName = Str(string) | Fn(numberFieldRootState => option<string>)
@unboxed type numberFieldRootStyle = Style(JsxDOM.style) | Fn(numberFieldRootState => option<JsxDOM.style>)
@unboxed type progressRootStyle = Style(JsxDOM.style) | Fn(progressRootState => option<JsxDOM.style>)
@unboxed type progressRootClassName = Str(string) | Fn(progressRootState => option<string>)
@unboxed type radioRootClassName = Str(string) | Fn(radioRootState => option<string>)
@unboxed type radioRootStyle = Style(JsxDOM.style) | Fn(radioRootState => option<JsxDOM.style>)
@unboxed type scrollAreaRootStyle = Style(JsxDOM.style) | Fn(scrollAreaRootState => option<JsxDOM.style>)
@unboxed type scrollAreaRootClassName = Str(string) | Fn(scrollAreaRootState => option<string>)
@unboxed type valueOrRootItemsConfigArray<'c> = Dict(Dict.t<React.element>) | RootItemsConfigArr(array<rootItemsConfig<'c>>)
@unboxed type sliderRootStyle = Style(JsxDOM.style) | Fn(sliderRootState => option<JsxDOM.style>)
@unboxed type sliderRootClassName = Str(string) | Fn(sliderRootState => option<string>)
@unboxed type tabsRootStyle = Style(JsxDOM.style) | Fn(tabsRootState => option<JsxDOM.style>)
@unboxed type tabsRootClassName = Str(string) | Fn(tabsRootState => option<string>)
@unboxed type toastRootStyle = Style(JsxDOM.style) | Fn(toastRootState => option<JsxDOM.style>)
@unboxed type toastRootClassName = Str(string) | Fn(toastRootState => option<string>)
@unboxed type toolbarRootStyle = Style(JsxDOM.style) | Fn(toolbarRootState => option<JsxDOM.style>)
@unboxed type toolbarRootClassName = Str(string) | Fn(toolbarRootState => option<string>)
