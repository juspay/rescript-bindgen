# Binding report — `@base-ui-components/react@1.0.0-rc.0`

**195** components · ✅ **195** usable · 🔍 **0** need review · 🛑 **0** broken

**10** function binding(s) → `ReactBindings.res`.

**545** shared types deduplicated into **58** `*Types.res` modules (referenced qualified — no per-file redeclaration).

## 📦 Dependencies

| Kind | Package | Provides | Status |
|------|---------|----------|--------|
| required | `@rescript/react + stdlib` | JsxDOM, Dom, React, ReactEvent | ✓ present |
| optional | `rescript-webapi` | File, FileList | ✓ present → used |

## 🔧 Function bindings

Standalone function exports, emitted as positional `@module external` bindings in `ReactBindings.res`.

- `PARENT_CHECKBOX`
- `useDirection`
- `useMenuSubmenuRootContext`
- `mergeProps`
- `mergePropsN`
- `makeEventPreventable`
- `mergeClassNames`
- `useToastManager`
- `createToastManager`
- `useRender`

## ✅ Usable

These compile and every prop is bound type-safely — use them directly.
_(n loose)_ = some props widened to `string`; they still work, just loosely typed.

- AccordionHeader
- AccordionItem
- AccordionPanel
- AccordionRoot
- AccordionTrigger
- AlertDialogRoot
- AutocompleteRoot
- AutocompleteValue
- AvatarFallback
- AvatarImage
- AvatarRoot
- Button
- CheckboxGroup
- CheckboxIndicator
- CheckboxRoot
- CollapsiblePanel
- CollapsibleRoot
- CollapsibleTrigger
- ComboboxArrow
- ComboboxBackdrop
- ComboboxChip
- ComboboxChipRemove
- ComboboxChips
- ComboboxClear
- ComboboxCollection
- ComboboxEmpty
- ComboboxGroup
- ComboboxGroupLabel
- ComboboxIcon
- ComboboxInput
- ComboboxItem
- ComboboxItemIndicator
- ComboboxList
- ComboboxPopup
- ComboboxPortal
- ComboboxPositioner  _(1 loose)_
- ComboboxRoot  _(2 loose)_
- ComboboxRow
- ComboboxStatus
- ComboboxTrigger
- ComboboxValue
- ContextMenuRoot
- ContextMenuTrigger
- DialogBackdrop
- DialogClose
- DialogDescription
- DialogPopup
- DialogPortal
- DialogRoot
- DialogTitle
- DialogTrigger
- DialogViewport
- DirectionProvider
- FieldControl
- FieldDescription
- FieldError
- FieldLabel
- FieldRoot
- FieldsetLegend
- FieldsetRoot
- FieldValidity
- Form
- Input
- MenuArrow
- MenuBackdrop
- Menubar
- MenuCheckboxItem
- MenuCheckboxItemIndicator
- MenuGroup
- MenuGroupLabel
- MenuItem
- MenuPopup
- MenuPortal
- MenuPositioner  _(1 loose)_
- MenuRadioGroup
- MenuRadioItem
- MenuRadioItemIndicator
- MenuRoot
- MenuSubmenuRoot
- MenuSubmenuTrigger
- MenuTrigger
- MeterIndicator
- MeterLabel
- MeterRoot  _(1 loose)_
- MeterTrack
- MeterValue
- NavigationMenuArrow
- NavigationMenuBackdrop
- NavigationMenuContent
- NavigationMenuIcon
- NavigationMenuItem
- NavigationMenuLink
- NavigationMenuList
- NavigationMenuPopup
- NavigationMenuPortal
- NavigationMenuPositioner  _(1 loose)_
- NavigationMenuRoot
- NavigationMenuTrigger
- NavigationMenuViewport
- NumberFieldDecrement
- NumberFieldGroup
- NumberFieldIncrement
- NumberFieldInput
- NumberFieldRoot  _(1 loose)_
- NumberFieldScrubArea
- NumberFieldScrubAreaCursor
- PopoverArrow
- PopoverBackdrop
- PopoverClose
- PopoverDescription
- PopoverPopup
- PopoverPortal
- PopoverPositioner  _(1 loose)_
- PopoverRoot
- PopoverTitle
- PopoverTrigger
- PopoverViewport
- PreviewCardArrow
- PreviewCardBackdrop
- PreviewCardPopup
- PreviewCardPortal
- PreviewCardPositioner  _(1 loose)_
- PreviewCardRoot
- PreviewCardTrigger
- ProgressIndicator
- ProgressLabel
- ProgressRoot  _(1 loose)_
- ProgressTrack
- ProgressValue
- RadioGroup
- RadioIndicator
- RadioRoot
- ScrollAreaContent
- ScrollAreaCorner
- ScrollAreaRoot  _(1 loose)_
- ScrollAreaScrollbar
- ScrollAreaThumb
- ScrollAreaViewport
- SelectArrow
- SelectBackdrop
- SelectGroup
- SelectGroupLabel
- SelectIcon
- SelectItem
- SelectItemIndicator
- SelectItemText
- SelectList
- SelectPopup
- SelectPortal
- SelectPositioner  _(1 loose)_
- SelectRoot  _(2 loose)_
- SelectScrollDownArrow
- SelectScrollUpArrow
- SelectTrigger
- SelectValue
- Separator
- SliderControl
- SliderIndicator
- SliderRoot  _(1 loose)_
- SliderThumb
- SliderTrack
- SliderValue
- SwitchRoot
- SwitchThumb
- TabsIndicator
- TabsList
- TabsPanel
- TabsRoot
- TabsTab
- ToastAction
- ToastArrow
- ToastClose
- ToastContent
- ToastDescription
- ToastPortal
- ToastPositioner  _(1 loose)_
- ToastProvider
- ToastRoot
- ToastTitle
- ToastViewport
- Toggle
- ToggleGroup
- ToolbarButton
- ToolbarGroup
- ToolbarInput
- ToolbarLink
- ToolbarRoot
- ToolbarSeparator
- TooltipArrow
- TooltipPopup
- TooltipPortal
- TooltipPositioner  _(1 loose)_
- TooltipProvider
- TooltipRoot
- TooltipTrigger

## ⚪ Loosely typed (widened to `string`)

These resolved to a real but complex type and were widened to `string` (they compile and work). Grouped by type so you can review each pattern once — confirm `string` is acceptable, or it may deserve a tighter mapping.

| Resolved TypeScript type | → emitted | count | example props |
|--------------------------|-----------|-------|---------------|
| `Padding` | `string` | 8 | collisionPadding … |
| `NumberFormatOptions` | `string` | 4 | format |
| `ComboboxValueType<Value, Multiple>` | `string` | 2 | defaultValue, value |
| `SelectValueType<Value, Multiple>` | `string` | 2 | defaultValue, value |
| `number \| Partial<{ xStart: number; xEnd: number; yStart: number; yEnd: number; }>` | `string` | 1 | overflowEdgeThreshold |

## 🔍 Needs review

A multi-type prop couldn't be auto-discriminated at runtime (e.g. two object shapes), so an `@unboxed` variant won't work and we **refuse to use `%identity`/unsafe casts**. The prop is emitted as a `string` placeholder with an inline `// ⚠️ REVIEW` comment — bind it by hand or fix the type upstream.

_(none)_

## 🛑 Broken — needs serious component change

These props resolved to `unknown`/`any` (usually a generic `T`). They're emitted as a placeholder so the file still compiles, but **the props will not work as typed** — they need a concrete type upstream, or generic-binding support.

_(none)_ 🎉

