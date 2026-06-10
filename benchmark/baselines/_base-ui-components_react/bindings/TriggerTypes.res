type type_ =
  | @as("button") Button
  | @as("submit") Submit
  | @as("reset") Reset
type useSyncedValue5 =
  | @as("role") Role
  | @as("modal") Modal
  | @as("disablePointerDismissal") DisablePointerDismissal
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
  | @as("openMethod") OpenMethod
  | @as("nested") Nested
  | @as("nestedOpenDialogCount") NestedOpenDialogCount
  | @as("titleElementId") TitleElementId
  | @as("descriptionElementId") DescriptionElementId
  | @as("viewportElement") ViewportElement
type useSyncedValue7 =
  | @as("disabled") Disabled
  | @as("modal") Modal
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
type useSyncedValue9 =
  | @as("disabled") Disabled
  | @as("modal") Modal
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
  | @as("openMethod") OpenMethod
  | @as("nested") Nested
  | @as("titleElementId") TitleElementId
  | @as("descriptionElementId") DescriptionElementId
  | @as("openOnHover") OpenOnHover
  | @as("closeDelay") CloseDelay
  | @as("stickIfOpen") StickIfOpen
  | @as("instantType") InstantType
  | @as("openChangeReason") OpenChangeReason
type useSyncedValue11 =
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
  valid: bool,
  filled: bool,
  focused: bool,
}
type contextMenuTriggerState = {
  @as("open") open_: bool,
}
type selectTriggerState = {
  @as("open") open_: bool,
  readOnly: bool,
  value: string,
  disabled: bool,
  touched: bool,
  dirty: bool,
  valid: bool,
  filled: bool,
  focused: bool,
}
@unboxed type comboboxTriggerStyle = Style(JsxDOM.style) | Fn(comboboxTriggerState => JsxDOM.style)
@unboxed type comboboxTriggerClassName = Str(string) | Fn(comboboxTriggerState => string)
@unboxed type contextMenuTriggerStyle = Style(JsxDOM.style) | Fn(contextMenuTriggerState => JsxDOM.style)
@unboxed type contextMenuTriggerClassName = Str(string) | Fn(contextMenuTriggerState => string)
@unboxed type selectTriggerStyle = Style(JsxDOM.style) | Fn(selectTriggerState => JsxDOM.style)
@unboxed type selectTriggerClassName = Str(string) | Fn(selectTriggerState => string)
