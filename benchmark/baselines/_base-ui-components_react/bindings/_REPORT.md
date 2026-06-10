# Binding report — `@base-ui-components/react@1.0.0-rc.0`

**195** components · ✅ **167** usable · 🔍 **28** need review · 🛑 **0** broken

**9** function binding(s) → `ReactBindings.res`.

**371** shared types deduplicated into **40** `*Types.res` modules (referenced qualified — no per-file redeclaration).

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
- ComboboxRow
- ComboboxStatus
- ComboboxTrigger
- ComboboxValue
- ContextMenuRoot
- ContextMenuTrigger
- DialogBackdrop
- DialogClose
- DialogDescription
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
- MenuRadioGroup
- MenuRadioItem
- MenuRadioItemIndicator
- MenuRoot
- MenuSubmenuRoot
- MenuSubmenuTrigger
- MenuTrigger
- MeterIndicator
- MeterLabel
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
- NavigationMenuRoot
- NavigationMenuTrigger
- NavigationMenuViewport
- NumberFieldDecrement
- NumberFieldGroup
- NumberFieldIncrement
- NumberFieldInput
- NumberFieldScrubArea
- NumberFieldScrubAreaCursor
- PopoverArrow
- PopoverBackdrop
- PopoverClose
- PopoverDescription
- PopoverRoot
- PopoverTitle
- PopoverTrigger
- PopoverViewport
- PreviewCardArrow
- PreviewCardBackdrop
- PreviewCardPopup
- PreviewCardRoot
- PreviewCardTrigger
- ProgressIndicator
- ProgressLabel
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
- SelectScrollDownArrow
- SelectScrollUpArrow
- SelectTrigger
- SelectValue
- Separator
- SliderControl
- SliderIndicator
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
| `(itemValue: Items[number]["items"][number], query: string, itemToString?: (itemValue: Items[number]["items"][number]) => string) => boolean` | `string` | 1 | filter |
| `(highlightedValue: Items[number]["items"][number], eventDetails: HighlightEventDetails) => void` | `string` | 1 | onItemHighlighted |
| `(itemValue: Items[number]["items"][number]) => string` | `string` | 1 | itemToStringValue |
| `(value: ComboboxValueType<Value, Multiple> \| (Multiple extends true ? never : null), eventDetails: ChangeEventDetails) => void` | `string` | 1 | onValueChange |
| `number \| Partial<{ xStart: number; xEnd: number; yStart: number; yEnd: number; }>` | `string` | 1 | overflowEdgeThreshold |
| `(value: SelectValueType<Value, Multiple> \| (Multiple extends true ? never : null), eventDetails: SelectRootChangeEventDetails) => void` | `string` | 1 | onValueChange |
| `(value: Value extends number ? number : Value, eventDetails: SliderRootChangeEventDetails) => void` | `string` | 1 | onValueChange |
| `(value: Value extends number ? number : Value, eventDetails: SliderRootCommitEventDetails) => void` | `string` | 1 | onValueCommitted |

## 🔍 Needs review

A multi-type prop couldn't be auto-discriminated at runtime (e.g. two object shapes), so an `@unboxed` variant won't work and we **refuse to use `%identity`/unsafe casts**. The prop is emitted as a `string` placeholder with an inline `// ⚠️ REVIEW` comment — bind it by hand or fix the type upstream.

### AutocompleteRoot  _(3 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `locale` | `locale?: Intl.LocalesArgument;` |

### ComboboxPopup

| Prop | Real TypeScript |
|------|-----------------|
| `initialFocus` | `initialFocus?: boolean \| React.RefObject<HTMLElement \| null> \| ((openType: InteractionType) => void \| boolean \| HTMLElement \| null);` |
| `finalFocus` | `finalFocus?: boolean \| React.RefObject<HTMLElement \| null> \| ((closeType: InteractionType) => void \| boolean \| HTMLElement \| null);` |

### ComboboxPortal

| Prop | Real TypeScript |
|------|-----------------|
| `container` | `container?: UseFloatingPortalNodeProps['container'];` |

### ComboboxPositioner  _(1 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `anchor` | `anchor?: Element \| null \| VirtualElement \| React.RefObject<Element \| null> \| (() => Element \| VirtualElement \| null);` |
| `collisionBoundary` | `collisionBoundary?: Boundary;` |

### ComboboxRoot  _(3 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `locale` | `locale?: Intl.LocalesArgument;` |

### DialogPopup

| Prop | Real TypeScript |
|------|-----------------|
| `initialFocus` | `initialFocus?: boolean \| React.RefObject<HTMLElement \| null> \| ((openType: InteractionType) => boolean \| HTMLElement \| null \| void);` |
| `finalFocus` | `finalFocus?: boolean \| React.RefObject<HTMLElement \| null> \| ((closeType: InteractionType) => boolean \| HTMLElement \| null \| void);` |

