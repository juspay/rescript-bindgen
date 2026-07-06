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
  | @as("fixed") Fixed
  | @as("absolute") Absolute
type distRenderConfig = {
  content: React.element,
  activeAnchor: Nullable.t<Dom.element>,
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
type tooltipImperativeOpenOptions = {
  anchorSelect?: string,
  position?: iPosition,
  place?: placesType,
  content?: React.element,
  delay?: float,
}
type tooltipImperativeCloseOptions = {
  delay?: float,
}
type tooltipRefProps = {
  @as("open") open_: option<tooltipImperativeOpenOptions> => unit,
  close: option<tooltipImperativeCloseOptions> => unit,
  activeAnchor: Nullable.t<Dom.element>,
  place: placesType,
  isOpen: bool,
}
module WrapperType = {
  type t
  external fromTag: [#"symbol" | #"object" | #"map" | #"filter" | #"a" | #"abbr" | #"address" | #"area" | #"article" | #"aside" | #"audio" | #"b" | #"base" | #"bdi" | #"bdo" | #"big" | #"blockquote" | #"body" | #"br" | #"button" | #"canvas" | #"caption" | #"center" | #"cite" | #"code" | #"col" | #"colgroup" | #"data" | #"datalist" | #"dd" | #"del" | #"details" | #"dfn" | #"dialog" | #"div" | #"dl" | #"dt" | #"em" | #"embed" | #"fieldset" | #"figcaption" | #"figure" | #"footer" | #"form" | #"h1" | #"h2" | #"h3" | #"h4" | #"h5" | #"h6" | #"head" | #"header" | #"hgroup" | #"hr" | #"html" | #"i" | #"iframe" | #"img" | #"input" | #"ins" | #"kbd" | #"keygen" | #"label" | #"legend" | #"li" | #"link" | #"main" | #"mark" | #"menu" | #"menuitem" | #"meta" | #"meter" | #"nav" | #"noindex" | #"noscript" | #"ol" | #"optgroup" | #"option" | #"output" | #"p" | #"param" | #"picture" | #"pre" | #"progress" | #"q" | #"rp" | #"rt" | #"ruby" | #"s" | #"samp" | #"search" | #"slot" | #"script" | #"section" | #"select" | #"small" | #"source" | #"span" | #"strong" | #"style" | #"sub" | #"summary" | #"sup" | #"table" | #"template" | #"tbody" | #"td" | #"textarea" | #"tfoot" | #"th" | #"thead" | #"time" | #"title" | #"tr" | #"track" | #"u" | #"ul" | #"var" | #"video" | #"wbr" | #"webview" | #"svg" | #"animate" | #"animateMotion" | #"animateTransform" | #"circle" | #"clipPath" | #"defs" | #"desc" | #"ellipse" | #"feBlend" | #"feColorMatrix" | #"feComponentTransfer" | #"feComposite" | #"feConvolveMatrix" | #"feDiffuseLighting" | #"feDisplacementMap" | #"feDistantLight" | #"feDropShadow" | #"feFlood" | #"feFuncA" | #"feFuncB" | #"feFuncG" | #"feFuncR" | #"feGaussianBlur" | #"feImage" | #"feMerge" | #"feMergeNode" | #"feMorphology" | #"feOffset" | #"fePointLight" | #"feSpecularLighting" | #"feSpotLight" | #"feTile" | #"feTurbulence" | #"foreignObject" | #"g" | #"image" | #"line" | #"linearGradient" | #"marker" | #"mask" | #"metadata" | #"mpath" | #"path" | #"pattern" | #"polygon" | #"polyline" | #"radialGradient" | #"rect" | #"set" | #"stop" | #"switch" | #"text" | #"textPath" | #"tspan" | #"use" | #"view"] => t = "%identity"
  external fromComponentClass: React.component<'a> => t = "%identity"
  external fromFunctionComponent: React.component<'a> => t = "%identity"
}
