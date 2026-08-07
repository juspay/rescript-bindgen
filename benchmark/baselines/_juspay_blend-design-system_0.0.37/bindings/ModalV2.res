type props = {
  ...HtmlAttrs.htmlAttributesOmitChildrenClassNameStyleTitle,
  isOpen: bool,
  isCustom?: bool,
  onClose: unit => unit,
  title?: string,
  subtitle?: string,
  children: React.element,
  primaryAction?: ModalV2Types.modalV2ButtonAction,
  secondaryAction?: ModalV2Types.modalV2ButtonAction,
  showCloseButton?: bool,
  showHeader?: bool,
  showFooter?: bool,
  closeOnBackdropClick?: bool,
  customHeader?: React.element,
  customFooter?: React.element,
  headerSlot?: React.element,
  showDivider?: bool,
  dimensions?: ModalV2Types.modalV2Dimensions,
  useDrawerOnMobile?: bool,
  skeleton?: ModalV2Types.modalV2BodySkeletonProps,
  ref?: React.ref<Nullable.t<Dom.element>>,
}

@module("@juspay/blend-design-system")
external make: React.component<props> = "ModalV2"
