@module("@base-ui-components/react") @react.component
external make: (
  // 🛑 BROKEN: `children` is `(item: any, index: number) => ReactNode` — contains `any`; emitted as `string` placeholder and WON'T WORK. Needs a concrete type upstream.
  ~children: string,
) => React.element = "ComboboxCollection"
