# Binding report — `@base-ui-components/react@1.0.0-rc.0`

**195** components · ✅ **174** usable · 🔍 **21** need review · 🛑 **0** broken

**13** function binding(s) → `ReactBindings.res`.

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
- `mergePropsWithC`
- `mergePropsWithCAndD`
- `mergePropsWithCAndDAndE`
- `mergePropsN`
- `makeEventPreventable`
- `mergeClassNames`
- `useToastManager`
- `createToastManager`
- `useRender`

## ✅ Usable

These compile and every prop is bound type-safely — use them directly.
_(n loose)_ = some props widened to `string`; they still work, just loosely typed.

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
- ContextMenuTrigger
- DialogBackdrop
- DialogClose
- DialogDescription
- DialogPopup
- DialogPortal
- DialogTitle
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
- MenuSubmenuTrigger
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
- PopoverTitle
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

### AccordionHeader

| Prop | Real TypeScript |
|------|-----------------|
| `style` | `style?: CSSProperties \| undefined;` — binds, but references shared field(s) `accordionItemState.value` (`any`) emitted as `string` |
| `className` | `className?: string \| ((state: State) => string \| undefined);` — binds, but references shared field(s) `accordionItemState.value` (`any`) emitted as `string` |

### AccordionItem

| Prop | Real TypeScript |
|------|-----------------|
| `style` | `style?: CSSProperties \| undefined;` — binds, but references shared field(s) `accordionItemState.value` (`any`) emitted as `string` |
| `className` | `className?: string \| ((state: State) => string \| undefined);` — binds, but references shared field(s) `accordionItemState.value` (`any`) emitted as `string` |

### AccordionPanel

| Prop | Real TypeScript |
|------|-----------------|
| `style` | `style?: CSSProperties \| undefined;` — binds, but references shared field(s) `accordionPanelState.value` (`any`) emitted as `string` |
| `className` | `className?: string \| ((state: State) => string \| undefined);` — binds, but references shared field(s) `accordionPanelState.value` (`any`) emitted as `string` |

### AccordionRoot

| Prop | Real TypeScript |
|------|-----------------|
| `style` | `style?: CSSProperties \| undefined;` — binds, but references shared field(s) `accordionRootState.value` (`any`) emitted as `string` |
| `className` | `className?: string \| ((state: State) => string \| undefined);` — binds, but references shared field(s) `accordionRootState.value` (`any`) emitted as `string` |

### AccordionTrigger

| Prop | Real TypeScript |
|------|-----------------|
| `style` | `style?: CSSProperties \| undefined;` — binds, but references shared field(s) `accordionItemState.value` (`any`) emitted as `string` |
| `className` | `className?: string \| ((state: State) => string \| undefined);` — binds, but references shared field(s) `accordionItemState.value` (`any`) emitted as `string` |

### AlertDialogRoot

| Prop | Real TypeScript |
|------|-----------------|
| `handle` | `handle?: DialogHandle<Payload>;` — binds, but references shared field(s) `dialogStoreV9pmvf.controlledValues` (`any`), `dialogStoreV9pmvf.selectors` (`any`), `dialogStoreV9pmvf.useSyncedValue` (`unknown`), `dialogStoreV9pmvf.useSyncedValueWithCleanup` (`unknown`) emitted as `string` |

### ContextMenuRoot

| Prop | Real TypeScript |
|------|-----------------|
| `handle` | `handle?: MenuHandle<Payload>;` — binds, but references shared field(s) `menuStoreV15tin.unsubscribeParentListener` (`any`), `menuStoreV15tin.controlledValues` (`any`), `menuStoreV15tin.selectors` (`any`), `menuStoreV15tin.useSyncedValue` (`unknown`) emitted as `string` |

### DialogRoot

| Prop | Real TypeScript |
|------|-----------------|
| `handle` | `handle?: DialogHandle<Payload>;` — binds, but references shared field(s) `dialogStoreV9pmvf2.controlledValues` (`any`), `dialogStoreV9pmvf2.selectors` (`any`), `dialogStoreV9pmvf2.useSyncedValue` (`unknown`), `dialogStoreV9pmvf2.useSyncedValueWithCleanup` (`unknown`) emitted as `string` |

### DialogTrigger

| Prop | Real TypeScript |
|------|-----------------|
| `handle` | `handle?: DialogHandle<Payload>;` — binds, but references shared field(s) `dialogStoreNkdc0.controlledValues` (`any`), `dialogStoreNkdc0.selectors` (`any`), `dialogStoreNkdc0.useSyncedValue` (`unknown`), `dialogStoreNkdc0.useSyncedValueWithCleanup` (`unknown`) emitted as `string` |

### MenuRoot

