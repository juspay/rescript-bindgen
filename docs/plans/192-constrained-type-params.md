# Plan — #192: resolve constrained type-parameter bounds (soundly, without losing round-trips)

Status: **DRAFT for review** — no non-doc code should merge until this is signed off.
Branch: `agent/192-constrained-type-params`
Depends on: #190 (merged in #193) — the naming blocker that deferred this is now gone.

---

## 0. In plain English (read this first)

**The one-line story:** when a library says *"you must hand me a string,"* our tool currently forgets
that rule and tells ReScript *"hand me anything."* So ReScript happily lets you pass a **number**
where the library demands a **string** — the code compiles, then breaks. This fixes that.

### The issue — an everyday analogy
Think of a generic type parameter as a **fill-in-the-blank** the library puts on a function:

> `fnConstrained<T extends string>(x: T): T`  →  *"Give me some value of type **T**, where **T** must
> be a string. I'll give you back the same **T**."*

The `extends string` part is a **promise the library makes you keep** ("the blank can only be filled
with a string"). Our tool throws that promise away and writes the ReScript blank as `'a` — ReScript's
word for *"literally any type."* Result:

- **What TypeScript allows:** `fnConstrained("hi")` ✅, `fnConstrained(42)` ❌ (rejected — 42 isn't a string).
- **What our binding allows:** `fnConstrained("hi")` ✅, `fnConstrained(42)` ✅ **(wrongly compiles!)**.

So the binding is **more permissive than the real library** — it green-lights calls the library will
refuse. Our project's rulebook (`CLAUDE.md`) explicitly forbids this ("never emit a plausible-but-wrong
type"). And it's **inconsistent**: the exact same TypeScript gets handled four different ways depending
on whether it's a plain function, a method, a `static`, or a constructor.

### The approach — honor the promise, with one careful exception
1. **Honor the constraint.** When the library says `<T extends string>`, write the blank as `string`
   (or, for `<T extends "a" | "b" | "c">`, the exact little set of allowed values) — **not** `'a`.
   Now the binding refuses `42` just like the library does.
2. **The one exception — "round-trips."** Sometimes a generic means *"whatever type you give me, I
   give you back **the same type**"* — the value goes **in and comes back out unchanged**. Example:
   `getSkeletonDefaults<T>(props: T, …): T`. Here `'a` ("any type") is actually the **right** answer,
   because pinning it to a concrete type would force you to re-label a value whose type you already
   knew. So: **resolve the constraint everywhere, EXCEPT when the value round-trips in-and-out — there
   we keep `'a`.**
3. **One rule for all four shapes** (function / method / static / constructor), so they stop
   disagreeing.

Rule of thumb: *`'a` ("anything") is only kept when the value genuinely goes in one end and out the
other unchanged; otherwise use the real constraint.*

### The expectation — before → after (real examples)
```
hono  c.text(...)   status argument
  before:  ~status: string=?                     // 🛑 broken — "string" is a lie; the lib wants a status code
  after:   ~status: CommonTypes.statusCode=?     // ✅ the actual set of allowed HTTP status codes

hono  request.valid(target)
  before:  ~target: string                       // 🛑 broken
  after:   ~target: TypesTypes.typesTarget       // ✅ the real allowed values

blend getSkeletonDefaults(props, defaults)        // T goes IN and comes back OUT (round-trips)
  before:  ('a, …) => 'a                          // already correct
  after:   ('a, …) => 'a                          // ✅ UNCHANGED — the exception protects it
```
**In one sentence:** functions that were marked *broken* because we faked a `string` become genuinely
usable, and the one shape where `'a` was already right is deliberately left alone.

**The single decision we need you to sign off (details in §3):** for that round-trip case, do we keep
`'a` (recommended — preserves the in-and-out link, mildly over-permissive on the input) or force the
constraint everywhere (stricter, but breaks the round-trip)? The plan recommends **keep `'a`**.

---

## 1. The defect (what's wrong today)

A generic type parameter with a constraint (`<T extends string>`) is a promise the library makes
about the caller ("you must pass a string"). The generator throws that promise away, and does so
**inconsistently** across the four signature kinds.

```ts
function fnConstrained<T extends string>(x: T): T;   // T must be a string
```

| kind | today | problem |
|---|---|---|
| standalone function | `('a) => 'a` | `'a` accepts anything → `fnConstrained(42)` **compiles**, TS rejects it — unsound |
| instance method (#189) | 🛑 BROKEN `string` | honest but coarse; the type is unusable |
| static method | flagged `string` | inconsistent again |
| constructor | flagged `string` | type params not registered at all |

Same TS shape, up to four different answers — one of them (`'a`) accepts code the library rejects,
which the contract explicitly forbids ("never emit a plausible-but-wrong type").

### Root cause (in `src/extract.mjs`)
- **Function path** (`buildFunctionIR`, ~line 1902): registers **every** signature type param as
  `'a`, dropping the constraint.
- **Method path** (`buildClassIR` / method loop, ~line 2350): registers **only unconstrained** ones;
  a constrained param is left unmapped, and `classify`'s unmapped-TypeParameter branch (~line 3872)
  returns `{kind:'unknown'}` → flagged.
- That `classify` branch's own comment says resolving the bound was *"rejected here (#177)… needs the
  large-union NAMING problem solved first and belongs in its own change."*

### Why it was deferred, and why it's unblocked now
Resolving `T extends U` to `U` was blocked because hono's `U extends ContentfulStatusCode` produced a
~60-member union whose generated name was `v100OrV102Or…OrV511OrV1`, pasted into every status
signature — technically faithful, practically unusable. **#190 (shipped in #193) fixed exactly that:**
the union is now the readable `CommonTypes.contentfulStatusCode` (the monster name survives only as a
compat alias). So the naming blocker is gone and this is "its own change."

---

## 2. Real-world impact (why this matters)

Measured against the pinned benchmark packages. hono's most-used methods were stamped
`🛑 BROKEN — WON'T WORK` on `main` and become usable:

```rescript
// hono HonoRequest.parseBody — before → after
- @send external parseBody: (t, ~options: string=?, unit) => promise<string>              // 🛑 BROKEN
+ @send external parseBody: (t, ~options: UtilsTypes.utilsOptionsConfig=?, unit) => promise<Dict.t<string>>

// hono HonoRequest.valid  (valid<T extends keyof Schema>(target: T))
- @send external valid: (t, ~target: string) => string                                    // 🛑 BROKEN
+ @send external valid: (t, ~target: TypesTypes.typesTarget) => string

// hono Context.text / json / body — the status param
- ~status: string=?    // 🛑 BROKEN
+ ~status: CommonTypes.statusCode=?
```

blend's `EditorSharedTypes` similarly gains several `🛑 BROKEN → clean` methods
(`get`/`getOption`/`getContribution`).

---

## 3. The design decision to review (the important part)

The naïve "resolve every constrained param to its bound" is **too aggressive**. It regresses a real,
useful case: a constrained parameter that **round-trips**.

### Case study: blend's `getSkeletonDefaults`
```ts
getSkeletonDefaults<T extends Record<string, unknown>>(props: T, defaults: Partial<T>): T
```
`T` appears in `props` **and** the return — it genuinely round-trips.

```rescript
// main (today):   ('a, Dict.t<string>) => 'a      — round-trip preserved; mildly OVER-permissive input
// naïve #192:     (Dict.t<JSON.t>, …) => Dict.t<JSON.t>  — sound input, but round-trip DESTROYED
```

The `'a` version's only fault is that ReScript would also accept an input **outside** the bound; but
the input↔output connection — the entire reason a generic exists — is faithful. Widening it to
`Dict.t<JSON.t>` makes the caller re-narrow a value whose type they already knew. **For this shape the
"before" was better.** CLAUDE.md agrees: *"`'a` is only for a genuine generic that round-trips."*

### The refined rule (proposed)

Decide per signature type parameter `T`, using whether it **round-trips** (appears in a parameter AND
in the return — machinery already computed by `demoteReturnOnly` via its `used` vs `retVars` sets):

| `T` is… | round-trips? | mapping | rationale |
|---|---|---|---|
| unconstrained | yes | `'a` | genuine generic (unchanged) |
| unconstrained | no (return-only) | flagged | rule #4, unchanged |
| **constrained** | **yes** | **`'a`** | preserve the round-trip; the bound only over-widens the input, which `'a` already does soundly for the connection's sake |
| **constrained** | **no** (param-only or return-only) | **resolve the bound** | sound, and there's no round-trip to lose — this is the core #192 win (hono `parseBody`, `valid`, `c.text` status, `send`) |

Net effect:
- hono's broken methods still get fixed (they're param-only / return-only).
- `getSkeletonDefaults` **stays** `('a, …) => 'a` — no blend regression.
- Function, method, static, constructor all follow **one** rule — the asymmetry is deleted.

### Open questions for the reviewer
1. **Do we accept the mild input over-permissiveness of `'a` for round-tripping constrained params?**
   (i.e. `getSkeletonDefaults(42)` would still compile in ReScript.) This plan says yes — the
   round-trip is worth it and it matches the existing `'a` contract. The alternative is "soundness
   absolutely first," which resolves the bound everywhere and accepts the `getSkeletonDefaults`
   widening. **This is the crux to sign off.**
2. **Constructors:** fold them in so `new C<T extends …>()` agrees with the others? (Currently ctors
   don't register type params at all.) Low risk; recommended for consistency.
3. **Return position of a resolved bound** is an honest ⚪ *loose* widening (not 🛑 broken) — confirm
   that bucket is right (it is what `demoteReturnOnly` already does for return-only constrained vars).

---

## 4. Implementation sketch

All in `src/extract.mjs`. The round-trip signal is already available where it's needed.

1. **`classify` unmapped-TypeParameter branch (~3872):** when the param has a bound, resolve it
   (`type.getConstraint()` → `classify(bound, …)`); fall back to `{kind:'unknown'}` when there is no
   bound. (Prototyped and verified — compiles.)
2. **Register only the params that must stay `'a`.** In both `buildFunctionIR` (~1902) and the method
   loop (~2350), register a type param as `'a` when it is **unconstrained** *or* (**constrained AND
   round-trips**). Leave the rest unmapped so branch (1) resolves their bound. The round-trip test is
   `usedInAParam(tp) && usedInReturn(tp)` — the same `collectTypeVars` sets `demoteReturnOnly` builds.
3. **Constructor / static:** ensure their signature type params flow through the same helper so all
   four kinds share one decision. (Statics already benefit via branch (1); ctors need wiring.)
4. Factor the decision into one small helper (e.g. `typeParamMode(tp, sig) → 'var' | 'resolve' | 'flag'`)
   so function/method/ctor/static cannot drift apart again.

The current branch has a **prototype of the naïve version** (resolve *all* constrained params) for
evidence-gathering; it must be revised to the round-trip-gated rule above before anything merges.

---

## 5. Testing & maintenance loop (per CONTRIBUTING / mapping-change skill)

- **New golden fixture** `constrained-type-param-bound`: one case each of function / method / static /
  ctor covering (a) `T extends string` param-only → `string`, (b) `T extends <union>` → readable union
  name, (c) round-tripping constrained (`<T extends Record>(x: T): T`) → **stays `'a`**, (d)
  unconstrained → `'a`, (e) unconstrained return-only → flagged.
- **Update** `generic-instantiation-distinct`: its `constrained<S extends string>(s: S): Pair<S>`
  round-trips, so under the refined rule it **stays `'a`/`pair<'a>`** — confirm the fixture's comment
  and golden reflect that (this differs from the naïve prototype, which flipped it to `Pair<string>`).
- `npm test`, `npm run test:compile` (all goldens compile), `npm run bench` — expect hono/base-ui/etc.
  to improve (broken→typed) and **blend to stay put** on `getSkeletonDefaults`; accept baselines that
  only move in the broken→typed direction.
- `docs/TYPE_MAPPING.md`: document the four-way rule and the round-trip carve-out; CHANGELOG entry.
- Update `classify`'s and the two registration sites' comments (they currently document the old
  "deferred / flagged" behavior).

---

## 6. Risks

- **Contract tension:** round-tripping constrained `'a` is over-permissive on the input. This plan
  treats that as acceptable (documented, matches the `'a`-round-trips rule); a reviewer who wants strict
  soundness would choose the naïve "resolve everywhere" and accept the `getSkeletonDefaults` widening.
- **Scope creep into the method path:** #189 deliberately flags constrained method params; adopting the
  refined rule *changes* that path too (round-tripping constrained method params become `'a`). That is
  intentional (delete the asymmetry) but should be an explicit, reviewed decision, not a side effect.
- **Bound that itself references type params** (`T extends U`) or a recursive/self bound: rely on
  `classify`'s existing depth guards; the fixture should include a benign nested-bound case.
- **`getConstraint()` on `T extends unknown`:** may return a non-null `unknown` type; resolving it lands
  on flagged (`unknown`), same as today — no regression, but note it.
