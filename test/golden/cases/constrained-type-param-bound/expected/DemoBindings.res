@module("demo") external greet: (string) => unit = "greet"
@module("demo") external setSize: (ConstrainedTypeParamBoundTypes.constrainedTypeParamBoundSetSize) => unit = "setSize"
@module("demo") external echo: ('a) => 'a = "echo"
@module("demo") external identity: ('a) => unit = "identity"
// 🛑 BROKEN: `make` has an `unknown`/`any` in its signature — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@module("demo") external make: unit => string = "make"
// 🛑 BROKEN: `boxParam` has an `unknown`/`any` in its signature — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@module("demo") external boxParam: (string) => unit = "boxParam"
@module("demo") external boxRoundTrip: (ConstrainedTypeParamBoundTypes.wrap<'a>) => ConstrainedTypeParamBoundTypes.wrap<'a> = "boxRoundTrip"
@module("demo") external arrParam: (array<string>) => unit = "arrParam"
// 🛑 BROKEN: `unionParam` has an `unknown`/`any` in its signature — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@module("demo") external unionParam: (string) => unit = "unionParam"
@module("demo") external unionRoundTrip: (ConstrainedTypeParamBoundTypes.ConstrainedTypeParamBoundUnionRoundTripX.t) => ConstrainedTypeParamBoundTypes.ConstrainedTypeParamBoundUnionRoundTripX.t = "unionRoundTrip"
