// Two function-export fixes:
//  - Bug D (optional params): a `?` param can't be a positional external arg, so it binds as
//    a labeled `~name=?` with a trailing `unit` sentinel — `greet()`/`greet(~greeting=…)`.
//  - Bug C (return-only generic): a type parameter used ONLY in the return doesn't round-trip,
//    so `'a` would be unsound (a caller could pick any type while the runtime value is fixed).
//    `makeId<T extends string>()` demotes `T` to its constraint -> `string`, NOT `'a`.
//    `pluck<T>(items: T[], …)` keeps `'a` because `T` DOES round-trip (it's in a param).
export declare function greet(name: string, greeting?: string): string
export declare function makeId<T extends string>(size?: number): T
export declare function pluck<T>(items: T[], index: number): T
