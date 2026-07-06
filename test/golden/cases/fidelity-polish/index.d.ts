// Three fidelity-polish mappings (#34):
//   I-5 `number | null` value prop -> Nullable.t<float> (passing null = controlled-clear,
//       distinct from omitting; recovered from the SYNTACTIC node since strictNullChecks
//       is off). A plain `count?: number` (no null) stays float.
//   I-7 `ReactElement | ((…) => ReactElement)` render prop -> React.element + ⓘ note that
//       the function form isn't bound (instead of silently dropping it).
//   I-8 `RefObject<HTMLInputElement>` in PROP position -> the generic
//       React.ref<Nullable.t<Dom.element>> (#98: the consumer must CREATE the ref, and
//       ReactDOM.Ref.domRef can only produce the generic one — the element-specific type
//       forced an %identity widening in every consumer; nested/read positions keep the
//       specific element); a `RefObject<HTMLElement | null>` strips null to the element.
type ReactElement = { __brand: 'element' }
interface RefObject<T> { current: T | null }
type ComponentRenderFn = (props: {}, state: {}) => ReactElement

export declare const Widget: (props: {
  value?: number | null
  count?: number
  render?: ReactElement | ComponentRenderFn
  inputRef?: RefObject<HTMLInputElement>
  anyRef?: RefObject<HTMLElement | null>
}) => ReactElement
