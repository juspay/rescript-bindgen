# Plan — #192: resolve constrained type-parameter bounds (soundly, without losing round-trips)

Status: **DRAFT — research-reviewed (round 1 folded in)**; awaiting the crux sign-off (§3, decision 1).
No non-doc code should merge until signed off.
Branch: `agent/192-constrained-type-params`
Depends on: #190 (merged in #193) — the naming blocker that deferred this is now gone.
ReScript-12 grounding: verified against the [v12 Type manual](https://rescript-lang.org/docs/manual/v12.0.0/type),
[Scoped Polymorphic Types](https://rescript-lang.org/docs/manual/latest/scoped-polymorphic-types),
[Bind to JS Function](https://rescript-lang.org/docs/manual/v12.0.0/bind-to-js-function), and the
[Generic Constraints forum thread](https://forum.rescript-lang.org/t/generic-constraints/2382).

---

## 0. In plain English (read this first)

**The one-line story:** when a library says *"you must hand me a string,"* our tool currently forgets
that rule and tells ReScript *"hand me anything."* So ReScript happily lets you pass a **number**
where the library demands a **string** — the code compiles, then breaks. This fixes that.

### The issue — an everyday analogy
Think of a generic type parameter as a **fill-in-the-blank** the library puts on a function, and
`extends string` as a **promise it makes you keep** ("this blank can only be filled with a string").
Our tool throws that promise away and writes the ReScript blank as `'a` — ReScript's word for
*"literally any type."*

> `greet<T extends string>(name: T): void`  →  *"Give me a name (must be a string). I return nothing."*

- **What TypeScript allows:** `greet("hi")` ✅, `greet(42)` ❌ (rejected — 42 isn't a string).
- **What our binding (`('a) => unit`) allows:** `greet("hi")` ✅, `greet(42)` ✅ **(wrongly compiles!)**.

So the binding is **more permissive than the real library** — it green-lights calls the library will
refuse. Our project's rulebook (`CLAUDE.md`) forbids this ("never emit a plausible-but-wrong type").
And it's **inconsistent**: the exact same TypeScript gets handled four different ways depending on
whether it's a plain function, a method, a `static`, or a constructor.

> **One crucial distinction.** `greet` **consumes** the value — the string goes *in* and never comes
> back. Contrast it with `echo<T extends string>(x: T): T`, which **hands the value straight back**
> (in *and* out — a "round-trip"). These look identical in TypeScript, but they want opposite
> treatment, and telling them apart is the heart of the approach below.

### The approach — honor the promise, with one careful exception
1. **Honor the constraint** (the `greet` case). When a constrained value is **consumed** — it goes in
   and doesn't come back — write the blank as `string` (or, for `<T extends "a" | "b" | "c">`, the
   exact little set of allowed values), **not** `'a`. Now the binding refuses `greet(42)` just like the
   library does. This is the real fix (hono's `status`, `valid`, `parseBody` below).
2. **The one exception — "round-trips"** (the `echo` case). Sometimes a generic means *"whatever type
   you give me, I give you back **the same type**"* — the value goes **in and comes back out
   unchanged** (`echo<T>(x: T): T`, or blend's `getSkeletonDefaults<T>(props: T, …): T`). Here `'a` is
   actually the **right** answer: pinning it to a concrete type would force you to re-label a value
   whose type you already knew, and would sever the "same value back" guarantee that is the whole
   point of the generic. So: **resolve the constraint everywhere, EXCEPT when the value round-trips
   in-and-out — there we keep `'a`.** (Keeping `'a` here isn't a correctness bug — ReScript faithfully
   returns whatever type went in; it's just a touch looser on the input than TypeScript is.)
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

A constrained type parameter (`<T extends string>`) is a promise the library makes about the caller
("you must pass a string"). The generator throws that promise away, and does so **inconsistently**
across the four signature kinds. Take a **param-only** constrained value (consumed, never returned):

```ts
function greet<T extends string>(name: T): void;   // name must be a string; nothing comes back
```

| kind | today | problem |
|---|---|---|
| standalone function | `('a) => unit` | `'a` accepts anything → `greet(42)` **compiles**, TS rejects it — **unsound** (accepts code the library refuses, and gains nothing — nothing round-trips) |
| instance method (#189) | 🛑 BROKEN `string` | honest but coarse; the type is unusable |
| static method | flagged `string` | inconsistent again |
| constructor | flagged `string` | type params not registered at all |

Same TS shape, up to four different answers — and the function path's `'a` accepts code the library
rejects, which the contract explicitly forbids ("never emit a plausible-but-wrong type").

> **Scope note (research [SHOULD]).** "Unsound" is precise for the **param-only** case above — `'a`
> there is a genuine defect. For a **round-tripping** constrained param (`echo<T extends string>(x: T): T`),
> `'a` is *not* a ReScript soundness bug — ReScript faithfully returns whatever type went in; it is
> only *looser than the TS source* on the input (a fidelity gap). §3 keeps `'a` there on purpose. So
> "the defect #192 fixes" = the param-only (and return-only) constrained cases; the round-trip case is
> a deliberate carve-out, not a bug being left unfixed.

### Root cause (in `src/extract.mjs`; line numbers verified against current `main`)
- **Function path** (`buildFunctionIR`, §1991; type-var registration §2004): registers **every**
  signature type param as `'a`, dropping the constraint.
- **Method path** (`buildClassIR` method loop, §2451–2461): registers **only unconstrained** ones —
  the `.filter((tp) => !tp.getConstraint())` at **§2452** drops constrained params, which then reach
  `classify`'s unmapped-TypeParameter branch (**§4052–4068**) and return `{kind:'unknown'}` → flagged.
- That `classify` branch's own comment (§4055–4066) says resolving the bound was *"rejected here
  (#177)… needs the large-union NAMING problem solved first and belongs in its own change."*

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
in the return). This is decided by the generalised demotion pass in §4 — **after** every type param is
registered as `'a` and the IR is built, which is the only point the round-trip signal actually exists
(see the §4 ordering-trap box):

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

### Why not preserve the constraint itself? (the option space is complete)
**ReScript 12 has no bounded/constrained type variable** — no `extends`, no where-clause. The v12 Type
manual documents only plain `'a` parameters ([v12 Type](https://rescript-lang.org/docs/manual/v12.0.0/type)),
and the only constraint-like idiom is a structural open-object type (`{.."field": t} as 'a` /
`constraint 'a = {..}`) that applies **only to object types with named fields**
([forum: Generic Constraints](https://forum.rescript-lang.org/t/generic-constraints/2382)). It cannot
express `T extends string`, `T extends <numeric union>` (hono status), or `T extends keyof Schema`
(hono `valid`) — the actual real-world cases — and rescript-bindgen has no structural-subtyping
machinery. So the option space is exactly **{ resolve to the concrete bound, or unconstrained `'a` }**;
there is no third "constrained `'a`" to reach for. That is *why* the rule is a binary choice, and why
"keep `'a` for round-trippers" is the best available answer there rather than a compromise.

### The three decisions — research-backed answers (verified against ReScript 12)
1. **Accept the looser-than-TS input of `'a` for round-tripping constrained params? → YES (keep `'a`).**
   ⭐ **This is the one crux for you to sign off.** A top-level `external`'s `'a` is genuine per-call-site
   (rank-1) polymorphism ([Scoped Polymorphic Types](https://rescript-lang.org/docs/manual/latest/scoped-polymorphic-types)),
   so `('a, …) => 'a` *faithfully* preserves the input↔output link. Resolving the bound in a round-trip
   position is strictly worse — it doesn't just widen the input, it **destroys** the "same value back"
   guarantee that is the whole reason the generic exists. And it's a fidelity gap, **not** a ReScript
   soundness bug. This matches CLAUDE.md ("`'a` is only for a genuine generic that round-trips"). The
   only alternative is "soundness-absolutely-first → resolve everywhere," accepting the
   `getSkeletonDefaults` round-trip loss. **Plan recommends keep `'a`.**
2. **Fold constructors in? → YES, low risk (research-confirmed).** All four kinds emit top-level
   externals with the same generalization. And because `buildClassIR` binds a first-slice class as an
   abstract `type t` (§2349) and a constructor returns `t`, a ctor type param **can't round-trip into
   the opaque return** — so ctor params are always param-only → resolve the bound, with no round-trip
   edge case. Pure consistency win.
3. **Return-position resolved bound = ⚪ loose (not 🛑)? → YES, confirmed.** A return-only `T extends U`
   resolved to `U` is a widening (library promises the narrower `T`; caller gets the correct-but-broader
   `U`) — always right at runtime, just less precise. Exactly the ⚪ *loose* definition, and exactly what
   `demoteReturnOnly` already does (§2317–2318), so buckets stay consistent.

---

## 4. Implementation sketch

All in `src/extract.mjs`. **Approach: register-all-then-demote** (chosen over a pre-registration
detector — see the box below for why the "obvious" version doesn't work).

> ### ⚠️ Why NOT "decide at registration time" — the ordering trap (research [BLOCKER], resolved)
> The natural-sounding version — *"at registration, only emit `'a` for a param that round-trips;
> leave the rest unmapped so `classify` resolves the bound"* — **is circular and cannot work.** The
> round-trip signal is computed by `collectTypeVars` (§2310), which walks the **already-built IR
> nodes** and recognises a `T` only by its `'a` name — i.e. **only *after* that `T` has been
> registered** and run through `sigToMembers`. The registration decision happens *before* that, so it
> cannot consult a signal that does not exist yet. (A true pre-registration detector — walking each
> `sig.typeParameters` symbol's occurrences across the parameter and return TS type nodes — is
> possible but is all-new code, not the "already-available" machinery the earlier draft claimed.)

**The register-all-then-demote design (reuses existing machinery):**

1. **Register every signature type param as `'a`** in `buildFunctionIR` (§2004) and the method loop
   (§2451–2461) — as `buildFunctionIR` already does today. Crucially, **stop the method loop
   filtering out constrained params** (drop the `.filter((tp) => !tp.getConstraint())` at §2452), so
   the function and method paths become identical from here on.
2. **Generalise `demoteReturnOnly` (§2308) into a "demote-non-round-trip" pass.** Today it demotes a
   type var that appears **only in the return** to its constraint. Extend it to also demote a
   **constrained** var that appears **only in a parameter** (param-only). Net decision per var:
   - **round-trips** (in a param **and** the return) → **keep `'a`** (the carve-out).
   - **constrained, does NOT round-trip** (param-only or return-only) → **resolve the bound**
     (`tp.getConstraint()` → `classify(bound, ctx, '', 0)`), exactly the call `demoteReturnOnly`
     already makes at §2317–2318; reuse its `substTypeVars` and `_demoteFailed` dead-end handling.
   - **unconstrained, does NOT round-trip** → **unchanged**: param-only unconstrained stays `'a`
     (`f<T>(x: T): void` → `('a) => unit`); return-only unconstrained flags (rule #4).
   > The pass must therefore resolve-to-bound **only for *constrained* vars**, and must **not** touch
   > unconstrained param-only vars. This is precisely the split the §3 table draws — but it has to be
   > encoded deliberately, since "param-only" alone is not enough to decide.
3. **`classify` TypeParameter branch (§4052–4068).** Its unmapped-TypeParameter case currently
   returns `{kind:'unknown'}` → flagged (its comment at §4055–4066 is the "deferred / rejected #177"
   note this change rewrites). Give it the same bound-resolution as step 2 so any TypeParameter that
   reaches `classify` still unmapped (ctor/static paths, or a var never registered) resolves its
   bound, falling back to `{kind:'unknown'}` only when there is genuinely no bound. This mirrors the
   existing `getConstraint()→classify` in `demoteReturnOnly` (§2317) — same call, different site.
4. **Constructors / statics.** Route their signature type params through the same pass. Statics already
   benefit via step 3; **constructors need wiring**. Note (research [SHOULD]): because `buildClassIR`
   binds a first-slice class as an abstract `type t` (§2349) and a constructor returns `t`, a ctor
   type param **can't round-trip into the opaque return** — so ctor params are param-only in practice
   and always resolve the bound. The round-trip branch is effectively dead code for ctors: folding
   them in is pure consistency win with no edge case.
5. **One shared decision.** Factor the per-var choice into a single helper
   (`typeParamMode(tp, roundTrips) → 'var' | 'resolve'`) so function/method/ctor/static cannot drift
   apart again — the asymmetry in §1 is deleted by construction.

Prior art that de-risks the whole change: `demoteReturnOnly` (§2317–2318) **already** does
`tp.getConstraint()` → `classify(...)` with the `{kind:'unknown'}` fallback, and already handles the
`_demoteFailed` typeRef-tparams dead end (§2322–2340) — which applies symmetrically when demoting in
param position. Step 2 is a generalisation of an existing pass, not a new mechanism.

---

## 5. Testing & maintenance loop (per CONTRIBUTING / mapping-change skill)

- **New golden fixture** `constrained-type-param-bound`: one case each of function / method / static /
  ctor covering (a) `T extends string` param-only → `string`, (b) `T extends <union>` → readable union
  name, (c) round-tripping constrained (`<T extends Record>(x: T): T`) → **stays `'a`**, (d)
  unconstrained → `'a`, (e) unconstrained return-only → flagged.
- **Update** `generic-instantiation-distinct`: its `constrained<S extends string>(s: S): Pair<S>`
  round-trips, so under the refined rule it **stays `'a`/`pair<'a>`** — confirm the fixture's comment
  and golden reflect that (a naïve "resolve everywhere" would instead flip it to `Pair<string>`; the
  round-trip carve-out is exactly what keeps it `'a`).
- `npm test`, `npm run test:compile` (all goldens compile), `npm run bench` — expect hono/base-ui/etc.
  to improve (broken→typed) and **blend to stay put** on `getSkeletonDefaults`; accept baselines that
  only move in the broken→typed direction.
- `docs/TYPE_MAPPING.md`: document the four-way rule and the round-trip carve-out; CHANGELOG entry.
- Update `classify`'s and the two registration sites' comments (they currently document the old
  "deferred / flagged" behavior).

---

## 6. Risks

- **Contract tension (the crux):** round-tripping constrained `'a` is *looser than the TS source on the
  input* — a fidelity gap, **not** a ReScript soundness bug (the round-trip itself is faithful). This
  plan treats it as acceptable (matches the `'a`-round-trips rule); a reviewer who wants strict TS
  fidelity would choose "resolve everywhere" and accept the `getSkeletonDefaults` round-trip loss.
- **Scope creep into the method path:** #189 deliberately flags constrained method params; adopting the
  refined rule *changes* that path too (round-tripping constrained method params become `'a`). That is
  intentional (delete the asymmetry) but should be an explicit, reviewed decision, not a side effect.
- **Weak-polymorphism (`'a` → `'_weak`) is a non-issue here:** all four kinds emit **top-level**
  externals, which are generalized, so a round-trip `'a` instantiates fresh per call site — it does not
  degrade to weak `'_weak`. The `'a.`-scoping concern only arises for a bare `'a` in a **record-field /
  object-type** position, which is the pre-existing generic-record concern (already handled by
  parameterizing the record `<'a>`), not something #192 introduces.
  ([Scoped Polymorphic Types](https://rescript-lang.org/docs/manual/latest/scoped-polymorphic-types))
- **Bound that itself references type params** (`T extends U`) or a recursive/self bound: rely on
  `classify`'s existing depth guards; the fixture should include a benign nested-bound case.
- **`getConstraint()` on `T extends unknown`:** may return a non-null `unknown` type; resolving it lands
  on flagged (`unknown`), same as today — no regression, but note it.
