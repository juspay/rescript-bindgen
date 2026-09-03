# #221 — Bootstrap `formerModules` from prior `.res` output (pre-#190 / cold generations)

Status: DRAFT (design)
Issue: https://github.com/juspay/rescript-bindgen/issues/221 · #190 (P1b) follow-up · seen in juspay/blend-rescript#151.

## §0 Plain English — the real case

When a type's home MODULE changes between runs, #190 keeps the old qualified path working by emitting a
**compatibility re-export** at the former home (`HighchartsSharedTypes.res` → `type chartType =
ChartsSharedTypes.chartType`). It knows the former home from the **previous manifest's `publicTypes`**.

**The gap:** a previous generation produced by bindgen ≤ 1.4.0-beta.1 (before the `publicTypes` registry
existed) — or by any **cold** run — has *no* `publicTypes`. So an identity that moved home across that
boundary gets `formerModules: null` and **no re-export**, even though the previous `.res` output on disk
says exactly where it used to live.

**Concrete (blend-rescript#151):** 45 blend Charts identities (`chartType`, `axisConfig`, `tooltipConfig`,
`newNestedDataPoint`, `sankeyLink`, …) lived in `HighchartsSharedTypes` under beta.1 (absorbed into the
Highcharts SCC). From beta.2 they home to `ChartsSharedTypes` (their own SCC — the correct home). The
beta.1→beta.3 regen emitted **0 / 45** shims → `HighchartsSharedTypes.chartType` + 44 siblings stopped
resolving for every downstream consumer. The fix is *discovery* only: hand-adding
`formerModules: ["HighchartsSharedTypes"]` to those rows makes bindgen emit all 45 shims correctly, build
green, idempotent. The mechanism is sound; the tool just never looked at the prior output.

## §1 The defect precisely

`src/cli.mjs` ~500-512 derives each entry's former homes ONLY from `priorPublicTypes[id]`:
```js
for (const id of e.publicIds || []) {
    const row = priorPublicTypes[id]        // ← only the prior manifest's publicTypes
    if (!row) continue
    if (typeof row.module === 'string') priorHomes.add(row.module)
    for (const fm of row.formerModules || []) priorHomes.add(fm)
}
```
No `publicTypes` (legacy/cold) ⇒ no `row` ⇒ no former home ⇒ no shim.

## §2 The fix — bootstrap former homes from the prior `.res` on disk

