// #242: an opaque-views union whose every arm is a NAMED record (named arms go to the views module to
// preserve the library's own type names, #62 — blend's `DataTableTypes.ColumnDefinition` is this shape
// at 20 arms, all declaring `field`/`header`). A field declared IDENTICALLY by every arm — same name,
// same emitted type, required in all — is always safe to read off the opaque `t`, so it gets a real
// `@get` reader and the consumer stops `%identity`-casting `t` to a one-field record. The gate is tight:
//
//   · `field`, `label`  — required `string` in all three arms  -> a reader each.
//   · `width`           — `float` in two arms, `string` in one  -> DIVERGENT type, no reader.
//   · `sortable`        — required in two arms, optional in one  -> DIVERGENT optionality, no reader.
//   · `maxChars`/`precision`/`icon` — arm-SPECIFIC               -> present in one arm only, no reader.
//
// Only REQUIRED shared fields get a reader: a bare `@get` on a maybe-absent prop would be unsound, so a
// field optional in EVERY arm is left out rather than widened to `option`.
type JsxElement = { __brand: 'element' }

interface TextColumn   { field: string; label: string; width: number; sortable: boolean; maxChars: number }
interface NumberColumn { field: string; label: string; width: number; sortable: boolean; precision: number }
interface DateColumn   { field: string; label: string; width: string; sortable?: boolean; icon: string }

export declare const Table: (props: {
    column?: TextColumn | NumberColumn | DateColumn
}) => JsxElement
