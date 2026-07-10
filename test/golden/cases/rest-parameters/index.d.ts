// Rest parameters are a JS CALLING-CONVENTION feature, not optional array parameters (#105).
// Homogeneous final rests bind through `@variadic`, which lets ReScript callers pass an array
// while spreading its elements into separate positional arguments at the JavaScript boundary.

// rest-only function declaration
export declare function collect(...items: string[]): string

// fixed positional prefix + rest
export declare function format(prefix: string, ...values: number[]): string

// optional labeled prefix + rest — the final array replaces the usual optional `unit` sentinel
export declare function configure(label?: string, ...flags: boolean[]): void

// generic rest keeps the round-tripping type variable
export declare function collectGeneric<T>(...items: T[]): T[]

// const-with-call-signature follows the same standalone-function path
export declare const join: (...parts: string[]) => string

// `@new @variadic` and `@send @variadic` use the shared ParamIR rest marker too
export declare class VariadicBox {
  constructor(prefix: string, ...values: number[])
  append(separator: string, ...values: string[]): string
}

// A typed event emitter's indexed tuple rest is unsupported, but it must remove ONLY `emit` —
// the constructor and sibling methods remain useful class bindings.
interface BusEvents {
  data: [payload: string, attempts: number]
}
export declare class Bus {
  constructor(name: string)
  on(event: string): void
  emit<K extends keyof BusEvents>(event: K, ...args: BusEvents[K]): boolean
  close(): void
}

// The same isolation applies to a bad constructor: keep the abstract type and methods, omit make.
export declare class TupleCtor {
  constructor(...args: [name: string, size: number])
  info(message: string): void
}

// Heterogeneous tuple rests cannot be represented by ReScript's homogeneous `@variadic` array.
// This export must be explicitly skipped instead of passing one tuple argument to JavaScript.
export declare function mixed(...args: [string, number]): void
