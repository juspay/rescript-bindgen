// Main entry -> @module("demo"). A component consuming the shared Theme.
import { Theme } from "./theme"
type JsxElement = { __brand: 'element' }
export declare const Button: (props: { theme?: Theme; label: string }) => JsxElement