Approach 1 from the issue. Build a **legacy home index** by scanning the prior output for top-level
`type <leaf>` / `@unboxed type <leaf>` / `type rec <leaf>` / `and <leaf>` / `module <Name>` declarations,
mapping each **leaf public name → the module (file basename) it was declared in**. Then, for a live
entry whose identity has **no** prior‑manifest home (the pre-#190/cold boundary), look up its leaf name;
if it is **unique** across the legacy index AND that legacy module ≠ its new module, treat the legacy
module as a former home. It flows into `e._formerModules`, so the shim is emitted AND the home is
**recorded in this run's manifest** — identity-based from the next run on (self-healing, one-shot).

**Scan scope — the shared `*Types.res` modules only** (validated against blend-rescript's beta.1 output,
4,014 leaf/module pairs). Former-home relocation is a **shared-type / SCC-merge** phenomenon — both
`HighchartsSharedTypes` and `ChartsSharedTypes` are `*Types` modules — so scanning files whose basename
matches `/Types\.res$/` is the *right* scope, not merely a filter: it excludes per-component `props`
(emitted into all 235 component modules → a spurious 235-way collision) and component-module leaves
(`Circle` in `Skeleton`, `Header` in `CardV2`/`Timeline`, `ariaAttributes` in `HtmlAttrs`), none of which
is a relocatable shared identity. On the real data this leaves all 45 chart leaves unique. Scan across
BOTH `outDir` and `typesDir` (the same `Set` `--clean` iterates — covers `--out src` where they coincide
and a real `--types-dir` split). Prefer the manifest's `files` list (filtered to `*Types.res`) when
present; else `*Types.res` in the dirs.

**Uniqueness gate** (the issue's safety rule): only bootstrap a leaf that appears in EXACTLY ONE prior
`*Types` module. A leaf in ≥2 is ambiguous → skip (never a wrong shim). For a genuine pre-#190 output
there are no compat re-exports yet, so a relocated shared leaf is in exactly one file. The residual
real-data collisions (`Header`, `ariaAttributes`) are not relocated shared types and are correctly
skipped.

## §3 THE ORDERING CONSTRAINT (make-or-break — from blend-rescript validation)

blend-rescript's `generate:raw` passes **`--clean` on every invocation**, and `--clean` (cli.mjs:479)
**deletes the prior `.res` before generation**. The manifest is read at :296 but the `formerModules`
derivation runs *after* `--clean`. So the scan MUST happen **immediately after the manifest read (:296),
before `--clean`**, snapshotting the `leaf → module` map into memory for the later derivation. A scan
placed after `--clean` silently finds nothing and looks like a no-op fix. **A regression MUST run with
`--clean` explicitly.**

## §4 Implementation (src/cli.mjs)

1. **`scanPriorHomes(outDir, priorManifestFiles)`** — right after `priorManifest = readBindgenManifest(…)`
   (:296), BEFORE `--clean`. Reads the prior `.res` files (the manifest's `files` list if present, else
   `<outDir>/*.res`), regex-extracts top-level declared leaf names per module, returns
   `Map<leaf, Set<module>>`. Deterministic (sorted file order); tolerant of a missing dir.
2. **Feed it into the `formerHomeReexports` derivation** (~:500): after the `priorPublicTypes` pass, for
   an entry with an EMPTY `priorHomes`, add the unique legacy module for its leaf name(s) when it differs
   from `newModule`. (Never overrides a manifest-derived home; only fills the gap.)
3. **Record** — already flows via `e._formerModules` into the written manifest.
4. **Surface the recovery.** Two channels (the `_REPORT.md` section from the first draft was dropped in
   favour of the machine-readable one, which is where a consumer actually diffs a suspect shim):
   - **stderr note** — `recovered N former home(s) from prior output …` with each `<oldModule>.<leaf> →
     <newModule>`, **capped at 20** lines (`… and N more`) to keep a 1,396-row blend regen legible.
   - **`--json-summary` `relocations[]`** — the FULL, uncapped list (`{name, from, to}`, sorted), so
     CI/audit tooling has the complete migration table the capped stderr can't carry. Omitted when empty.

## §5 Tests

Extend `test/module-move-compat.mjs` (it drives the real CLI across generations of one out dir):
- **legacy bootstrap + `--clean`:** gen a beta.1-style output where a type is homed in ModuleA and its
  manifest has NO `publicTypes` (strip it, or write a files-only manifest); then a warm **`--clean`** run
  where the type now homes to ModuleB. Assert `ModuleA.res` re-exports it (`type x = ModuleB.x`), the row
  now carries `formerModules:["ModuleA"]`, it compiles, and a second run is idempotent. **Verify it fails
  without the fix** (0 shims) and, critically, **fails if the scan is moved after `--clean`**.
- **cold (no manifest) + prior `.res`:** delete the manifest entirely, keep the prior `.res`; assert the
  relocated leaf gets its shim.
- **uniqueness gate:** a leaf present in two prior modules is NOT bootstrapped (no wrong shim).
- **no false positives:** a type whose home is UNCHANGED gets no spurious former home; goldens (cold, no
  prior output) byte-identical; bench byte-identical.

## §6 Risks

- **`--clean` ordering** (§3) — the whole fix hinges on scanning before deletion. Pinned by a `--clean`
  test.
- **Leaf ambiguity** — mitigated by the uniqueness gate; a duplicated leaf is skipped, never mis-shimmed.
- **Delete + same-leaf re-add across one boundary (bounded, not closed)** — the uniqueness gate matches
  on NAME, not identity. If shared type A named `foo` in module X is deleted in the same version bump that
  an UNRELATED shared type B named `foo` is added in module Y, the scan sees `foo` uniquely at X (B didn't
  exist in the prior output) and mints `X.foo = Y.foo` onto B's identity. Contained by three facts: it
  requires a delete AND a same-leaf re-add of *shared* types across ONE bump; it surfaces as a consumer
  COMPILE error (B's shape ≠ the old A-shape the consumer annotated), not silent unsoundness; and the
  `--json-summary` `relocations[]` audit trail lets a consumer diff the offending pair (this is exactly how
  blend-rescript exhaustively cleared all 1,396 real relocations — 0 occurrences). The only sound closure
  is shape-gating (parse the former-home declaration body and require a runtime-signature match); deferred
  as machinery disproportionate to a case with zero real occurrences, to be revisited if it's ever observed.
- **Hand-written files in a manifest-less cold scan** — scanning `<out>/*.res` could read a hand-written
  file; the uniqueness gate + name-based match keep this from producing a wrong shim (worst case: a
  spurious former-home candidate that fails uniqueness → skipped). Prefer the manifest `files` list when
  present.
- **Parsing robustness** — match only TOP-LEVEL declarations (column-0 `type`/`@unboxed`/`module`/`and`),
  not nested module bodies; a re-export `type x = M.x` still validly marks `x` as having lived at this
  module path, so it is included (and folds into the uniqueness gate).
- **Determinism** — stable file ordering; the index is a pure function of the prior output. No
  encounter-order counters.
