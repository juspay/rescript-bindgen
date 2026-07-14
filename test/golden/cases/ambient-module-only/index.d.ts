// #109.1: an AMBIENT-MODULE-ONLY .d.ts (`declare module "pkg" { … }`, no top-level exports —
// common in older `@types/*`) has NO source module symbol, so bindgen crashed "No module symbol"
// and produced nothing. It now falls back to the ambient module declared in the file (matched to
// the `--from` package name) and binds its exports normally.
declare module "demo" {
  export function doThing(x: number): string
  export const VERSION: string
}
