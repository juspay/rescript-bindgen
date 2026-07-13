# Binding report — `@juspay/blend-design-system@0.0.37-beta.8`

**222** components · ✅ **215** usable · 🔍 **7** need review · 🛑 **0** broken

**249** function binding(s) → `BlendDesignSystemBindings.res`.

**2659** shared types deduplicated into **74** `*Types.res` modules (referenced qualified — no per-file redeclaration).

## 📦 Dependencies

| Kind | Package | Provides | Status |
|------|---------|----------|--------|
| required | `@rescript/react + stdlib` | JsxDOM, Dom, React, ReactEvent | ✓ present |
| optional | `rescript-webapi` | File, FileList | ✓ present → used |

## 🔧 Function bindings

Standalone function exports, emitted as positional `@module external` bindings in `BlendDesignSystemBindings.res`.

- `FOUNDATION_THEME`
- `useTheme`
- `useShadowRoot`
- `getAccordionToken`
- `getAlertTokens`
- `getAvatarTokens`
- `getAvatarGroupTokens`
- `getBreadcrumbTokens`
- `normalizeBreadcrumbItems`
- `getButtonTokens`
- `getCardTokens`
- `getChartTokens`
- `BlendChartBaseInstance`
- `getChatInputTokens`
- `validateColumnData`
- `getColumnTypeConfig`
- `getTableToken`
- `getCalendarToken`
- `getDirectoryTokens`
- `getTextInputTokens`
- `getNumberInputTokens`
- `getDropdownInputTokens`
- `getSearchInputTokens`
- `getOTPInputTokens`
- `getUnitInputTokens`
- `getMultiValueInputTokens`
- `getKeyValuePairTokens`
- `getMenuTokens`
- `getModalComponentTokens`
- `getMultiSelectTokens`
- `getPopoverTokens`
- `getProgressBarTokens`
- `getSidebarTokens`
- `useSkeletonBase`
- `getSkeletonState`
- `mergeSkeletonProps`
- `getSkeletonDefaults`
- `getSkeletonTokens`
- `getSingleSelectTokens`
- `getSliderTokenStyles`
- `formatSliderValue`
- `parseSliderValue`
- `createSliderRange`
- `buildThumbAriaAttributes`
- `getSliderLabelStyles`
- `addSnackbar`
- `getSnackbarTokens`
- `getStatCardToken`
- `getStepperTokens`
- `getTabsTokens`
- `getTagTokens`
- `getTooltipTokens`
- `getUploadTokens`
- `getButtonV2Tokens`
- `getButtonV2BorderRadius`
- `createButtonClickHandler`
- `getButtonHeight`
- `getIconMaxHeight`
- `getButtonStatus`
- `getButtonTabIndex`
- `getSkeletonBorderRadius`
- `getSkeletonWidth`
- `getButtonBorderStyles`
- `getButtonStyles`
- `getIconColor`
- `getTextColor`
- `getButtonPadding`
- `getButtonLineHeight`
- `getAlertV2Tokens`
- `getTagV2Tokens`
- `getTagBorderRadius`
- `getAccessibleName`
- `createKeyboardHandler`
- `getCheckboxV2Tokens`
- `getCheckboxDataState`
- `getCheckboxIconColor`
- `getCheckboxTextColor`
- `getCheckboxSubtextColor`
- `getCheckboxTextProps`
- `getCheckboxSubtextProps`
- `getCheckboxLabelStyles`
- `getAccessibilityAttributes`
- `getSubtextId`
- `mergeCheckboxV2AriaDescribedBy`
- `handleCheckboxKeyDown`
- `getCheckboxState`
- `getRadioV2Tokens`
- `getSwitchV2Tokens`
- `getBreadcrumbV2Tokens`
- `getPlainTextFromReactNode`
- `filterBreadcrumbItemChildren`
- `indexBreadcrumbChildren`
- `computeBreadcrumbOverflowLayout`
- `resolveBreadcrumbItemActive`
- `createStubNativeClickEvent`
- `createStubAnchorClickEvent`
- `getAvatarV2Tokens`
- `getInitialsFromText`
- `sanitizeTextForLabel`
- `renderFallbackContent`
- `getColorFromText`
- `getAccessibleLabel`
- `getAriaLiveValue`
- `getStatusPositionStyles`
- `createAvatarKeyboardHandler`
- `isInteractive`
- `DEFAULT_AVATAR_ALT`
- `DEFAULT_FALLBACK_COLOR`
- `MAX_INITIALS_LENGTH`
- `DEFAULT_POSITION`
- `getTooltipV2Tokens`
- `getProgressBarV2Tokens`
- `normalizeRange`
- `clampValue`
- `getProgressBarValueState`
- `calculatePercentage`
- `parseTokenValue`
- `extractProgressBarV2AriaProps`
- `generateDefaultAriaLabel`
- `getCircularDimensions`
- `parseCircularDashToken`
- `calculateCircularProgressStroke`
- `STATCARD_FALLBACK_DISPLAY`
- `renderVariantFallbackValue`
- `buildStatCardV2ChartOptions`
- `getStatCardV2Tokens`
- `buildStatCardV2AriaLabel`
- `ACCORDION_TRANSITION`
- `getAccordionV2Tokens`
- `getTextInputV2Tokens`
- `toEmbeddedSingleSelectV2Props`
- `FOCUS_RING_STYLES`
- `TRANSITION`
- `getInputState`
- `getVerticalInputPadding`
- `getTextAreaV2Tokens`
- `useTabsV2Context`
- `TabsV2Context`
- `getTabsV2Tokens`
- `processTabsWithConcatenation`
- `prepareDropdownItems`
- `calculateTabIndicatorPosition`
- `getActualTabValue`
- `isConcatenatedTab`
- `extractOriginalValues`
- `mergeItemsWithDefaultOrdering`
- `applyTabItemDisplayDefaults`
- `useChartLegend`
- `useChartLegendHover`
- `useChartRefs`
- `getLegendItems`
- `applyHoverState`
- `mergeChartOptions`
- `getChartV2Tokens`
- `ChartV2BaseInstance`
- `getButtonGroupPosition`
- `getButtonGroupGap`
- `getPopoverV2Tokens`
- `getSidebarV2Tokens`
- `isControlledSidebarV2`
- `getSidebarV2Status`
- `announceSidebarV2StateChange`
- `getTopbarV2Styles`
- `getSidebarV2MobileNavigationItems`
- `useTopbarV2AutoHide`
- `getStepperV2Tokens`
- `scheduleLiveRegionAnnouncement`
- `getStepState`
- `getTimelineTokens`
- `getTopbarV2Tokens`
- `SELECT_V2_MENU_Z_INDEX`
- `useSelectV2MenuBehavior`
- `getMultiValueInputV2Tokens`
- `getNumberInputV2Tokens`
- `getOTPInputV2Tokens`
- `getSearchInputV2Tokens`
- `addSnackbarV2`
- `getSnackbarV2Tokens`
- `getCodeEditorV2Tokens`
- `getEditorMetrics`
- `getContainerDimensions`
- `getPlaceholderPosition`
- `configureLanguageDefaults`
- `blurMonacoEditorDom`
- `getMonacoViewModeOptions`
- `syncDiffEditorPaneViewMode`
- `getMountEditorOptions`
- `getUpdateEditorOptions`
- `getDiffEditorOptions`
- `getInitialEditorOptions`
- `EDITOR_FOCUS_DELAY_MS`
- `COPY_FEEDBACK_RESET_MS`
- `MIN_SCROLLBAR_SIZE`
- `copyToClipboardWithTemporaryFeedback`
- `shouldShowLineNumbers`
- `isDiffEditorMode`
- `getCodeEditorV2ContainerStyles`
- `toCssValue`
- `toNumericValue`
- `backupColor`
- `getKeyValuePairV2Tokens`
- `getKeyValuePairV2ContainerStyles`
- `getLayoutStyles`
- `getSlotStyles`
- `getMenuV2Tokens`
- `getItemSlots`
- `getItemMatchRank`
- `defaultSearchSortFn`
- `filterMenuV2Item`
- `getMenuItemBackgroundColor`
- `getMenuItemOptionColor`
- `getMenuItemDescriptionColor`
- `flattenMenuV2Groups`
- `filterMenuV2Groups`
- `getMultiSelectV2Tokens`
- `getMultiSelectBorderRadius`
- `getMultiSelectCrossBorderRadius`
- `getSelectAllState`
- `getMultiSelectV2ValueLabelMap`
- `getFilteredMenuItem`
- `filterMultiSelectV2MenuGroups`
- `getAllAvailableValues`
- `handleSelectAll`
- `flattenMenuGroups`
- `getTriggerLeftPadding`
- `getTriggerTopPadding`
- `getTriggerHorizontalPadding`
- `getTriggerVerticalPadding`
- `getSingleSelectV2Tokens`
- `getSingleSelectV2BorderRadius`
- `getSingleSelectV2ValueLabelMap`
- `flattenGroups`
- `filterSingleSelectV2MenuGroups`
- `filterSingleSelectV2Item`
- `isTooltipWrappingTrigger`
- `getMenuItemIndex`
- `getVirtualRowEstimate`
- `getItemOrdinalIndex`
- `defaultSingleSelectV2Skeleton`
- `DROPDOWN_DATA_ATTR`
- `MENU_SCROLL_SELECTORS`
- `DEFAULT_END_REACHED_THRESHOLD`
- `generateAccessibilityIds`
- `extractSingleSelectV2AriaProps`
- `mergeSingleSelectV2AriaDescribedBy`
- `buildAriaAttributes`
- `setupAccessibility`
- `VIRTUAL_ROW_ESTIMATES`
- `getChatInputV2Tokens`

