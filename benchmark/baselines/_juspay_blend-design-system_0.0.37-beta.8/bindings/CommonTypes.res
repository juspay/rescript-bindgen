@unboxed type themeOrString = @as("light") Light | @as("dark") Dark | Custom(string)
@unboxed type stringOrStringArray = Str(string) | StrArr(array<string>)
@unboxed type stringOrNumber = Str(string) | Num(float)
@unboxed type stringOrNumberOrStringArray = Str(string) | Num(float) | StrArr(array<string>)
@unboxed type preserveStartOrPreserveEndOrPreserveStartEndOrNumber = @as("preserveStart") PreserveStart | @as("preserveEnd") PreserveEnd | @as("preserveStartEnd") PreserveStartEnd | Num(float)
@unboxed type autoOrNumber = @as("auto") Auto | Num(float)
@unboxed type boolOrString = Bool(bool) | Str(string)
@unboxed type boolOrStringOrNumber = Bool(bool) | Str(string) | Num(float)
@unboxed type boolOrNumber = Bool(bool) | Num(float)
@unboxed type numberOrNumberArray = Num(float) | NumArr(array<float>)
@unboxed type boolOrAutoOrDefault = Bool(bool) | @as("auto") Auto | @as("default") Default
@unboxed type boolOrStringOrStringArray = Bool(bool) | Str(string) | StrArr(array<string>)
@unboxed type v0OrV100 = @as(0) N0 | @as(100) N100
@unboxed type boolOrIndeterminate = Bool(bool) | @as("indeterminate") Indeterminate
@unboxed type dataTableRowActionConfigDisabled<'a> = Bool(bool) | Fn(('a, float) => bool)
@unboxed type dataTableRowActionConfigHidden<'a> = Bool(bool) | Fn(('a, float) => bool)
@unboxed type v1OrV2OrV3 = @as(1) N1 | @as(2) N2 | @as(3) N3
@unboxed type tabsFormAction<'a> = Str(string) | Fn(Webapi.FormData.t => 'a)
@unboxed type boolOrMixed = Bool(bool) | @as("mixed") Mixed
@unboxed type selectorV2FormAction<'a> = Str(string) | Fn(Webapi.FormData.t => 'a)
@unboxed type drawerV2FormAction<'a> = Str(string) | Fn(Webapi.FormData.t => 'a)
@unboxed type tabsV2FormAction<'a> = Str(string) | Fn(Webapi.FormData.t => 'a)
@unboxed type v0OrV1 = @as(0) N0 | @as(1) N1
@unboxed type v2OrV3OrV4 = @as(2) N2 | @as(3) N3 | @as(4) N4
@unboxed type v5OrV8 = @as(5) N5 | @as(8) N8
@unboxed type tabSizeOrNumber = @as("tabSize") TabSize | Num(float)
@unboxed type v0OrV1OrV2OrV3 = @as(0) N0 | @as(1) N1 | @as(2) N2 | @as(3) N3
@unboxed type v1OrV2OrV4OrV7 = @as(1) N1 | @as(2) N2 | @as(4) N4 | @as(7) N7
@unboxed type v1OrV2 = @as(1) N1 | @as(2) N2
@unboxed type editorIEditorOptionsLineNumbers = @as("relative") Relative | @as("off") Off | @as("on") On | @as("interval") Interval | Fn(float => string)
@unboxed type boolOrInlineOrOffOrOn = Bool(bool) | @as("inline") Inline | @as("off") Off | @as("on") On
@unboxed type boolOrActive = Bool(bool) | @as("active") Active
@unboxed type boolOrAlways = Bool(bool) | @as("always") Always
@unboxed type boolOrInUntrustedWorkspace = Bool(bool) | @as("inUntrustedWorkspace") InUntrustedWorkspace
@unboxed type v0OrV1OrV2 = @as(0) N0 | @as(1) N1 | @as(2) N2
@unboxed type v0OrV1OrV2OrV3OrV4 = @as(0) N0 | @as(1) N1 | @as(2) N2 | @as(3) N3 | @as(4) N4
@unboxed type editorGetMonacoViewModeOptionsLineNumbers = @as("relative") Relative | @as("off") Off | @as("on") On | @as("interval") Interval | Fn(float => string)
@unboxed type editorIStandaloneCodeEditorUpdateOptionsLineNumbers = @as("relative") Relative | @as("off") Off | @as("on") On | @as("interval") Interval | Fn(float => string)
@unboxed type boolOrConfiguredByTheme = Bool(bool) | @as("configuredByTheme") ConfiguredByTheme
@unboxed type editorIDiffEditorOptionsLineNumbers = @as("relative") Relative | @as("off") Off | @as("on") On | @as("interval") Interval | Fn(float => string)
@unboxed type editorIStandaloneEditorConstructionOptionsLineNumbers = @as("relative") Relative | @as("off") Off | @as("on") On | @as("interval") Interval | Fn(float => string)
@unboxed type editorIDiffEditorConstructionOptionsLineNumbers = @as("relative") Relative | @as("off") Off | @as("on") On | @as("interval") Interval | Fn(float => string)
@unboxed type reactCopyToClipboardWithTemporaryFeedbackSetIsCopied = Bool(bool) | Fn(bool => bool)
@unboxed type stringOrNumberOrBigInt = Str(string) | Num(float) | Big(bigint)
type truncatedTextWithTooltipV2Props = {
  text: string,
  className?: string,
  style?: JsxDOM.style,
  tooltipContent?: string,
  side?: TooltipV2Types.tooltipV2Side,
  align?: TooltipV2Types.tooltipV2Align,
  size?: TooltipV2Types.tooltipV2Size,
  delayDuration?: float,
  offset?: float,
  disabled?: bool,
  @as("data-element") dataElement?: string,
  @as("data-id") dataId?: string,
}
@unboxed type stringOrNumberOrStringOrNumberArray = Str(string) | Num(float) | Arr(array<stringOrNumber>)
