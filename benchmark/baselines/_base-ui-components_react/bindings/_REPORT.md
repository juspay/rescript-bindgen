# Binding report — `@base-ui-components/react@1.0.0-rc.0`

**195** components · ✅ **151** usable · 🔍 **28** need review · 🛑 **16** broken

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
- AccordionPanel
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
- ComboboxEmpty
- ComboboxGroupLabel
- ComboboxIcon
- ComboboxInput
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
- NavigationMenuLink
- NavigationMenuList
- NavigationMenuPopup
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

### AccordionItem

| Prop | Real TypeScript | Why it won't work |
|------|-----------------|-------------------|
| `value` | `value?: any;` | Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly. |

### AccordionRoot

| Prop | Real TypeScript | Why it won't work |
|------|-----------------|-------------------|
| `value` | `value?: AccordionValue;` | Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly. |
| `defaultValue` | `defaultValue?: AccordionValue;` | Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly. |
| `onValueChange` | `onValueChange?: (value: AccordionValue, eventDetails: AccordionRootChangeEventDetails) => void;` | It's a **callback** typed `unknown` → emitted as `string`; passing a string does nothing. |

### ComboboxCollection

| Prop | Real TypeScript | Why it won't work |
|------|-----------------|-------------------|
| `children` | `children: (item: any, index: number) => React.ReactNode;` | It's a **callback** typed `unknown` → emitted as `string`; passing a string does nothing. |

### ComboboxGroup

| Prop | Real TypeScript | Why it won't work |
|------|-----------------|-------------------|
| `items` | `items?: readonly any[];` | Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly. |

### ComboboxItem

| Prop | Real TypeScript | Why it won't work |
|------|-----------------|-------------------|
| `value` | `value?: any;` | Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly. |

### FieldRoot

| Prop | Real TypeScript | Why it won't work |
|------|-----------------|-------------------|
| `validate` | `validate?: (value: unknown, formValues: Form.Values) => string \| string[] \| null \| Promise<string \| string[] \| null>;` | It's a **callback** typed `unknown` → emitted as `string`; passing a string does nothing. |

### MenuRadioGroup

| Prop | Real TypeScript | Why it won't work |
|------|-----------------|-------------------|
| `value` | `value?: any;` | Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly. |
| `defaultValue` | `defaultValue?: any;` | Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly. |
| `onValueChange` | `onValueChange?: (value: any, eventDetails: MenuRadioGroup.ChangeEventDetails) => void;` | It's a **callback** typed `unknown` → emitted as `string`; passing a string does nothing. |

### MenuRadioItem

| Prop | Real TypeScript | Why it won't work |
|------|-----------------|-------------------|
| `value` | `value: any;` | Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly. |

### NavigationMenuItem

| Prop | Real TypeScript | Why it won't work |
|------|-----------------|-------------------|
| `value` | `value?: any;` | Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly. |

### NavigationMenuRoot

| Prop | Real TypeScript | Why it won't work |
|------|-----------------|-------------------|
| `value` | `value?: any;` | Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly. |
| `defaultValue` | `defaultValue?: any;` | Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly. |
| `onValueChange` | `onValueChange?: (value: any, eventDetails: NavigationMenuRoot.ChangeEventDetails) => void;` | It's a **callback** typed `unknown` → emitted as `string`; passing a string does nothing. |

### RadioRoot

| Prop | Real TypeScript | Why it won't work |
|------|-----------------|-------------------|
| `value` | `value: any;` | Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly. |

### SelectItem

| Prop | Real TypeScript | Why it won't work |
|------|-----------------|-------------------|
| `value` | `value?: any;` | Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly. |

### TabsPanel

| Prop | Real TypeScript | Why it won't work |
|------|-----------------|-------------------|
| `value` | `value: TabsTab.Value;` | Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly. |

### TabsRoot

| Prop | Real TypeScript | Why it won't work |
|------|-----------------|-------------------|
| `value` | `value?: TabsTab.Value;` | Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly. |
| `defaultValue` | `defaultValue?: TabsTab.Value;` | Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly. |
| `onValueChange` | `onValueChange?: (value: TabsTab.Value, eventDetails: TabsRoot.ChangeEventDetails) => void;` | It's a **callback** typed `unknown` → emitted as `string`; passing a string does nothing. |

### TabsTab

| Prop | Real TypeScript | Why it won't work |
|------|-----------------|-------------------|
| `value` | `value: TabsTab.Value;` | Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly. |

### ToggleGroup

| Prop | Real TypeScript | Why it won't work |
|------|-----------------|-------------------|
| `value` | `value?: readonly any[];` | Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly. |
| `defaultValue` | `defaultValue?: readonly any[];` | Resolved to `unknown` (generic `T` / untyped) → emitted as `string`; real values won't be used correctly. |
| `onValueChange` | `onValueChange?: (groupValue: any[], eventDetails: ToggleGroup.ChangeEventDetails) => void;` | It's a **callback** typed `unknown` → emitted as `string`; passing a string does nothing. |

