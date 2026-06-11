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
module WrapperType = {
  type t
  external fromSymbol: [#"symbol"] => t = "%identity"
  let symbol: t = fromSymbol(#"symbol")
  external fromObject: [#"object"] => t = "%identity"
  let object: t = fromObject(#"object")
  external fromMap: [#"map"] => t = "%identity"
  let map: t = fromMap(#"map")
  external fromFilter: [#"filter"] => t = "%identity"
  let filter: t = fromFilter(#"filter")
  external fromA: [#"a"] => t = "%identity"
  let a: t = fromA(#"a")
  external fromAbbr: [#"abbr"] => t = "%identity"
  let abbr: t = fromAbbr(#"abbr")
  external fromAddress: [#"address"] => t = "%identity"
  let address: t = fromAddress(#"address")
  external fromArea: [#"area"] => t = "%identity"
  let area: t = fromArea(#"area")
  external fromArticle: [#"article"] => t = "%identity"
  let article: t = fromArticle(#"article")
  external fromAside: [#"aside"] => t = "%identity"
  let aside: t = fromAside(#"aside")
  external fromAudio: [#"audio"] => t = "%identity"
  let audio: t = fromAudio(#"audio")
  external fromB: [#"b"] => t = "%identity"
  let b: t = fromB(#"b")
  external fromBase: [#"base"] => t = "%identity"
  let base: t = fromBase(#"base")
  external fromBdi: [#"bdi"] => t = "%identity"
  let bdi: t = fromBdi(#"bdi")
  external fromBdo: [#"bdo"] => t = "%identity"
  let bdo: t = fromBdo(#"bdo")
  external fromBig: [#"big"] => t = "%identity"
  let big: t = fromBig(#"big")
  external fromBlockquote: [#"blockquote"] => t = "%identity"
  let blockquote: t = fromBlockquote(#"blockquote")
  external fromBody: [#"body"] => t = "%identity"
  let body: t = fromBody(#"body")
  external fromBr: [#"br"] => t = "%identity"
  let br: t = fromBr(#"br")
  external fromButton: [#"button"] => t = "%identity"
  let button: t = fromButton(#"button")
  external fromCanvas: [#"canvas"] => t = "%identity"
  let canvas: t = fromCanvas(#"canvas")
  external fromCaption: [#"caption"] => t = "%identity"
  let caption: t = fromCaption(#"caption")
  external fromCenter: [#"center"] => t = "%identity"
  let center: t = fromCenter(#"center")
  external fromCite: [#"cite"] => t = "%identity"
  let cite: t = fromCite(#"cite")
  external fromCode: [#"code"] => t = "%identity"
  let code: t = fromCode(#"code")
  external fromCol: [#"col"] => t = "%identity"
  let col: t = fromCol(#"col")
  external fromColgroup: [#"colgroup"] => t = "%identity"
  let colgroup: t = fromColgroup(#"colgroup")
  external fromData: [#"data"] => t = "%identity"
  let data: t = fromData(#"data")
  external fromDatalist: [#"datalist"] => t = "%identity"
  let datalist: t = fromDatalist(#"datalist")
  external fromDd: [#"dd"] => t = "%identity"
  let dd: t = fromDd(#"dd")
  external fromDel: [#"del"] => t = "%identity"
  let del: t = fromDel(#"del")
  external fromDetails: [#"details"] => t = "%identity"
  let details: t = fromDetails(#"details")
  external fromDfn: [#"dfn"] => t = "%identity"
  let dfn: t = fromDfn(#"dfn")
  external fromDialog: [#"dialog"] => t = "%identity"
  let dialog: t = fromDialog(#"dialog")
  external fromDiv: [#"div"] => t = "%identity"
  let div: t = fromDiv(#"div")
  external fromDl: [#"dl"] => t = "%identity"
  let dl: t = fromDl(#"dl")
  external fromDt: [#"dt"] => t = "%identity"
  let dt: t = fromDt(#"dt")
  external fromEm: [#"em"] => t = "%identity"
  let em: t = fromEm(#"em")
  external fromEmbed: [#"embed"] => t = "%identity"
  let embed: t = fromEmbed(#"embed")
  external fromFieldset: [#"fieldset"] => t = "%identity"
  let fieldset: t = fromFieldset(#"fieldset")
  external fromFigcaption: [#"figcaption"] => t = "%identity"
  let figcaption: t = fromFigcaption(#"figcaption")
  external fromFigure: [#"figure"] => t = "%identity"
  let figure: t = fromFigure(#"figure")
  external fromFooter: [#"footer"] => t = "%identity"
  let footer: t = fromFooter(#"footer")
  external fromForm: [#"form"] => t = "%identity"
  let form: t = fromForm(#"form")
  external fromH1: [#"h1"] => t = "%identity"
  let h1: t = fromH1(#"h1")
  external fromH2: [#"h2"] => t = "%identity"
  let h2: t = fromH2(#"h2")
  external fromH3: [#"h3"] => t = "%identity"
  let h3: t = fromH3(#"h3")
  external fromH4: [#"h4"] => t = "%identity"
  let h4: t = fromH4(#"h4")
  external fromH5: [#"h5"] => t = "%identity"
  let h5: t = fromH5(#"h5")
  external fromH6: [#"h6"] => t = "%identity"
  let h6: t = fromH6(#"h6")
  external fromHead: [#"head"] => t = "%identity"
  let head: t = fromHead(#"head")
  external fromHeader: [#"header"] => t = "%identity"
  let header: t = fromHeader(#"header")
  external fromHgroup: [#"hgroup"] => t = "%identity"
  let hgroup: t = fromHgroup(#"hgroup")
  external fromHr: [#"hr"] => t = "%identity"
  let hr: t = fromHr(#"hr")
  external fromHtml: [#"html"] => t = "%identity"
  let html: t = fromHtml(#"html")
  external fromI: [#"i"] => t = "%identity"
  let i: t = fromI(#"i")
  external fromIframe: [#"iframe"] => t = "%identity"
  let iframe: t = fromIframe(#"iframe")
  external fromImg: [#"img"] => t = "%identity"
  let img: t = fromImg(#"img")
  external fromInput: [#"input"] => t = "%identity"
  let input: t = fromInput(#"input")
  external fromIns: [#"ins"] => t = "%identity"
  let ins: t = fromIns(#"ins")
  external fromKbd: [#"kbd"] => t = "%identity"
  let kbd: t = fromKbd(#"kbd")
  external fromKeygen: [#"keygen"] => t = "%identity"
  let keygen: t = fromKeygen(#"keygen")
  external fromLabel: [#"label"] => t = "%identity"
  let label: t = fromLabel(#"label")
  external fromLegend: [#"legend"] => t = "%identity"
  let legend: t = fromLegend(#"legend")
  external fromLi: [#"li"] => t = "%identity"
  let li: t = fromLi(#"li")
  external fromLink: [#"link"] => t = "%identity"
  let link: t = fromLink(#"link")
  external fromMain: [#"main"] => t = "%identity"
  let main: t = fromMain(#"main")
  external fromMark: [#"mark"] => t = "%identity"
  let mark: t = fromMark(#"mark")
  external fromMenu: [#"menu"] => t = "%identity"
  let menu: t = fromMenu(#"menu")
  external fromMenuitem: [#"menuitem"] => t = "%identity"
  let menuitem: t = fromMenuitem(#"menuitem")
  external fromMeta: [#"meta"] => t = "%identity"
  let meta: t = fromMeta(#"meta")
  external fromMeter: [#"meter"] => t = "%identity"
  let meter: t = fromMeter(#"meter")
  external fromNav: [#"nav"] => t = "%identity"
  let nav: t = fromNav(#"nav")
  external fromNoindex: [#"noindex"] => t = "%identity"
  let noindex: t = fromNoindex(#"noindex")
  external fromNoscript: [#"noscript"] => t = "%identity"
  let noscript: t = fromNoscript(#"noscript")
  external fromOl: [#"ol"] => t = "%identity"
  let ol: t = fromOl(#"ol")
  external fromOptgroup: [#"optgroup"] => t = "%identity"
  let optgroup: t = fromOptgroup(#"optgroup")
  external fromOption: [#"option"] => t = "%identity"
  let option: t = fromOption(#"option")
  external fromOutput: [#"output"] => t = "%identity"
  let output: t = fromOutput(#"output")
  external fromP: [#"p"] => t = "%identity"
  let p: t = fromP(#"p")
  external fromParam: [#"param"] => t = "%identity"
  let param: t = fromParam(#"param")
  external fromPicture: [#"picture"] => t = "%identity"
  let picture: t = fromPicture(#"picture")
  external fromPre: [#"pre"] => t = "%identity"
  let pre: t = fromPre(#"pre")
  external fromProgress: [#"progress"] => t = "%identity"
  let progress: t = fromProgress(#"progress")
  external fromQ: [#"q"] => t = "%identity"
  let q: t = fromQ(#"q")
  external fromRp: [#"rp"] => t = "%identity"
  let rp: t = fromRp(#"rp")
  external fromRt: [#"rt"] => t = "%identity"
  let rt: t = fromRt(#"rt")
  external fromRuby: [#"ruby"] => t = "%identity"
  let ruby: t = fromRuby(#"ruby")
  external fromS: [#"s"] => t = "%identity"
  let s: t = fromS(#"s")
  external fromSamp: [#"samp"] => t = "%identity"
  let samp: t = fromSamp(#"samp")
  external fromSearch: [#"search"] => t = "%identity"
  let search: t = fromSearch(#"search")
  external fromSlot: [#"slot"] => t = "%identity"
  let slot: t = fromSlot(#"slot")
  external fromScript: [#"script"] => t = "%identity"
  let script: t = fromScript(#"script")
  external fromSection: [#"section"] => t = "%identity"
  let section: t = fromSection(#"section")
  external fromSelect: [#"select"] => t = "%identity"
  let select: t = fromSelect(#"select")
  external fromSmall: [#"small"] => t = "%identity"
  let small: t = fromSmall(#"small")
  external fromSource: [#"source"] => t = "%identity"
  let source: t = fromSource(#"source")
  external fromSpan: [#"span"] => t = "%identity"
  let span: t = fromSpan(#"span")
  external fromStrong: [#"strong"] => t = "%identity"
  let strong: t = fromStrong(#"strong")
  external fromStyle: [#"style"] => t = "%identity"
  let style: t = fromStyle(#"style")
  external fromSub: [#"sub"] => t = "%identity"
  let sub: t = fromSub(#"sub")
  external fromSummary: [#"summary"] => t = "%identity"
  let summary: t = fromSummary(#"summary")
  external fromSup: [#"sup"] => t = "%identity"
  let sup: t = fromSup(#"sup")
  external fromTable: [#"table"] => t = "%identity"
  let table: t = fromTable(#"table")
  external fromTemplate: [#"template"] => t = "%identity"
  let template: t = fromTemplate(#"template")
  external fromTbody: [#"tbody"] => t = "%identity"
  let tbody: t = fromTbody(#"tbody")
  external fromTd: [#"td"] => t = "%identity"
  let td: t = fromTd(#"td")
  external fromTextarea: [#"textarea"] => t = "%identity"
  let textarea: t = fromTextarea(#"textarea")
  external fromTfoot: [#"tfoot"] => t = "%identity"
  let tfoot: t = fromTfoot(#"tfoot")
  external fromTh: [#"th"] => t = "%identity"
  let th: t = fromTh(#"th")
  external fromThead: [#"thead"] => t = "%identity"
  let thead: t = fromThead(#"thead")
  external fromTime: [#"time"] => t = "%identity"
  let time: t = fromTime(#"time")
  external fromTitle: [#"title"] => t = "%identity"
  let title: t = fromTitle(#"title")
  external fromTr: [#"tr"] => t = "%identity"
  let tr: t = fromTr(#"tr")
  external fromTrack: [#"track"] => t = "%identity"
  let track: t = fromTrack(#"track")
  external fromU: [#"u"] => t = "%identity"
  let u: t = fromU(#"u")
  external fromUl: [#"ul"] => t = "%identity"
  let ul: t = fromUl(#"ul")
  external fromVar: [#"var"] => t = "%identity"
  let var: t = fromVar(#"var")
  external fromVideo: [#"video"] => t = "%identity"
  let video: t = fromVideo(#"video")
  external fromWbr: [#"wbr"] => t = "%identity"
  let wbr: t = fromWbr(#"wbr")
  external fromWebview: [#"webview"] => t = "%identity"
  let webview: t = fromWebview(#"webview")
  external fromSvg: [#"svg"] => t = "%identity"
  let svg: t = fromSvg(#"svg")
  external fromAnimate: [#"animate"] => t = "%identity"
  let animate: t = fromAnimate(#"animate")
  external fromAnimateMotion: [#"animateMotion"] => t = "%identity"
  let animateMotion: t = fromAnimateMotion(#"animateMotion")
  external fromAnimateTransform: [#"animateTransform"] => t = "%identity"
  let animateTransform: t = fromAnimateTransform(#"animateTransform")
  external fromCircle: [#"circle"] => t = "%identity"
  let circle: t = fromCircle(#"circle")
  external fromClipPath: [#"clipPath"] => t = "%identity"
  let clipPath: t = fromClipPath(#"clipPath")
  external fromDefs: [#"defs"] => t = "%identity"
  let defs: t = fromDefs(#"defs")
  external fromDesc: [#"desc"] => t = "%identity"
  let desc: t = fromDesc(#"desc")
  external fromEllipse: [#"ellipse"] => t = "%identity"
  let ellipse: t = fromEllipse(#"ellipse")
  external fromFeBlend: [#"feBlend"] => t = "%identity"
  let feBlend: t = fromFeBlend(#"feBlend")
  external fromFeColorMatrix: [#"feColorMatrix"] => t = "%identity"
  let feColorMatrix: t = fromFeColorMatrix(#"feColorMatrix")
  external fromFeComponentTransfer: [#"feComponentTransfer"] => t = "%identity"
  let feComponentTransfer: t = fromFeComponentTransfer(#"feComponentTransfer")
  external fromFeComposite: [#"feComposite"] => t = "%identity"
  let feComposite: t = fromFeComposite(#"feComposite")
  external fromFeConvolveMatrix: [#"feConvolveMatrix"] => t = "%identity"
  let feConvolveMatrix: t = fromFeConvolveMatrix(#"feConvolveMatrix")
  external fromFeDiffuseLighting: [#"feDiffuseLighting"] => t = "%identity"
  let feDiffuseLighting: t = fromFeDiffuseLighting(#"feDiffuseLighting")
  external fromFeDisplacementMap: [#"feDisplacementMap"] => t = "%identity"
  let feDisplacementMap: t = fromFeDisplacementMap(#"feDisplacementMap")
  external fromFeDistantLight: [#"feDistantLight"] => t = "%identity"
  let feDistantLight: t = fromFeDistantLight(#"feDistantLight")
  external fromFeDropShadow: [#"feDropShadow"] => t = "%identity"
  let feDropShadow: t = fromFeDropShadow(#"feDropShadow")
  external fromFeFlood: [#"feFlood"] => t = "%identity"
  let feFlood: t = fromFeFlood(#"feFlood")
  external fromFeFuncA: [#"feFuncA"] => t = "%identity"
  let feFuncA: t = fromFeFuncA(#"feFuncA")
  external fromFeFuncB: [#"feFuncB"] => t = "%identity"
  let feFuncB: t = fromFeFuncB(#"feFuncB")
  external fromFeFuncG: [#"feFuncG"] => t = "%identity"
  let feFuncG: t = fromFeFuncG(#"feFuncG")
  external fromFeFuncR: [#"feFuncR"] => t = "%identity"
  let feFuncR: t = fromFeFuncR(#"feFuncR")
  external fromFeGaussianBlur: [#"feGaussianBlur"] => t = "%identity"
  let feGaussianBlur: t = fromFeGaussianBlur(#"feGaussianBlur")
  external fromFeImage: [#"feImage"] => t = "%identity"
  let feImage: t = fromFeImage(#"feImage")
  external fromFeMerge: [#"feMerge"] => t = "%identity"
  let feMerge: t = fromFeMerge(#"feMerge")
  external fromFeMergeNode: [#"feMergeNode"] => t = "%identity"
  let feMergeNode: t = fromFeMergeNode(#"feMergeNode")
  external fromFeMorphology: [#"feMorphology"] => t = "%identity"
  let feMorphology: t = fromFeMorphology(#"feMorphology")
  external fromFeOffset: [#"feOffset"] => t = "%identity"
  let feOffset: t = fromFeOffset(#"feOffset")
  external fromFePointLight: [#"fePointLight"] => t = "%identity"
  let fePointLight: t = fromFePointLight(#"fePointLight")
  external fromFeSpecularLighting: [#"feSpecularLighting"] => t = "%identity"
  let feSpecularLighting: t = fromFeSpecularLighting(#"feSpecularLighting")
  external fromFeSpotLight: [#"feSpotLight"] => t = "%identity"
  let feSpotLight: t = fromFeSpotLight(#"feSpotLight")
  external fromFeTile: [#"feTile"] => t = "%identity"
  let feTile: t = fromFeTile(#"feTile")
  external fromFeTurbulence: [#"feTurbulence"] => t = "%identity"
  let feTurbulence: t = fromFeTurbulence(#"feTurbulence")
  external fromForeignObject: [#"foreignObject"] => t = "%identity"
  let foreignObject: t = fromForeignObject(#"foreignObject")
  external fromG: [#"g"] => t = "%identity"
  let g: t = fromG(#"g")
  external fromImage: [#"image"] => t = "%identity"
  let image: t = fromImage(#"image")
  external fromLine: [#"line"] => t = "%identity"
  let line: t = fromLine(#"line")
  external fromLinearGradient: [#"linearGradient"] => t = "%identity"
  let linearGradient: t = fromLinearGradient(#"linearGradient")
  external fromMarker: [#"marker"] => t = "%identity"
  let marker: t = fromMarker(#"marker")
  external fromMask: [#"mask"] => t = "%identity"
  let mask: t = fromMask(#"mask")
  external fromMetadata: [#"metadata"] => t = "%identity"
  let metadata: t = fromMetadata(#"metadata")
  external fromMpath: [#"mpath"] => t = "%identity"
  let mpath: t = fromMpath(#"mpath")
  external fromPath: [#"path"] => t = "%identity"
  let path: t = fromPath(#"path")
  external fromPattern: [#"pattern"] => t = "%identity"
  let pattern: t = fromPattern(#"pattern")
  external fromPolygon: [#"polygon"] => t = "%identity"
  let polygon: t = fromPolygon(#"polygon")
  external fromPolyline: [#"polyline"] => t = "%identity"
  let polyline: t = fromPolyline(#"polyline")
  external fromRadialGradient: [#"radialGradient"] => t = "%identity"
  let radialGradient: t = fromRadialGradient(#"radialGradient")
  external fromRect: [#"rect"] => t = "%identity"
  let rect: t = fromRect(#"rect")
  external fromSet: [#"set"] => t = "%identity"
  let set: t = fromSet(#"set")
  external fromStop: [#"stop"] => t = "%identity"
  let stop: t = fromStop(#"stop")
  external fromSwitch: [#"switch"] => t = "%identity"
  let switch_: t = fromSwitch(#"switch")
  external fromText: [#"text"] => t = "%identity"
  let text: t = fromText(#"text")
  external fromTextPath: [#"textPath"] => t = "%identity"
  let textPath: t = fromTextPath(#"textPath")
  external fromTspan: [#"tspan"] => t = "%identity"
  let tspan: t = fromTspan(#"tspan")
  external fromUse: [#"use"] => t = "%identity"
  let use: t = fromUse(#"use")
  external fromView: [#"view"] => t = "%identity"
  let view: t = fromView(#"view")
  external fromComponentClass: React.component<'a> => t = "%identity"
  external fromFunctionComponent: React.component<'a> => t = "%identity"
}
