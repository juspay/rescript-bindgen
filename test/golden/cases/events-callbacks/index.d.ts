// Callbacks and event handlers, in both forms:
//  - inline `(e: SomeEvent) => void`        -> the matching ReactEvent type
//  - `*EventHandler<T>` alias               -> the matching ReactEvent type (by alias name)
// Plus a `void | Promise<void>` return (-> polymorphic `'a`) and a plain multi-arg
// callback. (MouseEvent/HTMLInputElement/HTMLDivElement are lib.dom; the alias and
// ChangeEvent stubs are recognized by name — the alias must use `T` in its body so
// TypeScript keeps the alias name through instantiation.)
type JsxElement = { __brand: 'element' }
interface ChangeEvent<T> { target: T }
type ChangeEventHandler<T> = (event: ChangeEvent<T>) => void
type KeyboardEventHandler<T> = (event: ChangeEvent<T>) => void

export declare const EventsCallbacks: (props: {
  onClick?: (e: MouseEvent) => void                  // inline   -> ReactEvent.Mouse.t => unit
  onChange?: ChangeEventHandler<HTMLInputElement>    // alias    -> ReactEvent.Form.t => unit
  onKeyDown?: KeyboardEventHandler<HTMLDivElement>   // alias    -> ReactEvent.Keyboard.t => unit
  onSelect?: (value: string, index: number) => void  // multi    -> (string, int) => unit
  onSubmit?: () => void | Promise<void>              // async    -> unit => 'a
  onImageError?: (e: Error) => void                  // global Error -> JsError.t => unit (#63)
}) => JsxElement
