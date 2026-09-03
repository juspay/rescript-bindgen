# #222 — A structurally-identical live type reclaims a tombstone's clean name

Status: DRAFT (design)
Issue: https://github.com/juspay/rescript-bindgen/issues/222 · #190 follow-up · seen in juspay/blend-rescript#151.
Cluster siblings: #220 (merged #223), #221 (merged #224), #219 (open).

## §0 Plain English — the real case

#190 reserves a removed identity's public name **forever** with an inactive tombstone (`active:false`), so
an old annotation can never silently re-bind to a *different* type. Correct in general. But when the
tombstone and a **live newcomer of the same ReScript shape** collide, the reservation protects nothing and
instead *breaks* every consumer of the clean name, permanently.

**Concrete (blend-rescript#151, bindgen 1.4.0-beta.3):**
```
{ id:"…|lib.es5.d.ts|named:NonNullable<Property.MaxHeight>",  name:"stringOrNumber",  module:"CommonTypes", active:false }  // csstype ghost killed by #206
{ id:"…|ThemeProvider…gap|slot:stringOrNumber|composition:string&number", name:"stringOrNumber2", module:"CommonTypes", active:true }
```
Emitted: `@unboxed type stringOrNumber2 = Str(string) | Num(float)` and **no** `stringOrNumber` at all
(tombstones are not emitted). The previous release had `@unboxed type stringOrNumber = Str(string) |
Num(float)` — the single most-used union in the whole output (`height`, `width`, `gap`, tick values…). So
every `CommonTypes.stringOrNumber` annotation downstream broke, the replacement wears a meaningless `2`, and
because the tombstone is permanent this can **never** heal on its own. A *cold* run (no manifest) emits the
clean `stringOrNumber` — so the lock made the output strictly *worse* here.

**Scope — it is 8 live types, not 1** (blend-rescript real manifest; `stringOrNumber` itself already
hand-fixed by the consumer, so 7 remain to fix automatically):
```
stringOrNumber2 (hand-fixed)   stringOrDateTimeFormatOptions2    positionAffinity2
chartsChartTokensTypeHeaderConfig2   chartsChartTokensTypeHeaderPaddingConfig2   chartsChartTokensTypeHeaderSlotsConfig2
chartsChartTokensTypeContentConfig2  chartsChartTokensTypeContentLegendConfig2   chartsChartTokensTypeContentPaddingConfig2
```

## §1 The contract

For a live entry whose public name carries a counter suffix (`<base>2`, `<base>3`, …) whose **base** is held
by an **inactive tombstone in the same module**, decide by a structural **proof**:

```
reclaimed  →  the live entry takes the clean <base> name;
              `<base>N` is kept as a transparent compatibility alias:  type <base>N = <base>
              the matched tombstone is DOWNGRADED to an alias identity of the live entry (active stays false;
              it no longer squats the name — the live entry now owns it, the tombstone's id is recorded as an
              alias so an old annotation binds correctly).
refused    →  the live entry KEEPS `<base>N`; NO alias is emitted; the old `<base>` path stays intentionally
              broken (the tombstone denotes a genuinely-different, upstream-DELETED type).
```

**The proof is the entire discriminator, and the doc must state that plainly** where the two rules sit side
by side, or they read as contradictory: for a *reclaim* we have proven the live type and the tombstone are
the same runtime representation, so both names denoting one identity is correct — the alias is sound. For a
*refusal* we have proven they are different, so any alias would be a fabrication that re-points an existing
annotation at a type of different membership — exactly the bind #190 exists to prevent.

### Why a refusal is NOT a no-path-churn violation
roshan's no-path-churn requirement covers a type that **still exists** being moved or renamed. The refused
case is an **upstream deletion** — the old identity is genuinely gone, and no registry cleverness resurrects
it. Different category. Refusing preserves #190's guarantee; it does not violate the churn rule. A compile
error at the old path is honest and actionable; a silent wrong bind is neither. The doc/PR say this
explicitly so the one refusal does not read as a regression.

## §2 The match predicate (the crux — strict equality is WRONG)

Comparing each live type to its tombstone's **beta.1 emitted body** (recovered from disk, §3):

- **5/8 are byte-identical after aligning cross-type references.** A record whose fields reference *other*
  renamed cluster members compares equal because **both sides already carry the clean base name**: the
  tombstone's proof body is recovered from the generation where its base was still LIVE (so its refs are the
  clean names), and a live entry's IR `typeRef.to` is the extraction-time base, not the manifest-locked
  counter. So referenced types are compared by **exact name** — NOT by stripping a trailing counter.
  (Blanket counter-stripping was an early draft and is *unsound*: it collapses `vec2`/`vec3`, `mat3`/`mat4`,
  `int8`/`int16` into false matches — the referenced type's structure is never re-compared, only its name.
  Adversarial review caught this end-to-end; the fix is exact-name comparison, pinned by a `vec2`≠`vec3`
  refuse test.)
