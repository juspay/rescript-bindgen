# Plan — #208: recover partially-degraded DeepPartial token ghosts (without regressing #177)

Status: **DRAFT — design-reviewed (round 1 folded in)**; awaiting maintainer sign-off. No non-doc code
should merge until signed off. Root cause verified against source; approach confirmed sound + complete.
Branch: `agent/208-deep-record-heal-threshold`
Follows: #205/#206 (recovered 350 → 111 of blend's record→`string` token ghosts).

---

## 0. In plain English (read this first)

**The one-line story:** blend has ~71 theme-token records that are *mostly good* — a few fields the
tool couldn't model, surrounded by many it could — but a safety valve throws the **whole** record away
as a flat `string`. This recovers them, without breaking a separate correctness guard.

### The issue — an everyday analogy
The tool has a "repair" step (`healGhostRecords`) for records that came out as a useless all-`string`
blob because they were first seen mid-cycle. To decide *which* records to bother repairing, it uses a
crude filter: **only repair a record if ≥80% of its fields are junk.** blend's token records
(`ButtonTokens`, the `SEARCH_INPUT` config, …) are the opposite shape — *most* fields are fine, only a
handful got too deeply nested (through blend's `DeepPartial<>` wrapper) to model. So they sit at, say,
20% junk, fall **under** the 80% bar, and never get repaired — they stay a flat `string` even though
80% of the record is perfectly typeable. ~71 records are stuck this way.

### Why we can't just lower the bar (the load-bearing part)
Lowering the threshold to "repair any record with ≥1 junk field" recovers all 71 — **but it breaks a
different guard (#177).** Some record fields are *deliberately* flagged `string`: when a field sits in
an **ambiguous overloaded slot**, the tool suppresses narrowing it to an exact value (because the
overloads disagree about what's allowed there) — an honest "we can't pin this" flag. The repair step
re-resolves the record's fields from scratch, and — here's the bug — it does so **without that
suppression turned on**, so it "repairs" the deliberately-flagged field into a *fake* exact type
(`[#"ordCt"]`). That's a "flag-don't-fake" violation.

### Root cause (found in the code, not just theorized)
The repair captures the record's build-context to re-resolve later: `entry._heal = { type, ctx, depth }`
(`src/extract.mjs:6571`). Its comment claims it keeps "a ctx **snapshot**" — **but it's a live
reference**, not a snapshot. The suppression is a mutable flag `ctx.noPolyTag` that is set `true` only
while the ambiguous slot is being built and restored to `false` immediately after (the `finally` at
`~2251`/`~2258`). By the time `healGhostRecords` runs (a whole pass later), `ctx.noPolyTag` is back to
`false`, so the rebuild re-resolves the once-suppressed field **without** suppression → the fake tag.

### The approach
1. **Make `_heal` an actual snapshot of the suppression state** — capture `noPolyTag: ctx.noPolyTag`
   at `_heal` time and re-apply it in the rebuild. Now the repair re-suppresses exactly the fields
   that were suppressed originally: the deliberately-flagged `_format` stays `string`, #177 holds.
2. **Then lower the threshold** so partially-degraded records are repaired too. The accept gate already
   only lands a rebuild that has *fewer* junk fields and a provably-bounded subtree, so lowering the
   pre-filter can only turn ghosts into better records — never regress a good one.

### The expectation — before → after
```
blend 0.0.38-beta.1 token record (mostly good, a few DeepPartial-deep fields):
  before:  type … = string            // ⚪ loose — the whole record thrown away
  after:   type … = { size, color, … typed fields …, deepField: string /* ⚪ the genuinely-deep one */ }

#177 ambiguous-overload record (unchanged):
  before:  OrderDep.ambiguous._format : string   // deliberately flagged
  after:   OrderDep.ambiguous._format : string   // STILL flagged — suppression preserved
```
**In one sentence:** blend's record ghosts drop from **111 → ~40** (the genuinely-unmappable floor),
while the deliberately-flagged overload field stays flagged.

---

## 1. The defect (what's wrong today)

`healGhostRecords` (`src/extract.mjs:3309`) re-resolves a record whose fields came out as fallbacks
(the mid-cycle all-`string` ghost, #33), but only attempts a record where **≥80%** of fields are bad:

```js
const bad = fallbacks(e.fields)
if (!bad || bad < e.fields.length * 0.8) continue   // only heal a MOSTLY-fallback record
```

blend `0.0.38-beta.1` (instrumented, `recordEntries=3194`): **406** records sit below the threshold;
of those, **72** would heal (fewer fallbacks + bounded), **182** are genuinely unmappable (correctly
rejected), 0 unbounded. Those 72 (≈71 net) are the partially-degraded token configs held back — the
residual **111** record ghosts after #205.

### Root cause — the `_heal.ctx` live-reference, and the #177 tension
- `entry._heal = { type, ctx, depth }` (`:6571`) captures `ctx` **by reference**. `ctx.noPolyTag`
  (the ambiguous-overload suppression, `:2233-2234`/`:2254-2255`, restored by the `finally`) is `false`
  by the time `healGhostRecords` runs.
- The rebuild `buildRecordFields(type, { ...ctx, visiting: new Set() }, 0)` (`:3324`) therefore sees
  `noPolyTag: false` and re-resolves a suppressed literal to an exact polytag.
- The accept gate `fallbacks(rebuilt.fields) < bad` (`:3339`) *counts that fake tag as an improvement*,
  so it lands. Golden `generic-instantiation-distinct` asserts `OrderDep.ambiguous._format` stays
  flagged `string` — lowering the threshold today flips it to a faked `[#"ordCt"]` (flag-don't-fake
  violation) and merges the ambiguous/unambiguous records.
- **A suppressed literal is `{kind:'opaque'}`, not `{kind:'string'}`.** Under `noPolyTag` the polytag
  branch at `:4715` is skipped and control falls through to `:4719-4720` `return {kind:'opaque', text}`
  (the golden renders `ordTagged…._format` as `string, // ⚪ loose — was ` + "`ordCt`" + `). Two
  consequences: (a) an opaque field **is** an imperfection (`irHasImperfection`, `:~3700`), so the
  ambiguous record `ordTagged…` has `bad=1` at 50% degraded — skipped at the 80% bar today but
  **attempted** at `!bad`. Without the fix the rebuild re-resolves `_format` opaque→polytag,
  `fallbacks(rebuilt)=0 < bad=1` → **accepted** → the fake lands and merges with the unsuppressed
  twin. With the `noPolyTag` snapshot, `_format` stays opaque, `fallbacks(rebuilt)=1`, **not** `< 1`
  → **rejected** → rolled back → byte-identical. #177 holds *by construction*. (b) A prior attempt to
  skip suppressed fields via `f.type.relinkNp` failed by **marker-parity**: `relinkNp` is stamped only
  at the past-bound truncation site (`:4063`), **never** at the `:4715` suppression fall-through — so a
  suppressed opaque field is indistinguishable from a genuinely-deep opaque field; the heal has no
  field-level marker to tell them apart.

---

## 2. Real-world impact (why this matters)

Cosmetic/fidelity only — the residual are ⚪ *loose* flagged `string` (usable, honest), not 🛑 broken.
Closing this takes blend `0.0.38-beta.1` from **111 → ~40** residual record ghosts (the genuinely
unmappable floor), and total loose from ~843 → ~168 (per #208's instrumentation). Downstream
(blend-rescript) gets ~71 token configs as real records instead of opaque `string`.

---

## 3. The approach + decisions to review

### The proposed fix (snapshot the suppression, then lower the threshold)
1. **Snapshot `noPolyTag` in `_heal`** (`:6571`): `entry._heal = { type, ctx, depth, noPolyTag: !!ctx.noPolyTag }`.
2. **Re-apply it in the rebuild** (`:3324`): `buildRecordFields(type, { ...ctx, visiting: new Set(), noPolyTag: e._heal.noPolyTag }, 0)`.
   Now a suppressed field re-suppresses on rebuild → stays flagged; #177 holds by construction.
3. **Lower the pre-filter threshold** (`:3314`) from `bad < len*0.8` to `bad < 1` (i.e. attempt any
   record with ≥1 fallback field). The **accept gate is unchanged** (`:3339`): a rebuild only lands if
   it has *strictly fewer* fallbacks **and** (`newEntries===0 || healFieldsBounded`) — so lowering the
   pre-filter only widens *what is attempted*, never what is *accepted*. A good record either produces
   an equal-or-worse rebuild (rejected, rolled back) or an identical one (no-op).

### Which reading-flags to snapshot (the completeness argument)
Every mutable `ctx` reading-flag is stale-to-ambient at heal time (the `_heal.ctx` live reference).
The question is which of them can flip a heal **honest→fake** at a record's top-level field. Audited:
- **`noPolyTag`** — flips honest→fake at `:4715` (literal → polytag) with **no co-gate**, AND changes
  the per-read entry key (`entryKey`/`keyOf`, `:4937-4948`, `keyOf(id, np)`) so the suppressed record
  is a distinct entry from its unsuppressed twin. **Must snapshot.** (The staleness is *not* "tolerated"
  today — it simply doesn't surface because the ≥80% healed set contains no suppressed fields; lowering
  the threshold removes that accident, which is the whole point.)
- **`produced`** (input/output polarity) — its three fake-producing sites are each **co-gated**:
  `fieldVarOk` (`:4115`, output `any` → unsound `'a`) by `ctx.inArrayElem`; the union→construct-only
  views module (`:5925/:5931`) and the receive-guard (`:5020`) by `ctx.inFnReturn`. Both co-gates are
  transient `finally`-restored flags that are reliably `false` at a heal record's top and re-established
  correctly *inside* the rebuild's own recursion — so `produced`-staleness alone cannot flip a top-level
  field. It is therefore not strictly required. **We snapshot it anyway** (symmetric, cheap, faithful to
  the record's original polarity, and future-proofs against a later edit loosening the `inArrayElem`/
  `inFnReturn` co-gates and silently reopening the hole).
- **`constValue`** (`:4157`) can't go stale — it lives on the separate const-value ctx (`:2108`), set
  once, never toggled. **No snapshot needed.**

So: snapshot **`noPolyTag` (required) + `produced` (belt-and-suspenders)**; the `_heal` comment's
promise of "a ctx snapshot" is finally made true for the flags that matter.

### Alternative considered — field-level heal (#208 option 2)
Re-resolve only the individual opaque (depth-truncated, non-suppressed) fields, leaving suppressed and
already-good fields untouched, sidestepping the threshold entirely. **Rejected as the primary approach**
because it duplicates field-resolution logic outside `buildRecordFields` and would need its own bounded
gate; the snapshot approach reuses the existing, tested rebuild + accept machinery. Kept as a fallback
if the snapshot proves insufficient.

### Decisions — resolved by the design review
1. **Threshold value → drop the 0.8 term (attempt any record with a fallback).** The accept gate is the
   real guard, so a percentage bar only arbitrarily excludes a fully-healable but lightly-degraded
   record. The one cost is *attempts*: ~406 sandboxed rebuild+rollbacks on blend — measured against
   bench wall-clock in §5; fall back to `bad < len*0.2` only if that regresses.
2. **Is `noPolyTag` the complete suppression state? → Yes, plus `produced` for safety.** Verified: only
   `noPolyTag` flips honest→fake at a top-level field with no co-gate; `produced`'s fake sites are all
   co-gated by `inArrayElem`/`inFnReturn` (false at heal), `constValue` can't go stale. We snapshot both
   `noPolyTag` (required) and `produced` (belt-and-suspenders / future-proofs the co-gate). See the
   audit above.
3. **Snapshot on `_heal` over field-level heal.** Field-level can't distinguish a suppressed opaque
   field from a genuinely-deep one without the *same* marker plumbing (marker-parity), and would
   duplicate per-field context derivation — harder to get right than reusing the tested record-level
   rebuild + accept gate. Snapshot chosen.

---

## 4. Implementation sketch

All in `src/extract.mjs`.
1. `:6571` — snapshot the reading-flags: `entry._heal = { type, ctx, depth, noPolyTag: !!ctx.noPolyTag, produced: ctx.produced }`.
2. `:3324` — thread the snapshot into the rebuild ctx: `buildRecordFields(type, { ...ctx, visiting: new Set(), noPolyTag: e._heal.noPolyTag, produced: e._heal.produced }, 0)`.
3. `:3314` — lower the pre-filter to attempt any record with a fallback. The guard already has `!bad`
   (`bad===0` → skip); `bad < 1` is redundant with it, so the clean edit is to **drop the
   `bad < e.fields.length * 0.8` term** — the condition becomes `if (!bad) continue`.
4. Update the misleading `:6568-6570` comment ("a ctx snapshot") to say exactly which flags are
   snapshotted and why (`noPolyTag` required to preserve #177 suppression; `produced` for polarity
   fidelity / co-gate future-proofing).

The accept gate (`:3339`), the `registryTrial` sandbox/rollback, and `healFieldsBounded`/`boundedPastDepth`
are untouched.

The accept gate, the `registryTrial` sandbox/rollback, and `healFieldsBounded`/`boundedPastDepth` are
untouched.

---

## 5. Testing & maintenance loop (per CONTRIBUTING / mapping-change skill)

- **New golden fixture** `deeppartial-partial-heal`: pins BOTH mechanisms so they can't regress each
  other — (a) a partially-degraded `DeepPartial<>` token record whose good fields recover to real types
  while a genuinely-deep field stays `⚪` flagged; (b) — **THE key guard** — a *partially-degraded
  ambiguous-overload* record: its suppressed field stays flagged `string` while a healable **sibling**
  field recovers. This is the exact shape that exercises the snapshot (partial recovery, suppression
  intact) rather than an all-or-nothing reject, and is the case that would catch a `produced`-style miss
  if the co-gating analysis is ever wrong.
- **`generic-instantiation-distinct`** must stay byte-identical (the #177 contract) — the key
  regression guard.
- `npm test`, `npm run test:compile` (all goldens compile), `npm run bench` — blend record ghosts
  drop (⚪ loose count improves), `broken` unchanged, everything compiles; accept blend baselines that
  move only in the ghost→typed direction; measure the wall-clock delta from the extra heal attempts.
- `docs/TYPE_MAPPING.md`: note the heal now recovers partially-degraded records and preserves
  `noPolyTag` suppression; CHANGELOG.

---

## 6. Risks

- **Count-based accept over wholesale replacement (the general class).** The accept gate guarantees the
  *total* fallback count drops; it does **not** guarantee each individually-good field is preserved. The
  `noPolyTag` bug was one instance of "trade a fallback for a confident-but-wrong non-fallback, count
  drops, gate accepts." The snapshot closes that specific instance, but a rebuild that recovers a
  genuinely-deep field while silently re-resolving some *other* field to a subtly-different confident
  type remains possible, and lowering the threshold *widens* exposure to it. Caught only by golden +
  bench diff review (accept only ghost→typed moves) — which §5 prescribes. This is the real residual
  risk, not the (now-closed) suppression-completeness one.
- **Suppression completeness — resolved.** `noPolyTag` is the sole reading-flag that flips honest→fake
  at a top-level field with no co-gate; `produced`'s fake sites are co-gated (false at heal) and it is
  snapshotted anyway; `constValue` can't go stale. The new partial-ambiguous golden (below) is the
  guard that would catch any miss in this analysis.
- **Perf.** `bad < 1` turns ~406 blend records into sandboxed rebuild attempts (most rolled back). Each
  is a `registryTrial` snapshot + `buildRecordFields` + rollback. Measure `npm run bench` wall-clock; if
  material, use a softer threshold (`bad < len*0.2`) — the accept gate keeps either safe.
- **A heal that legitimately improves an ambiguous record's OTHER fields.** Desired: with the snapshot,
  the suppressed field stays flagged while its healable siblings recover. Confirm the new golden shows
  exactly that (partial recovery, suppression intact) rather than all-or-nothing.
- **Idempotence/determinism.** Re-running generation must stay byte-identical; the heal reads the same
  snapshot each run.
