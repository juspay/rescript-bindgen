# Binding report — `@juspay/blend-design-system@0.0.36`

**96** components · ✅ **96** usable · 🔍 **0** need review · 🛑 **0** broken

**53** function binding(s) → `BlendDesignSystemBindings.res`.

**2328** shared types deduplicated into **62** `*Types.res` modules (referenced qualified — no per-file redeclaration).

## 📦 Dependencies

| Kind | Package | Provides | Status |
|------|---------|----------|--------|
| required | `@rescript/react + stdlib` | JsxDOM, Dom, React, ReactEvent | ✓ present |
| optional | `rescript-webapi` | File, FileList | ✓ present → used |

## 🔧 Function bindings

Standalone function exports, emitted as positional `@module external` bindings in `BlendDesignSystemBindings.res`.

- `getButtonTokens`
- `getTabsTokens`
- `getAlertTokens`
- `getTagTokens`
- `getBreadcrumbTokens`
- `getAvatarTokens`
- `getAvatarGroupTokens`
- `getModalComponentTokens`
- `getTooltipTokens`
- `getAccordionToken`
- `addSnackbar`
- `getSnackbarTokens`
- `getPopoverTokens`
- `getChartTokens`
- `getCalendarToken`
- `getStatCardToken`
- `getCardTokens`
- `getTextInputTokens`
- `getNumberInputTokens`
- `getDropdownInputTokens`
- `getSearchInputTokens`
- `getOTPInputTokens`
- `getUnitInputTokens`
- `getMultiValueInputTokens`
- `getMenuTokens`
- `validateColumnData`
- `getColumnTypeConfig`
- `getTableToken`
- `getSidebarTokens`
- `getDirectoryTokens`
- `getMultiSelectTokens`
- `getSingleSelectTokens`
- `getSliderTokenStyles`
- `formatSliderValue`
- `parseSliderValue`
- `createSliderRange`
- `buildThumbAriaAttributes`
- `getSliderLabelStyles`
- `getProgressBarTokens`
- `getStepperTokens`
- `useSkeletonBase`
- `getSkeletonState`
- `mergeSkeletonProps`
- `getSkeletonDefaults`
- `getSkeletonTokens`
- `getKeyValuePairTokens`
- `getUploadTokens`
- `getChatInputTokens`
- `useTheme`
- `FOUNDATION_THEME`
- `getChartV2Tokens`
- `getTimelineTokens`
- `getAlertV2Tokens`

## ✅ Usable

These compile and every prop is bound type-safely — use them directly.
_(n loose)_ = some props widened to `string`; they still work, just loosely typed.

- Accordion
- AccordionItem
- Alert
- AlertV2
- Avatar
- AvatarGroup
- BlendChart  _(2 loose)_
- BlendChartContainer
- BlendChartHeader
- Breadcrumb
- Button
- ButtonGroup
- Card
- ChartContainer
- ChartContainerV2
- ChartHeader
- ChartHeaderV2
- ChartLegends
- Charts
- ChartV2  _(1 loose)_
- ChartV2Fullscreen
- ChartV2Legend
- ChartV2NoData
- ChartV2Skeleton
- ChatInput
- Checkbox
- CodeBlock
- CodeEditor
- CoreChart
- DataTable
- DateRangePicker
- Directory
- Drawer
- DrawerBody
- DrawerClose
- DrawerContent
- DrawerDescription
- DrawerFooter
- DrawerHeader
- DrawerOverlay
- DrawerPortal
- DrawerTitle
- DrawerTrigger
- DropdownInput
- KeyValuePair
- Menu
- MobileDrawerPresets
- Modal
- MultiSelect
- MultiSelectDrawer
- MultiSelectTrigger
- MultiValueInput
- NestedMultiSelectDrawer
- NestedSingleSelectDrawer
- NumberInput
- OTPInput
- Popover
- ProgressBar
- Radio
- RadioGroup
- SankeyLink
- SankeyNode
- SearchInput
- Sidebar
- SingleSelect
- SingleSelectDrawer
- Skeleton
- SkeletonAvatar
- SkeletonBase
- SkeletonCard
- Slider
- Snackbar
- SplitTag
- StatCard
- StatusDrawer
- Stepper
- Switch
- SwitchGroup
- Tabs
- TabsContent
- TabsList
- TabsTrigger
- Tag
- TextArea
- TextInput
- ThemeProvider
- Timeline
- TimelineHeader
- TimelineLabel
- TimelineNode
- TimelineShowMore
- TimelineSubstep
- Tooltip
- UnitInput
- Upload
- VirtualList

## ⚪ Loosely typed (widened to `string`)

These resolved to a real but complex type and were widened to `string` (they compile and work). Grouped by type so you can review each pattern once — confirm `string` is acceptable, or it may deserve a tighter mapping.

| Resolved TypeScript type | → emitted | count | example props |
|--------------------------|-----------|-------|---------------|
| `typeof import("/Users/roshan.chourasiya/work/FE/opensource/rescript-bindgen/benchmark/.work/_juspay_blend-design-system/sandbox/node_modules/highcharts/highcharts")` | `string` | 2 | highcharts |
| `[boolean] \| [boolean, boolean] \| [boolean, boolean, boolean]` | `string` | 1 | updateArgs |

## 🔍 Needs review

A multi-type prop couldn't be auto-discriminated at runtime (e.g. two object shapes), so an `@unboxed` variant won't work and we **refuse to use `%identity`/unsafe casts**. The prop is emitted as a `string` placeholder with an inline `// ⚠️ REVIEW` comment — bind it by hand or fix the type upstream.

_(none)_

## 🛑 Broken — needs serious component change

These props resolved to `unknown`/`any` (usually a generic `T`). They're emitted as a placeholder so the file still compiles, but **the props will not work as typed** — they need a concrete type upstream, or generic-binding support.

_(none)_ 🎉

