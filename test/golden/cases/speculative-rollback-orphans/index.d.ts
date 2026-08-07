// #178 — A REJECTED SPECULATIVE MAPPING MUST LEAVE NO TRACE.
//
// `unionNode` tries an `@unboxed` variant first, and building the candidate calls `memberOf` ->
// `classify` for each object arm, which REGISTERS records. The candidate is then rejected when two
// arms land in the same JS `typeof` bucket — `{left}` and `{right}` are both objects, so no untagged
// variant can discriminate them. The prop correctly falls back, but the speculatively-registered
// records used to SURVIVE: generation reported "2 unique types" and wrote a *Types.res that nothing
// referenced. Now the candidate pass runs inside a `registryTrial` and rolls back, so a rejected
// mapping leaves no registry or emission side effect — the file set itself is part of the assertion
// here (there must be NO shared-types module for this case).
type JsxElement = { __brand: "element" }

type Leaked =
    | { left: string }
    | { right: number }

export declare const LeakProbe: (props: { value?: Leaked }) => JsxElement
