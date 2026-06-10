# Binding report — `react-markdown@10.1.0`

**2** components · ✅ **0** usable · 🔍 **2** need review · 🛑 **0** broken

**2** function binding(s) → `ReactMarkdownBindings.res`.

**11** shared types deduplicated into **2** `*Types.res` modules (referenced qualified — no per-file redeclaration).

## 📦 Dependencies

| Kind | Package | Provides | Status |
|------|---------|----------|--------|
| required | `@rescript/react + stdlib` | JsxDOM, Dom, React, ReactEvent | ✓ present |
| optional | `rescript-webapi` | File, FileList | ✓ present → used |

## 🔧 Function bindings

Standalone function exports, emitted as positional `@module external` bindings in `ReactMarkdownBindings.res`.

- `MarkdownAsync`
- `defaultUrlTransform`

## ✅ Usable

These compile and every prop is bound type-safely — use them directly.
_(n loose)_ = some props widened to `string`; they still work, just loosely typed.

_(none)_

## ⚪ Loosely typed (widened to `string`)

These resolved to a real but complex type and were widened to `string` (they compile and work). Grouped by type so you can review each pattern once — confirm `string` is acceptable, or it may deserve a tighter mapping.

| Resolved TypeScript type | → emitted | count | example props |
|--------------------------|-----------|-------|---------------|
| `AllowElement` | `string` | 2 | allowElement |
| `UrlTransform` | `string` | 2 | urlTransform |

## 🔍 Needs review

A multi-type prop couldn't be auto-discriminated at runtime (e.g. two object shapes), so an `@unboxed` variant won't work and we **refuse to use `%identity`/unsafe casts**. The prop is emitted as a `string` placeholder with an inline `// ⚠️ REVIEW` comment — bind it by hand or fix the type upstream.

### Markdown  _(2 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `rehypePlugins` | `rehypePlugins?: PluggableList \| null \| undefined;` |
| `remarkPlugins` | `remarkPlugins?: PluggableList \| null \| undefined;` |

### MarkdownHooks  _(2 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `rehypePlugins` | `rehypePlugins?: PluggableList \| null \| undefined;` |
| `remarkPlugins` | `remarkPlugins?: PluggableList \| null \| undefined;` |

## 🛑 Broken — needs serious component change

These props resolved to `unknown`/`any` (usually a generic `T`). They're emitted as a placeholder so the file still compiles, but **the props will not work as typed** — they need a concrete type upstream, or generic-binding support.

_(none)_ 🎉

