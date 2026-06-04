# TypeScript Compiler API — learning demos

Three runnable scripts that show how the tool reads TypeScript. Each writes a tiny
`.d.ts`, runs the TypeScript compiler on it, and prints what the **checker** returns
at each step. Edit the fixtures and re-run to experiment.

```bash
node test/ts-demo.mjs            # basics: symbol → type → flags
node test/ts-demo-nested.mjs     # nested types (arrays, callbacks, objects)
node test/ts-demo-advanced.mjs   # intersection (A & B), Omit, generics
```

The one move you'll see everywhere:
`checker.getTypeOfSymbolAtLocation(symbol)` = **"I have a name → tell me what it is."**

---

## 1. Basics — `ts-demo.mjs`

**Fixture**
```ts
export declare const Box: (props: {
  label: string;
  size?: 'sm' | 'lg';
  width?: string | number;
}) => any;
```

**Output**
```
STEP 2: checker.getExportsOfModule(file) → ["Box"]

STEP 3: take the `Box` SYMBOL → its TYPE
  boxSym.getName()          → "Box"                         (SYMBOL = a name)
  getTypeOfSymbolAtLocation → "(props: {...}) => any"       (TYPE = what it is)

STEP 4: a component is a function → grab its props param
  getCallSignatures()[0].parameters[0] → the "props" parameter
  its TYPE → "{ label: string; size?: "sm" | "lg"; width?: string | number; }"

STEP 5: checker.getPropertiesOfType(props) → ["label","size","width"]

STEP 6: inspect each prop
  • label   optional=false  type="string"          flags=[String]
  • size    optional=true   type=""sm" | "lg""      flags=[Union]
        └ member: ""sm""  value="sm"
        └ member: ""lg""  value="lg"
  • width   optional=true   type="string | number"  flags=[Union]
        └ member: "string"
        └ member: "number"
```

**Takeaway:** `Symbol` (a name) → `getTypeOfSymbolAtLocation` → `Type` (the meaning).
A Type's `flags` tell you its category (`String`, `Union`, …); a Union's `.types`
gives its members; a string-literal member's `.value` is the literal text.

---

## 2. Nested types — `ts-demo-nested.mjs`

**Fixture (excerpt)**
```ts
export declare const Card: (props: {
  tags?: string[];                          // array
  ids?: (string | number)[];                // array of union
  onPick?: (id: number) => void;            // callback
  style?: { color?: string; size?: number };// nested object
  author?: { name: string; contact?: { email: string } }; // deeply nested
  items?: { id: string; count: number }[];  // array of objects
}) => any;
```

**Output**
```
tags?: ARRAY of ↓
  element: string
ids?: ARRAY of ↓
  element: UNION of ↓
    member0: string
    member1: number
onPick?: FUNCTION (1 param) → void
  arg id: number
style?: OBJECT { ↓
  color?: string
  size?: number
}
author?: OBJECT { ↓
  name: string
  contact?: OBJECT { ↓        ← object inside an object
    email: string
  }
}
items?: ARRAY of ↓
  element: OBJECT { ↓
    id: string
    count: number
  }
```

**Takeaway:** a Type can *contain* other Types. You get the inner one(s) with a
method per container, and each inner thing is a Type too — so you repeat:

| Container | Get what's inside |
|---|---|
| Union | `type.types` |
| Array | `checker.getTypeArguments(type)[0]` |
| Object | `type.getProperties()` → Symbol → Type each |
| Function | `getCallSignatures()[0]` → params + return |

"Nested" = the same 5 questions asked again one level deeper (recursion).

---

## 3. Intersection, Omit, generics — `ts-demo-advanced.mjs`

**Fixture (excerpt)**
```ts
type Base = { id: string; className?: string };
type Clickable = { onClick?: () => void; disabled?: boolean };
type OwnProps  = Base & Clickable & { variant: 'a' | 'b' };
type FinalProps = Omit<OwnProps, 'className'> & { extra?: number };

export declare const Widget: (props: FinalProps) => any;
export declare const Table:  (props: {
  rows: Array<Record<string, number>>;
  lookup?: Record<string, string>;
}) => any;
```

**Output**
```
INTERSECTION + Omit: `Widget`
  The .d.ts says:  Omit<Base & Clickable & {variant}, "className"> & {extra}
  getPropertiesOfType resolves it to a FLAT list:
   • id           : string
   • onClick?     : () => void
   • disabled?    : boolean
   • variant      : "a" | "b"
   • extra?       : number
  → `className` is GONE (Omit applied); id/onClick/variant/extra all merged.

GENERICS: `Table`
   • rows     : Record<string, number>[]
        └ array element: Record<string, number>
   • lookup?  : Record<string, string>
  → the checker unwrapped Array<...> and Record<K,V> into their inner types.
```

**Takeaway:** `getPropertiesOfType` doesn't read text — it **computes** the type's
real members. Intersections (`A & B`) merge, `Omit` removes keys, generics
(`Array<…>`, `Record<K,V>`) unwrap — all resolved by the checker before you ever
see them. This is exactly what makes the binding complete and correct.

---

## The whole loop, in one line

> Get a **Type** → ask which category it is (`flags`) → if it's a container, get the
> inner Type(s) and repeat. The checker always hands you the next Type down.

That loop is what `classify()` in `src/extract.mjs` does for real.
