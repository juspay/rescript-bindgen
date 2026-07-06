// #98 follow-up — components with a forwardRef surface (`… & RefAttributes<R>`) got NO `~ref`
// prop: the `ref` symbol is React-reserved and was filtered, so an imperative handle
// (highcharts-react's `HighchartsReactRefObject`) was unreachable from ReScript. The JSX v4 ppx
// accepts and forwards a `~ref` labeled arg on an external (proven: `ref: dom` lands in the JS
// props), so synthesize it from the RefAttributes payload:
//
//   DomBox     — R = HTMLDivElement  -> ~ref: React.ref<Nullable.t<Dom.element>>=? (the generic
//                constructable domRef, per the #98 element-ref-prop rule)
//   Chart      — R = ChartHandle     -> ~ref: React.ref<Nullable.t<chartHandle>>=? (typed handle;
//                consumer creates it with React.useRef(Nullable.null) and reads the handle back)
//   NoRefPlain — no RefAttributes    -> no ~ref synthesized (control)
type JsxElement = { __brand: 'element' }
// the real @types/react shape: ref? is the `Ref<T>` FAMILY (object form | callback form)
interface RefObject<T> { readonly current: T | null }
type Ref<T> = RefObject<T> | ((instance: T | null) => void)
interface RefAttributes<T> { ref?: Ref<T> }
type ForwardRefExoticComponent<P> = (props: P) => JsxElement

interface ChartHandle {
  chart: string
  refresh(): void
}

declare const DomBox: ForwardRefExoticComponent<{ title?: string } & RefAttributes<HTMLDivElement>>
export { DomBox }

declare const Chart: ForwardRefExoticComponent<{ options?: { title: string } } & RefAttributes<ChartHandle>>
export { Chart }

declare const NoRefPlain: (props: { label: string }) => JsxElement
export { NoRefPlain }
