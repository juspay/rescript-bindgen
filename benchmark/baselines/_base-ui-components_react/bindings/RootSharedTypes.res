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
  data?: string,  // 🛑 BROKEN — contains `unknown`
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
