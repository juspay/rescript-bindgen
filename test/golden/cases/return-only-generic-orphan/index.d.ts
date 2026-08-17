// A type parameter that appears ONLY in the return position can't round-trip (contract rule #4), so
// the return is flagged (`unit => string`). The record `classify` registered while building that
// discarded return (`boxOf<'a>`) must NOT be emitted as an orphan — a post-traversal reachability
// sweep drops it, and the concrete sibling reclaims the clean base name `boxOf`. (#191)
interface BoxOf<T> { v: T }
export declare function jsonBoxed<T>(): BoxOf<T>;
export declare function readBox(): BoxOf<string>;
