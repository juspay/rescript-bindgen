// A DEFAULT export must bind the JS name `= "default"`, NOT the resolved identifier — binding
// `= "greet"`/`= "index"` would call `require("pkg").greet`, which doesn't exist (the value is
// the default export). The ReScript id still uses the declaration's own name (`greet`), and a
// flag is emitted because a CJS `module.exports = greet` package would instead expose the value
// as the module itself (so `.default` would be undefined) — a case the consumer must verify.
// The named `helper` export is the contrast: it binds positionally as `= "helper"`.
export declare function helper(x: number): number
export default function greet(name: string): string
