// augments the base `Point` from ./index — merged only when this file is a program root (--augment)
import './index'
declare module './index' {
  interface Point {
    x2?: number
    custom?: Record<string, number>
  }
}
