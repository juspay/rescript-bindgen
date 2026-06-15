// stdlib-types.mjs — names extracted from the ReScript stdlib so we can map TS
// types to the exact ReScript ones. Regenerate from:
//   @rescript/runtime/lib/ocaml/Dom.res        (element type names)
//   @rescript/runtime/lib/ocaml/JsxDOM.res     (domProps JS prop names, incl. @as values)

/** Built-in `Dom` module HTML element type names (no dependency). */
export const DOM_ELEMENTS = [
  'htmlAnchorElement',
  'htmlAreaElement',
  'htmlAudioElement',
  'htmlBaseElement',
  'htmlBodyElement',
  'htmlBrElement',
  'htmlButtonElement',
  'htmlCanvasElement',
  'htmlDataElement',
  'htmlDataListElement',
  'htmlDialogElement',
  'htmlDivElement',
  'htmlDlistElement',
  'htmlEmbedElement',
  'htmlFieldSetElement',
  'htmlFormElement',
  'htmlHeadElement',
  'htmlHeadingElement',
  'htmlHrElement',
  'htmlHtmlElement',
  'htmlIframeElement',
  'htmlImageElement',
  'htmlInputElement',
  'htmlLabelElement',
  'htmlLegendElement',
  'htmlLiElement',
  'htmlLinkElement',
  'htmlMapElement',
  'htmlMediaElement',
  'htmlMenuElement',
  'htmlMetaElement',
  'htmlMeterElement',
  'htmlModElement',
  'htmlOListElement',
  'htmlObjectElement',
  'htmlOptGroupElement',
  'htmlOptionElement',
  'htmlOutputElement',
  'htmlParagraphElement',
  'htmlParamElement',
  'htmlPreElement',
  'htmlProgressElement',
  'htmlQuoteElement',
  'htmlScriptElement',
  'htmlSelectElement',
  'htmlSlotElement',
  'htmlSourceElement',
  'htmlSpanElement',
  'htmlStyleElement',
  'htmlTableCaptionElement',
  'htmlTableCellElement',
  'htmlTableColElement',
  'htmlTableDataCellElement',
  'htmlTableElement',
  'htmlTableHeaderCellElement',
  'htmlTableRowElement',
  'htmlTableSectionElement',
  'htmlTextAreaElement',
  'htmlTimeElement',
  'htmlTitleElement',
  'htmlTrackElement',
  'htmlUlistElement',
  'htmlUnknownElement',
  'htmlVideoElement',]

/** Lowercased name -> exact Dom element type, e.g. "htmldivelement" -> "htmlDivElement". */
export const DOM_ELEMENT_BY_LOWER = new Map(DOM_ELEMENTS.map((n) => [n.toLowerCase(), n]))

/** JS property names present in JsxDOM.domProps (the @as value, or the field id) —
 *  used to skip collisions when a generated record spreads JsxDOM.domProps. */
