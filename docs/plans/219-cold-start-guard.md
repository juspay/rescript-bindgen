# #219 — a cold run (no prior manifest) silently discards the #190 lock

Status: DRAFT (design)
Issue: https://github.com/juspay/rescript-bindgen/issues/219 · #190/#35/#96 follow-up · juspay/blend-rescript#151.
Cluster: #220 (#223 ✓), #221 (#224 ✓), #222 (#225 ✓), **#219** (this).

## §0 Plain English

`.bindgen-manifest.json` IS the #190 lock: it permanently pins every public type name and module home. That
only works if the file is present on the next run. When it is **absent** — a *cold* run — bindgen treats
every identity as a newcomer: no locked names, no `formerModules`, no compat re-exports, SCC homes recomputed
from scratch. Today that happens **silently**; the requirement to commit the manifest lives only in the
1.4.0-beta.2 CHANGELOG. The consumer it bites hardest is the one the lock was built for: blend-rescript's CI
does a fresh checkout and its `.gitignore` has listed the manifest since before #190, so **every CI regen is
cold**, and a developer's warm local run and CI produce two different public APIs for the same inputs (121
`.res` differ, 11 compat modules vanish, `stringOrNumber2` vs `stringOrNumber`) — the exact churn #190 ends,
with zero signal.

This is a **guardrail/UX fix, not a type-mapping change**: it lives in `src/cli.mjs` + README, and touches
none of `extract/emit/resolve` (so the CI fixture-guard does not apply). Generated `.res` output is byte-for-
byte unchanged; only diagnostics, one new flag, and the json-summary gain fields.

## §1 The fix

1. **Loud cold-run warning (stderr).** When the prior manifest has **no `publicTypes` registry** AND prior
   output exists on disk (a previous generation we're about to silently diverge from), print:
   ```
   ⚠ no prior .bindgen-manifest.json registry — public names and module homes are UNLOCKED for this run;
     nothing from a previous generation can be preserved (no compat re-exports, homes recomputed). Commit
     .bindgen-manifest.json next to the output and regenerate THROUGH it. (#190)
   ```
   Gate on "prior output exists" so a genuine first-ever run (nothing to lose) stays quiet — only a run that
   *discards* an existing generation warns.

2. **Git guard.** When `--out` is inside a git work tree AND the manifest is **gitignored or untracked**
   *while sibling `.res` files are tracked* (the exact blend-rescript misconfig: output committed, lock not),
   surface it. Default: **warn**. With `--require-manifest`: **fail (exit 1)** so a consumer can wire the
   hard stop into CI deliberately. Implemented by shelling out to `git` (tolerant of git-absent / not-a-repo
   → silently skip): `rev-parse --is-inside-work-tree`, `check-ignore <manifest>`, `ls-files
   --error-unmatch <manifest>` (untracked test), `ls-files '*.res'` (are any tracked?).

3. **README.** A short "the manifest is a committed source-of-truth input" section — the requirement must
   live where consumers look, not only in a CHANGELOG entry.

4. **`--json-summary`.** Add `coldStart: true|false` and `compatModulesWritten: <n>` so CI can assert on them
   (e.g. fail the sync job if `coldStart` is true).

## §2 Placement (ordering)

The cold-detection and git guard run **right after the manifest read + `scanPriorHomes`** (cli.mjs ~371),
BEFORE `--clean` (~556) deletes the prior `.res` — so "prior output exists" is observed on the real prior
tree, mirroring #221's before-clean discipline.

## §3 Tests (`test/cold-start-guard.mjs`, drives the real CLI)

- **cold + prior output → warns**: generate warm once (manifest written), delete the manifest, regenerate →
  the cold warning fires; generated `.res` are unaffected.
- **warm → silent**: with the manifest present, no cold warning.
- **first-ever run → silent**: empty out dir, no manifest → no cold warning (nothing to discard).
- **git guard**: `git init` an out dir, commit the `.res` but gitignore the manifest → warns by default;
  `--require-manifest` exits non-zero; a properly-tracked manifest → silent.
- **json-summary**: `coldStart` reflects warm vs cold; `compatModulesWritten` counts standalone compat files.
- **no output drift**: goldens byte-identical (this change emits no `.res` differences); smoke green.

## §4 Risks

- **Warning noise** — gated on prior-output-exists, so a first run is quiet; warm runs are quiet.
- **git shell-out portability** — every git call is wrapped and a non-zero/throw degrades to "skip the guard"
  (never breaks generation); the guard only ever *adds* a warning (or a fail under the explicit opt-in flag).
- **`--require-manifest` breaking CI** — it is strictly opt-in; default behaviour is unchanged (warn only),
  so no existing pipeline changes without adding the flag.
