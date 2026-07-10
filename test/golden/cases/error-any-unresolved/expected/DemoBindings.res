// 🛑 BROKEN: `getTabsTokens` has a param/return whose declared type DOES NOT RESOLVE (broken import in the package's .d.ts) — `string` placeholder(s) emitted. Fix the upstream import or hand-match the real type.
@module("demo") external getTabsTokens: (string) => string = "getTabsTokens"
@module("demo") external legitAny: ('a) => string = "legitAny"
