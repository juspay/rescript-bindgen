@module("@base-ui-components/react") external parentCheckbox: string = "PARENT_CHECKBOX"
@module("@base-ui-components/react") external useDirection: unit => DirectionProviderTypes.textDirection = "useDirection"
@module("@base-ui-components/react") external useMenuSubmenuRootContext: unit => SubmenuRootTypes.menuSubmenuRootContext = "useMenuSubmenuRootContext"
// ⚠️ REVIEW: `mergeProps` couldn't be auto-typed exactly — `string` placeholder(s) emitted. Match the real type by hand.
@module("@base-ui-components/react") external mergeProps: (string, string) => Dict.t<string> = "mergeProps"
// ⚠️ REVIEW: `mergePropsWithC` couldn't be auto-typed exactly — `string` placeholder(s) emitted. Match the real type by hand.
@module("@base-ui-components/react") external mergePropsWithC: (string, string, string) => Dict.t<string> = "mergeProps"
// ⚠️ REVIEW: `mergePropsWithCAndD` couldn't be auto-typed exactly — `string` placeholder(s) emitted. Match the real type by hand.
@module("@base-ui-components/react") external mergePropsWithCAndD: (string, string, string, string) => Dict.t<string> = "mergeProps"
// ⚠️ REVIEW: `mergePropsWithCAndDAndE` couldn't be auto-typed exactly — `string` placeholder(s) emitted. Match the real type by hand.
@module("@base-ui-components/react") external mergePropsWithCAndDAndE: (string, string, string, string, string) => Dict.t<string> = "mergeProps"
// ⚠️ REVIEW: `mergePropsN` couldn't be auto-typed exactly — `string` placeholder(s) emitted. Match the real type by hand.
@module("@base-ui-components/react") external mergePropsN: (array<string>) => Dict.t<string> = "mergePropsN"
@module("@base-ui-components/react") external makeEventPreventable: (PositionerSharedTypes.baseUIEvent) => PositionerSharedTypes.baseUIEvent = "makeEventPreventable"
@module("@base-ui-components/react") external mergeClassNames: (string, string) => string = "mergeClassNames"
@module("@base-ui-components/react") external useToastManager: unit => RootSharedTypes.useToastManagerReturnValue = "useToastManager"
@module("@base-ui-components/react") external createToastManager: unit => RootSharedTypes.toastManager = "createToastManager"
// 🛑 BROKEN: `useRender` has an `unknown`/`any` in its signature — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@module("@base-ui-components/react") external useRender: (string) => string = "useRender"
