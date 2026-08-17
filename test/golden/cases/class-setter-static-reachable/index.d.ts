// A shared type reachable ONLY through a write-only setter (`onlyViaSetter`) or a static member
// (`onlyViaStatic`) must survive the reachability sweep — each emits a `@set`/`@scope` external, so
// dropping the type would dangle the reference. Guards the class-member root set. (#191)
export interface OnlyViaSetter { a: number; b: string }
export interface OnlyViaStatic { x: boolean }
export declare class Widget {
  set config(v: OnlyViaSetter)
  static build(opts: OnlyViaStatic): Widget
  ping(): number
}
