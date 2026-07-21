// #65: a discriminated-union props type with a CLEAN string discriminant (`mode`). The flattened form
// (see `discriminated-union-props`) makes every prop optional, losing that `selected` is required for
// mode="single" and `selectedValues` for mode="multi". With --variant-props we emit a `@tag("mode")`
// variant that RESTORES that guarantee (the compiler rejects a branch missing its required fields).
type JsxElement = { __brand: 'element' }
interface Base { label?: string; disabled?: boolean }
type SingleProps = Base & { mode: "single"; selected: string }
type MultiProps  = Base & { mode: "multi";  selectedValues: string[]; placeholder?: string }
type SelectItemProps = SingleProps | MultiProps
export declare const SelectItem: (props: SelectItemProps) => JsxElement

// #65 review: a branch with a GENERIC (`any`) or IMPERFECT field must NOT emit the variant — an inline
// record can't carry a free type var ("Unbound type parameter" compile break), and a lossy field would
// drop its ⚪/⚠️ flag. So this one FALLS BACK to the flattened all-optional form (which handles both).
type LoadingProps = { kind: "a"; payload: any }
type ReadyProps   = { kind: "b"; value: string }
type WidgetProps  = LoadingProps | ReadyProps
export declare const Widget: (props: WidgetProps) => JsxElement
