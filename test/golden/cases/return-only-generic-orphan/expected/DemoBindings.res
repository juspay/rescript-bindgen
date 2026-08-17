// 🛑 BROKEN: `jsonBoxed` has an `unknown`/`any` in its signature — emitted with `string` placeholder(s) and WON'T WORK. Needs a concrete type upstream.
@module("demo") external jsonBoxed: unit => string = "jsonBoxed"
@module("demo") external readBox: unit => ReturnOnlyGenericOrphanTypes.boxOf = "readBox"
