type t = InstanceTypes.collapsed
@new @module("demo") external make: unit => t = "Collapsed"
// ⚪ loose: `putNested` has a param/return widened to `string`.
@send external putNested: (t, ~name: string, ~v: string) => GenericInstantiationDistinctTypes.nestedTag = "putNested"
@send external nestedParam: (t, ~o: GenericInstantiationDistinctTypes.genericInstantiationDistinctOConfig) => unit = "nestedParam"
// ⚪ loose: `arrayParam` has a param/return widened to `string`.
@send external arrayParam: (t, ~names: array<string>) => string = "arrayParam"
@send external onlyOne: (t, ~name: [#"Content-Type"]) => [#"just-one"] = "onlyOne"
