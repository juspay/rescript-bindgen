type JsxElement = { __brand: 'element' }

export declare const Gadget: (props: {
  // SAME `{width,height}` shape as Widget.badge — but a DIFFERENT component, so it gets its own
  // config in GadgetTypes (a distinct name), NOT merged into WidgetTypes.
  badge?: { width: string; height: string }
}) => JsxElement
