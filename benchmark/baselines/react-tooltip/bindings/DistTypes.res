type placesType =
  | @as("top") Top
  | @as("top-start") TopStart
  | @as("top-end") TopEnd
  | @as("right") Right
  | @as("right-start") RightStart
  | @as("right-end") RightEnd
  | @as("bottom") Bottom
  | @as("bottom-start") BottomStart
  | @as("bottom-end") BottomEnd
  | @as("left") Left
  | @as("left-start") LeftStart
  | @as("left-end") LeftEnd
type variantType =
  | @as("dark") Dark
  | @as("light") Light
  | @as("success") Success
  | @as("warning") Warning
  | @as("error") Error
  | @as("info") Info
type positionStrategy =
  | @as("absolute") Absolute
  | @as("fixed") Fixed
type renderConfig = {
  content: React.element,
  activeAnchor: Dom.element,
}
type globalCloseEvents = {
  escape?: bool,
  scroll?: bool,
  resize?: bool,
  clickOutsideAnchor?: bool,
}
type iPosition = {
  x: float,
  y: float,
}
