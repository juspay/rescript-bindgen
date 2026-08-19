type htmlInputTypeAttribute =
  | @as("number") Number
  | @as("color") Color
  | @as("hidden") Hidden
  | @as("text") Text
  | @as("search") Search
  | @as("button") Button
  | @as("checkbox") Checkbox
  | @as("radio") Radio
  | @as("reset") Reset
  | @as("range") Range
  | @as("month") Month
  | @as("week") Week
  | @as("time") Time
  | @as("image") Image
  | @as("date") Date
  | @as("tel") Tel
  | @as("url") Url
  | @as("email") Email
  | @as("submit") Submit
  | @as("datetime-local") DatetimeLocal
  | @as("file") File
  | @as("password") Password
type reactSidebarPropsPrimaryActionButtonPropsConfig = {
  ...JsxDOM.domProps,
}
module ElementType = {
  type t
  external fromTag: [#"symbol" | #"object" | #"body" | #"small" | #"base" | #"code" | #"style" | #"slot" | #"form" | #"pattern" | #"title" | #"text" | #"search" | #"big" | #"link" | #"sub" | #"sup" | #"label" | #"button" | #"input" | #"center" | #"header" | #"footer" | #"option" | #"menu" | #"ruby" | #"table" | #"clipPath" | #"filter" | #"marker" | #"mask" | #"map" | #"meter" | #"textarea" | #"progress" | #"circle" | #"embed" | #"pre" | #"caption" | #"menuitem" | #"line" | #"area" | #"legend" | #"section" | #"track" | #"time" | #"switch" | #"image" | #"article" | #"dialog" | #"figure" | #"img" | #"main" | #"path" | #"polygon" | #"linearGradient" | #"radialGradient" | #"select" | #"a" | #"q" | #"s" | #"animate" | #"meta" | #"textPath" | #"data" | #"rect" | #"source" | #"stop" | #"html" | #"div" | #"h2" | #"h3" | #"li" | #"nav" | #"ol" | #"p" | #"span" | #"svg" | #"ul" | #"abbr" | #"address" | #"aside" | #"audio" | #"b" | #"bdi" | #"bdo" | #"blockquote" | #"br" | #"canvas" | #"cite" | #"col" | #"colgroup" | #"datalist" | #"dd" | #"del" | #"details" | #"dfn" | #"dl" | #"dt" | #"em" | #"fieldset" | #"figcaption" | #"h1" | #"h4" | #"h5" | #"h6" | #"head" | #"hgroup" | #"hr" | #"i" | #"iframe" | #"ins" | #"kbd" | #"keygen" | #"mark" | #"noindex" | #"noscript" | #"optgroup" | #"output" | #"param" | #"picture" | #"rp" | #"rt" | #"samp" | #"script" | #"strong" | #"summary" | #"template" | #"tbody" | #"td" | #"tfoot" | #"th" | #"thead" | #"tr" | #"u" | #"var" | #"video" | #"wbr" | #"webview" | #"animateMotion" | #"animateTransform" | #"defs" | #"desc" | #"ellipse" | #"feBlend" | #"feColorMatrix" | #"feComponentTransfer" | #"feComposite" | #"feConvolveMatrix" | #"feDiffuseLighting" | #"feDisplacementMap" | #"feDistantLight" | #"feDropShadow" | #"feFlood" | #"feFuncA" | #"feFuncB" | #"feFuncG" | #"feFuncR" | #"feGaussianBlur" | #"feImage" | #"feMerge" | #"feMergeNode" | #"feMorphology" | #"feOffset" | #"fePointLight" | #"feSpecularLighting" | #"feSpotLight" | #"feTile" | #"feTurbulence" | #"foreignObject" | #"g" | #"metadata" | #"mpath" | #"polyline" | #"set" | #"tspan" | #"use" | #"view"] => t = "%identity"
  external fromComponentClass: React.component<'a> => t = "%identity"
  external asComponentClass: t => (React.component<'a>) = "%identity"
  external fromFunctionComponent: React.component<'a> => t = "%identity"
  external asFunctionComponent: t => (React.component<'a>) = "%identity"
}
