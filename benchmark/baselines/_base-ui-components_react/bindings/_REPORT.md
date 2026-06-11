# Binding report — `@base-ui-components/react@1.0.0-rc.0`

**195** components · ✅ **182** usable · 🔍 **13** need review · 🛑 **0** broken

**9** function binding(s) → `ReactBindings.res`.

**374** shared types deduplicated into **41** `*Types.res` modules (referenced qualified — no per-file redeclaration).

## 📦 Dependencies

| Kind | Package | Provides | Status |
|------|---------|----------|--------|
| required | `@rescript/react + stdlib` | JsxDOM, Dom, React, ReactEvent | ✓ present |
| optional | `rescript-webapi` | File, FileList | ✓ present → used |

## 🔧 Function bindings

Standalone function exports, emitted as positional `@module external` bindings in `ReactBindings.res`.

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
- ComboboxPortal
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
- MenuPortal
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
- PopoverPortal
- PopoverRoot
- PopoverTitle
- PopoverTrigger
- PopoverViewport
- PreviewCardArrow
- PreviewCardBackdrop
- PreviewCardPopup
- PreviewCardPortal
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

### ComboboxPopup

| Prop | Real TypeScript |
|------|-----------------|
| `initialFocus` | `initialFocus?: boolean \| React.RefObject<HTMLElement \| null> \| ((openType: InteractionType) => void \| boolean \| HTMLElement \| null);` |
| `finalFocus` | `finalFocus?: boolean \| React.RefObject<HTMLElement \| null> \| ((closeType: InteractionType) => void \| boolean \| HTMLElement \| null);` |

### ComboboxPositioner  _(1 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `anchor` | `anchor?: Element \| null \| VirtualElement \| React.RefObject<Element \| null> \| (() => Element \| VirtualElement \| null);` |
| `collisionBoundary` | `collisionBoundary?: Boundary;` |

### DialogPopup

| Prop | Real TypeScript |
|------|-----------------|
| `initialFocus` | `initialFocus?: boolean \| React.RefObject<HTMLElement \| null> \| ((openType: InteractionType) => boolean \| HTMLElement \| null \| void);` |
| `finalFocus` | `finalFocus?: boolean \| React.RefObject<HTMLElement \| null> \| ((closeType: InteractionType) => boolean \| HTMLElement \| null \| void);` |

### MenuPopup

| Prop | Real TypeScript |
|------|-----------------|
| `finalFocus` | `finalFocus?: boolean \| React.RefObject<HTMLElement \| null> \| ((closeType: InteractionType) => boolean \| HTMLElement \| null \| void);` |

### MenuPositioner  _(1 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `anchor` | `anchor?: Element \| null \| VirtualElement \| React.RefObject<Element \| null> \| (() => Element \| VirtualElement \| null);` |
| `collisionBoundary` | `collisionBoundary?: Boundary;` |

### NavigationMenuPositioner  _(1 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `anchor` | `anchor?: Element \| null \| VirtualElement \| React.RefObject<Element \| null> \| (() => Element \| VirtualElement \| null);` |
| `collisionBoundary` | `collisionBoundary?: Boundary;` |

### PopoverPopup

| Prop | Real TypeScript |
|------|-----------------|
| `initialFocus` | `initialFocus?: boolean \| React.RefObject<HTMLElement \| null> \| ((openType: InteractionType) => void \| boolean \| HTMLElement \| null);` |
| `finalFocus` | `finalFocus?: boolean \| React.RefObject<HTMLElement \| null> \| ((closeType: InteractionType) => void \| boolean \| HTMLElement \| null);` |

### PopoverPositioner  _(1 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `anchor` | `anchor?: Element \| null \| VirtualElement \| React.RefObject<Element \| null> \| (() => Element \| VirtualElement \| null);` |
| `collisionBoundary` | `collisionBoundary?: Boundary;` |

### PreviewCardPositioner  _(1 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `anchor` | `anchor?: Element \| null \| VirtualElement \| React.RefObject<Element \| null> \| (() => Element \| VirtualElement \| null);` |
| `collisionBoundary` | `collisionBoundary?: Boundary;` |

### SelectPositioner  _(1 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `anchor` | `anchor?: Element \| null \| VirtualElement \| React.RefObject<Element \| null> \| (() => Element \| VirtualElement \| null);` |
| `collisionBoundary` | `collisionBoundary?: Boundary;` |

### SelectRoot  _(2 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `items` | `items?: Record<string, React.ReactNode> \| ReadonlyArray<{ label: React.ReactNode; value: any; }>;` |

### ToastPositioner  _(1 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `collisionBoundary` | `collisionBoundary?: Boundary;` |

### TooltipPositioner  _(1 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `anchor` | `anchor?: Element \| null \| VirtualElement \| React.RefObject<Element \| null> \| (() => Element \| VirtualElement \| null);` |
| `collisionBoundary` | `collisionBoundary?: Boundary;` |

## 🛑 Broken — needs serious component change

These props resolved to `unknown`/`any` (usually a generic `T`). They're emitted as a placeholder so the file still compiles, but **the props will not work as typed** — they need a concrete type upstream, or generic-binding support.

_(none)_ 🎉

