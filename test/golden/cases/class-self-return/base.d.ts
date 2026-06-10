// The non-exported-from-the-entry base (the `HonoBase` analogue).
export declare class Base<T> {
  chain(value: T): Base<T>;
  reset(): this;
}
