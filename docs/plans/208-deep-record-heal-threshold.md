# Plan — #208: recover partially-degraded DeepPartial token ghosts (without regressing #177)

Status: **DRAFT for review** — no non-doc code should merge until this is signed off.
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
- A prior attempt to skip records with a suppressed field via `f.type.relinkNp` failed because a
  suppressed **string-literal** field is a bare `{kind:'string'}` — the `relinkNp` marker is only set
  on **opaque** (deep-truncated) nodes (`:4063`), not on suppressed literals. So the top-level field
  carries no marker the heal can see.

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

### Why snapshot only `noPolyTag` (not the whole ctx)
The current heal already rebuilds with the live `ctx` and works for the ≥80% case — so `produced`,
`selfId`, `path`, etc. being live is already tolerated. The **only** flag whose staleness causes a
*correctness* regression is `noPolyTag` (it flips flag→fake). Snapshotting just it is the minimal,
targeted fix; the `_heal` comment's promise of "a ctx snapshot" is finally made true for the one flag
that needs it. (Open question 1 — is any *other* reading-flag load-bearing across a heal? see §6.)

### Alternative considered — field-level heal (#208 option 2)
Re-resolve only the individual opaque (depth-truncated, non-suppressed) fields, leaving suppressed and
already-good fields untouched, sidestepping the threshold entirely. **Rejected as the primary approach**
because it duplicates field-resolution logic outside `buildRecordFields` and would need its own bounded
gate; the snapshot approach reuses the existing, tested rebuild + accept machinery. Kept as a fallback
if the snapshot proves insufficient.

### Decisions for the reviewer
1. **Threshold value.** Lower to `bad < 1` (attempt any record with a fallback), or a softer bar (e.g.
   `bad < len*0.2`)? `bad < 1` is simplest and the accept gate makes it safe; the only cost is more
   *attempts* (each a sandboxed rebuild + rollback). Perf: 406 attempts on blend, all rolled back if
   rejected — measure the bench wall-clock delta. **Recommend `bad < 1`** unless bench regresses.
2. **Is `noPolyTag` the complete suppression state?** Confirm no *other* per-read flag (e.g. a nested
   `produced` polarity) can flip a heal from honest→fake. (Verified target for the research review.)
3. **Snapshot vs re-suppress-marker.** Snapshot on `_heal` (proposed) vs marking each suppressed field
   so the heal preserves it field-wise. Snapshot is coarser (whole-record re-read) but reuses the
   rebuild; field-marking is surgical but needs the marker plumbed onto suppressed literals. Snapshot
   recommended.

---

## 4. Implementation sketch

All in `src/extract.mjs`.
1. `:6571` — `entry._heal = { type, ctx, depth, noPolyTag: !!ctx.noPolyTag }`.
2. `:3324` — thread the snapshot into the rebuild ctx (`noPolyTag: e._heal.noPolyTag`).
3. `:3314` — lower the threshold to `bad < 1`.
4. Update the misleading `:6568-6570` comment ("a ctx snapshot") to say what is and isn't snapshotted.

The accept gate, the `registryTrial` sandbox/rollback, and `healFieldsBounded`/`boundedPastDepth` are
untouched.

---

## 5. Testing & maintenance loop (per CONTRIBUTING / mapping-change skill)

- **New golden fixture** `deeppartial-partial-heal`: pins BOTH mechanisms so they can't regress each
  other — (a) a partially-degraded `DeepPartial<>` token record whose good fields recover to real types
  while a genuinely-deep field stays `⚪` flagged; (b) an ambiguous-overload record whose suppressed
  field stays flagged `string` even though its sibling fields are healable.
- **`generic-instantiation-distinct`** must stay byte-identical (the #177 contract) — the key
  regression guard.
- `npm test`, `npm run test:compile` (all goldens compile), `npm run bench` — blend record ghosts
  drop (⚪ loose count improves), `broken` unchanged, everything compiles; accept blend baselines that
  move only in the ghost→typed direction; measure the wall-clock delta from the extra heal attempts.
- `docs/TYPE_MAPPING.md`: note the heal now recovers partially-degraded records and preserves
  `noPolyTag` suppression; CHANGELOG.

---

## 6. Risks

- **Suppression completeness.** If a reading-flag other than `noPolyTag` also flips a heal honest→fake,
  the snapshot must include it. Mitigation: the research/design review audits every mutable `ctx` flag
  read during `buildRecordFields`; the `generic-instantiation-distinct` golden + a new suppressed-field
  golden catch a miss.
- **Perf.** `bad < 1` turns ~406 blend records into sandboxed rebuild attempts (most rolled back). Each
  is a `registryTrial` snapshot + `buildRecordFields` + rollback. Measure `npm run bench` wall-clock; if
  material, use a softer threshold (`bad < len*0.2`) — the accept gate keeps either safe.
- **A heal that legitimately improves an ambiguous record's OTHER fields.** Desired: with the snapshot,
  the suppressed field stays flagged while its healable siblings recover. Confirm the new golden shows
  exactly that (partial recovery, suppression intact) rather than all-or-nothing.
- **Idempotence/determinism.** Re-running generation must stay byte-identical; the heal reads the same
  snapshot each run.