## ✅ Usable

These compile and every prop is bound type-safely — use them directly.
_(n loose)_ = some props widened to `string`; they still work, just loosely typed.

- Accordion
- AccordionItem
- AccordionV2
- AccordionV2Chevron
- AccordionV2Item
- AccordionV2TriggerContent
- Alert
- AlertV2
- Avatar
- AvatarGroup
- AvatarV2
- Badge
- BlendChartContainer
- BlendChartHeader
- Breadcrumb
- BreadcrumbV2
- BreadcrumbV2Icon
- BreadcrumbV2Item
- BreadcrumbV2List
- BreadcrumbV2OverflowMenu
- BreadcrumbV2Page
- BreadcrumbV2Separator
- Button
- ButtonGroup
- ButtonGroupV2
- ButtonV2
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
- ChatInputV2
- Checkbox
- CheckboxV2
- CircularProgressBarV2
- CodeBlock
- CodeEditor
- CodeEditorV2
- CodeEditorV2Header
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
- DrawerV2
- DrawerV2Body
- DrawerV2Close
- DrawerV2Content
- DrawerV2Description
- DrawerV2Footer
- DrawerV2Header
- DrawerV2NestedRoot
- DrawerV2Overlay
- DrawerV2Portal
- DrawerV2Title
- DrawerV2Trigger
- DropdownInput
- IconButton
- KeyValuePair
- KeyValuePairLayout
- KeyValuePairV2
- LinearProgressBarV2
- LinkButton
- Menu
- MenuItem
- MenuV2
- MenuV2Content
- MenuV2Item
- MenuV2SubMenu
- MobileChatInputV2
- MobileDrawerPresets
- MobileMultiSelectV2
- MobileSingleSelectV2
- Modal
- MultiSelect
- MultiSelectDrawer
- MultiSelectTrigger
- MultiSelectV2
- MultiSelectV2Menu
- MultiSelectV2MenuActions
- MultiSelectV2MenuHeader
- MultiSelectV2MenuItem
- MultiSelectV2MenuItems
- MultiSelectV2MenuSearch
- MultiSelectV2MenuVirtualList
- MultiSelectV2SelectAllItem
- MultiSelectV2Skeleton
- MultiSelectV2SubMenu
- MultiSelectV2Trigger
- MultiValueInput
- MultiValueInputV2
- NestedMultiSelectDrawer
- NestedSingleSelectDrawer
- NumberInput
- NumberInputV2
- OTPInput
- OTPInputV2
- Popover
- PopoverV2
- ProgressBar
- ProgressBarV2
- Radio
- RadioGroup
- RadioV2
- RadioV2Content
- renderButtonContent
- ResponsiveText
- SankeyLink
- SankeyNode
- SearchInput
- SearchInputV2
- SecondarySidebar
- SelectItemV2
- ShadowAware
- Sidebar
- SidebarV2
- SidebarV2Footer
- SidebarV2Header
- SidebarV2Panel
- SingleSelect
- SingleSelectDrawer
- SingleSelectV2
- SingleSelectV2List
- SingleSelectV2Menu
- SingleSelectV2Search
- SingleSelectV2Skeleton
- SingleSelectV2Trigger
- SingleSelectV2VirtualList
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
- SnackbarV2
- SplitTag
- StatCard
- StatCardV2Change
- StatCardV2NoData
- StatCardV2Skeleton
- StatCardV2Subtitle
- StatCardV2Title
- StatCardV2Value
- StatusDrawer
- Stepper
- StepperV2
- StyledCheckboxIndicator
- StyledCheckboxRoot
- StyledRadioV2Root
- StyledTabsContent
- StyledTabsList
- StyledTabsRoot
- StyledTabsTrigger
- StyledToast
- SubMenu
- Switch
- SwitchGroup
- SwitchV2
- Tabs
- TabsContent
- TabsList
- TabsTrigger
- TabsV2
- TabsV2Content
- TabsV2IconContainer
- TabsV2List
- TabsV2Provider
- TabsV2Trigger
- Tag
- TagGroupV2
- TagSkeleton
- TagV2
- TextArea
- TextAreaV2
- TextInput
- TextInputV2
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
- TooltipV2
- TopbarV2
- TruncatedTextWithTooltipV2
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

