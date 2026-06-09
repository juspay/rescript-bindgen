# Publishing setup

This package auto-publishes to npm when a `v*` git tag is pushed, using
**npm OIDC trusted publishing** (no long-lived tokens). The CI/workflow side is
already done in this repo — the steps below are the **one-time setup that needs
npm admin access to the `@juspay` scope** (Sachin / whoever owns npm publishing).

---

## Already done in this repo (no action needed)

- **`.github/workflows/publish-npm.yml`** — triggers on `v*` tags. It:
  - runs on Node 24 (npm ≥ 11.5.1, the floor for OIDC trusted publishing),
  - has `permissions: id-token: write` (supplies the OIDC token),
  - runs the test, verifies the tag matches `package.json` version,
  - then `npm publish --access public --provenance`.
- **`package.json`** — name `@juspay/rescript-bindgen`, `files` allowlist, public scope, `exports`/`types` set.

So **no `NPM_TOKEN` secret is needed** — npm exchanges the workflow's short-lived OIDC token at publish time.

---

## What the npm admin must do (one-time)

### Prerequisite
- An npm account that is a **member of the `@juspay` org** with publish rights to the scope.

### Step 1 — Bootstrap the package (first publish)
The package name doesn't exist on npm yet. Publish `v1.0.0` once, by hand:
```bash
cd rescript-bindgen
npm login                    # an @juspay member
npm whoami                   # confirm
npm publish --access public  # creates @juspay/rescript-bindgen on npm
```
*(A brand-new scoped package needs `--access public` or npm treats it as private.)*

### Step 2 — Configure the trusted publisher (enables hands-free releases)
On **npmjs.com** → the package → **Settings** → **Trusted Publisher** (a.k.a.
"Publishing access" → GitHub Actions), add:

| Field | Value |
|-------|-------|
| Provider | **GitHub Actions** |
| Repository owner | `juspay` |
| Repository name | `rescript-bindgen` |
| Workflow filename | `publish-npm.yml` |
| Environment | *(leave blank)* |

Save. From now on, every `v*` tag push publishes automatically via OIDC.

---

## Admin checklist

- [ ] npm account is an `@juspay` member with publish rights
- [ ] `npm publish --access public` once to bootstrap v1.0.0
- [ ] Configure Trusted Publisher → `juspay/rescript-bindgen` + `publish-npm.yml`
- [ ] Verify: bump version, push tag, confirm the workflow publishes

---

## Release flow (after setup — for everyone)

### Stable release → npm dist-tag `latest`
```bash
npm version patch          # or minor / major — bumps package.json + creates the v-tag
git push --follow-tags     # pushes the commit AND the tag → publish-npm.yml runs → npm
```

### Prerelease → npm dist-tag `beta` (or `rc`, `alpha`, …)
```bash
npm version prerelease --preid=beta   # 1.0.0 -> 1.0.1-beta.0 (re-run -> -beta.1, …)
git push --follow-tags                # tag v1.0.1-beta.0 → publishes under `beta`
```
Consumers then opt in with `npm i @juspay/rescript-bindgen@beta`, while
`npm i @juspay/rescript-bindgen` keeps installing the latest **stable**.

The workflow derives the dist-tag from the version automatically: a `-beta.`/`-rc.`/`-alpha.`
prerelease publishes under that pre-id; a plain `x.y.z` publishes to `latest`. So a beta tag
**never displaces the stable release**.

To later promote a beta to stable, just cut a normal release (`npm version patch` →
`x.y.z` → `latest`), or move the tag on npm: `npm dist-tag add @juspay/rescript-bindgen@1.0.1-beta.3 latest`.

That's it: **bump → push tag → it ships itself**, to the right channel.

---

## Preview releases (pkg.pr.new) — test a PR/commit without a real release

Every PR and every push to `main` auto-publishes an **ephemeral, commit-pinned preview** of the
tool via [pkg.pr.new](https://pkg.pr.new) (the `preview` job in `.github/workflows/ci.yml`, gated on
the tests passing). The bot posts a sticky PR comment with an install URL like:

```bash
npm i https://pkg.pr.new/@juspay/rescript-bindgen@<sha>
```

Install that in any project and run the CLI (`npx rescript-bindgen …`) to test the **exact** build of
a PR/commit — no clone, no `npm link`, no waiting for a real release. Previews live on pkg.pr.new's
domain (not npmjs.org) and are **not** real publishes; they don't touch `latest`/`beta`.

**One-time setup:** install the [pkg-pr-new GitHub App](https://github.com/apps/pkg-pr-new) on the
repo (done). No token to manage — it authorizes via the App.

---

## Notes / gotchas

- The workflow **fails on purpose** if the git tag (`v1.2.3`) doesn't match the
  `package.json` version (`1.2.3`). `npm version` keeps them in sync, so use it.
- OIDC requires the repo to be the exact one configured in the trusted publisher.
  If you fork/rename the repo, update the trusted publisher.
- `--provenance` adds a signed link between the npm release and the GitHub Actions
  run (supply-chain transparency). It needs the public repo + OIDC, both set up here.
- **dist-tags:** the workflow publishes a prerelease version under its pre-id
  (`1.2.3-beta.0` → `beta`) and a plain version under `latest` — automatically, from the
  version string. So you never accidentally ship a beta as the default install. Mint
  prereleases with `npm version prerelease --preid=beta` (then `-beta.1`, `-beta.2`, … on re-run).
