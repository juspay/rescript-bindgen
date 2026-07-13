# Binding report — `@juspay/blend-design-system@0.0.36`

**107** components · ✅ **102** usable · 🔍 **5** need review · 🛑 **0** broken

**55** function binding(s) → `BlendDesignSystemBindings.res`.

**2015** shared types deduplicated into **63** `*Types.res` modules (referenced qualified — no per-file redeclaration).

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
- `BlendChartBaseInstance`
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
- `ChartV2BaseInstance`
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
- ChartV2Fullscreen
- ChartV2NoData
- ChartV2Skeleton
- ChatInput
- Checkbox
- CodeBlock
- CodeEditor
- CoreChart
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
- SkeletonAvatar2
- SkeletonBase
- SkeletonBase2
- SkeletonCard
- SkeletonCard2
- SkeletonCircle
- SkeletonRectangle
- SkeletonRounded
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
- Timeline
- TimelineHeader
- TimelineHeader2
- TimelineLabel
- TimelineLabel2
- TimelineNode
- TimelineNode2
- TimelineShowMore
- TimelineShowMore2
- TimelineSubstep
- TimelineSubstep2
- Tooltip
- UnitInput
- Upload
- VirtualList

## ⚪ Loosely typed (widened to `string`)

These resolved to a real but complex type and were widened to `string` (they compile and work). Grouped by type so you can review each pattern once — confirm `string` is acceptable, or it may deserve a tighter mapping.

_(none)_

## 🔍 Needs review

A multi-type prop couldn't be auto-discriminated at runtime (e.g. two object shapes), so an `@unboxed` variant won't work and we **refuse to use `%identity`/unsafe casts**. The prop is emitted as a `string` placeholder with an inline `// ⚠️ REVIEW` comment — bind it by hand or fix the type upstream.

### BlendChart

| Prop | Real TypeScript |
|------|-----------------|
| `ref` | `Ref<HighchartsReactRefObject>` — binds, but references shared field(s) `axis.crosshair` (`review`), `axis.addPlotBand` (`review`), `axis.getPlotBandPath` (`review`), `axis.setExtremes` (`any`) emitted as `string` |
| `options` | `Options` — binds, but references shared field(s) `options.defs` (`review`), `accessibilityOptions.customComponents` (`any`), `accessibilityOptions.highContrastTheme` (`any`), `accessibilityOptions.linkedDescription` (`review`) emitted as `string` |
| `callback` | `ChartCallbackFunction` — binds, but references shared field(s) `axis.crosshair` (`review`), `axis.addPlotBand` (`review`), `axis.getPlotBandPath` (`review`), `axis.setExtremes` (`any`) emitted as `string` |

### ChartV2

| Prop | Real TypeScript |
|------|-----------------|
| `options` | `options?: Highcharts.Options;` — binds, but references shared field(s) `options.defs` (`review`), `accessibilityOptions.customComponents` (`any`), `accessibilityOptions.highContrastTheme` (`any`), `accessibilityOptions.linkedDescription` (`review`) emitted as `string` |
| `callback` | `callback?: Highcharts.ChartCallbackFunction;` — binds, but references shared field(s) `axis.crosshair` (`review`), `axis.addPlotBand` (`review`), `axis.getPlotBandPath` (`review`), `axis.setExtremes` (`any`) emitted as `string` |
| `ref` | `Ref<HighchartsReactRefObject>` — binds, but references shared field(s) `axis.crosshair` (`review`), `axis.addPlotBand` (`review`), `axis.getPlotBandPath` (`review`), `axis.setExtremes` (`any`) emitted as `string` |

### ChartV2Legend

| Prop | Real TypeScript |
|------|-----------------|
| `chartRef` | `chartRef?: RefObject<ChartV2ReactRefObject \| null>;` — binds, but references shared field(s) `axis.crosshair` (`review`), `axis.addPlotBand` (`review`), `axis.getPlotBandPath` (`review`), `axis.setExtremes` (`any`) emitted as `string` |
| `chartRefs` | `chartRefs?: ReadonlyArray<RefObject<ChartV2ReactRefObject \| null>>;` — binds, but references shared field(s) `axis.crosshair` (`review`), `axis.addPlotBand` (`review`), `axis.getPlotBandPath` (`review`), `axis.setExtremes` (`any`) emitted as `string` |
| `renderItem` | `renderItem?: (params: { item: ChartV2LegendItem; name: string; visible: boolean; color: string; value?: string \| number; onClick: () => void; }) => ReactNode;` — binds, but references shared field(s) `patternOptionsObject.path` (`review`), `axis.crosshair` (`review`), `axis.addPlotBand` (`review`), `axis.getPlotBandPath` (`review`) emitted as `string` |

### DataTable

| Prop | Real TypeScript |
|------|-----------------|
| `columns` | `columns: ColumnDefinition<T>[];` — binds, but references shared field(s) `dateColumnProps.date` (`review`) emitted as `string` |
| `onColumnReorder` | `onColumnReorder?: (columns: ColumnDefinition<T>[]) => void;` — binds, but references shared field(s) `dateColumnProps.date` (`review`) emitted as `string` |

### ThemeProvider

| Prop | Real TypeScript |
|------|-----------------|
| `componentTokens` | `componentTokens?: ComponentTokenType;` — binds, but references shared field(s) `popoverV2PopoverV2TokenTypeTopContainerHeadingIconSizeConfig.sm` (`review`), `popoverV2PopoverV2TokenTypeTopContainerHeadingIconSizeConfig.md` (`review`), `popoverV2PopoverV2TokenTypeTopContainerHeadingIconSizeConfig.lg` (`review`), `dataTableHeaderTypeActionIconsColumnManagerTriggerConfig.opacity` (`review`) emitted as `string` |

## 🛑 Broken — needs serious component change

These props resolved to `unknown`/`any` (usually a generic `T`). They're emitted as a placeholder so the file still compiles, but **the props will not work as typed** — they need a concrete type upstream, or generic-binding support.

_(none)_ 🎉