### PivotTableModal

| Prop | Real TypeScript |
|------|-----------------|
| `columns` | `columns: ColumnDefinition<T>[];` — binds, but references shared field(s) `dateColumnProps.date` (`review`) emitted as `string` |

### StatCardV2

| Prop | Real TypeScript |
|------|-----------------|
| `options` | `options?: import('../ChartsV2').ChartV2Options;` — binds, but references shared field(s) `options.defs` (`review`), `accessibilityOptions.customComponents` (`any`), `accessibilityOptions.highContrastTheme` (`any`), `accessibilityOptions.linkedDescription` (`review`) emitted as `string` |

### ThemeProvider

| Prop | Real TypeScript |
|------|-----------------|
| `componentTokens` | `componentTokens?: ComponentTokenType;` — binds, but references shared field(s) `dataTableHeaderTypeActionIconsColumnManagerTriggerConfig.opacity` (`review`), `popoverV2PopoverV2TokenTypeTopContainerHeadingIconSizeConfig.sm` (`review`), `popoverV2PopoverV2TokenTypeTopContainerHeadingIconSizeConfig.md` (`review`), `popoverV2PopoverV2TokenTypeTopContainerHeadingIconSizeConfig.lg` (`review`) emitted as `string` |

## 🛑 Broken — needs serious component change

These props resolved to `unknown`/`any` (usually a generic `T`). They're emitted as a placeholder so the file still compiles, but **the props will not work as typed** — they need a concrete type upstream, or generic-binding support.

_(none)_ 🎉

