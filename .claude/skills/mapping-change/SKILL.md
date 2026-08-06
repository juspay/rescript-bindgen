---
name: mapping-change
description: Rules and traps for adding or changing a TypeScript→ReScript mapping in rescript-bindgen — the union/variant decision table, the flag-don't-fake contract, the required maintenance loop (docs row + fixture + goldens + compile + benchmark), and the specific failure modes that have bitten before (registry side effects, checker-resolution churn, @as tags, position matrix). Use whenever touching src/extract.mjs, src/emit.mjs or src/resolve.mjs, or when asked how a TS shape should map to ReScript.
---

# Changing a mapping in rescript-bindgen

`docs/TYPE_MAPPING.md` is the contract, not documentation. Read the relevant section before
editing, and update it in the same commit. CI enforces it: a PR touching
`src/extract|emit|resolve.mjs` must also touch `test/golden/cases/` or `docs/TYPE_MAPPING.md`.

## The two hard rules

1. **No unsafe casts.** Never emit `Obj.magic`, `@unwrap`, or a bare `%identity`. The only allowed
   `%identity` are an opaque module's zero-cost `from*`/`as*` views and the `<prop>Fn` render-prop
   wrapper (#46). The golden suite's `checkNoStrayIdentity` enforces this.
2. **Flag, don't fake.** If a shape can't be modelled exactly, emit a `string` placeholder + comment
   and bucket it (⚪ loose / 🔍 review / 🛑 broken). A confident-looking type that is wrong for some
   inputs is worse than a flagged one — it fails silently, in production, with no diagnostic.

Rule 2 is the one that gets violated by accident. Watch for it whenever you "merge" several
candidate types into one: taking the first, or letting the checker intersect them, invents a type
no real value satisfies.

## Discriminated unions: the decision table (#63 C2 / #65 / #167 / #169)

`Base & (A | B)` is distributed by TS into a **union of full intersections** before bindgen sees it.
`getProperties()` on a union returns only the props common to **every** arm — this is the trap that
silently dropped fields and crashed blend's DataTable (#167).

Preference order, best first:

| Mapping | When | Guarantee |
|---|---|---|
| **`@tag` variant** with inline-record branches | clean string discriminant + arms whose member sets differ + ≤ 12 arms + every branch field concretely typed + no inherited DOM attrs | lossless — per-arm requiredness enforced by the compiler |
| **one flattened record**, arm-specific fields optional | no clean discriminant, or a generic/lossy branch field, or > 12 arms | complete, but can't say "required only in this arm" |
| **flagged placeholder** | a multi-arm field whose arms are functions (see below) | honest; bucketed in the report |

Position matters — three different code paths, all must be considered:

- **component props** → `buildComponentIR` flattens by default; the `@tag` variant is **opt-in via
  `--variant-props`**, because a props variant changes how the component is *rendered*
  (`React.createElement(make, Aligned({…}))` instead of JSX).
- **record field / prop type** → `classify`'s union branch → variant by default, flatten as fallback.
- **array element** → `classify`'s array branch calls `opaqueUnion` **directly**, bypassing the union
  branch. A hook added to the union branch will not fire here (#169 was exactly this miss).

## Traps that have actually bitten

**`classify` has registry side effects.** It mints records, enums and opaque modules as it resolves.
Any *speculative* build that can bail must be wrapped in the snapshot/rollback pattern
(`trialVendorRecord`, #39/#33) — restoring `entries`, `byKey`, `bySig`, `names` and `typeVars`.
Skipping it stranded +50 orphan types (and unreferenced Highcharts modules) in blend.

**Resolving a type in a *gate* reorders unrelated output.** Calling
`checker.getTypeOfSymbolAtLocation` while deciding *whether* a mapping applies forces resolution
earlier than the rest of the pipeline expects, and TS's member order shifts — it moved record fields,
enum members and polyvar tags across blend's 3300 shared types, in files the change had nothing to do
with. Read declaration nodes **syntactically** in gates (`ts.isLiteralTypeNode(d.type)`), and keep the
cheap name-only checks first. Reading member *names* (`getProperties()`) is safe; resolving their
*types* is not.

**A `@tag` variant's runtime tag comes from `@as`, never the constructor name.** Without
`@as("bezier")` the emitted value is `{transitionType: "Bezier"}` (capital B) and every consumer
check misses, silently taking a fallback branch. Always drive the tag from the TS string literal.

**A record field's flag comment reads `type.text`, not `type.note`.** `looseMark`/`findLooseText`
(emit.mjs) read `text`; `findNote` is only called from `propLine`, the component-props path. A
`review` node created for a record field with only `note` set renders as bare boilerplate and the
cause is lost.

**Only object-ish arms have harvestable members.** `getProperties()` on a primitive arm goes through
`getApparentType` and returns the whole prototype (a `string` arm yields 52 lib.es members). Guard
with `arm.flags & (ts.TypeFlags.Object | ts.TypeFlags.Intersection)` before harvesting — and note
`hasHtml` is computed *before* the `isInherited` filter, so leaked prototype members can staple a
spurious `...JsxDOM.domProps` onto a record.

**A function union is not unionable.** TS resolves a call on a union of signatures by **intersecting**
its parameters, so `(d: Date) => void | (d: Date[]) => void` yields a first param of `Date & Date[]` —
a signature no arm accepts. Flag it, or give each arm its own variant branch.

## Required loop for every mapping change

Not done until all of these pass:

```bash
npm test                    # smoke + golden snapshot
npm run test:golden:update  # after an INTENTIONAL change — then read the diff line by line
npm run test:compile        # every golden must compile on ReScript
npm run bench               # 9 real packages vs committed baselines
npm run bench:update        # accept intentional output changes; commit the baseline diff in the SAME PR
```

Two things about this loop:

- **`--update` rewrites every golden.** Running `npm test` afterwards compares updated-to-updated and
  always passes. Always `git diff` the goldens; an unrelated fixture changing is a signal, not noise.
- **The benchmark is the only real-world gate**, and its baselines are *pinned versions*. A type
  introduced in a newer release is invisible to it — generate against the actual package
  (`npm i <pkg>@<version>` in a scratch dir, then run the local CLI) before claiming a fix works.

## Verifying a ReScript shape before you emit it

Don't reason about ReScript syntax and semantics — compile it. `test/sandbox` is a ready project:
write a `.res` into `test/sandbox/src/probe/`, run `npx rescript build` there, and **read the emitted
`.res.mjs`** to confirm the runtime shape is what the JS library expects. Delete the probe after.
This is how the `@tag` variant's flat-object-with-tag runtime (and its legality on an `and` clause,
and as a record field) was established rather than assumed.