export const DOM_PROPS_FIELDS = new Set(['about','accentHeight','accept','acceptCharset','accessKey','accumulate','action','additive','alignmentBaseline','allow','allowFullScreen','allowReorder','alphabetic','alt','amplitude','arabicForm','aria-activedescendant','aria-atomic','aria-busy','aria-checked','aria-colcount','aria-colindex','aria-colspan','aria-controls','aria-current','aria-describedby','aria-details','aria-disabled','aria-errormessage','aria-expanded','aria-flowto','aria-grabbed','aria-haspopup','aria-hidden','aria-keyshortcuts','aria-label','aria-labelledby','aria-level','aria-modal','aria-multiline','aria-multiselectable','aria-owns','aria-placeholder','aria-posinset','aria-readonly','aria-relevant','aria-required','aria-roledescription','aria-rowcount','aria-rowindex','aria-rowspan','aria-selected','aria-setsize','aria-sort','aria-valuemax','aria-valuemin','aria-valuenow','aria-valuetext','as','ascent','async','attributeName','attributeType','autoCapitalize','autoComplete','autoFocus','autoPlay','autoReverse','azimuth','baseFrequency','baseProfile','baselineShift','bbox','begin','begin_','bias','by','calcMode','capHeight','capture','challenge','charSet','checked','children','cite','className','clip','clipPath','clipPathUnits','clipRule','colSpan','colorInterpolation','colorInterpolationFilters','colorProfile','colorRendering','cols','content','contentEditable','contentScriptType','contentStyleType','contextMenu','controls','coords','crossOrigin','cursor','cx','cy','d','dangerouslySetInnerHTML','data','data-testid','datatype','dateTime','decelerate','default','defaultChecked','defaultValue','defer','descent','diffuseConstant','direction','disabled','display','divisor','dominantBaseline','download','draggable','dur','dx','dy','edgeMode','elevation','enableBackground','encType','end','end_','exponent','externalResourcesRequired','fill','fillOpacity','fillRule','filter','filterRes','filterUnits','floodColor','floodOpacity','focusable','fomat','fontFamily','fontSize','fontSizeAdjust','fontStretch','fontStyle','fontVariant','fontWeight','form','formAction','formMethod','formTarget','frameBorder','from','fx','fy','g1','g2','glyphName','glyphOrientationHorizontal','glyphOrientationVertical','glyphRef','gradientTransform','gradientUnits','hanging','headers','height','hidden','high','horizAdvX','horizOriginX','href','hrefLang','htmlFor','httpEquiv','icon','id','ideographic','imageRendering','in','in2','inert','inlist','inputMode','integrity','intercept','itemID','itemProp','itemRef','itemScope','itemType','k','k1','k2','k3','k4','kernelMatrix','kernelUnitLength','kerning','key','keyPoints','keySplines','keyTimes','keyType','kind','label','lang','lengthAdjust','letterSpacing','lightingColor','limitingConeAngle','list','loading','local','loop','low','manifest','markerEnd','markerHeight','markerMid','markerStart','markerUnits','markerWidth','mask','maskContentUnits','maskUnits','mathematical','max','maxLength','media','mediaGroup','method','min','minLength','mode','multiple','muted','name','noValidate','nonce','numOctaves','offset','onAbort','onAnimationEnd','onAnimationIteration','onAnimationStart','onBeforeInput','onBlur','onCanPlay','onCanPlayThrough','onChange','onClick','onCompositionEnd','onCompositionStart','onCompositionUpdate','onContextMenu','onCopy','onCut','onDoubleClick','onDrag','onDragEnd','onDragEnter','onDragExit','onDragLeave','onDragOver','onDragStart','onDrop','onDurationChange','onEmptied','onEncrypted','onEnded','onError','onFocus','onGotPointerCapture','onInput','onInvalid','onKeyDown','onKeyPress','onKeyUp','onLoad','onLoadStart','onLoadedData','onLoadedMetadata','onLostPointerCapture','onMouseDown','onMouseEnter','onMouseLeave','onMouseMove','onMouseOut','onMouseOver','onMouseUp','onPaste','onPause','onPlay','onPlaying','onPointerCancel','onPointerDown','onPointerEnter','onPointerLeave','onPointerMove','onPointerOut','onPointerOver','onPointerUp','onProgress','onRateChange','onReset','onScroll','onSeeked','onSeeking','onSelect','onStalled','onSubmit','onSuspend','onTimeUpdate','onTouchCancel','onTouchEnd','onTouchMove','onTouchStart','onTransitionEnd','onVolumeChange','onWaiting','onWheel','opacity','open','operator','optimum','order','orient','orientation','origin','overflow','overflowX','overflowY','overlinePosition','overlineThickness','paintOrder','panose1','pathLength','pattern','patternContentUnits','patternTransform','patternUnits','placeholder','playsInline','pointerEvents','points','pointsAtX','pointsAtY','pointsAtZ','popover','popoverTarget','popoverTargetAction','poster','prefix','preload','preserveAlpha','preserveAspectRatio','primitiveUnits','property','r','radioGroup','radius','readOnly','ref','refX','refY','referrerPolicy','rel','renderingIntent','repeatCount','repeatDur','required','requiredExtensions','requiredFeatures','resource','restart','result','reversed','role','rotate','rowSpan','rows','rx','ry','sandbox','scale','scope','scoped','scrolling','seed','selected','shape','shapeRendering','size','sizes','slope','slot','spacing','span','specularConstant','specularExponent','speed','spellCheck','spreadMethod','src','srcDoc','srcLang','srcSet','start','startOffset','stdDeviation','stemh','stemv','step','stitchTiles','stopColor','stopOpacity','strikethroughPosition','strikethroughThickness','string','stroke','strokeDasharray','strokeDashoffset','strokeLinecap','strokeLinejoin','strokeMiterlimit','strokeOpacity','strokeWidth','style','summary','suppressContentEditableWarning','surfaceScale','systemLanguage','tabIndex','tableValues','target','targetX','targetY','textAnchor','textDecoration','textLength','textRendering','title','to','to_','transform','type','typeof','u1','u2','underlinePosition','underlineThickness','unicode','unicodeBidi','unicodeRange','unitsPerEm','useMap','vAlphabetic','vHanging','vIdeographic','vMathematical','value','values','vectorEffect','version','vertAdvX','vertAdvY','vertOriginX','vertOriginY','viewBox','viewTarget','visibility','vocab','width','widths','wordSpacing','wrap','writingMode','x','x1','x2','xChannelSelector','xHeight','xlinkActuate','xlinkArcrole','xlinkHref','xlinkRole','xlinkShow','xlinkTitle','xlinkType','xmlBase','xmlLang','xmlSpace','xmlns','xmlnsXlink','y','y1','y2','yChannelSelector','z','zoomAndPan'])

/** ReScript reserved words — a generated identifier matching one gets a trailing underscore.
 *  Shared by extract (type/let names, view-constant notes) and emit (view-constant idents)
 *  so the note and the emitted code can never disagree. (#39 review) */
export const RESCRIPT_RESERVED = new Set([
    'type', 'and', 'as', 'open', 'let', 'rec', 'in', 'switch', 'if', 'else',
    'for', 'while', 'fun', 'mutable', 'try', 'catch', 'exception', 'module',
    'external', 'when', 'with', 'lazy', 'assert', 'true', 'false', 'include',
    'constraint', 'private', 'of', 'to', 'downto',
])
