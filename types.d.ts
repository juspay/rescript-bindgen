// Type definitions for @juspay/rescript-bindgen
// A deterministic TypeScript -> ReScript binding generator.

/** A node in the intermediate representation of a prop/field type. */
export type IRType =
  | { kind: 'string' }
  | { kind: 'number'; _float?: boolean }
  | { kind: 'boolean' }
  | { kind: 'reactElement' }
  | { kind: 'style' }
  | { kind: 'date' }
  | { kind: 'domElement' }
  | { kind: 'domRef' }
  | { kind: 'unit' }
  | { kind: 'typeRef'; to: string; _enum?: boolean; _unboxed?: boolean }
  | { kind: 'array'; of: IRType }
  | { kind: 'dict'; of: IRType }
  | { kind: 'callback'; arg: IRType | { kind: 'event'; res: string }; ret: IRType }
  /** Complex but real type, widened to a fallback (default `string`). */
  | { kind: 'opaque'; text: string }
  /** Multi-type union we refuse to bind unsafely — flagged for human review. */
  | { kind: 'review'; text: string }
  /** unknown / any — upstream type defect, never silently typed. */
  | { kind: 'unknown' }
  | { kind: 'any' }

export interface EnumDecl {
  name: string
  members: { as: string; ctor: string }[]
}

export interface RecordDecl {
  name: string
  fields: { name: string; optional: boolean; type: IRType }[]
}

/** An `@unboxed` declaration: an untagged union or a zero-cost branded-primitive wrapper. */
export interface UnboxedDecl {
  name: string
  members: { ctor: string; type: IRType }[]
}

export interface PropIR {
  name: string
  optional: boolean
  inherited: boolean
  type: IRType
  /** Resolved TS type string (for reports). */
  tsType?: string
  /** Original `.d.ts` declaration text (for reports). */
  declText?: string
}

export interface ComponentIR {
  module: string
  import: { from: string; name: string }
  kind: 'react-component'
  enums: EnumDecl[]
  records: RecordDecl[]
  unboxed: UnboxedDecl[]
  props: PropIR[]
}

/** IR for a standalone function / const-with-call-signature export (generic TS). */
export interface FunctionIR {
  module: string
  import: { from: string; name: string }
  kind: 'function'
  enums: EnumDecl[]
  records: RecordDecl[]
  unboxed: UnboxedDecl[]
  /** The classified call signature: params (name + optionality + type) + return type.
   *  Required params bind positionally; optional ones bind as labeled `~name=?`. */
  sig: { params: ParamIR[]; ret: IRType }
}

/** A labeled-argument member (class constructor / method param): name + optionality + type. */
export interface ParamIR {
  name: string
  optional: boolean
  type: IRType
}

/** IR for an exported class (generic TS) — bound as a module with an abstract `type t`. */
export interface ClassIR {
  module: string
  import: { from: string; name: string }
  kind: 'class'
  enums: EnumDecl[]
  records: RecordDecl[]
  unboxed: UnboxedDecl[]
  /** This class's abstract type name in the `InstanceTypes` sink — `type t` aliases it. */
  sinkName: string
  /** First construct signature's params (`@new ... make`), or null if no usable constructor. */
  ctor: { params: ParamIR[] } | null
  /** Instance methods (`@send`): each a JS name + labeled params + return type. */
  methods: { jsName: string; params: ParamIR[]; ret: IRType }[]
  /** Data properties / getters (`@get`): each a JS name + its type. */
  getters: { jsName: string; type: IRType }[]
}

export interface ExtractOptions {
  /** `@module(...)` import name stamped into the binding. */
  from?: string
  /** Override the component/import name. */
  importName?: string
  /** Inherited HTML/ARIA props to keep (default: a common allowlist). */
  htmlAllowlist?: string[]
}

export interface EmitOptions {
  /** ReScript type emitted for DOM refs. */
  refType?: string
  /** Fallback type for opaque/review props (default `'string'`). */
  opaqueFallback?: string
}

export interface ReportItem {
  prop: string
  kind: 'opaque' | 'review' | 'unknown' | 'any'
  tsType?: string
  declText?: string
  emittedAs?: string
}

export interface Report {
  /** Real types widened to a fallback — compile & work, just loosely typed. */
  loose: ReportItem[]
  /** unknown/any — won't work as typed; fix upstream. */
  defects: ReportItem[]
  /** Multi-type props that need a hand-written binding. */
  review: ReportItem[]
}

/** Extract a single component from a per-component `.d.ts`. */
export function extractComponent(entryFile: string, opts?: ExtractOptions): ComponentIR

/** Extract every exported React component + standalone function from a module's entry `.d.ts`. */
export function extractModule(
  entryFile: string,
  opts?: ExtractOptions
): {
  components: { name: string; ir: ComponentIR }[]
  functions: { name: string; ir: FunctionIR }[]
  classes: { name: string; ir: ClassIR }[]
  skipped: { name: string; reason: string }[]
}

/** Render a ComponentIR to ReScript source. */
export function emit(ir: ComponentIR, options?: EmitOptions): string

/** Render a FunctionIR to a ReScript `@module external` binding. */
export function emitFunction(ir: FunctionIR, options?: EmitOptions): string

/** Render a ClassIR to a ReScript module (abstract `type t` + `@new`/`@send`/`@get`). */
export function emitClass(ir: ClassIR, options?: EmitOptions): string

/** Summarise which props are loose / defective / need review. */
export function report(ir: ComponentIR): Report

/** Resolve a CLI input (file / dir / pkg) to a declaration entry file. */
export function resolveInput(opts: {
  file?: string
  dir?: string
  pkg?: string
  install?: boolean
  nodeModulesRoots?: string[]
}): { entry: string; from?: string; untyped?: boolean }
