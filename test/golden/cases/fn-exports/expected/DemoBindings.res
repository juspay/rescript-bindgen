@module("demo") external add: (float, float) => float = "add"
@module("demo") external greet: (string) => string = "greet"
@module("demo") external now: unit => float = "now"
@module("demo") external forEach: (array<float>, (float, float) => unit) => unit = "forEach"
@module("demo") external translate: (FnExportsTypes.point, float, float) => FnExportsTypes.point = "translate"
@module("demo") external renderThing: (FnExportsTypes.point, FnExportsTypes.point) => Dom.element = "renderThing"
// ⚪ loose: `getSlots` has a param/return widened to `string`.
@module("demo") external getSlots: (FnExportsTypes.point) => string = "getSlots"
