// A bare `Function` sets `shared.usesJsFn` while a speculative type is built, but that type can then be
// discarded — here `makeBox<T>(): Box<T>` flags its return-only generic (rule #4), so the `Box` record
// (with a `cb: Function` -> JsFn.t field) is swept as an orphan. `usesJsFn` must be recomputed from the
// survivors so no unreferenced `JsFn.res` is emitted. The complete file set is the assertion: only
// DemoBindings.res, no JsFn.res, no orphan `*Types.res`. (#178)
interface Box<T> { cb: Function; v: T }
export declare function makeBox<T>(): Box<T>;
export declare function ping(): void;
