// String-literal unions -> `@as` variant enums, including the open-ended
// `"a" | "b" | (string & {})` form (the brand escape is dropped; it stays an enum).
type JsxElement = { __brand: 'element' }
type HTMLInputTypeAttribute = 'text' | 'password' | 'email' | (string & {})

export declare const StringEnums: (props: {
  size?: 'sm' | 'md' | 'lg'         // -> type size = @as("sm") Sm | …
  variant?: 'primary' | 'secondary' // -> type variant = @as("primary") Primary | …
  type?: HTMLInputTypeAttribute     // open union -> enum (the `string & {}` escape dropped)
}) => JsxElement
