@module("@base-ui-components/react") external useDirection: unit => DirectionProviderTypes.textDirection = "useDirection"
@module("@base-ui-components/react") external useMenuSubmenuRootContext: unit => SubmenuRootTypes.menuSubmenuRootContext = "useMenuSubmenuRootContext"
// ⚠️ REVIEW: `mergeProps` couldn't be auto-typed exactly — `string` placeholder(s) emitted. Match the real type by hand.
@module("@base-ui-components/react") external mergeProps: (string, string) => Dict.t<string> = "mergeProps"
// ⚠️ REVIEW: `mergePropsN` couldn't be auto-typed exactly — `string` placeholder(s) emitted. Match the real type by hand.
@module("@base-ui-components/react") external mergePropsN: (array<string>) => Dict.t<string> = "mergePropsN"
@module("@base-ui-components/react") external makeEventPreventable: (PositionerTabUtilsTypes.baseUIEvent) => PositionerTabUtilsTypes.baseUIEvent = "makeEventPreventable"
@module("@base-ui-components/react") external mergeClassNames: (string, string) => string = "mergeClassNames"
@module("@base-ui-components/react") external useToastManager: unit => ComponentsMenubarRootStoreToastTypes.useToastManagerReturnValue = "useToastManager"
@module("@base-ui-components/react") external createToastManager: unit => ComponentsMenubarRootStoreToastTypes.toastManager = "createToastManager"
// ⚪ loose: `useRender` has a param/return widened to `string`.
@module("@base-ui-components/react") external useRender: (UseRenderTypes.parameters<'a, 'c>) => string = "useRender"
