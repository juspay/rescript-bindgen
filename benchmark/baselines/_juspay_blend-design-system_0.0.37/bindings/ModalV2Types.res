type modalV2ModalV2TokensTypeOverlayConfig = {
  backgroundColor: string,
  offset: string,
}
type modalV2ModalV2TokensTypeHeaderSlotConfig = {
  gap: string,
}
type modalV2ModalV2TokensTypeHeaderTextTitleConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
}
type modalV2ModalV2TokensTypeHeaderTextConfig = {
  title: modalV2ModalV2TokensTypeHeaderTextTitleConfig,
  subtitle: modalV2ModalV2TokensTypeHeaderTextTitleConfig,
}
type modalV2ModalV2TokensTypeHeaderConfig = {
  gap: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  maxHeight: string,
  borderBottom: string,
  backgroundColor: string,
  borderTopLeftRadius: string,
  borderTopRightRadius: string,
  slot: modalV2ModalV2TokensTypeHeaderSlotConfig,
  text: modalV2ModalV2TokensTypeHeaderTextConfig,
}
type modalV2ModalV2TokensTypeDividerConfig = {
  borderColor: string,
}
type modalV2ModalV2TokensTypeSkeletonHeaderConfig = {
  gap: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  borderBottom: string,
  width: string,
  height: string,
  borderRadius: string,
}
type modalV2ModalV2TokensTypeSkeletonBodyConfig = {
  gap: string,
  width: string,
  height: string,
  borderRadius: string,
}
type modalV2ModalV2TokensTypeSkeletonConfig = {
  header: modalV2ModalV2TokensTypeSkeletonHeaderConfig,
  body: modalV2ModalV2TokensTypeSkeletonBodyConfig,
}
type modalV2ModalV2TokensTypeBodyConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  backgroundColor: string,
}
type modalV2ModalV2TokensTypeFooterConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  borderTop: string,
  backgroundColor: string,
  gap: string,
}
type modalV2ModalV2TokensTypeCloseButtonConfig = {
  color: string,
  width: string,
  height: string,
}
type modalV2TokensType = {
  boxShadow: string,
  borderRadius: string,
  overlay: modalV2ModalV2TokensTypeOverlayConfig,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  backgroundColor: string,
  header: modalV2ModalV2TokensTypeHeaderConfig,
  divider: modalV2ModalV2TokensTypeDividerConfig,
  skeleton: modalV2ModalV2TokensTypeSkeletonConfig,
  body: modalV2ModalV2TokensTypeBodyConfig,
  footer: modalV2ModalV2TokensTypeFooterConfig,
  closeButton: modalV2ModalV2TokensTypeCloseButtonConfig,
}
type responsiveModalV2Tokens = {
  sm: modalV2TokensType,
  lg: modalV2TokensType,
}
type modalV2ButtonAction = {
  width?: CommonTypes.stringOrNumber,
  size?: ButtonV2Types.buttonV2Size,
  minWidth?: CommonTypes.stringOrNumber,
  maxWidth?: CommonTypes.stringOrNumber,
  text?: string,
  leftSlot?: ButtonV2Types.buttonSlot,
  rightSlot?: ButtonV2Types.buttonSlot,
  skeleton?: ButtonV2Types.buttonSkeleton,
  buttonType?: ButtonV2Types.buttonV2Type,
  subType?: ButtonV2Types.buttonV2SubType,
  loading?: bool,
  state?: ButtonV2Types.buttonV2State,
}
type modalV2Dimensions = {
  width?: string,
  height?: string,
  minWidth?: string,
  maxWidth?: string,
  minHeight?: string,
  maxHeight?: string,
}
type bodySkeletonPropsModalV2 = {
  show?: bool,
  width?: string,
  height?: CommonTypes.stringOrNumber,
}
type modalV2BodySkeletonProps = {
  show?: bool,
  variant?: SkeletonTypes.skeletonVariant,
  bodySkeletonProps?: bodySkeletonPropsModalV2,
}
