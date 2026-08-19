# Binding report — `@juspay/blend-design-system@0.0.38-beta.1`

**235** components · ✅ **226** usable · 🔍 **9** need review · 🛑 **0** broken

**263** function binding(s) → `BlendDesignSystemBindings.res`.

**4132** shared types deduplicated into **82** `*Types.res` modules (referenced qualified — no per-file redeclaration).

## 🔤 Constructor name collisions

ReScript scopes variant constructors to the **module**, not to their type, so one `*Types.res` can define the same name twice. Where the expected type is known from context ReScript picks correctly; where it **isn't**, it binds the *last* definition in the file — with no error or warning.

### Renamed — the same name carried DIFFERENT runtime representations

A bare constant, an identity payload and a `@tag`-injected object are different shapes at runtime. Left alone, an unannotated use would have compiled cleanly and produced the **wrong one**. Each colliding definition is suffixed with the tail of its owning type's name.

| Module | Constructor | Conflicting runtime representations | Renamed to |
|---|---|---|---|
| `ContextSharedTypes` | `Alt` | `6` / `"alt"` | `AltCursorModifier`, `AltKeyCode` |
| `ContextSharedTypes` | `Center` | `"center"` / `2` | `CenterMarginLane`, `CenterMenuAlignment`, `CenterV2Alignment`, `CenterRevertEtc1mkx8`, `CenterRevertEtc1w3ez`, `CenterRevertEtc2zoye`, `CenterRevertEtcoic7x` |
| `ContextSharedTypes` | `ContextMenu` | `"context-menu"` / `58` | `ContextMenuKeyCode`, `ContextMenuRevertEtcop7hp` |
| `ContextSharedTypes` | `CRLF` | `2` / `1` | `CRLFOfLine`, `CRLFLinePreference`, `CRLFLineSequence` |
| `ContextSharedTypes` | `End` | `"end"` / `13` | `EndKeyCode`, `EndMenuAlignment`, `EndV2Alignment`, `EndRevertEtc1w3ez`, `EndRevertEtcoic7x` |
| `ContextSharedTypes` | `Explicit` | `3` / `"explicit"` | `ExplicitCaretAnimation`, `ExplicitChangeReason` |
| `ContextSharedTypes` | `Highlight` | `"Highlight"` / `"highlight"` | `HighlightSelectionStyle`, `HighlightRevertEtc1270i`, `HighlightRevertEtc1i3k7`, `HighlightRevertEtc1mkx8`, `HighlightRevertEtc1yz1q`, `HighlightRevertEtcgjquu`, `HighlightRevertEtcsclw8` |
| `ContextSharedTypes` | `Hover` | `"hover"` / `69` | `HoverActivatedOn`, `HoverEditorOption`, `HoverStateV2`, `HoverSelectionStates` |
| `ContextSharedTypes` | `Insert` | `19` / `"insert"` | `InsertInsertMode`, `InsertKeyCode` |
| `ContextSharedTypes` | `Item` | `{type: "item", …}` / `"item"` | `ItemFlatRow`, `ItemItemType` |
| `ContextSharedTypes` | `Label` | `{type: "label", …}` / `"label"` | `LabelFlatRow`, `LabelItemType` |
| `ContextSharedTypes` | `Left` | `"left"` / `0` / `1` | `LeftOutsidePosition`, `LeftMarginLane`, `LeftMenuSide`, `LeftV2Side`, `LeftRevertEtc1mkx8`, `LeftRevertEtc1w3ez`, `LeftRevertEtc2zoye`, `LeftV2Direction`, `LeftPositionAffinity`, `LeftDropdownPosition` |
| `ContextSharedTypes` | `LF` | `1` / `0` | `LFOfLine`, `LFLinePreference`, `LFLineSequence` |
| `ContextSharedTypes` | `None` | `"none"` / `0` / `2` | `NoneOptionsAutohide`, `NoneAutoIndent`, `NoneLineHighlight`, `NoneRenderWhitespace`, `NoneSnippetSuggestions`, `NoneWrappingIndent`, `NoneRevertEtc1i3k7`, `NoneRevertEtc1mkx8`, `NoneRevertEtc1ufa7`, `NoneRevertEtc1x0av`, `NoneRevertEtc1yz1q`, `NoneRevertEtc2zoye`, `NoneRevertEtcc55tl`, `NoneRevertEtcop7hp`, `NoneRevertEtcsclw8`, `NoneRevertEtcydel2`, `NoneRevertEtcz3a4s`, `NonePositionAffinity`, `NoneRenderMinimap` |
| `ContextSharedTypes` | `Right` | `"right"` / `1` / `3` | `RightOutsidePosition`, `RightMarginLane`, `RightMenuSide`, `RightV2Side`, `RightRevertEtc1mkx8`, `RightRevertEtc1w3ez`, `RightRevertEtc2zoye`, `RightV2Direction`, `RightPositionAffinity`, `RightDropdownPosition` |
| `ContextSharedTypes` | `Scrollbar` | `"Scrollbar"` / `117` | `ScrollbarEditorOption`, `ScrollbarRevertEtc1270i`, `ScrollbarRevertEtc1i3k7`, `ScrollbarRevertEtc1mkx8`, `ScrollbarRevertEtc1yz1q`, `ScrollbarRevertEtcgjquu`, `ScrollbarRevertEtcsclw8` |
| `ContextSharedTypes` | `Separator` | `{type: "separator", …}` / `"separator"` | `SeparatorFlatRow`, `SeparatorItemType` |
| `ContextSharedTypes` | `Smooth` | `"smooth"` / `0` | `SmoothCursorBlinking`, `SmoothScrollType` |
| `ContextSharedTypes` | `Space` | `"space"` / `10` | `SpaceKeyCode`, `SpaceRevertEtc1mkx8` |
| `ContextSharedTypes` | `Text` | `"text"` / `1` | `TextMouseStyle`, `TextRevertEtcop7hp`, `TextTagType`, `TextRenderMinimap` |
| `ContextSharedTypes` | `WordWrapColumn` | `152` / `"wordWrapColumn"` | `WordWrapColumnWordWrap`, `WordWrapColumnEditorOption` |
| `DataTableTypes` | `DateRange` | `"date_range"` / `"dateRange"` | `DateRangeColumnType`, `DateRangeTypeType`, `DateRangeFilterComponent` |
| `ChartsSharedTypes` | `Point` | `"point"` / `"Point"` | `PointConstructorType`, `PointObjectScope` |
| `HighchartsSharedTypes` | `Solid` | `"Solid"` / `"solid"` | `SolidStyleValue`, `SolidShapeValue` |
| `HighchartsSharedTypes` | `Value` | `""` / `"!="` / `"value"` | `ValueAnnotationDraggable`, `ValueOptionsCompare`, `ValueGapUnit`, `ValueOptionsOperator` |

