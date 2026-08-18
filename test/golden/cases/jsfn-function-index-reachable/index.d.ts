// A SURVIVING record whose `Function`-typed index signature is its only JsFn.t must keep JsFn.res.
// `[event: string]: Function` -> `@set_index …Set: (reg, string, JsFn.t)`, and that JsFn.t lives in
// the record's `indexValue` slot — which `entryChildTypes` omits — so the post-sweep usesJsFn recompute
// must scan indexValue too, else JsFn.res is dropped and the @set_index external dangles. (#178)
interface Reg { cb: () => void; [event: string]: Function }
export declare function useReg(r: Reg): void;