### DialogPortal

| Prop | Real TypeScript |
|------|-----------------|
| `container` | `container?: FloatingPortal.Props<DialogPortal.State>['container'];` |

### MenuPopup

| Prop | Real TypeScript |
|------|-----------------|
| `finalFocus` | `finalFocus?: boolean \| React.RefObject<HTMLElement \| null> \| ((closeType: InteractionType) => boolean \| HTMLElement \| null \| void);` |

### MenuPortal

| Prop | Real TypeScript |
|------|-----------------|
| `container` | `container?: UseFloatingPortalNodeProps['container'];` |

### MenuPositioner  _(1 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `anchor` | `anchor?: Element \| null \| VirtualElement \| React.RefObject<Element \| null> \| (() => Element \| VirtualElement \| null);` |
| `collisionBoundary` | `collisionBoundary?: Boundary;` |

### MeterRoot  _(1 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `locale` | `locale?: Intl.LocalesArgument;` |

### NavigationMenuPortal

| Prop | Real TypeScript |
|------|-----------------|
| `container` | `container?: FloatingPortal.Props<NavigationMenuPortal.State>['container'];` |

### NavigationMenuPositioner  _(1 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `anchor` | `anchor?: Element \| null \| VirtualElement \| React.RefObject<Element \| null> \| (() => Element \| VirtualElement \| null);` |
| `collisionBoundary` | `collisionBoundary?: Boundary;` |

### NumberFieldRoot  _(1 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `locale` | `locale?: Intl.LocalesArgument;` |

### PopoverPopup

| Prop | Real TypeScript |
|------|-----------------|
| `initialFocus` | `initialFocus?: boolean \| React.RefObject<HTMLElement \| null> \| ((openType: InteractionType) => void \| boolean \| HTMLElement \| null);` |
| `finalFocus` | `finalFocus?: boolean \| React.RefObject<HTMLElement \| null> \| ((closeType: InteractionType) => void \| boolean \| HTMLElement \| null);` |

### PopoverPortal

| Prop | Real TypeScript |
|------|-----------------|
| `container` | `container?: UseFloatingPortalNodeProps['container'];` |

### PopoverPositioner  _(1 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `anchor` | `anchor?: Element \| null \| VirtualElement \| React.RefObject<Element \| null> \| (() => Element \| VirtualElement \| null);` |
| `collisionBoundary` | `collisionBoundary?: Boundary;` |

### PreviewCardPortal

| Prop | Real TypeScript |
|------|-----------------|
| `container` | `container?: UseFloatingPortalNodeProps['container'];` |

### PreviewCardPositioner  _(1 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `anchor` | `anchor?: Element \| null \| VirtualElement \| React.RefObject<Element \| null> \| (() => Element \| VirtualElement \| null);` |
| `collisionBoundary` | `collisionBoundary?: Boundary;` |

### ProgressRoot  _(1 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `locale` | `locale?: Intl.LocalesArgument;` |

### SelectPortal

| Prop | Real TypeScript |
|------|-----------------|
| `container` | `container?: UseFloatingPortalNodeProps['container'];` |

### SelectPositioner  _(1 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `anchor` | `anchor?: Element \| null \| VirtualElement \| React.RefObject<Element \| null> \| (() => Element \| VirtualElement \| null);` |
| `collisionBoundary` | `collisionBoundary?: Boundary;` |

### SelectRoot  _(3 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `items` | `items?: Record<string, React.ReactNode> \| ReadonlyArray<{ label: React.ReactNode; value: any; }>;` |

### SliderRoot  _(3 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `locale` | `locale?: Intl.LocalesArgument;` |

### ToastPortal

| Prop | Real TypeScript |
|------|-----------------|
| `container` | `container?: UseFloatingPortalNodeProps['container'];` |

### ToastPositioner  _(1 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `collisionBoundary` | `collisionBoundary?: Boundary;` |

### TooltipPortal

| Prop | Real TypeScript |
|------|-----------------|
| `container` | `container?: UseFloatingPortalNodeProps['container'];` |

### TooltipPositioner  _(1 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `anchor` | `anchor?: Element \| null \| VirtualElement \| React.RefObject<Element \| null> \| (() => Element \| VirtualElement \| null);` |
| `collisionBoundary` | `collisionBoundary?: Boundary;` |

## 🛑 Broken — needs serious component change

These props resolved to `unknown`/`any` (usually a generic `T`). They're emitted as a placeholder so the file still compiles, but **the props will not work as typed** — they need a concrete type upstream, or generic-binding support.

_(none)_ 🎉

