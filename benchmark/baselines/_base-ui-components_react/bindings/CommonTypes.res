@unboxed type formAction<'a> = Str(string) | Fn(Webapi.FormData.t => 'a)
@unboxed type stringOrNumberOrStringArray = Str(string) | Num(float) | StrArr(array<string>)
@unboxed type boolOrTrapFocus = Bool(bool) | @as("trap-focus") TrapFocus
@unboxed type boolOrAlways = Bool(bool) | @as("always") Always
@unboxed type stringOrNumber = Str(string) | Num(float)
@unboxed type style = Style(JsxDOM.style) | Fn(string => JsxDOM.style)
@unboxed type className = Str(string) | Fn(string => string)
@unboxed type stringOrStringArray = Str(string) | StrArr(array<string>)
@unboxed type boolOrBadInputOrCustomErrorOrPatternMismatchOrRangeOverflowOrRangeUnderflowOrStepMismatchOrTooLongOrTooShortOrTypeMismatchOrValidOrValueMissing = Bool(bool) | @as("badInput") BadInput | @as("customError") CustomError | @as("patternMismatch") PatternMismatch | @as("rangeOverflow") RangeOverflow | @as("rangeUnderflow") RangeUnderflow | @as("stepMismatch") StepMismatch | @as("tooLong") TooLong | @as("tooShort") TooShort | @as("typeMismatch") TypeMismatch | @as("valid") Valid | @as("valueMissing") ValueMissing
@unboxed type v1OrV1 = @as(1) N1 | @as(-1) N_1
@unboxed type style2<'a> = Style(JsxDOM.style) | Fn('a => JsxDOM.style)
@unboxed type className2<'a> = Str(string) | Fn('a => string)
module Validate = {
  type t
  external fromString: string => t = "%identity"
  external fromArray: array<string> => t = "%identity"
  external fromPromise: promise<stringOrStringArray> => t = "%identity"
}
