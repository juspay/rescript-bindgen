type htmlInputTypeAttribute =
  | @as("number") Number
  | @as("text") Text
  | @as("hidden") Hidden
  | @as("color") Color
  | @as("search") Search
  | @as("button") Button
  | @as("checkbox") Checkbox
  | @as("radio") Radio
  | @as("reset") Reset
  | @as("range") Range
  | @as("date") Date
  | @as("time") Time
  | @as("month") Month
  | @as("week") Week
  | @as("image") Image
  | @as("tel") Tel
  | @as("url") Url
  | @as("email") Email
  | @as("submit") Submit
  | @as("datetime-local") DatetimeLocal
  | @as("file") File
  | @as("password") Password
type reactPrimaryActionButtonPropsConfig = {
  ...JsxDOM.domProps,
}
module ElementType = {
  type t
  external fromTag: [#"symbol" | #"object" | #"text" | #"small" | #"slot" | #"center" | #"ruby" | #"table" | #"search" | #"big" | #"link" | #"sub" | #"sup" | #"button" | #"meter" | #"textarea" | #"style" | #"progress" | #"circle" | #"embed" | #"pre" | #"caption" | #"menu" | #"menuitem" | #"map" | #"filter" | #"body" | #"base" | #"code" | #"title" | #"article" | #"dialog" | #"figure" | #"form" | #"img" | #"main" | #"option" | #"switch" | #"time" | #"animate" | #"stop" | #"rect" | #"polygon" | #"area" | #"line" | #"label" | #"marker" | #"data" | #"select" | #"linearGradient" | #"radialGradient" | #"a" | #"q" | #"s" | #"textPath" | #"meta" | #"image" | #"html" | #"div" | #"h2" | #"h3" | #"input" | #"li" | #"nav" | #"ol" | #"p" | #"span" | #"svg" | #"ul" | #"abbr" | #"address" | #"aside" | #"audio" | #"b" | #"bdi" | #"bdo" | #"blockquote" | #"br" | #"canvas" | #"cite" | #"col" | #"colgroup" | #"datalist" | #"dd" | #"del" | #"details" | #"dfn" | #"dl" | #"dt" | #"em" | #"fieldset" | #"figcaption" | #"footer" | #"h1" | #"h4" | #"h5" | #"h6" | #"head" | #"header" | #"hgroup" | #"hr" | #"i" | #"iframe" | #"ins" | #"kbd" | #"keygen" | #"legend" | #"mark" | #"noindex" | #"noscript" | #"optgroup" | #"output" | #"param" | #"picture" | #"rp" | #"rt" | #"samp" | #"script" | #"section" | #"source" | #"strong" | #"summary" | #"template" | #"tbody" | #"td" | #"tfoot" | #"th" | #"thead" | #"tr" | #"track" | #"u" | #"var" | #"video" | #"wbr" | #"webview" | #"animateMotion" | #"animateTransform" | #"clipPath" | #"defs" | #"desc" | #"ellipse" | #"feBlend" | #"feColorMatrix" | #"feComponentTransfer" | #"feComposite" | #"feConvolveMatrix" | #"feDiffuseLighting" | #"feDisplacementMap" | #"feDistantLight" | #"feDropShadow" | #"feFlood" | #"feFuncA" | #"feFuncB" | #"feFuncG" | #"feFuncR" | #"feGaussianBlur" | #"feImage" | #"feMerge" | #"feMergeNode" | #"feMorphology" | #"feOffset" | #"fePointLight" | #"feSpecularLighting" | #"feSpotLight" | #"feTile" | #"feTurbulence" | #"foreignObject" | #"g" | #"mask" | #"metadata" | #"mpath" | #"path" | #"pattern" | #"polyline" | #"set" | #"tspan" | #"use" | #"view"] => t = "%identity"
  external fromComponentClass: React.component<'a> => t = "%identity"
  external asComponentClass: t => (React.component<'a>) = "%identity"
  external fromFunctionComponent: React.component<'a> => t = "%identity"
  external asFunctionComponent: t => (React.component<'a>) = "%identity"
}
