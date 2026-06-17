type size =
  | @as("sm") Sm
  | @as("lg") Lg
type itemData = {
  id: CommonTypes.stringOrNumber,
  size?: size,
  label: string,
}
