// ============================================================================
// index.mjs — public library entry point for @juspay/rescript-bindgen.
//
// Import these to embed the generator in your own scripts/workflows instead of
// shelling out to the CLI. Typical use:
//
//   import { extractComponent, emit, report } from '@juspay/rescript-bindgen'
//   const ir   = extractComponent('node_modules/pkg/dist/Button.d.ts', { from: 'pkg' })
//   const code = emit(ir)          // ReScript source string
//   const { defects, review } = report(ir)
//
// Type definitions for all of these live in ../types.d.ts.
// ============================================================================

/** `extractComponent` / `extractModule` — read a .d.ts via the TS compiler API into an IR. */
export { extractComponent, extractModule } from './extract.mjs'

/** `emit` — component IR → ReScript · `emitFunction` — function-export IR → `@module external`
 *  · `emitClass` — class IR → a `@new`/`@send`/`@get` module · `report` — bucket props. */
export { emit, emitFunction, emitClass, report } from './emit.mjs'

/** `resolveInput` — locate/install a package's .d.ts entry from a file/dir/pkg spec. */
export { resolveInput } from './resolve.mjs'

/** `writeReport` — render the markdown `_REPORT.md` from emit.report output. */
export { writeReport } from './report.mjs'
