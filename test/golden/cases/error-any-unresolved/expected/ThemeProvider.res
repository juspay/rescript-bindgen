@module("demo") @react.component
external make: (
  // 🛑 BROKEN: `foundationTokens`'s declared type DOES NOT RESOLVE (broken import in the package's .d.ts — see the declaration in the report); emitted as `string` placeholder. Fix the upstream import or hand-match the real type.
  ~foundationTokens: string=?,
  ~name: string=?,
) => React.element = "ThemeProvider"
