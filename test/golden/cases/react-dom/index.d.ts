// React-valued and DOM-valued props. ReactNode/ReactElement -> React.element;
// ComponentType<P> -> React.component<p>; Element/Node/HTML*Element -> Dom.*;
// Element | DocumentFragment -> Dom.element (+ note); RefObject -> a React ref.
// (Element, Node, DocumentFragment, HTMLDivElement, HTMLInputElement are lib.dom.)
type JsxElement = { __brand: 'element' }
type ReactNode = JsxElement | string | number | null | undefined
type ComponentType<P> = (props: P) => JsxElement
type RefObject<T> = { current: T | null }

interface FilterProps {
  query: string
  onChange: (q: string) => void
}

export declare const ReactDom: (props: {
  children?: ReactNode                    // -> React.element
  icon?: ReactNode | ReactNode[]          // -> React.element
  filterComponent?: ComponentType<FilterProps> // -> React.component<filterProps>
  container?: Element                     // -> Dom.element
  node?: Node                             // -> Dom.node
  divRef?: HTMLDivElement                 // -> Dom.htmlDivElement
  inputRef?: RefObject<HTMLInputElement>  // -> React.ref<Nullable.t<Dom.element>>
  boundary?: Element | DocumentFragment   // -> Dom.element (+ ⓘ note: DocumentFragment unsupported)
}) => JsxElement
