// A module (has exports → module mode) with functions whose returns are explicitly nullable. Covers the
// #194 `returnNode` fix directly in the golden suite: strictNullChecks is off, so `T | null`/`T | undefined`
// resolve to bare `T` — the fix recovers them from the syntactic return node (`| undefined` → option,
// `| null` → Nullable.t). Without a case like this the suite structurally can't observe the change; a real
// package (blend) does. (#194 review — jagguji)

export interface Thing {
  id: string;
}

// `| undefined` → option<string>
export declare function maybeLabel(id: string): string | undefined;

// `| null` → Nullable.t<thing>
export declare function findThing(items: Thing[], id: string): Thing | null;

// optional param + `| undefined` return (mirrors blend's toCssValue)
export declare function toCssValue(value?: string | number): string | undefined;

// non-nullable control — must stay bare `string`, never wrapped
export declare function requiredLabel(id: string): string;

// #194 review #2 — PARENTHESIZED `(T | null)` return must still recover (ParenthesizedTypeNode).
export declare function parenFind(id: string): (Thing | null);

// #194 review #1 — a CALLBACK param returning `Promise<T | null>` must recover the inner promise-arg null
// (the functionNode path), not just the top-level returnNode path.
export declare function subscribe(cb: () => Promise<Thing | null>): void;
