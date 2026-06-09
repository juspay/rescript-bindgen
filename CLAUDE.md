# rescript-bindgen — project instructions

`@juspay/rescript-bindgen` is a **deterministic** TypeScript→ReScript binding generator (no AI at
runtime, no guessing). It reads `.d.ts` via the TypeScript compiler API (`src/extract.mjs`),
builds an IR, and emits ReScript (`src/emit.mjs`); `src/cli.mjs` wires it together.

## Canonical reference — read before changing any mapping

**[`docs/TYPE_MAPPING.md`](docs/TYPE_MAPPING.md)** is the source of truth for every TypeScript→ReScript
rule. Consult it before adding or modifying a mapping. It is backed by golden fixtures and is enforced
in CI — treat it as a contract, not just docs.

## Hard rules (the contract)

- **No unsafe casts.** Never emit `Obj.magic`, `@unwrap`, or a bare `%identity`. The only allowed
  `%identity` is the zero-cost `external from*` constructor of an opaque-type module.
- **Flag, don't fake.** If a type can't be modelled exactly, emit a `string` placeholder + comment
  and bucket it (⚪ loose / 🔍 review / 🛑 broken). Never emit a plausible-but-wrong type.
- **Multi-type props** → `@unboxed` untagged variant (distinct runtime tags) or an opaque module.
- **`unknown` → `JSON.t`** (opaque value), never a type variable. `'a` is only for a genuine generic
  that round-trips (input ↔ callback).

## Maintenance loop (required for every mapping change)

A new or changed mapping is not done until all three are updated together:

1. A row in **`docs/TYPE_MAPPING.md`**.
2. A fixture under **`test/golden/cases/<name>/`** (self-contained `index.d.ts` with inline stubs +
   `lib.dom`, no installs — see existing cases; plus `args.json`).
3. Its regenerated golden: `npm run test:golden:update`, then verify the diff is correct.

## Commands

| Command | What it does |
|---|---|
| `npm test` | smoke test + golden snapshot diff (offline, fast) |
| `npm run test:golden` | golden snapshot only |
| `npm run test:golden:update` | regenerate goldens (after an intentional change) |
| `npm run test:compile` | compile every golden with ReScript in `test/sandbox` (needs sandbox deps) |
| `npm run gen -- --pkg <name> --out <dir> --report` | generate bindings for a package |

CI (`.github/workflows/ci.yml`) runs the smoke+golden diff and the compile check on every PR, both
**blocking** — generated output cannot drift from `docs/TYPE_MAPPING.md` without a failing build.

## Conventions

- ESM, Node ≥ 20, single runtime dep (`typescript`). Match the terse, heavily-commented style of
  `src/*.mjs`.
