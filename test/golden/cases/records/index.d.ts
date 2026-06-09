// Object types -> ReScript records. Anonymous objects are named after the prop
// (`itemConfig`); named interfaces keep their name; a self-referential interface
// becomes a `type rec`; `Partial<T>` is unwrapped to a record of optional fields.
type JsxElement = { __brand: 'element' }

interface MenuItemType {
  label: string
  value: string
  subItems?: MenuItemType[]   // self-reference -> `type rec menuItemType`
}

interface BaseProps {
  id: string
  className?: string
}

export declare const Records: (props: {
  point?: { x: number; y: number } // anonymous -> type pointConfig = { x: int, y: int }
  menu?: MenuItemType               // named, recursive -> menuItemType
  config?: Partial<BaseProps>       // Partial<T> unwrap -> all-optional record
}) => JsxElement
