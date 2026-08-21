@module("demo") external greet: (string) => unit = "greet"
@module("demo") external setSize: (ConstrainedTypeParamBoundTypes.constrainedTypeParamBoundSetSize) => unit = "setSize"
@module("demo") external echo: ('a) => 'a = "echo"
@module("demo") external identity: ('a) => unit = "identity"
// 🛑 BROKEN: `make` has an `unknown`/`any` in its signature — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@module("demo") external make: unit => string = "make"
