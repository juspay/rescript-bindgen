# Benchmark gate — real-world validation before release

This suite runs the **current checkout's** generator against version-pinned, well-known
npm packages (`packages.json`) and compares the result with committed baselines. It is
the pre-release safety net for the blend pipeline: a green run means this version of
the tool can safely regenerate `@juspay/rescript-blend`'s bindings.

It does **not** ship to npm — `package.json`'s `files` allowlist excludes `benchmark/`
(like `test/`).

## The one-click button on PRs

`.github/workflows/benchmark.yml` triggers on every PR but the job is gated by the
`benchmark` GitHub **environment**, so it parks in *Waiting* until approved:

1. Open the PR → checks area shows **"Review pending deployments"**.
2. Click it → **Approve and run**. That's the button.
3. The run posts a sticky comment on the PR with the per-package verdict table
   (also visible in the workflow job summary).

**One-time setup** (already done if the check works): repo *Settings → Environments →
New environment* `benchmark` → add the maintainer under *Required reviewers*.

Fork-PR caveat: `GITHUB_TOKEN` is read-only for forks, so the sticky comment silently
fails there — the job summary and the check status still work.

## Verdicts

| Verdict | Meaning |
|---|---|
| ✅ PASS | Output byte-identical to baseline (incl. an unchanged known-gap package) |
| ⚠️ WARN | Output changed but compiles and quality is equal-or-better — likely an intentional improvement |
| ❌ FAIL | Generator crashed, bindings stopped compiling, new warnings, or buckets regressed (broken↑ / usable↓ / review↑) |

The job exits 1 (red check) only on FAIL.

## Commands

| Command | What it does |
|---|---|
| `npm run bench` | verify all packages against baselines (what CI runs) |
| `npm run bench:update` | regenerate `baselines/<slug>/{bindings/,metrics.json,package-lock.json}` |
| `node benchmark/run.mjs --only react-markdown` | debug one package (slug or name) |

## Accepting an intentional output change (WARN → PASS)

```sh
npm run bench:update
git add benchmark/baselines
# commit in the same PR — the binding changes become part of the reviewable diff
```

For judging a WARN before accepting it, the AI-review `bindgen-probe` skill can be run
locally on the changed package — it is deliberately **not** part of this CI gate (the
gate stays deterministic; no LLM, no secrets).

## Adding a package

Add an entry to `packages.json` (exact `version`, optional `flags` like `--webapi`),
then `npm run bench:update` and commit the new baseline. Determinism comes from the
exact pin + the committed sandbox `package-lock.json` (pins the transitive `.d.ts`
surface).
