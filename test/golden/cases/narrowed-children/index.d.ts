// A component that NARROWS `children` to `string | number` while extending a base whose
// `children?: ReactNode` is inherited. The merge resolves to `ReactNode & (string | number)`,
// which TS distributes to `string | number | (ReactElement & string) | (ReactPortal & number) | …`.
// The `<reactType> & <primitive>` parts are uninhabitable DISTRIBUTION ARTIFACTS; the real type is
// `string | number`, so `children` must be `CommonTypes.stringOrNumber`, NOT the lossy `React.element`.
// (#64) A GENUINE `children?: ReactNode` (Plain, below) stays `React.element`.
interface ReactElement {
  type: string
}
interface ReactPortal {
  key: string
}
type ReactNode = ReactElement | ReactPortal | string | number | boolean | null | undefined
type JsxElement = { __brand: 'element' }

interface BaseProps {
  children?: ReactNode
  label?: string
}

// own `children: string | number` merged with inherited `children?: ReactNode` -> stringOrNumber
export declare const Tab: (props: BaseProps & { children: string | number }) => JsxElement

// genuine ReactNode children -> React.element (unaffected)
export declare const Panel: (props: { children?: ReactNode; title?: string }) => JsxElement