### Left as-is — same name, same runtime representation (393)

These produce the same runtime shape whichever definition wins, so renaming them would churn every consumer for no correctness gain. Listed because the ambiguity is still there to read.

- `ContextSharedTypes`: `AccentColor`, `AccentColorText`, `Action`, `ActiveBorder`, `ActiveCaption`, `ActiveText`, `Advanced`, `Aliceblue`, `All`, `Always`, `Antiquewhite`, `AppWorkspace`, `Aqua`, `Aquamarine`, `Auto`, `Azure`, `Background`, `Beige`, `Bisque`, `Black`, `Blanchedalmond`, `Block`, `Blue`, `Blueviolet`, `Bool`, `BorderBox`, `Bottom`, `Brackets`, `Brown`, `Burlywood` … +241 more
- `CommonTypes`: `Arr`, `Auto`, `Bool`, `Fn`, `Interval`, `N0`, `N1`, `N2`, `N3`, `N4`, `Num`, `Off`, `On`, `Relative`, `Str`, `StrArr`
- `TagsTypes`: `Lg`, `Md`, `Sm`, `Xs`
- `InputsTypes`: `Left`, `Lg`, `Md`, `Right`, `Sm`
- `TooltipTypes`: `Left`, `Right`
- `ButtonTypes`: `Default`
- `DataTableTypes`: `Avatar`, `Custom`, `Date`, `Decimal`, `Dropdown`, `Error`, `Multiselect`, `Number`, `Percentage`, `Primary`, `Progress`, `ReactElement`, `Secondary`, `Select`, `Slider`, `Success`, `Tag`, `Text`, `Warning`
- `DateRangePickerTypes`: `Custom`
- `ProgressBarTypes`: `Segmented`, `Solid`
- `ChartsSharedTypes`: `Chart`, `End`, `Hover`, `Inactive`, `Normal`, `Offset`, `Right`, `Select`, `Top`, `Value`
- `SkeletonTypes`: `Circle`
- `UploadTypes`: `Error`, `Success`
- `ButtonV2Types`: `Default`, `Disabled`
- `TooltipV2Types`: `Left`, `Right`
- `SliderTypes`: `Bottom`, `Inline`, `Top`
- `HighchartsSharedTypes`: `All`, `Allow`, `Alt`, `AnnotationMockPointOptionsObject`, `Arc`, `Area`, `Arr`, `Auto`, `Bool`, `Callout`, `Category`, `Center`, `Chart`, `Circle`, `Close`, `CssObject`, `Ctrl`, `Day`, `Diamond`, `Fn`, `High`, `Horizontal`, `Inside`, `Justify`, `Left`, `Linear`, `Logarithmic`, `Low`, `Meta`, `Middle` … +22 more

## 📦 Dependencies

| Kind | Package | Provides | Status |
|------|---------|----------|--------|
| required | `@rescript/react + stdlib` | JsxDOM, Dom, React, ReactEvent | ✓ present |
| optional | `rescript-webapi` | File, FileList | ✓ present → used |

## 🔧 Function bindings

Standalone function exports, emitted as positional `@module external` bindings in `BlendDesignSystemBindings.res`.

