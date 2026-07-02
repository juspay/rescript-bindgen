type recordHtmlCollisionItemDataSize =
  | @as("sm") Sm
  | @as("lg") Lg
type itemData = {
  id: CommonTypes.stringOrNumber,
  size?: recordHtmlCollisionItemDataSize,
  label: string,
}
