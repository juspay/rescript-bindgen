// 🛑 BROKEN: `makeBox` has an `unknown`/`any` in its signature — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@module("demo") external makeBox: unit => string = "makeBox"
@module("demo") external ping: unit => unit = "ping"
