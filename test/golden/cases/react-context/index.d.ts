// A `React.Context<T>` VALUE export. React 19 makes a context renderable (`<Ctx value=…>`), so
// its type carries element-returning call signatures — which previously misclassified it as a
// `@react.component` taking `value`+`children`, hiding that the runtime export is a Context
// object (used `<Ctx.Provider value=…>` / `useContext(Ctx)`). It now binds faithfully as the
// context VALUE: `external themeContext: React.Context.t<themeValue> = "ThemeContext"`. (#63 C6)
interface ReactNode {
  __brand: 'node'
}
interface Provider<T> {
  (props: { value: T; children?: ReactNode }): ReactNode
}
interface Context<T> {
  Provider: Provider<T>
  // React 19: the Context itself is renderable, giving it an element-returning call signature.
  (props: { value: T; children?: ReactNode }): ReactNode
}

interface ThemeValue {
  mode: string
  scale: number
}

export declare const ThemeContext: Context<ThemeValue>
