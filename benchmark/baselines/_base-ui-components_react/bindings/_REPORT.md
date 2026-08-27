# Binding report — `@base-ui-components/react@1.0.0-rc.0`

**195** components · ✅ **174** usable · 🔍 **21** need review · 🛑 **0** broken

**13** function binding(s) → `ReactBindings.res`.

**566** shared types deduplicated into **56** `*Types.res` modules (referenced qualified — no per-file redeclaration).

## 🔤 Constructor name collisions

ReScript scopes variant constructors to the **module**, not to their type, so one `*Types.res` can define the same name twice. Where the expected type is known from context ReScript picks correctly; where it **isn't**, it binds the *last* definition in the file — with no error or warning.

### Left as-is — same name, same runtime representation (203)

These produce the same runtime shape whichever definition wins, so renaming them would churn every consumer for no correctness gain. Listed because the ambiguity is still there to read.

- `RootSharedTypes`: `ActiveIndex`, `ActiveTriggerElement`, `ActiveTriggerId`, `ActiveTriggerProps`, `AllowMouseEnter`, `Both`, `CancelOpen`, `Click`, `CloseDelay`, `ClosePress`, `DecrementPress`, `DescriptionElementId`, `Disabled`, `DisableHoverablePopup`, `DisablePointerDismissal`, `Dismiss`, `DomReferenceElement`, `EscapeKey`, `FloatingElement`, `FloatingId`, `FloatingNodeId`, `FloatingParentNodeId`, `FloatingRootContext`, `FloatingTreeRoot`, `Fn`, `FocusOut`, `Horizontal`, `HoverEnabled`, `ImperativeAction`, `InactiveTriggerProps` … +52 more
- `PositionerSharedTypes`: `Bottom`, `End`, `Flip`, `Fn`, `InlineEnd`, `InlineStart`, `Left`, `None`, `Num`, `Right`, `Shift`, `Start`, `Str`, `Style`, `Top`
- `ItemTypes`: `Fn`, `Str`, `Style`
- `TriggerTypes`: `ActiveTriggerElement`, `ActiveTriggerId`, `ActiveTriggerProps`, `CloseDelay`, `DescriptionElementId`, `Disabled`, `FloatingRootContext`, `Fn`, `InactiveTriggerProps`, `InstantType`, `Modal`, `Mounted`, `Nested`, `Open`, `OpenChangeReason`, `OpenMethod`, `Payload`, `PopupElement`, `PopupProps`, `PositionerElement`, `PreventUnmountingOnClose`, `StickIfOpen`, `Str`, `Style`, `TitleElementId`, `TransitionStatus`
- `CommonTypes`: `Bool`, `Fn`, `Num`, `Str`, `StrArr`, `Style`
- `PanelTypes`: `Fn`, `Str`, `Style`
- `ButtonTypes`: `Fn`, `Str`, `Style`
- `IndicatorTypes`: `Fn`, `Str`, `Style`
- `CheckboxGroupTypes`: `Fn`
- `InputTypes`: `Fn`, `Str`, `Style`
- `PopupTypes`: `Bool`, `Fn`, `Ref`, `Str`, `Style`
- `ListTypes`: `Fn`, `Str`, `Style`
- `ItemIndicatorTypes`: `Fn`
- `ArrowTypes`: `Fn`, `Str`, `Style`
- `BackdropTypes`: `Fn`
- `ChipTypes`: `Fn`
- `ChipRemoveTypes`: `Fn`
- `ClearTypes`: `Fn`
- `CloseTypes`: `Fn`, `Str`, `Style`
- `ViewportTypes`: `Fn`, `Str`, `Style`
- `LegendTypes`: `Fn`
- `CheckboxItemTypes`: `Fn`
- `CheckboxItemIndicatorTypes`: `Fn`
- `RadioGroupTypes`: `Fn`, `Str`, `Style`
- `RadioItemTypes`: `Fn`
- `RadioItemIndicatorTypes`: `Fn`
- `SubmenuTriggerTypes`: `Fn`
- `ContentTypes`: `Down`, `Fn`, `Left`, `Right`, `Str`, `Style`, `Up`
- `LinkTypes`: `Fn`, `Str`, `Style`
- `IconTypes`: `Fn`
- `GroupTypes`: `Fn`
- `IncrementTypes`: `Fn`
- `DecrementTypes`: `Fn`
- `ScrubAreaTypes`: `Fn`
- `ScrubAreaCursorTypes`: `Fn`
- `ScrollbarTypes`: `Fn`
- `ThumbTypes`: `Fn`, `Str`, `Style`
- `ValueTypes`: `Fn`
- `SeparatorTypes`: `Fn`
- `DescriptionTypes`: `Fn`
- `TitleTypes`: `Fn`
- `ActionTypes`: `Fn`
- `ToggleTypes`: `Fn`
- `ToggleGroupTypes`: `Fn`

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
| `handle` | `handle?: DialogHandle<Payload>;` — binds, but references shared field(s) `dialogStoreV1cpzz.controlledValues` (`any`), `dialogStoreV1cpzz.selectors` (`any`), `dialogStoreV1cpzz.useSyncedValue` (`unknown`), `dialogStoreV1cpzz.useControlledProp` (`unknown`) emitted as `string` |

