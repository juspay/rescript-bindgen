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

### Step 3 — (optional) Enable Claude PR reviews
GitHub repo → **Settings → Secrets and variables → Actions** → add secret
`ANTHROPIC_API_KEY` (from console.anthropic.com). Without it, the
`Claude Auto Review` workflow simply no-ops.

---

## Admin checklist

- [ ] npm account is an `@juspay` member with publish rights
- [ ] `npm publish --access public` once to bootstrap v1.0.0
- [ ] Configure Trusted Publisher → `juspay/rescript-bindgen` + `publish-npm.yml`
- [ ] (optional) add `ANTHROPIC_API_KEY` repo secret
- [ ] Verify: bump version, push tag, confirm the workflow publishes

---

## Release flow (after setup — for everyone)

```bash
npm version patch          # or minor / major — bumps package.json + creates the v-tag
git push --follow-tags     # pushes the commit AND the tag → publish-npm.yml runs → npm
```

That's it: **bump → push tag → it ships itself.**

---

## Notes / gotchas

- The workflow **fails on purpose** if the git tag (`v1.2.3`) doesn't match the
  `package.json` version (`1.2.3`). `npm version` keeps them in sync, so use it.
- OIDC requires the repo to be the exact one configured in the trusted publisher.
  If you fork/rename the repo, update the trusted publisher.
- `--provenance` adds a signed link between the npm release and the GitHub Actions
  run (supply-chain transparency). It needs the public repo + OIDC, both set up here.
