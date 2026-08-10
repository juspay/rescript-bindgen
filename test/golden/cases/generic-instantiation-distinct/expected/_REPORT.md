# Binding report — `demo`

**6** components · ✅ **6** usable · 🔍 **0** need review · 🛑 **0** broken

**4** function binding(s) → `DemoBindings.res`.

**7** class module(s) → `@new`/`@send`/`@get` bindings.

**30** shared types deduplicated into **2** `*Types.res` modules (referenced qualified — no per-file redeclaration).

## 📦 Dependencies

| Kind | Package | Provides | Status |
|------|---------|----------|--------|
| required | `@rescript/react + stdlib` | JsxDOM, Dom, React, ReactEvent | ✓ present |
| optional | `rescript-webapi` | File, FileList | ✗ not installed |

## 🔧 Function bindings

Standalone function exports, emitted as positional `@module external` bindings in `DemoBindings.res`.

- `takeFnArms`
- `takeSharedArms`
- `fnDigit`
- `fnDigitForName`

## 🏛 Class modules

Each class binds to its own `<Name>.res` module with an abstract `type t` (`@new` constructor, `@send` methods, `@get` properties).

| Class | Constructor | Methods | Properties |
|-------|-------------|---------|------------|
| `Api` | ✓ | 3 | 0 |
| `Svc` | ✓ | 5 | 0 |
| `Headers` | ✓ | 5 | 0 |
| `Req` | ✓ | 1 | 0 |
| `Collapsed` | ✓ | 4 | 0 |
| `Statics` | ✓ | 0 | 0 |
| `CtorOverload` | ✓ | 0 | 0 |

## ✅ Usable

These compile and every prop is bound type-safely — use them directly.
_(n loose)_ = some props widened to `string`; they still work, just loosely typed.

- Edge  _(6 loose)_
- InlineArm
- Kinds
- NamedArm
- setHeader
- Symmetry

## ⚪ Loosely typed (widened to `string`)

These resolved to a real but complex type and were widened to `string` (they compile and work). Grouped by type so you can review each pattern once — confirm `string` is acceptable, or it may deserve a tighter mapping.

| Resolved TypeScript type | → emitted | count | example props |
|--------------------------|-----------|-------|---------------|
| `"2"` | `string` | 1 | digit |
| `"0"` | `string` | 1 | zero |
| `"say \\"hi\\""` | `string` | 1 | quoted |
| `"C:\\\\Users"` | `string` | 1 | backslash |
| `"a\\tb"` | `string` | 1 | tabbed |
| `"_"` | `string` | 1 | underscore |

## 🔍 Needs review

A multi-type prop couldn't be auto-discriminated at runtime (e.g. two object shapes), so an `@unboxed` variant won't work and we **refuse to use `%identity`/unsafe casts**. The prop is emitted as a `string` placeholder with an inline `// ⚠️ REVIEW` comment — bind it by hand or fix the type upstream.

_(none)_

## 🛑 Broken — needs serious component change

These props resolved to `unknown`/`any` (usually a generic `T`). They're emitted as a placeholder so the file still compiles, but **the props will not work as typed** — they need a concrete type upstream, or generic-binding support.

_(none)_ 🎉

