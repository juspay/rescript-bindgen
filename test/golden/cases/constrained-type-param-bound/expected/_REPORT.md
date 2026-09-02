# Binding report — `demo`

**0** components · ✅ **0** usable · 🔍 **0** need review · 🛑 **0** broken

**25** function binding(s) → `DemoBindings.res`.

**2** class module(s) → `@new`/`@send`/`@get` bindings.

**28** shared types deduplicated into **2** `*Types.res` modules (referenced qualified — no per-file redeclaration).

## 🔤 Constructor name collisions

ReScript scopes variant constructors to the **module**, not to their type, so one `*Types.res` can define the same name twice. Where the expected type is known from context ReScript picks correctly; where it **isn't**, it binds the *last* definition in the file — with no error or warning.

### Renamed — the same name carried DIFFERENT runtime representations

A bare constant, an identity payload and a `@tag`-injected object are different shapes at runtime. Left alone, an unannotated use would have compiled cleanly and produced the **wrong one**. Each colliding definition is suffixed with the tail of its owning type's name.

| Module | Constructor | Conflicting runtime representations | Renamed to |
|---|---|---|---|
| `ConstrainedTypeParamBoundTypes` | `A` | `"a"` / `{tag: "a", …}` | `AParamVTag`, `ATVString` |
| `ConstrainedTypeParamBoundTypes` | `B` | `"b"` / `{tag: "b", …}` | `BParamVTag`, `BTVString` |

### Left as-is — same name, same runtime representation (2)

These produce the same runtime shape whichever definition wins, so renaming them would churn every consumer for no correctness gain. Listed because the ambiguity is still there to read.

- `ConstrainedTypeParamBoundTypes`: `Off`, `On`

## 📦 Dependencies

| Kind | Package | Provides | Status |
|------|---------|----------|--------|
| required | `@rescript/react + stdlib` | JsxDOM, Dom, React, ReactEvent | ✓ present |
| optional | `rescript-webapi` | File, FileList | ✗ not installed |

## 🔧 Function bindings

Standalone function exports, emitted as positional `@module external` bindings in `DemoBindings.res`.

- `greet`
- `setSize`
- `echo`
- `identity`
- `make`
- `boxParam`
- `boxRoundTrip`
- `boxBoth`
- `arrParam`
- `useRenderLike`
- `mixed`
- `nestedParam`
- `selfParam`
- `flaggedParam`
- `setFlag`
- `deepParam`
- `d7RT`
- `boundaryParam`
- `tvParam`
- `tvRoundTrip`
- `homoParam`
- `recTvParam`
- `mkBox`
- `unionParam`
- `unionRoundTrip`

## 🏛 Class modules

Each class binds to its own `<Name>.res` module with an abstract `type t` (`@new` constructor, `@send` methods, `@get` properties).

| Class | Constructor | Methods | Properties |
|-------|-------------|---------|------------|
| `Registry` | ✓ | 2 | 0 |
| `Boxed` | ✓ | 0 | 1 |

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

