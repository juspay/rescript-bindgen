// Type-parameter propagation across a recursive group through a NON-generic intermediary
// (reproduces a Highcharts `HighchartsSharedTypes.res` compile failure — issue #61).
//
// The cycle: annotationOptions → events(annotationEvents) → add(annotation) → annotation
// → options(annotationOptions). A genuine round-tripping generic enters via the input
// `{ value: any }[]` field (#50): `controlPointsConfig<'a>` → so `annotationOptions<'a>`,
// and transitively `annotation<'a>`. The intermediary `annotationEvents` has no type
// variable OF ITS OWN, so the bottom-up build leaves it non-generic — yet it references
// the now-generic `annotation<'a>`. Naively that emits `option<annotation>` (bare) inside
// `annotationEvents`, an UNDER-APPLIED type constructor: "the type constructor annotation
// expects 1 argument(s), but is here applied to 0 argument(s)" — uncompilable.
//
// The fix: a fixpoint pass propagates the parameter so every entry that transitively
// reaches a parameterized member becomes parameterized too (`annotationEvents<'a>`), and
// every reference is re-synced to its target's params (`option<annotation<'a>>`).
type JsxElement = { __brand: 'element' }

interface AnnotationControlPoint {
  // `value: any` in a consumer-SUPPLIED array element round-trips -> a genuine `'a` (#50),
  // which is the type variable that must thread through the whole cycle below.
  controlPoints?: ReadonlyArray<{ id: string; value: any }>
  events?: AnnotationEvents // back-edge into the cycle, via a non-generic intermediary
}

interface AnnotationEvents {
  // references `Annotation` (generic after propagation) but has no variable of its own —
  // this is the record the naive pass leaves non-generic while under-applying `annotation`.
  add?: (annotation: Annotation) => boolean
  remove?: (annotation: Annotation) => boolean
}

interface Annotation {
  options: AnnotationControlPoint
  userOptions: AnnotationControlPoint
}

export declare const Chart: (props: {
  annotations?: ReadonlyArray<AnnotationControlPoint>
}) => JsxElement
