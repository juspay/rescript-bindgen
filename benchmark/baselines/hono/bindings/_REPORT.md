# Binding report — `hono@4.12.25`

**0** components · ✅ **0** usable · 🔍 **0** need review · 🛑 **0** broken

**3** class module(s) → `@new`/`@send`/`@get` bindings.

**34** shared types deduplicated into **6** `*Types.res` modules (referenced qualified — no per-file redeclaration).

## 🔤 Constructor name collisions

ReScript scopes variant constructors to the **module**, not to their type, so one `*Types.res` can define the same name twice. Where the expected type is known from context ReScript picks correctly; where it **isn't**, it binds the *last* definition in the file — with no error or warning.

### Left as-is — same name, same runtime value (60)

These resolve to the right value whichever definition wins, so renaming them would churn every consumer for no correctness gain. Listed because the ambiguity is still there to read.

- `CommonTypes`: `N_1`, `N100`, `N102`, `N103`, `N200`, `N201`, `N202`, `N203`, `N206`, `N207`, `N208`, `N226`, `N300`, `N301`, `N302`, `N303`, `N305`, `N306`, `N307`, `N308`, `N400`, `N401`, `N402`, `N403`, `N404`, `N405`, `N406`, `N407`, `N408`, `N409` … +30 more

## 📦 Dependencies

| Kind | Package | Provides | Status |
|------|---------|----------|--------|
| required | `@rescript/react + stdlib` | JsxDOM, Dom, React, ReactEvent | ✓ present |
| optional | `rescript-webapi` | File, FileList | ✓ present → used |

## 🏛 Class modules

Each class binds to its own `<Name>.res` module with an abstract `type t` (`@new` constructor, `@send` methods, `@get` properties).

| Class | Constructor | Methods | Properties |
|-------|-------------|---------|------------|
| `Context` | ✓ | 15 | 8 |
| `HonoRequest` | ✓ | 13 | 8 |
| `Hono` | ✓ | 18 | 2 |

## ✅ Usable

These compile and every prop is bound type-safely — use them directly.
_(n loose)_ = some props widened to `string`; they still work, just loosely typed.

_(none)_

## ⚪ Loosely typed (widened to `string`)

These resolved to a real but complex type and were widened to `string` (they compile and work). Grouped by type so you can review each pattern once — confirm `string` is acceptable, or it may deserve a tighter mapping.

_(none)_

## 🔍 Needs review

A multi-type prop couldn't be auto-discriminated at runtime (e.g. two object shapes), so an `@unboxed` variant won't work and we **refuse to use `%identity`/unsafe casts**. The prop is emitted as a `string` placeholder with an inline `// ⚠️ REVIEW` comment — bind it by hand or fix the type upstream.

_(none)_

## 🛑 Broken — needs serious component change

These props resolved to `unknown`/`any` (usually a generic `T`). They're emitted as a placeholder so the file still compiles, but **the props will not work as typed** — they need a concrete type upstream, or generic-binding support.

_(none)_ 🎉