### ContextMenuRoot

| Prop | Real TypeScript |
|------|-----------------|
| `handle` | `handle?: MenuHandle<Payload>;` — binds, but references shared field(s) `menuStoreV17hkr.unsubscribeParentListener` (`any`), `menuStoreV17hkr.controlledValues` (`any`), `menuStoreV17hkr.selectors` (`any`), `menuStoreV17hkr.set` (`unknown`) emitted as `string` |

### DialogRoot

| Prop | Real TypeScript |
|------|-----------------|
| `handle` | `handle?: DialogHandle<Payload>;` — binds, but references shared field(s) `dialogStoreV1cpzz2.controlledValues` (`any`), `dialogStoreV1cpzz2.selectors` (`any`), `dialogStoreV1cpzz2.useSyncedValue` (`unknown`), `dialogStoreV1cpzz2.useControlledProp` (`unknown`) emitted as `string` |

### DialogTrigger

| Prop | Real TypeScript |
|------|-----------------|
| `handle` | `handle?: DialogHandle<Payload>;` — binds, but references shared field(s) `dialogStoreV9tmgy.controlledValues` (`any`), `dialogStoreV9tmgy.selectors` (`any`), `dialogStoreV9tmgy.useSyncedValue` (`unknown`), `dialogStoreV9tmgy.useControlledProp` (`unknown`) emitted as `string` |

### MenuRoot

| Prop | Real TypeScript |
|------|-----------------|
| `handle` | `handle?: MenuHandle<Payload>;` — binds, but references shared field(s) `menuStoreV15aym.unsubscribeParentListener` (`any`), `menuStoreV15aym.controlledValues` (`any`), `menuStoreV15aym.selectors` (`any`), `menuStoreV15aym.useSyncedValue` (`unknown`) emitted as `string` |

### MenuSubmenuRoot

| Prop | Real TypeScript |
|------|-----------------|
| `handle` | `handle?: MenuHandle<Payload>;` — binds, but references shared field(s) `menuStoreV17hkr.unsubscribeParentListener` (`any`), `menuStoreV17hkr.controlledValues` (`any`), `menuStoreV17hkr.selectors` (`any`), `menuStoreV17hkr.set` (`unknown`) emitted as `string` |

### MenuTrigger

| Prop | Real TypeScript |
|------|-----------------|
| `handle` | `handle?: MenuHandle<Payload>;` — binds, but references shared field(s) `menuStoreCmh23.unsubscribeParentListener` (`any`), `menuStoreCmh23.controlledValues` (`any`), `menuStoreCmh23.selectors` (`any`), `menuStoreCmh23.useSyncedValue` (`unknown`) emitted as `string` |

### PopoverRoot

| Prop | Real TypeScript |
|------|-----------------|
| `handle` | `handle?: PopoverHandle<Payload>;` — binds, but references shared field(s) `popoverStoreV18r19.disposeEffect` (`any`), `popoverStoreV18r19.controlledValues` (`any`), `popoverStoreV18r19.selectors` (`any`), `popoverStoreV18r19.useSyncedValue` (`unknown`) emitted as `string` |

### PopoverTrigger

| Prop | Real TypeScript |
|------|-----------------|
| `handle` | `handle?: PopoverHandle<Payload>;` — binds, but references shared field(s) `popoverStoreNxgp0.disposeEffect` (`any`), `popoverStoreNxgp0.controlledValues` (`any`), `popoverStoreNxgp0.selectors` (`any`), `popoverStoreNxgp0.useSyncedValue` (`unknown`) emitted as `string` |

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
| `toastManager` | `toastManager?: ToastManager;` — binds, but references shared field(s) `toastManager.promise` (`unknown`), `toastManagerEvent.options` (`any`), `toastManagerPromiseOptions.loading` (`review`), `toastManagerPromiseOptions.success` (`review`) emitted as `string` |

### ToastRoot

| Prop | Real TypeScript |
|------|-----------------|
| `toast` | `toast: ToastRootToastObject<any>;` — binds, but references shared field(s) `toastRootToastObject.data` (`any`) emitted as `string` |

### TooltipRoot

| Prop | Real TypeScript |
|------|-----------------|
| `handle` | `handle?: TooltipHandle<Payload>;` — binds, but references shared field(s) `tooltipStoreLyqeh.controlledValues` (`any`), `tooltipStoreLyqeh.selectors` (`any`), `tooltipStoreLyqeh.useSyncedValue` (`unknown`), `tooltipStoreLyqeh.useControlledProp` (`unknown`) emitted as `string` |

### TooltipTrigger

| Prop | Real TypeScript |
|------|-----------------|
| `handle` | `handle?: TooltipHandle<Payload>;` — binds, but references shared field(s) `tooltipStoreV17v53.controlledValues` (`any`), `tooltipStoreV17v53.selectors` (`any`), `tooltipStoreV17v53.useSyncedValue` (`unknown`), `tooltipStoreV17v53.useControlledProp` (`unknown`) emitted as `string` |

## 🛑 Broken — needs serious component change

These props resolved to `unknown`/`any` (usually a generic `T`). They're emitted as a placeholder so the file still compiles, but **the props will not work as typed** — they need a concrete type upstream, or generic-binding support.

_(none)_ 🎉