- `FOUNDATION_THEME`
- `UploadErrorReason`
- `useTheme`
- `useShadowRoot`
- `getAccordionToken`
- `getAlertTokens`
- `getAvatarTokens`
- `getAvatarGroupTokens`
- `getBreadcrumbTokens`
- `normalizeBreadcrumbItems`
- `getButtonTokens`
- `getButtonGroupTokens`
- `getCardTokens`
- `getChartTokens`
- `BlendChartBaseInstance`
- `getChatInputTokens`
- `validateColumnData`
- `getColumnTypeConfig`
- `getTableToken`
- `getCalendarToken`
- `getTimePickerTokens`
- `getDirectoryTokens`
- `getTextInputTokens`
- `getNumberInputTokens`
- `getDropdownInputTokens`
- `getSearchInputTokens`
- `getOTPInputTokens`
- `getUnitInputTokens`
- `getMultiValueInputTokens`
- `getKeyValuePairTokens`
- `getMenuItemStateToken`
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
- `getSliderTokens`
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
- `getTopbarTokens`
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
- `getSpinnerTokens`
- `getEmptyStateTokens`
- `STATCARD_FALLBACK_DISPLAY`
- `renderVariantFallbackValue`
- `buildStatCardV2ChartOptions`
- `getStatCardV2Tokens`
- `buildStatCardV2AriaLabel`
- `getCardV2Tokens`
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
- `getModalV2Tokens`
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
- `useSelectListNavigation`
- `flattenSelectListV2Groups`
- `countSelectListV2Options`
- `getSelectListV2FocusTargets`
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
- CardV2
- CardV2Actions
- CardV2Body
- CardV2Content
- CardV2Footer
- CardV2Header
- CardV2Media
- CardV2Meta
- CardV2Skeleton
- ChartContainer
- ChartContainerV2
- ChartHeader
- ChartHeaderV2
- ChartLegends
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
- EmptyState
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
- ModalV2
- MultiSelect
- MultiSelectDrawer
- MultiSelectListV2
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
- SelectItemIndicator
- SelectItemV2
- SelectListV2
- SelectListV2Rows
- SelectListV2Surface
- ShadowAware
- Sidebar
- SidebarV2
- SidebarV2Footer
- SidebarV2Header
- SidebarV2Panel
- SingleDatePicker
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
- SkeletonBase
- SkeletonCard
- SkeletonCircle
- SkeletonRectangle
- SkeletonRounded
- Slider
- Snackbar
- SnackbarV2
- Spinner
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
- TimelineLabel
- TimelineNode
- TimelineShowMore
- TimelineSubstep
- TimePicker
- Tooltip
- TooltipV2
- Topbar
- TopbarV2
- TruncatedTextWithTooltipV2
- UnitInput
- Upload
- UploadV2
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

### Charts

| Prop | Real TypeScript |
|------|-----------------|
| `tooltip` | `tooltip?: TooltipConfig;` — binds, but references shared field(s) `tooltipContentProps.labelFormatter` (`any`), `tooltipContentProps.label` (`any`), `payload.payload` (`any`) emitted as `string` |

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
| `renderItem` | `renderItem?: (params: { item: ChartV2LegendItem; name: string; visible: boolean; color: string; value?: string \| number; onClick: () => void; }) => ReactNode;` — binds, but references shared field(s) `seriesPieDataLabelsOptionsObject.animation` (`review`), `seriesPieDataLabelsOptionsObject.connectorShape` (`review`), `seriesNetworkgraphDataLabelsOptionsObject.animation` (`review`), `seriesPackedBubbleDataLabelsOptionsObject.animation` (`review`) emitted as `string` |

### CoreChart

| Prop | Real TypeScript |
|------|-----------------|
| `tooltip` | `tooltip?: TooltipConfig;` — binds, but references shared field(s) `tooltipContentProps.labelFormatter` (`any`), `tooltipContentProps.label` (`any`), `payload.payload` (`any`) emitted as `string` |

### DataTable

| Prop | Real TypeScript |
|------|-----------------|
| `columns` | `columns: ColumnDefinition<T>[];` — binds, but references shared field(s) `dateColumnProps.date` (`review`) emitted as `string` |
| `onColumnReorder` | `onColumnReorder?: (columns: ColumnDefinition<T>[]) => void;` — binds, but references shared field(s) `dateColumnProps.date` (`review`) emitted as `string` |
| `exportConfig` | `exportConfig?: DataTableExportConfig<T>;` — binds, but references shared field(s) `dateColumnProps.date` (`review`) emitted as `string` |

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
| `componentTokens` | `componentTokens?: ComponentTokenOverrides;` — binds, but references shared field(s) `contextComponentTokensTABLESmHeaderActionIconsColumnManagerTriggerConfig.opacity` (`review`) emitted as `string` |

## 🛑 Broken — needs serious component change

These props resolved to `unknown`/`any` (usually a generic `T`). They're emitted as a placeholder so the file still compiles, but **the props will not work as typed** — they need a concrete type upstream, or generic-binding support.

_(none)_ 🎉