| Prop | Real TypeScript |
|------|-----------------|
| `handle` | `handle?: MenuHandle<Payload>;` — binds, but references shared field(s) `menuStoreFoqt4.unsubscribeParentListener` (`any`), `menuStoreFoqt4.controlledValues` (`any`), `menuStoreFoqt4.selectors` (`any`), `menuStoreFoqt4.useSyncedValue` (`unknown`) emitted as `string` |

### MenuSubmenuRoot

| Prop | Real TypeScript |
|------|-----------------|
| `handle` | `handle?: MenuHandle<Payload>;` — binds, but references shared field(s) `menuStoreV15tin.unsubscribeParentListener` (`any`), `menuStoreV15tin.controlledValues` (`any`), `menuStoreV15tin.selectors` (`any`), `menuStoreV15tin.useSyncedValue` (`unknown`) emitted as `string` |

### MenuTrigger

| Prop | Real TypeScript |
|------|-----------------|
| `handle` | `handle?: MenuHandle<Payload>;` — binds, but references shared field(s) `menuStoreSoi6r.unsubscribeParentListener` (`any`), `menuStoreSoi6r.controlledValues` (`any`), `menuStoreSoi6r.selectors` (`any`), `menuStoreSoi6r.useSyncedValue` (`unknown`) emitted as `string` |

### PopoverRoot

| Prop | Real TypeScript |
|------|-----------------|
| `handle` | `handle?: PopoverHandle<Payload>;` — binds, but references shared field(s) `popoverStoreHtnqz.disposeEffect` (`any`), `popoverStoreHtnqz.controlledValues` (`any`), `popoverStoreHtnqz.selectors` (`any`), `popoverStoreHtnqz.useSyncedValue` (`unknown`) emitted as `string` |

### PopoverTrigger

| Prop | Real TypeScript |
|------|-----------------|
| `handle` | `handle?: PopoverHandle<Payload>;` — binds, but references shared field(s) `popoverStoreGz1y8.disposeEffect` (`any`), `popoverStoreGz1y8.controlledValues` (`any`), `popoverStoreGz1y8.selectors` (`any`), `popoverStoreGz1y8.useSyncedValue` (`unknown`) emitted as `string` |

### SelectTrigger

| Prop | Real TypeScript |
|------|-----------------|
| `style` | `style?: CSSProperties \| undefined;` — binds, but references shared field(s) `selectTriggerState.value` (`any`) emitted as `string` |
| `className` | `className?: string \| ((state: State) => string \| undefined);` — binds, but references shared field(s) `selectTriggerState.value` (`any`) emitted as `string` |

### SelectValue

| Prop | Real TypeScript |
|------|-----------------|
| `className` | `className?: string \| ((state: State) => string \| undefined);` — binds, but references shared field(s) `selectValueState.value` (`any`) emitted as `string` |
| `style` | `style?: CSSProperties \| undefined;` — binds, but references shared field(s) `selectValueState.value` (`any`) emitted as `string` |

### ToastPositioner  _(1 loose)_

| Prop | Real TypeScript |
|------|-----------------|
| `toast` | `toast: ToastObject<any>;` — binds, but references shared field(s) `toastObject.data` (`any`) emitted as `string` |

### ToastProvider

| Prop | Real TypeScript |
|------|-----------------|
| `toastManager` | `toastManager?: ToastManager;` — binds, but references shared field(s) `toastManager.promise` (`unknown`), `toastManagerEvent.options` (`any`), `toastManagerAddOptions.data` (`unknown`), `toastManagerPromiseOptions.loading` (`review`) emitted as `string` |

### ToastRoot

| Prop | Real TypeScript |
|------|-----------------|
| `toast` | `toast: ToastRootToastObject<any>;` — binds, but references shared field(s) `toastRootToastObject.data` (`any`) emitted as `string` |

### TooltipRoot

| Prop | Real TypeScript |
|------|-----------------|
| `handle` | `handle?: TooltipHandle<Payload>;` — binds, but references shared field(s) `tooltipStoreY7ia3.controlledValues` (`any`), `tooltipStoreY7ia3.selectors` (`any`), `tooltipStoreY7ia3.useSyncedValue` (`unknown`), `tooltipStoreY7ia3.useSyncedValueWithCleanup` (`unknown`) emitted as `string` |

### TooltipTrigger

| Prop | Real TypeScript |
|------|-----------------|
| `handle` | `handle?: TooltipHandle<Payload>;` — binds, but references shared field(s) `tooltipStoreSd50v.controlledValues` (`any`), `tooltipStoreSd50v.selectors` (`any`), `tooltipStoreSd50v.useSyncedValue` (`unknown`), `tooltipStoreSd50v.useSyncedValueWithCleanup` (`unknown`) emitted as `string` |

## 🛑 Broken — needs serious component change

These props resolved to `unknown`/`any` (usually a generic `T`). They're emitted as a placeholder so the file still compiles, but **the props will not work as typed** — they need a concrete type upstream, or generic-binding support.

_(none)_ 🎉

