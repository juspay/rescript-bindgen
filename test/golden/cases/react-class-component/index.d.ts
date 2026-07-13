// React CLASS components (#101): `class X extends React.Component<Props>`. Its export type has
// CONSTRUCT signatures, not call signatures, so `isReactComponent` (call-sig based) missed it and it
// bound as an unusable `@new external make: unit => t` + `@send render` — wrong ctor arity, can't be
// used in JSX. React renders a class component identically to an FC, so it now binds
// `@react.component external make` from its Props. Heritage is name-matched `^(Pure)?Component$`
// (like the real @types/react). Still ships in react-slick / react-datepicker / draft-js / recharts v1.
import { Component, PureComponent } from './react'
type ReactNode = { __brand: 'node' }
type JsxElement = { __brand: 'element' }

interface SliderProps { value: number; onChange?: (v: number) => void; disabled?: boolean }
export declare class Slider extends Component<SliderProps> {
  render(): ReactNode
}

// PureComponent is a class component too.
interface BadgeProps { count: number; label?: string }
export declare class Badge extends PureComponent<BadgeProps> {
  render(): ReactNode
}

// render-fallback: extends Component with NO props type arg → props come from the constructor.
export declare class Legacy extends Component {
  constructor(props: { title: string })
  render(): JsxElement
}

// CONTROL: a plain (non-React) class must still bind as `@new`/`@send`/`@get`, untouched.
export declare class Store {
  constructor(initial: number)
  get(): number
  set(v: number): void
  readonly size: number
}

// CONTROL (rev): a canvas/chart/D3-style widget has `render(): *Element` + a constructor but does
// NOT extend Component — it must NOT be mistaken for a React component (the fallback is gated on the
// Component heritage, not on render() alone). Binds as a normal `@new`/`@send` class.
export declare class ChartWidget {
  constructor(options: { width: number; height: number })
  render(): JsxElement
  destroy(): void
}