- **2/8 are the same identity our own generator IMPROVED between versions**, and strict equality would refuse
  them forever:
  - `legendConfig` — beta.1 `dropdown: string  // ⚪ loose` (was an unresolved `{maxHeight:…}`), today
    `dropdown: <structured record>` via the #205/#206 recovery; same field-NAME set.
  - `positionAffinity` — beta.1 `@as(0) LeftPositionAffinity | …`, today `@as(0) Left | …`; **constructor
    identifiers renamed on purpose, `@as` wire payloads identical.**
- **1/8 is genuinely different and MUST be refused** — `stringOrDateTimeFormatOptions`:
  `DateTimeFormatOptions(dateTimeFormatOptionsLib)` → `DateTimeFormatOptions2(dateTimeFormatOptionsHighcharts)`
  — a different underlying payload type.

### §2.1 The predicate, precisely
Two shapes MATCH (reclaim) iff, after cluster-wide `<base>N`→`<base>` normalisation of every type
reference on both sides:
1. **Same kind** (both `@unboxed` untagged variant / both record / both `@tag` variant …).
2. For a **variant**: the set of `@as(...)` payloads is equal (constructor identifiers are IGNORED — we rename
   them deliberately), and each arm's payload *type* matches by rule 4.
3. For a **record**: the set of field **names** (and each field's optionality `?`) is equal; each field's
   *type* matches by rule 4.
4. **Member/field type match** is normalised-string equality, with EXACTLY ONE tolerated asymmetry — the
   narrow improvement direction:
   > the old side is literally `string` carrying a degraded-flag comment (`⚪ loose` / `🔍 review` / broken),
   > AND the new side is a structured/typed non-placeholder.

   Nothing else is tolerated. This is a **two-part literal predicate**, NOT "old side looks degraded":

   **THE LOAD-BEARING CARVE-OUT NARROWNESS (do not widen).** `{ ...JsxDOM.domProps }` is *also* a degraded
   emission (cf. #144), and it is the OLD side of the refused `stringOrDateTimeFormatOptions` case. A predicate
   phrased as "old side is any fallback/degraded shape" would swallow the domProps bag and wrongly reclaim the
   single case that must stay refused. So the tolerated old side is the **literal `string` + flag-comment**
   form only; a spread bag (`{...X}`), an opaque, or any other shape on the old side does **not** qualify and
   **blocks** the reclaim. A `{...domProps}` bag accepts arbitrary DOM props while the new type is a strict
   N-field record — different membership, hence a different type regardless of how "improved" the transition
   looks.

If the shapes do not match under §2.1 → **refuse** (keep the counter name, no alias).

## §3 Evidence — the tombstone's shape comes from the prior `.res` on disk (reuse #221's scan)

A tombstone row is very often **signatureless**: a clean single-identity name never recorded a `signature`
(41 of 57 tombstones in blend's manifest have none), so the manifest alone cannot prove a structural match.
But the dead identity's **emitted body is still in the prior `.res` output** — and #221's `scanPriorHomes`
(cli.mjs:195) already reads exactly those files at exactly the right moment (**before `--clean` deletes
them**). Extend it to capture, per leaf, the full **top-level declaration body text** (not just `leaf →
module`), so #222 gets its evidence for free.

- Widen `scanPriorHomes` to return, per leaf, `{ modules:Set, body:string }` (or a parallel `Map<leaf,
  body>`), preserving the existing `leaf → Set<module>` use for #221 untouched.
- Recover the tombstone's shape by looking up its `name` (the clean `<base>`) in that body index; parse the
  RHS of `type <base> = …` into the same normalised comparison form as the live entry.
- Going forward, **record `signature` for reserved names** so a future identical shape is matched from the
  manifest directly, without needing the disk (self-healing after one run). This does not remove the disk
  path — signatureless legacy tombstones will exist for as long as pre-fix manifests do.

## §4 THE TRIGGER — fire WARM, do NOT inherit #221's `priorHomes.size === 0` gate (make-or-break)

#221 fires ONLY when no manifest home exists (`priorHomes.size === 0`) — the pre-#190/cold boundary. **#222 is
the opposite: it must fire WARM, with the committed manifest present**, because the tombstones live *in* that
committed manifest. Reusing `scanPriorHomes` must NOT drag along its gate. #222's trigger is independent:

> a live entry whose assigned public name is `<base>N` (numeric counter) AND whose `<base>` is held by an
> inactive tombstone in the same module — evaluated whether or not a manifest is present.

The disk scan supplies the tombstone body as evidence; the *trigger* is the counter-name × live-tombstone
collision, not the absence of a manifest home. Its own predicate, not a branch of #221's gate. The
warm-on-committed acceptance case (§6.6) pins that it fires with a manifest present.

## §5 Implementation (src/*.mjs) — AS BUILT

The match is a self-contained module **`src/name-reclaim.mjs`** (`parseResBody` for the disk body,
`canonLive` for the live IR, `reclaimable` for the §2.1 predicate, `splitCounter`/`stripCounter` for
suffix normalisation), unit-tested against all 8 blend shapes in `test/name-reclaim.mjs`.

1. **`scanPriorHomes` (cli.mjs:195)** — widened to return `{ homes, bodies }`; `bodies` maps each leaf to
   its full top-level declaration text (block-captured with brace-depth tracking so a multi-line
   record/variant is whole). The #221 `homes` use is unchanged (`priorScan.homes`). Threaded into
   extraction as `opts.priorBodies` → `shared.priorBodies`.
2. **Reclaim decision — it OVERRIDES A LOCK, not just a fresh allocation.** The 8 targets are `active:true`
   rows named `<base>N` in the committed manifest, so a warm run LOCKS each to `<base>N` (that is exactly
   why the ugly `2` self-perpetuates). `tryReclaimBase` (extract.mjs, in `applyPublicNameRegistry`'s lock
   block) runs when the locked `chosen` name is a counter whose `<base>` is a same-module inactive
   tombstone: it proves the match (disk body via `parseResBody`+`reclaimable`, or an exact recorded-
   `signature` fast-accept) and, on success, rewrites `chosen = <base>`. The existing rename→alias code then
   adds `<base>N` to the entry's `compatNames` for free.
3. **Emit the alias** — no emit change needed: `renderCompatAliases` (emit.mjs:742) already renders a
   same-module lowercase compat name as `type <base>N = <base>`.
4. **Manifest rows (cli.mjs)** — the reclaimed live row carries `name:<base>` + `aliases:[…,<base>N]`
   through the normal `entry.compatNames` path. The matched tombstone is left an **inert `active:false`
   row** (a dead identity is dead): the live entry now owns `<base>` via its OWN row, so `ownsReserved`
   keeps it on every later run and the tombstone never re-squats — and NOT flipping the tombstone active is
   what makes a no-op regen byte-identical (flipping it oscillated every run).
5. **Visibility (acceptance condition)** — `--json-summary` gets `nameReclaims: { reclaimed:[{name,
   from, tombstoneId}], refused:[{name, base, reason}] }`, plus a stderr note per reclaim/refusal. Same
   rationale as #221's `relocations[]`: roshan reads "N clean, M stays suffixed because its tombstone is a
   genuinely different (upstream-deleted) type" as OUTPUT, not a reverse-engineered build failure.
6. **Signature going forward** — deferred as a follow-up: the disk-body proof already covers the
   signatureless majority (41/57), and the fast-accept path uses a recorded `signature` when one is
   present, so recording signatures for every reserved name is an optimisation, not a correctness need.

## §6 Tests / acceptance matrix (reproduce the blend session's 6 targets verbatim)

Extend `test/module-move-compat.mjs` (or a sibling) driving the real CLI across generations, plus a golden
fixture. The blend session will run the same 8-case matrix against the build:

1. all 7 reclaim → clean names present in output.
2. all 7 `…N` aliases still resolve (a consumer pinned to the suffixed name still compiles).
3. `stringOrDateTimeFormatOptions2` unchanged, and `stringOrDateTimeFormatOptions` does **NOT** resolve
   (refused; no alias).
4. `nameReclaims.reclaimed` = 7, `.refused` = 1 with a readable reason.
5. blend-rescript builds green; second run byte-identical (idempotent — reclaimed row is now stable).
6. **warm-on-committed** → only the intended renames+aliases in the diff, nothing else (pins §4: fires WARM).

Plus focused fixtures:
- **positive** `string + ⚪loose → structured` reclaims;
- **NEGATIVE, right next to it,** `{...JsxDOM.domProps}` bag → structured record must **NOT** reclaim (the
  exact `stringOrDateTimeFormatOptions` boundary — the §2.1 carve-out narrowness);
- **constructor-rename with identical `@as`** reclaims (`positionAffinity`);
- **cluster normalisation** — a record referencing another cluster member reclaims (`…HeaderConfig` →
  `…HeaderPaddingConfig`);
- goldens (cold, no manifest) byte-identical; bench byte-identical.

## §7 Risks

- **Carve-out too wide** (§2.1) — the domProps-bag trap; pinned by the negative fixture. Keep the tolerated
  old side to the literal `string`+flag form.
- **Trigger inherits #221's cold-only gate** (§4) — would make #222 a silent no-op on the exact (warm) input
  it must fix; pinned by the warm-on-committed case.
- **Cluster normalisation scope** (§2) — normalising only the own-name mis-scores matches; normalise the whole
  reclaim set first.
- **Parsing robustness** — recover only TOP-LEVEL `type <base> = …` bodies from disk; a multiline record/variant
  body must be captured whole. Deterministic (sorted scan, pure function of prior output).
- **Idempotency** — once reclaimed, the live row owns `<base>` with `<base>N` aliased; the next run sees no
  counter collision and is a strict no-op. Pinned by §6.5.
