type triggerType =
  | @as("button") Button
  | @as("reset") Reset
  | @as("submit") Submit
type triggerDialogStoreUseSyncedValue =
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
type triggerMenuStoreUseSyncedValue =
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
type triggerPopoverStoreUseSyncedValue =
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
type triggerTooltipStoreUseSyncedValue =
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
type comboboxTriggerState = {
  @as("open") open_: bool,
  disabled: bool,
  touched: bool,
  dirty: bool,
  valid: Nullable.t<bool>,
  filled: bool,
  focused: bool,
}
type contextMenuTriggerState = {
  @as("open") open_: bool,
}
type dialogTriggerState = {
  disabled: bool,
  @as("open") open_: bool,
}
type selectTriggerState = {
  @as("open") open_: bool,
  readOnly: bool,
  value: string,  // 🛑 BROKEN — contains `any`
  disabled: bool,
  touched: bool,
  dirty: bool,
  valid: Nullable.t<bool>,
  filled: bool,
  focused: bool,
}
@unboxed type comboboxTriggerStyle = Style(JsxDOM.style) | Fn(comboboxTriggerState => JsxDOM.style)
@unboxed type comboboxTriggerClassName = Str(string) | Fn(comboboxTriggerState => string)
@unboxed type contextMenuTriggerStyle = Style(JsxDOM.style) | Fn(contextMenuTriggerState => JsxDOM.style)
@unboxed type contextMenuTriggerClassName = Str(string) | Fn(contextMenuTriggerState => string)
@unboxed type dialogTriggerStyle = Style(JsxDOM.style) | Fn(dialogTriggerState => JsxDOM.style)
@unboxed type dialogTriggerClassName = Str(string) | Fn(dialogTriggerState => string)
@unboxed type selectTriggerStyle = Style(JsxDOM.style) | Fn(selectTriggerState => JsxDOM.style)
@unboxed type selectTriggerClassName = Str(string) | Fn(selectTriggerState => string)
