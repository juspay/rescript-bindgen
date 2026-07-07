type contextCodeEditorV2TokensTheme =
  | @as("dark") Dark
  | @as("light") Light
type inputSizeV2 =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type textInputV2DropdownPosition =
  | @as("left") Left
  | @as("right") Right
type inputStateV2 =
  | @as("default") Default
  | @as("hover") Hover
  | @as("focus") Focus
  | @as("error") Error
  | @as("disabled") Disabled
type numberInputV2Direction =
  | @as("left") Left
  | @as("right") Right
type codeEditorV2Variant =
  | @as("default") Default
  | @as("no-gutter") NoGutter
  | @as("diff") Diff
type codeEditorV2SupportedLanguage =
  | @as("css") Css
  | @as("javascript") Javascript
  | @as("typescript") Typescript
  | @as("jsx") Jsx
  | @as("tsx") Tsx
  | @as("json") Json
  | @as("html") Html
  | @as("markdown") Markdown
  | @as("yaml") Yaml
  | @as("python") Python
  | @as("rust") Rust
  | @as("haskell") Haskell
type editorOption =
  | @as(0) AcceptSuggestionOnCommitCharacter
  | @as(1) AcceptSuggestionOnEnter
  | @as(2) AccessibilitySupport
  | @as(3) AccessibilityPageSize
  | @as(4) AllowOverflow
  | @as(5) AllowVariableLineHeights
  | @as(6) AllowVariableFonts
  | @as(7) AllowVariableFontsInAccessibilityMode
  | @as(8) AriaLabel
  | @as(9) AriaRequired
  | @as(10) AutoClosingBrackets
  | @as(11) AutoClosingComments
  | @as(12) ScreenReaderAnnounceInlineSuggestion
  | @as(13) AutoClosingDelete
  | @as(14) AutoClosingOvertype
  | @as(15) AutoClosingQuotes
  | @as(16) AutoIndent
  | @as(17) AutoIndentOnPaste
  | @as(18) AutoIndentOnPasteWithinString
  | @as(19) AutomaticLayout
  | @as(20) AutoSurround
  | @as(21) BracketPairColorization
  | @as(22) Guides
  | @as(23) CodeLens
  | @as(24) CodeLensFontFamily
  | @as(25) CodeLensFontSize
  | @as(26) ColorDecorators
  | @as(27) ColorDecoratorsLimit
  | @as(28) ColumnSelection
  | @as(29) Comments
  | @as(30) Contextmenu
  | @as(31) CopyWithSyntaxHighlighting
  | @as(32) CursorBlinking
  | @as(33) CursorSmoothCaretAnimation
  | @as(34) CursorStyle
  | @as(35) CursorSurroundingLines
  | @as(36) CursorSurroundingLinesStyle
  | @as(37) CursorWidth
  | @as(38) CursorHeight
  | @as(39) DisableLayerHinting
  | @as(40) DisableMonospaceOptimizations
  | @as(41) DomReadOnly
  | @as(42) DragAndDrop
  | @as(43) DropIntoEditor
  | @as(44) EditContext
  | @as(45) EmptySelectionClipboard
  | @as(46) ExperimentalGpuAcceleration
  | @as(47) ExperimentalWhitespaceRendering
  | @as(48) ExtraEditorClassName
  | @as(49) FastScrollSensitivity
  | @as(50) Find
  | @as(51) FixedOverflowWidgets
  | @as(52) Folding
  | @as(53) FoldingStrategy
  | @as(54) FoldingHighlight
  | @as(55) FoldingImportsByDefault
  | @as(56) FoldingMaximumRegions
  | @as(57) UnfoldOnClickAfterEndOfLine
  | @as(58) FontFamily
  | @as(59) FontInfo
  | @as(60) FontLigatures
  | @as(61) FontSize
  | @as(62) FontWeight
  | @as(63) FontVariations
  | @as(64) FormatOnPaste
  | @as(65) FormatOnType
  | @as(66) GlyphMargin
  | @as(67) GotoLocation
  | @as(68) HideCursorInOverviewRuler
  | @as(69) Hover
  | @as(70) InDiffEditor
  | @as(71) InlineSuggest
  | @as(72) LetterSpacing
  | @as(73) Lightbulb
  | @as(74) LineDecorationsWidth
  | @as(75) LineHeight
  | @as(76) LineNumbers
  | @as(77) LineNumbersMinChars
  | @as(78) LinkedEditing
  | @as(79) Links
  | @as(80) MatchBrackets
  | @as(81) Minimap
  | @as(82) MouseStyle
  | @as(83) MouseWheelScrollSensitivity
  | @as(84) MouseWheelZoom
  | @as(85) MultiCursorMergeOverlapping
  | @as(86) MultiCursorModifier
  | @as(87) MouseMiddleClickAction
  | @as(88) MultiCursorPaste
  | @as(89) MultiCursorLimit
  | @as(90) OccurrencesHighlight
  | @as(91) OccurrencesHighlightDelay
  | @as(92) OvertypeCursorStyle
  | @as(93) OvertypeOnPaste
  | @as(94) OverviewRulerBorder
  | @as(95) OverviewRulerLanes
  | @as(96) Padding
  | @as(97) PasteAs
  | @as(98) ParameterHints
  | @as(99) PeekWidgetDefaultFocus
  | @as(100) Placeholder
  | @as(101) DefinitionLinkOpensInPeek
  | @as(102) QuickSuggestions
  | @as(103) QuickSuggestionsDelay
  | @as(104) ReadOnly
  | @as(105) ReadOnlyMessage
  | @as(106) RenameOnType
  | @as(107) RenderRichScreenReaderContent
  | @as(108) RenderControlCharacters
  | @as(109) RenderFinalNewline
  | @as(110) RenderLineHighlight
  | @as(111) RenderLineHighlightOnlyWhenFocus
  | @as(112) RenderValidationDecorations
  | @as(113) RenderWhitespace
  | @as(114) RevealHorizontalRightPadding
  | @as(115) RoundedSelection
  | @as(116) Rulers
  | @as(117) Scrollbar
  | @as(118) ScrollBeyondLastColumn
  | @as(119) ScrollBeyondLastLine
  | @as(120) ScrollPredominantAxis
  | @as(121) SelectionClipboard
  | @as(122) SelectionHighlight
  | @as(123) SelectionHighlightMaxLength
  | @as(124) SelectionHighlightMultiline
  | @as(125) SelectOnLineNumbers
  | @as(126) ShowFoldingControls
  | @as(127) ShowUnused
  | @as(128) SnippetSuggestions
  | @as(129) SmartSelect
  | @as(130) SmoothScrolling
  | @as(131) StickyScroll
  | @as(132) StickyTabStops
  | @as(133) StopRenderingLineAfter
  | @as(134) Suggest
  | @as(135) SuggestFontSize
  | @as(136) SuggestLineHeight
  | @as(137) SuggestOnTriggerCharacters
  | @as(138) SuggestSelection
  | @as(139) TabCompletion
  | @as(140) TabIndex
  | @as(141) TrimWhitespaceOnDelete
  | @as(142) UnicodeHighlighting
  | @as(143) UnusualLineTerminators
  | @as(144) UseShadowDOM
  | @as(145) UseTabStops
  | @as(146) WordBreak
  | @as(147) WordSegmenterLocales
  | @as(148) WordSeparators
  | @as(149) WordWrap
  | @as(150) WordWrapBreakAfterCharacters
  | @as(151) WordWrapBreakBeforeCharacters
  | @as(152) WordWrapColumn
  | @as(153) WordWrapOverride1
  | @as(154) WordWrapOverride2
  | @as(155) WrappingIndent
  | @as(156) WrappingStrategy
  | @as(157) ShowDeprecated
  | @as(158) InertialScroll
  | @as(159) InlayHints
  | @as(160) WrapOnEscapedLineFeeds
  | @as(161) EffectiveCursorStyle
  | @as(162) EditorClassName
  | @as(163) PixelRatio
  | @as(164) TabFocusMode
  | @as(165) LayoutInfo
  | @as(166) WrappingInfo
  | @as(167) DefaultColorDecorators
  | @as(168) ColorDecoratorsActivatedOn
  | @as(169) InlineCompletionsAccessibilityVerbose
  | @as(170) EffectiveEditContext
  | @as(171) ScrollOnMiddleClick
  | @as(172) EffectiveAllowVariableFonts
type cursorChangeReason =
  | @as(0) NotSet
  | @as(1) ContentFlush
  | @as(2) RecoverFromMarkers
  | @as(3) Explicit
  | @as(4) Paste
  | @as(5) Undo
  | @as(6) Redo
type keyCode =
  | @as(-1) DependsOnKbLayout
  | @as(0) Unknown
  | @as(1) Backspace
  | @as(2) Tab
  | @as(3) Enter
  | @as(4) Shift
  | @as(5) Ctrl
  | @as(6) Alt
  | @as(7) PauseBreak
  | @as(8) CapsLock
  | @as(9) Escape
  | @as(10) Space
  | @as(11) PageUp
  | @as(12) PageDown
  | @as(13) End
  | @as(14) Home
  | @as(15) LeftArrow
  | @as(16) UpArrow
  | @as(17) RightArrow
  | @as(18) DownArrow
  | @as(19) Insert
  | @as(20) Delete
  | @as(21) Digit0
  | @as(22) Digit1
  | @as(23) Digit2
  | @as(24) Digit3
  | @as(25) Digit4
  | @as(26) Digit5
  | @as(27) Digit6
  | @as(28) Digit7
  | @as(29) Digit8
  | @as(30) Digit9
  | @as(31) KeyA
  | @as(32) KeyB
  | @as(33) KeyC
  | @as(34) KeyD
  | @as(35) KeyE
  | @as(36) KeyF
  | @as(37) KeyG
  | @as(38) KeyH
  | @as(39) KeyI
  | @as(40) KeyJ
  | @as(41) KeyK
  | @as(42) KeyL
  | @as(43) KeyM
  | @as(44) KeyN
  | @as(45) KeyO
  | @as(46) KeyP
  | @as(47) KeyQ
  | @as(48) KeyR
  | @as(49) KeyS
  | @as(50) KeyT
  | @as(51) KeyU
  | @as(52) KeyV
  | @as(53) KeyW
  | @as(54) KeyX
  | @as(55) KeyY
  | @as(56) KeyZ
  | @as(57) Meta
  | @as(58) ContextMenu
  | @as(59) F1
  | @as(60) F2
  | @as(61) F3
  | @as(62) F4
  | @as(63) F5
  | @as(64) F6
  | @as(65) F7
  | @as(66) F8
  | @as(67) F9
  | @as(68) F10
  | @as(69) F11
  | @as(70) F12
  | @as(71) F13
  | @as(72) F14
  | @as(73) F15
  | @as(74) F16
  | @as(75) F17
  | @as(76) F18
  | @as(77) F19
  | @as(78) F20
  | @as(79) F21
  | @as(80) F22
  | @as(81) F23
  | @as(82) F24
  | @as(83) NumLock
  | @as(84) ScrollLock
  | @as(85) Semicolon
  | @as(86) Equal
  | @as(87) Comma
  | @as(88) Minus
  | @as(89) Period
  | @as(90) Slash
  | @as(91) Backquote
  | @as(92) BracketLeft
  | @as(93) Backslash
  | @as(94) BracketRight
  | @as(95) Quote
  | @as(96) OEM8
  | @as(97) IntlBackslash
  | @as(98) Numpad0
  | @as(99) Numpad1
  | @as(100) Numpad2
  | @as(101) Numpad3
  | @as(102) Numpad4
  | @as(103) Numpad5
  | @as(104) Numpad6
  | @as(105) Numpad7
  | @as(106) Numpad8
  | @as(107) Numpad9
  | @as(108) NumpadMultiply
  | @as(109) NumpadAdd
  | @as(110) NUMPADSEPARATOR
  | @as(111) NumpadSubtract
  | @as(112) NumpadDecimal
  | @as(113) NumpadDivide
  | @as(114) KEYINCOMPOSITION
  | @as(115) ABNTC1
  | @as(116) ABNTC2
  | @as(117) AudioVolumeMute
  | @as(118) AudioVolumeUp
  | @as(119) AudioVolumeDown
  | @as(120) BrowserSearch
  | @as(121) BrowserHome
  | @as(122) BrowserBack
  | @as(123) BrowserForward
  | @as(124) MediaTrackNext
  | @as(125) MediaTrackPrevious
  | @as(126) MediaStop
  | @as(127) MediaPlayPause
  | @as(128) LaunchMediaPlayer
  | @as(129) LaunchMail
  | @as(130) LaunchApp2
  | @as(131) Clear
  | @as(132) MAXVALUE
type renderMinimap =
  | @as(0) None
  | @as(1) Text
  | @as(2) Blocks
type defaultEndOfLine =
  | @as(1) LF
  | @as(2) CRLF
type endOfLinePreference =
  | @as(0) TextDefined
  | @as(1) LF
  | @as(2) CRLF
type endOfLineSequence =
  | @as(0) LF
  | @as(1) CRLF
type trackedRangeStickiness =
  | @as(0) AlwaysGrowsWhenTypingAtEdges
  | @as(1) NeverGrowsWhenTypingAtEdges
  | @as(2) GrowsOnlyWhenTypingBefore
  | @as(3) GrowsOnlyWhenTypingAfter
type textDirection =
  | @as(0) LTR
  | @as(1) RTL
type codeEditorV2IEditorOptionsCursorSurroundingLinesStyle =
  | @as("all") All
  | @as("default") Default
type codeEditorV2IEditorOptionsRenderFinalNewline =
  | @as("off") Off
  | @as("on") On
  | @as("dimmed") Dimmed
type codeEditorV2IEditorOptionsUnusualLineTerminators =
  | @as("auto") Auto
  | @as("off") Off
  | @as("prompt") Prompt
type codeEditorV2IEditorOptionsRenderValidationDecorations =
  | @as("off") Off
  | @as("on") On
  | @as("editable") Editable
type codeEditorV2IEditorScrollbarOptionsVertical =
  | @as("auto") Auto
  | @as("hidden") Hidden
  | @as("visible") Visible
type codeEditorV2IEditorStickyScrollOptionsDefaultModel =
  | @as("outlineModel") OutlineModel
  | @as("foldingProviderModel") FoldingProviderModel
  | @as("indentationModel") IndentationModel
type codeEditorV2IEditorMinimapOptionsAutohide =
  | @as("none") None
  | @as("scroll") Scroll
  | @as("mouseover") Mouseover
type codeEditorV2IEditorMinimapOptionsSize =
  | @as("fill") Fill
  | @as("proportional") Proportional
  | @as("fit") Fit
type codeEditorV2IEditorMinimapOptionsShowSlider =
  | @as("always") Always
  | @as("mouseover") Mouseover
type codeEditorV2IEditorFindOptionsSeedSearchStringFromSelection =
  | @as("always") Always
  | @as("never") Never
  | @as("selection") Selection
type codeEditorV2IEditorFindOptionsAutoFindInSelection =
  | @as("always") Always
  | @as("never") Never
  | @as("multiline") Multiline
type codeEditorV2IEditorOptionsCursorBlinking =
  | @as("solid") Solid
  | @as("blink") Blink
  | @as("smooth") Smooth
  | @as("phase") Phase
  | @as("expand") Expand
type codeEditorV2IEditorOptionsMouseStyle =
  | @as("text") Text
  | @as("default") Default
  | @as("copy") Copy
type codeEditorV2IEditorOptionsCursorSmoothCaretAnimation =
  | @as("off") Off
  | @as("on") On
  | @as("explicit") Explicit
type codeEditorV2IEditorOptionsCursorStyle =
  | @as("block") Block
  | @as("underline") Underline
  | @as("line") Line
  | @as("line-thin") LineThin
  | @as("block-outline") BlockOutline
  | @as("underline-thin") UnderlineThin
type codeEditorV2IEditorOptionsDefaultColorDecorators =
  | @as("auto") Auto
  | @as("always") Always
  | @as("never") Never
type codeEditorV2IEditorOptionsWordWrap =
  | @as("off") Off
  | @as("on") On
  | @as("wordWrapColumn") WordWrapColumn
  | @as("bounded") Bounded
type codeEditorV2IEditorOptionsWordWrapOverride1 =
  | @as("inherit") Inherit
  | @as("off") Off
  | @as("on") On
type codeEditorV2IEditorOptionsWrappingIndent =
  | @as("none") None
  | @as("same") Same
  | @as("indent") Indent
  | @as("deepIndent") DeepIndent
type codeEditorV2IEditorOptionsWrappingStrategy =
  | @as("simple") Simple
  | @as("advanced") Advanced
type codeEditorV2IEditorOptionsWordBreak =
  | @as("normal") Normal
  | @as("keepAll") KeepAll
type codeEditorV2IEditorOptionsColorDecoratorsActivatedOn =
  | @as("hover") Hover
  | @as("click") Click
  | @as("clickAndHover") ClickAndHover
type codeEditorV2IEditorOptionsMultiCursorModifier =
  | @as("alt") Alt
  | @as("ctrlCmd") CtrlCmd
type codeEditorV2IEditorOptionsMultiCursorPaste =
  | @as("full") Full
  | @as("spread") Spread
type mouseMiddleClickAction =
  | @as("default") Default
  | @as("openLink") OpenLink
  | @as("ctrlLeftClick") CtrlLeftClick
type codeEditorV2IEditorOptionsAccessibilitySupport =
  | @as("auto") Auto
  | @as("off") Off
  | @as("on") On
type codeEditorV2ISuggestOptionsInsertMode =
  | @as("replace") Replace
  | @as("insert") Insert
type codeEditorV2ISuggestOptionsSelectionMode =
  | @as("always") Always
  | @as("never") Never
  | @as("whenTriggerCharacter") WhenTriggerCharacter
  | @as("whenQuickSuggestion") WhenQuickSuggestion
type codeEditorV2ISuggestOptionsPreviewMode =
  | @as("prefix") Prefix
  | @as("subword") Subword
  | @as("subwordSmart") SubwordSmart
type codeEditorV2IInlineSuggestOptionsShowToolbar =
  | @as("always") Always
  | @as("never") Never
  | @as("onHover") OnHover
type goToLocationValues =
  | @as("peek") Peek
  | @as("gotoAndPeek") GotoAndPeek
  | @as("goto") Goto
type editorAutoClosingStrategy =
  | @as("always") Always
  | @as("never") Never
  | @as("languageDefined") LanguageDefined
  | @as("beforeWhitespace") BeforeWhitespace
type editorAutoClosingEditStrategy =
  | @as("auto") Auto
  | @as("always") Always
  | @as("never") Never
type editorAutoSurroundStrategy =
  | @as("never") Never
  | @as("languageDefined") LanguageDefined
  | @as("quotes") Quotes
  | @as("brackets") Brackets
type codeEditorV2IEditorOptionsAutoIndent =
  | @as("none") None
  | @as("full") Full
  | @as("brackets") Brackets
  | @as("advanced") Advanced
  | @as("keep") Keep
type codeEditorV2IEditorOptionsAcceptSuggestionOnEnter =
  | @as("off") Off
  | @as("on") On
  | @as("smart") Smart
type codeEditorV2IEditorOptionsSnippetSuggestions =
  | @as("none") None
  | @as("top") Top
  | @as("bottom") Bottom
  | @as("inline") Inline
type codeEditorV2IEditorOptionsSuggestSelection =
  | @as("first") First
  | @as("recentlyUsed") RecentlyUsed
  | @as("recentlyUsedByPrefix") RecentlyUsedByPrefix
type codeEditorV2IEditorOptionsTabCompletion =
  | @as("off") Off
  | @as("on") On
  | @as("onlySnippets") OnlySnippets
type codeEditorV2IEditorOptionsOccurrencesHighlight =
  | @as("off") Off
  | @as("singleFile") SingleFile
  | @as("multiFile") MultiFile
type showLightbulbIconMode =
  | @as("off") Off
  | @as("onCode") OnCode
  | @as("on") On
type codeEditorV2IEditorOptionsFoldingStrategy =
  | @as("auto") Auto
  | @as("indentation") Indentation
type codeEditorV2IEditorOptionsShowFoldingControls =
  | @as("always") Always
  | @as("never") Never
  | @as("mouseover") Mouseover
type codeEditorV2IEditorOptionsMatchBrackets =
  | @as("always") Always
  | @as("never") Never
  | @as("near") Near
type codeEditorV2IEditorOptionsExperimentalGpuAcceleration =
  | @as("off") Off
  | @as("on") On
type codeEditorV2IEditorOptionsExperimentalWhitespaceRendering =
  | @as("off") Off
  | @as("svg") Svg
  | @as("font") Font
type codeEditorV2IEditorOptionsRenderWhitespace =
  | @as("none") None
  | @as("all") All
  | @as("boundary") Boundary
  | @as("selection") Selection
  | @as("trailing") Trailing
type codeEditorV2IEditorOptionsRenderLineHighlight =
  | @as("none") None
  | @as("all") All
  | @as("line") Line
  | @as("gutter") Gutter
type codeEditorV2IEditorOptionsPeekWidgetDefaultFocus =
  | @as("tree") Tree
  | @as("editor") Editor
type codeEditorV2IEditorInlayHintsOptionsEnabled =
  | @as("off") Off
  | @as("on") On
  | @as("offUnlessPressed") OffUnlessPressed
  | @as("onUnlessPressed") OnUnlessPressed
type codeEditorV2IDropIntoEditorOptionsShowDropSelector =
  | @as("never") Never
  | @as("afterDrop") AfterDrop
type codeEditorV2IPasteAsOptionsShowPasteSelector =
  | @as("never") Never
  | @as("afterPaste") AfterPaste
type scrollType =
  | @as(0) Smooth
  | @as(1) Immediate
type positionAffinity =
  | @as(0) Left
  | @as(1) Right
  | @as(2) None
  | @as(3) LeftOfInjectedText
  | @as(4) RightOfInjectedText
type contentWidgetPositionPreference =
  | @as(0) EXACT
  | @as(1) ABOVE
  | @as(2) BELOW
type glyphMarginLane =
  | @as(1) Left
  | @as(2) Center
  | @as(3) Right
type codeEditorV2IStandaloneCodeEditorUpdateOptionsWordBasedSuggestions =
  | @as("off") Off
  | @as("currentDocument") CurrentDocument
  | @as("matchingDocuments") MatchingDocuments
  | @as("allDocuments") AllDocuments
type codeEditorV2IDiffEditorOptionsDiffAlgorithm =
  | @as("legacy") Legacy
  | @as("advanced") Advanced
type codeEditorV2IStandaloneDiffEditorGoToDiff =
  | @as("next") Next
  | @as("previous") Previous
type multiSelectV2SelectionTagType =
  | @as("count") Count
  | @as("text") Text
type multiSelectV2FlattenedMultiSelectV2ItemType =
  | @as("separator") Separator
  | @as("item") Item
  | @as("label") Label
type inputsV2InputLabelsV2TokensLabelFontSizeConfig = {
  sm: string,
  md: string,
  lg: string,
}
type inputsV2InputLabelsV2TokensLabelColorConfig = {
  default: string,
  hover: string,
  focus: string,
  error: string,
  disabled: string,
}
type inputsV2InputLabelsV2TokensLabelConfig = {
  fontSize: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  fontWeight: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  lineHeight: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  color: inputsV2InputLabelsV2TokensLabelColorConfig,
}
type inputsV2InputLabelsV2TokensRequiredConfig = {
  color: string,
}
type inputsV2InputLabelsV2TokensHelpIconConfig = {
  width: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  color: inputsV2InputLabelsV2TokensLabelColorConfig,
}
type inputLabelsV2Tokens = {
  label: inputsV2InputLabelsV2TokensLabelConfig,
  subLabel: inputsV2InputLabelsV2TokensLabelConfig,
  required: inputsV2InputLabelsV2TokensRequiredConfig,
  helpIcon: inputsV2InputLabelsV2TokensHelpIconConfig,
}
type inputsV2TextAreaV2TokensTypeInputContainerPlaceholderConfig = {
  transition: string,
  color: inputsV2InputLabelsV2TokensLabelColorConfig,
  fontSize: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  fontWeight: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  lineHeight: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
}
type inputsV2TextAreaV2TokensTypeInputContainerPaddingConfig = {
  top: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  right: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  bottom: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  left: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
}
type inputsV2TextAreaV2TokensTypeInputContainerConfig = {
  gap: string,
  placeholder: inputsV2TextAreaV2TokensTypeInputContainerPlaceholderConfig,
  lineHeight: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  fontSize: string,
  fontWeight: string,
  padding: inputsV2TextAreaV2TokensTypeInputContainerPaddingConfig,
  borderRadius: string,
  boxShadow: string,
  border: inputsV2InputLabelsV2TokensLabelColorConfig,
  color: inputsV2InputLabelsV2TokensLabelColorConfig,
  backgroundColor: inputsV2InputLabelsV2TokensLabelColorConfig,
}
type inputsV2InputFooterV2TokensErrorMessageConfig = {
  fontSize: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  fontWeight: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  lineHeight: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  color: string,
}
type inputFooterV2Tokens = {
  hintText: inputsV2InputLabelsV2TokensLabelConfig,
  errorMessage: inputsV2InputFooterV2TokensErrorMessageConfig,
}
type textAreaV2TokensType = {
  gap: string,
  topContainer: inputLabelsV2Tokens,
  inputContainer: inputsV2TextAreaV2TokensTypeInputContainerConfig,
  bottomContainer: inputFooterV2Tokens,
}
type responsiveTextAreaV2Tokens = {
  sm: textAreaV2TokensType,
  lg: textAreaV2TokensType,
}
type inputsV2ChatInputV2TokensTypeContainerAttachedFilesContainerOverflowMenuConfig = {
  gap: string,
  backgroundColor: inputsV2InputLabelsV2TokensLabelColorConfig,
  borderRadius: string,
  padding: string,
  top: string,
  right: string,
  maxHeight: string,
}
type inputsV2ChatInputV2TokensTypeContainerAttachedFilesContainerConfig = {
  gap: string,
  overflowMenu: inputsV2ChatInputV2TokensTypeContainerAttachedFilesContainerOverflowMenuConfig,
}
type inputsV2ChatInputV2TokensTypeContainerTagContainerTextConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type inputsV2ChatInputV2TokensTypeContainerTagContainerConfig = {
  gap: string,
  borderRadius: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  border: string,
  backgroundColor: string,
  text: inputsV2ChatInputV2TokensTypeContainerTagContainerTextConfig,
}
type inputsV2ChatInputV2TokensTypeContainerInputContainerInputConfig = {
  color: string,
  placeholder: string,
  paddingTop: string,
  paddingRight: string,
  paddingLeft: string,
  minHeight: string,
  maxHeight: string,
}
type inputsV2ChatInputV2TokensTypeContainerInputContainerActionContainerConfig = {
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
}
type inputsV2ChatInputV2TokensTypeContainerInputContainerTopQueriesContainerHeaderConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
  textTransform: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  backgroundColor: string,
}
type inputsV2ChatInputV2TokensTypeContainerInputContainerTopQueriesContainerItemConfig = {
  backgroundColor: string,  // ⚪ loose — was `{ default: BackgroundColor; hover: BackgroundColor; focus: BackgroundColor; error: BackgroundColor; disabled: `
  color: string,  // ⚪ loose — was `{ default: Color; hover: Color; focus: Color; error: Color; disabled: Color; }`
  fontSize: string,
  fontWeight: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  border: string,
  transition: string,
  cursor: string,
  opacity: string,  // ⚪ loose — was `{ default: Opacity; hover: Opacity; focus: Opacity; error: Opacity; disabled: Opacity; }`
}
type inputsV2ChatInputV2TokensTypeContainerInputContainerTopQueriesContainerConfig = {
  marginRight: string,
  marginLeft: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  borderTop: string,
  header: inputsV2ChatInputV2TokensTypeContainerInputContainerTopQueriesContainerHeaderConfig,
  item: inputsV2ChatInputV2TokensTypeContainerInputContainerTopQueriesContainerItemConfig,
}
type inputsV2ChatInputV2TokensTypeContainerInputContainerConfig = {
  outline: inputsV2InputLabelsV2TokensLabelColorConfig,
  boxShadow: inputsV2InputLabelsV2TokensLabelColorConfig,
  gap: string,
  borderRadius: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  border: string,
  backgroundColor: string,
  input: inputsV2ChatInputV2TokensTypeContainerInputContainerInputConfig,
  actionContainer: inputsV2ChatInputV2TokensTypeContainerInputContainerActionContainerConfig,
  topQueriesContainer: inputsV2ChatInputV2TokensTypeContainerInputContainerTopQueriesContainerConfig,
}
type inputsV2ChatInputV2TokensTypeContainerConfig = {
  backgroundColor: inputsV2InputLabelsV2TokensLabelColorConfig,
  borderRadius: string,
  border: inputsV2InputLabelsV2TokensLabelColorConfig,
  gap: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  attachedFilesContainer: inputsV2ChatInputV2TokensTypeContainerAttachedFilesContainerConfig,
  tagContainer: inputsV2ChatInputV2TokensTypeContainerTagContainerConfig,
  inputContainer: inputsV2ChatInputV2TokensTypeContainerInputContainerConfig,
}
type chatInputV2TokensType = {
  container: inputsV2ChatInputV2TokensTypeContainerConfig,
}
type responsiveChatInputV2TokensType = {
  sm: chatInputV2TokensType,
  lg: chatInputV2TokensType,
}
type stateTokenSingleSelectV2 = {
  active: string,
  default: string,
  hover: string,
  disabled: string,
  focus: string,
  focusVisible: string,
  selected: string,
}
type singleSelectV2SingleSelectV2TokensTypeLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: stateTokenSingleSelectV2,
}
type singleSelectV2SingleSelectV2TokensTypeErrorMessageConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type singleSelectV2SingleSelectV2TokensTypeRequiredConfig = {
  color: string,
}
type variantTokenV1snf1 = {
  container: string,
  @as("no-container") noContainer: string,
}
type sizeTokenV10cld = {
  sm: variantTokenV1snf1,
  md: variantTokenV1snf1,
  lg: variantTokenV1snf1,
}
type singleSelectV2VariantTokenContainerConfig = {
  top: string,
  right: string,
  bottom: string,
  left: string,
}
type variantTokenV3iu27 = {
  container: singleSelectV2VariantTokenContainerConfig,
  @as("no-container") noContainer: singleSelectV2VariantTokenContainerConfig,
}
type sizeTokenV5a2hx = {
  sm: variantTokenV3iu27,
  md: variantTokenV3iu27,
  lg: variantTokenV3iu27,
}
type triggerStateTokenSingleSelectV2 = {
  hover: string,
  error: string,
  focus: string,
  @as("open") open_: string,
  closed: string,
}
type variantTokenV185i4 = {
  container: triggerStateTokenSingleSelectV2,
  @as("no-container") noContainer: triggerStateTokenSingleSelectV2,
}
type singleSelectV2SingleSelectV2TokensTypeTriggerSlotConfig = {
  gap: string,
  width: string,
}
type singleSelectV2SingleSelectV2TokensTypeTriggerPlaceholderConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type singleSelectV2SingleSelectV2TokensTypeTriggerConfig = {
  height: sizeTokenV10cld,
  padding: sizeTokenV5a2hx,
  borderRadius: sizeTokenV10cld,
  boxShadow: variantTokenV1snf1,
  backgroundColor: variantTokenV185i4,
  outline: variantTokenV185i4,
  slot: singleSelectV2SingleSelectV2TokensTypeTriggerSlotConfig,
  placeholder: singleSelectV2SingleSelectV2TokensTypeTriggerPlaceholderConfig,
  selectedValue: singleSelectV2SingleSelectV2TokensTypeTriggerPlaceholderConfig,
}
type singleSelectV2SingleSelectV2TokensTypeMenuContentConfig = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  boxShadow: string,
}
type singleSelectV2SingleSelectV2TokensTypeMenuGroupLabelConfig = {
  margin: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  fontSize: string,
  fontWeight: string,
  color: stateTokenSingleSelectV2,
}
type singleSelectV2SingleSelectV2TokensTypeMenuItemSeparatorConfig = {
  color: string,
  height: string,
  margin: string,
}
type singleSelectV2SingleSelectV2TokensTypeMenuItemConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  margin: string,
  borderRadius: string,
  gap: string,
  backgroundColor: stateTokenSingleSelectV2,
  groupLabelText: singleSelectV2SingleSelectV2TokensTypeLabelConfig,
  option: singleSelectV2SingleSelectV2TokensTypeLabelConfig,
  description: singleSelectV2SingleSelectV2TokensTypeLabelConfig,
  separator: singleSelectV2SingleSelectV2TokensTypeMenuItemSeparatorConfig,
}
type submenuTriggerStateToken = {
  default: string,
  hover: string,
  focus: string,
}
type singleSelectV2SingleSelectV2TokensTypeMenuSubmenuTriggerConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  margin: string,
  borderRadius: string,
  backgroundColor: submenuTriggerStateToken,
}
type singleSelectV2SingleSelectV2TokensTypeMenuSubmenuContentConfig = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  boxShadow: string,
}
type singleSelectV2SingleSelectV2TokensTypeMenuSubmenuConfig = {
  trigger: singleSelectV2SingleSelectV2TokensTypeMenuSubmenuTriggerConfig,
  content: singleSelectV2SingleSelectV2TokensTypeMenuSubmenuContentConfig,
  optionText: singleSelectV2SingleSelectV2TokensTypeErrorMessageConfig,
  iconColor: string,
}
type singleSelectV2SingleSelectV2TokensTypeMenuConfig = {
  content: singleSelectV2SingleSelectV2TokensTypeMenuContentConfig,
  padding: sizeTokenV5a2hx,
  groupLabel: singleSelectV2SingleSelectV2TokensTypeMenuGroupLabelConfig,
  item: singleSelectV2SingleSelectV2TokensTypeMenuItemConfig,
  submenu: singleSelectV2SingleSelectV2TokensTypeMenuSubmenuConfig,
}
type singleSelectV2SingleSelectV2TokensTypeMobilePanelHeaderConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  borderBottom: string,
}
type singleSelectV2SingleSelectV2TokensTypeMobilePanelConfig = {
  header: singleSelectV2SingleSelectV2TokensTypeMobilePanelHeaderConfig,
}
type singleSelectV2TokensType = {
  gap: string,
  label: singleSelectV2SingleSelectV2TokensTypeLabelConfig,
  subLabel: singleSelectV2SingleSelectV2TokensTypeLabelConfig,
  hintText: singleSelectV2SingleSelectV2TokensTypeLabelConfig,
  errorMessage: singleSelectV2SingleSelectV2TokensTypeErrorMessageConfig,
  required: singleSelectV2SingleSelectV2TokensTypeRequiredConfig,
  trigger: singleSelectV2SingleSelectV2TokensTypeTriggerConfig,
  menu: singleSelectV2SingleSelectV2TokensTypeMenuConfig,
  mobilePanel: singleSelectV2SingleSelectV2TokensTypeMobilePanelConfig,
}
type responsiveSingleSelectV2Tokens = {
  sm: singleSelectV2TokensType,
  lg: singleSelectV2TokensType,
}
type stateTokenMultiSelectV2 = {
  active: string,
  default: string,
  hover: string,
  disabled: string,
  focus: string,
  focusVisible: string,
  selected: string,
}
type multiSelectV2MultiSelectV2TokensTypeLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: stateTokenMultiSelectV2,
}
type multiSelectV2MultiSelectV2TokensTypeErrorMessageConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type multiSelectV2MultiSelectV2TokensTypeRequiredConfig = {
  color: string,
}
type variantTokenV1snf12 = {
  container: string,
  @as("no-container") noContainer: string,
}
type sizeTokenV5c1ol = {
  sm: variantTokenV1snf12,
  md: variantTokenV1snf12,
  lg: variantTokenV1snf12,
}
type multiSelectV2VariantTokenContainerConfig = {
  top: string,
  right: string,
  bottom: string,
  left: string,
}
type variantTokenV12kh5 = {
  container: multiSelectV2VariantTokenContainerConfig,
  @as("no-container") noContainer: multiSelectV2VariantTokenContainerConfig,
}
type sizeTokenV7m0wt = {
  sm: variantTokenV12kh5,
  md: variantTokenV12kh5,
  lg: variantTokenV12kh5,
}
type triggerStateTokenMultiSelectV2 = {
  hover: string,
  error: string,
  focus: string,
  @as("open") open_: string,
  closed: string,
}
type variantTokenYjc5g = {
  container: triggerStateTokenMultiSelectV2,
  @as("no-container") noContainer: triggerStateTokenMultiSelectV2,
}
type multiSelectV2MultiSelectV2TokensTypeTriggerSlotConfig = {
  gap: string,
  width: string,
}
type multiSelectV2SelectionTagTypeTokenCountConfig = {
  color: string,
  backgroundColor: string,
  fontWeight: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
}
type selectionTagTypeToken = {
  count: multiSelectV2SelectionTagTypeTokenCountConfig,
  text: multiSelectV2SelectionTagTypeTokenCountConfig,
}
type contextMultiSelectV2TokensTypeTriggerSelectionTagConfig = {
  container: selectionTagTypeToken,
  @as("no-container") noContainer: selectionTagTypeToken,
  marginLeft: string,
  borderRadius: string,
}
type multiSelectV2MultiSelectV2TokensTypeTriggerChevronConfig = {
  gap: string,
  width: string,
  height: string,
  iconSize?: float,
}
type multiSelectV2MultiSelectV2TokensTypeTriggerClearButtonConfig = {
  backgroundColor: triggerStateTokenMultiSelectV2,
  outline: triggerStateTokenMultiSelectV2,
  color: string,
  width?: string,
}
type multiSelectV2MultiSelectV2TokensTypeTriggerFloatingLabelConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
}
type multiSelectV2MultiSelectV2TokensTypeTriggerPlaceholderConfig = {
  color: string,
  fontSize: string,
  fontWeight: string,
}
type multiSelectV2MultiSelectV2TokensTypeTriggerConfig = {
  height: sizeTokenV5c1ol,
  padding: sizeTokenV7m0wt,
  borderRadius: sizeTokenV5c1ol,
  boxShadow: variantTokenV1snf12,
  backgroundColor: variantTokenYjc5g,
  outline: variantTokenYjc5g,
  slot: multiSelectV2MultiSelectV2TokensTypeTriggerSlotConfig,
  selectionTag: contextMultiSelectV2TokensTypeTriggerSelectionTagConfig,
  chevron: multiSelectV2MultiSelectV2TokensTypeTriggerChevronConfig,
  clearButton?: multiSelectV2MultiSelectV2TokensTypeTriggerClearButtonConfig,
  floatingLabel: multiSelectV2MultiSelectV2TokensTypeTriggerFloatingLabelConfig,
  placeholder: multiSelectV2MultiSelectV2TokensTypeTriggerPlaceholderConfig,
  selectedValue: multiSelectV2MultiSelectV2TokensTypeTriggerPlaceholderConfig,
}
type multiSelectV2MultiSelectV2TokensTypeMenuScrollConfig = {
  height: string,
  maxHeight: string,
}
type multiSelectV2MultiSelectV2TokensTypeMenuHeaderConfig = {
  backgroundColor: string,
  borderBottom: string,
  selectAllRowPaddingLeft: string,
  selectAllRowPaddingRight: string,
}
type multiSelectV2MultiSelectV2TokensTypeMenuSelectAllConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  borderRadius: string,
}
type multiSelectV2MultiSelectV2TokensTypeMenuActionsConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  gap: string,
  backgroundColor: string,
  borderTop: string,
}
type multiSelectV2MultiSelectV2TokensTypeMenuItemOptionsLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: stateTokenMultiSelectV2,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
}
type multiSelectV2MultiSelectV2TokensTypeMenuItemSeperatorConfig = {
  color: string,
  height: string,
  margin: string,
}
type multiSelectV2MultiSelectV2TokensTypeMenuItemConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  margin: string,
  borderRadius: string,
  gap: string,
  backgroundColor: stateTokenMultiSelectV2,
  optionsLabel: multiSelectV2MultiSelectV2TokensTypeMenuItemOptionsLabelConfig,
  option: multiSelectV2MultiSelectV2TokensTypeLabelConfig,
  description: multiSelectV2MultiSelectV2TokensTypeLabelConfig,
  seperator: multiSelectV2MultiSelectV2TokensTypeMenuItemSeperatorConfig,
}
type multiSelectV2MultiSelectV2TokensTypeMenuConfig = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  padding: sizeTokenV7m0wt,
  minWidth: string,
  scroll: multiSelectV2MultiSelectV2TokensTypeMenuScrollConfig,
  header: multiSelectV2MultiSelectV2TokensTypeMenuHeaderConfig,
  selectAll: multiSelectV2MultiSelectV2TokensTypeMenuSelectAllConfig,
  list: multiSelectV2MultiSelectV2TokensTypeTriggerFloatingLabelConfig,
  actions: multiSelectV2MultiSelectV2TokensTypeMenuActionsConfig,
  item: multiSelectV2MultiSelectV2TokensTypeMenuItemConfig,
}
type multiSelectV2MultiSelectV2TokensTypeSubMenuTriggerConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  margin: string,
  borderRadius: string,
}
type multiSelectV2MultiSelectV2TokensTypeSubMenuContentConfig = {
  borderRadius: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
}
type multiSelectV2MultiSelectV2TokensTypeSubMenuConfig = {
  trigger: multiSelectV2MultiSelectV2TokensTypeSubMenuTriggerConfig,
  content: multiSelectV2MultiSelectV2TokensTypeSubMenuContentConfig,
}
type multiSelectV2MultiSelectV2TokensTypeDrawerHeaderConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  borderBottom: string,
}
type multiSelectV2MultiSelectV2TokensTypeDrawerSearchConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  marginTop: string,
  marginBottom: string,
}
type multiSelectV2MultiSelectV2TokensTypeDrawerContentConfig = {
  gap: string,
}
type multiSelectV2MultiSelectV2TokensTypeDrawerConfig = {
  header: multiSelectV2MultiSelectV2TokensTypeDrawerHeaderConfig,
  search: multiSelectV2MultiSelectV2TokensTypeDrawerSearchConfig,
  content: multiSelectV2MultiSelectV2TokensTypeDrawerContentConfig,
}
type multiSelectV2TokensType = {
  gap: string,
  label: multiSelectV2MultiSelectV2TokensTypeLabelConfig,
  subLabel: multiSelectV2MultiSelectV2TokensTypeLabelConfig,
  hintText: multiSelectV2MultiSelectV2TokensTypeLabelConfig,
  errorMessage: multiSelectV2MultiSelectV2TokensTypeErrorMessageConfig,
  required: multiSelectV2MultiSelectV2TokensTypeRequiredConfig,
  trigger: multiSelectV2MultiSelectV2TokensTypeTriggerConfig,
  menu: multiSelectV2MultiSelectV2TokensTypeMenuConfig,
  subMenu: multiSelectV2MultiSelectV2TokensTypeSubMenuConfig,
  drawer: multiSelectV2MultiSelectV2TokensTypeDrawerConfig,
}
type responsiveMultiSelectV2Tokens = {
  sm: multiSelectV2TokensType,
  lg: multiSelectV2TokensType,
}
type inputsV2TextInputV2TokensTypeInputContainerPlaceholderConfig = {
  color: inputsV2InputLabelsV2TokensLabelColorConfig,
  fontSize: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  fontWeight: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  lineHeight: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
}
type inputsV2TextInputV2TokensTypeInputContainerConfig = {
  gap: string,
  placeholder: inputsV2TextInputV2TokensTypeInputContainerPlaceholderConfig,
  inputText: inputsV2InputLabelsV2TokensLabelConfig,
  borderRadius: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  boxShadow: string,
  padding: inputsV2TextAreaV2TokensTypeInputContainerPaddingConfig,
  border: inputsV2InputLabelsV2TokensLabelColorConfig,
  backgroundColor: inputsV2InputLabelsV2TokensLabelColorConfig,
}
type textInputV2TokensType = {
  gap: string,
  topContainer: inputLabelsV2Tokens,
  inputContainer: inputsV2TextInputV2TokensTypeInputContainerConfig,
  bottomContainer: inputFooterV2Tokens,
}
type responsiveTextInputV2Tokens = {
  sm: textInputV2TokensType,
  lg: textInputV2TokensType,
}
type codeEditorV2CodeEditorV2TokensHeaderIconConfig = {
  width: string,
}
type codeEditorV2CodeEditorV2TokensHeaderTextConfig = {
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
  color: string,
}
type codeEditorV2CodeEditorV2TokensHeaderConfig = {
  backgroundColor: string,
  borderBottom: string,
  paddingTop: string,
  paddingBottom: string,
  paddingLeft: string,
  paddingRight: string,
  gap: string,
  icon: codeEditorV2CodeEditorV2TokensHeaderIconConfig,
  text: codeEditorV2CodeEditorV2TokensHeaderTextConfig,
}
type codeEditorV2CodeEditorV2TokensBodyGutterBackgroundColorConfig = {
  added: string,
  removed: string,
  unchanged: string,
}
type codeEditorV2CodeEditorV2TokensBodyGutterConfig = {
  width: string,
  color: string,
  backgroundColor: codeEditorV2CodeEditorV2TokensBodyGutterBackgroundColorConfig,
  borderLeft: codeEditorV2CodeEditorV2TokensBodyGutterBackgroundColorConfig,
  borderColor: codeEditorV2CodeEditorV2TokensBodyGutterBackgroundColorConfig,
}
type codeEditorV2CodeEditorV2TokensBodyCodeConfig = {
  fontFamily: string,
  fontSize: string,
  lineHeight: string,
  paddingTop: string,
  paddingBottom: string,
  paddingLeft: string,
  paddingRight: string,
}
type codeEditorV2CodeEditorV2TokensBodyHighlightedLineConfig = {
  backgroundColor: codeEditorV2CodeEditorV2TokensBodyGutterBackgroundColorConfig,
}
type codeEditorV2CodeEditorV2TokensBodySyntaxKeywordConfig = {
  color: string,
}
type codeEditorV2CodeEditorV2TokensBodySyntaxConfig = {
  keyword: codeEditorV2CodeEditorV2TokensBodySyntaxKeywordConfig,
  function: codeEditorV2CodeEditorV2TokensBodySyntaxKeywordConfig,
  string: codeEditorV2CodeEditorV2TokensBodySyntaxKeywordConfig,
  number: codeEditorV2CodeEditorV2TokensBodySyntaxKeywordConfig,
  operator: codeEditorV2CodeEditorV2TokensBodySyntaxKeywordConfig,
  variable: codeEditorV2CodeEditorV2TokensBodySyntaxKeywordConfig,
  comment: codeEditorV2CodeEditorV2TokensBodySyntaxKeywordConfig,
  text: codeEditorV2CodeEditorV2TokensBodySyntaxKeywordConfig,
}
type codeEditorV2CodeEditorV2TokensBodyConfig = {
  paddingTop: string,
  paddingBottom: string,
  paddingLeft: string,
  paddingRight: string,
  backgroundColor: string,
  gutter: codeEditorV2CodeEditorV2TokensBodyGutterConfig,
  code: codeEditorV2CodeEditorV2TokensBodyCodeConfig,
  highlightedLine: codeEditorV2CodeEditorV2TokensBodyHighlightedLineConfig,
  syntax: codeEditorV2CodeEditorV2TokensBodySyntaxConfig,
}
type codeEditorV2Tokens = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  boxShadow: string,
  theme: contextCodeEditorV2TokensTheme,
  header: codeEditorV2CodeEditorV2TokensHeaderConfig,
  body: codeEditorV2CodeEditorV2TokensBodyConfig,
}
type responsiveCodeEditorV2Tokens = {
  sm: codeEditorV2Tokens,
  lg: codeEditorV2Tokens,
}
type inputsV2MultiValueInputV2TokensTypeInputContainerPlaceholderColorConfig = {
  default: string,
  focus: string,
  hover: string,
  error: string,
  disabled: string,
}
type inputsV2MultiValueInputV2TokensTypeInputContainerCloseButtonConfig = {
  width: string,
}
type inputsV2MultiValueInputV2TokensTypeInputContainerLeftSlotConfig = {
  width: string,
  height: string,
}
type inputsV2MultiValueInputV2TokensTypeInputContainerSlotAlignTopConfig = {
  withTags: string,
  withoutTags: string,
}
type inputsV2MultiValueInputV2TokensTypeInputContainerConfig = {
  offSet: float,
  fontSize: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  fontWeight: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  gap: string,
  borderRadius?: string,
  boxShadow: inputsV2InputLabelsV2TokensLabelColorConfig,
  paddingTop: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  paddingRight: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  paddingBottom: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  paddingLeft: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  border: inputsV2InputLabelsV2TokensLabelColorConfig,
  color: inputsV2InputLabelsV2TokensLabelColorConfig,
  placeholderColor: inputsV2MultiValueInputV2TokensTypeInputContainerPlaceholderColorConfig,
  backgroundColor: inputsV2InputLabelsV2TokensLabelColorConfig,
  closeButton: inputsV2MultiValueInputV2TokensTypeInputContainerCloseButtonConfig,
  leftSlot: inputsV2MultiValueInputV2TokensTypeInputContainerLeftSlotConfig,
  rightSlot: inputsV2MultiValueInputV2TokensTypeInputContainerLeftSlotConfig,
  slotAlignTop: inputsV2MultiValueInputV2TokensTypeInputContainerSlotAlignTopConfig,
}
type multiValueInputV2TokensType = {
  gap: string,
  borderRadius: string,
  topContainer: inputLabelsV2Tokens,
  inputContainer: inputsV2MultiValueInputV2TokensTypeInputContainerConfig,
  bottomContainer: inputFooterV2Tokens,
}
type responsiveMultiValueInputV2Tokens = {
  sm: multiValueInputV2TokensType,
  lg: multiValueInputV2TokensType,
}
type inputsV2NumberInputV2TokensTypeInputContainerStepperButtonIconConfig = {
  color: inputsV2InputLabelsV2TokensLabelColorConfig,
  width: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
}
type inputsV2NumberInputV2TokensTypeInputContainerStepperButtonConfig = {
  width: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  backgroundColor: inputsV2InputLabelsV2TokensLabelColorConfig,
  icon: inputsV2NumberInputV2TokensTypeInputContainerStepperButtonIconConfig,
}
type inputsV2NumberInputV2TokensTypeInputContainerSlotLeftConfig = {
  width: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  height: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  margin: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
}
type inputsV2NumberInputV2TokensTypeInputContainerSlotConfig = {
  left: inputsV2NumberInputV2TokensTypeInputContainerSlotLeftConfig,
  right: inputsV2NumberInputV2TokensTypeInputContainerSlotLeftConfig,
}
type inputsV2NumberInputV2TokensTypeInputContainerConfig = {
  placeholder: inputsV2TextInputV2TokensTypeInputContainerPlaceholderConfig,
  fontSize: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  fontWeight: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  color: inputsV2InputLabelsV2TokensLabelColorConfig,
  borderRadius: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  boxShadow: string,
  paddingTop: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  paddingRight: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  paddingBottom: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  paddingLeft: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  border: inputsV2InputLabelsV2TokensLabelColorConfig,
  lineHeight: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  backgroundColor: inputsV2InputLabelsV2TokensLabelColorConfig,
  stepperButton: inputsV2NumberInputV2TokensTypeInputContainerStepperButtonConfig,
  slot: inputsV2NumberInputV2TokensTypeInputContainerSlotConfig,
}
type inputsV2NumberInputV2TokensTypeUnitConfig = {
  fontSize: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  fontWeight: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  paddingTop: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  paddingRight: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  paddingBottom: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  paddingLeft: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  borderRadius: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  border: inputsV2InputLabelsV2TokensLabelColorConfig,
  color: inputsV2InputLabelsV2TokensLabelColorConfig,
}
type floatingLabelsV2Tokens = {
  placeholder: inputsV2TextInputV2TokensTypeInputContainerPlaceholderConfig,
  required: inputsV2InputLabelsV2TokensRequiredConfig,
}
type numberInputV2TokensType = {
  gap: string,
  topContainer: inputLabelsV2Tokens,
  inputContainer: inputsV2NumberInputV2TokensTypeInputContainerConfig,
  unit: inputsV2NumberInputV2TokensTypeUnitConfig,
  floatingLabels: floatingLabelsV2Tokens,
  bottomContainer: inputFooterV2Tokens,
}
type responsiveNumberInputV2Tokens = {
  sm: numberInputV2TokensType,
  lg: numberInputV2TokensType,
}
type inputsV2OTPInputV2TokensTypeInputContainerInputConfig = {
  height: string,
  width: string,
  fontSize: string,
  fontWeight: string,
  color: inputsV2InputLabelsV2TokensLabelColorConfig,
  borderRadius: string,
  border: inputsV2InputLabelsV2TokensLabelColorConfig,
  backgroundColor: inputsV2InputLabelsV2TokensLabelColorConfig,
}
type inputsV2OTPInputV2TokensTypeInputContainerConfig = {
  gap: string,
  input: inputsV2OTPInputV2TokensTypeInputContainerInputConfig,
}
type otpInputV2TokensType = {
  gap: string,
  topContainer: inputLabelsV2Tokens,
  inputContainer: inputsV2OTPInputV2TokensTypeInputContainerConfig,
  bottomContainer: inputFooterV2Tokens,
}
type responsiveOTPInputV2Tokens = {
  sm: otpInputV2TokensType,
  lg: otpInputV2TokensType,
}
type inputsV2SearchInputV2TokensTypeLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: inputsV2InputLabelsV2TokensLabelColorConfig,
}
type inputsV2SearchInputV2TokensTypeErrorMessageConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type inputsV2SearchInputV2TokensTypeInputContainerSlotLeftConfig = {
  top: string,
  left: string,
  bottom: string,
}
type inputsV2SearchInputV2TokensTypeInputContainerSlotRightConfig = {
  top: string,
  right: string,
  bottom: string,
}
type inputsV2SearchInputV2TokensTypeInputContainerSlotConfig = {
  left: inputsV2SearchInputV2TokensTypeInputContainerSlotLeftConfig,
  right: inputsV2SearchInputV2TokensTypeInputContainerSlotRightConfig,
  transition: string,
  transform: string,
  color: inputsV2InputLabelsV2TokensLabelColorConfig,
}
type inputsV2SearchInputV2TokensTypeInputContainerConfig = {
  paddingTop: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  paddingRight: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  paddingBottom: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  paddingLeft: inputsV2InputLabelsV2TokensLabelFontSizeConfig,
  borderRadius: string,
  borderBottom: inputsV2InputLabelsV2TokensLabelColorConfig,
  outline: string,
  boxShadow: string,
  color: inputsV2InputLabelsV2TokensLabelColorConfig,
  placeholderColor: inputsV2InputLabelsV2TokensLabelColorConfig,
  fontSize: string,
  fontWeight: string,
  slot: inputsV2SearchInputV2TokensTypeInputContainerSlotConfig,
}
type inputsV2SearchInputV2TokensTypeIconConfig = {
  color: inputsV2InputLabelsV2TokensLabelColorConfig,
  width: string,
}
type searchInputV2TokensType = {
  gap: string,
  label: inputsV2SearchInputV2TokensTypeLabelConfig,
  subLabel: inputsV2SearchInputV2TokensTypeLabelConfig,
  hintText: inputsV2SearchInputV2TokensTypeLabelConfig,
  errorMessage: inputsV2SearchInputV2TokensTypeErrorMessageConfig,
  required: inputsV2InputLabelsV2TokensRequiredConfig,
  inputContainer: inputsV2SearchInputV2TokensTypeInputContainerConfig,
  icon: inputsV2SearchInputV2TokensTypeIconConfig,
}
type responsiveSearchInputV2Tokens = {
  sm: searchInputV2TokensType,
  lg: searchInputV2TokensType,
}
type inputsV2ChatInputV2MobileTokensTypeAttachmentButtonDimensionsConfig = {
  width: string,
  height: string,
  border: string,
  borderRadius: string,
  backgroundColor: inputsV2InputLabelsV2TokensLabelColorConfig,
  color: string,
}
type contextChatInputV2MobileTokensTypeInputContainerConfig = {
  border: inputsV2InputLabelsV2TokensLabelColorConfig,
  borderRadius: inputsV2InputLabelsV2TokensLabelColorConfig,
  boxShadow: inputsV2InputLabelsV2TokensLabelColorConfig,
  paddingLeft: string,
  paddingTop: string,
  paddingBottom: string,
  lineHeight: string,
  fontSize: string,
  fontWeight: string,
  color: string,
  placeholder: inputsV2InputLabelsV2TokensRequiredConfig,
  backgroundColor: string,
  width: string,
  height: string,
  minHeight: string,
  maxHeight: string,
  minWidth: string,
  maxWidth: string,
}
type inputsV2ChatInputV2MobileTokensTypeSecondaryActionConfig = {
  width: string,
  height: string,
  borderRadius: string,
  right: string,
  bottom: string,
  backgroundColor: inputsV2InputLabelsV2TokensLabelColorConfig,
  color: string,
}
type chatInputV2MobileTokensType = {
  gap: string,
  attachmentButtonDimensions: inputsV2ChatInputV2MobileTokensTypeAttachmentButtonDimensionsConfig,
  inputContainer: contextChatInputV2MobileTokensTypeInputContainerConfig,
  secondaryAction: inputsV2ChatInputV2MobileTokensTypeSecondaryActionConfig,
}
type componentTokenType = {
  @as("TAGS") tags?: TagsTypes.responsiveTagTokens,
  @as("SEARCH_INPUT") searchInput?: InputsTypes.responsiveSearchInputTokens,
  @as("TEXT_AREA") textArea?: InputsTypes.responsiveTextAreaTokens,
  @as("TEXT_AREA_V2") textAreaV2?: responsiveTextAreaV2Tokens,
  @as("RADIO") radio?: RadioTypes.responsiveRadioTokens,
  @as("SWITCH") switch_?: SwitchTypes.responsiveSwitchTokens,
  @as("TEXT_INPUT") textInput?: InputsTypes.responsiveTextInputTokens,
  @as("NUMBER_INPUT") numberInput?: InputsTypes.responsiveNumberInputTokens,
  @as("ALERT") alert?: AlertTypes.responsiveAlertTokens,
  @as("OTP_INPUT") otpInput?: InputsTypes.responsiveOTPInputTokens,
  @as("TOOLTIP") tooltip?: TooltipTypes.responsiveTooltipTokens,
  @as("UNIT_INPUT") unitInput?: InputsTypes.responsiveUnitInputTokens,
  @as("MULTI_VALUE_INPUT") multiValueInput?: InputsTypes.responsiveMultiValueInputTokens,
  @as("DROPDOWN_INPUT") dropdownInput?: InputsTypes.responsiveDropdownInputTokens,
  @as("CHECKBOX") checkbox?: CheckboxTypes.responsiveCheckboxTokens,
  @as("TABS") tabs?: TabsTypes.responsiveTabsTokens,
  @as("BUTTON") button?: ButtonTypes.responsiveButtonTokens,
  @as("MODAL") modal?: ModalTypes.responsiveModalTokens,
  @as("BREADCRUMB") breadcrumb?: BreadcrumbTypes.responsiveBreadcrumbTokens,
  @as("POPOVER") popover?: PopoverTypes.responsivePopoverTokens,
  @as("MENU") menu?: MenuTypes.responsiveMenuTokensType,
  @as("MENU_V2") menuV2?: MenuV2Types.responsiveMenuV2TokensType,
  @as("MULTI_SELECT") multiSelect?: MultiSelectTypes.responsiveMultiSelectTokens,
  @as("SINGLE_SELECT") singleSelect?: SingleSelectTypes.responsiveSingleSelectTokens,
  @as("TABLE") table?: DataTableTypes.responsiveTableTokens,
  @as("CALENDAR") calendar?: DateRangePickerTypes.responsiveCalendarTokens,
  @as("ACCORDION") accordion?: AccordionTypes.responsiveAccordionTokens,
  @as("STAT_CARD") statCard?: StatCardTypes.responsiveStatCardTokens,
  @as("PROGRESS_BAR") progressBar?: ProgressBarTypes.responsiveProgressBarTokens,
  @as("DRAWER") drawer?: DrawerTypes.responsiveDrawerTokens,
  @as("CHARTS") charts?: ChartsTypes.responsiveChartTokens,
  @as("SNACKBAR") snackbar?: SnackbarTypes.responsiveSnackbarTokens,
  @as("STEPPER") stepper?: StepperTypes.responsiveStepperTokens,
  @as("KEYVALUEPAIR") keyvaluepair?: KeyValuePairTypes.responsiveKeyValuePairTokens,
  @as("CARD") card?: CardTypes.responsiveCardTokens,
  @as("SKELETON") skeleton?: SkeletonTypes.responsiveSkeletonTokens,
  @as("TOPBAR") topbar?: TopbarTypes.responsiveTopbarTokens,
  @as("TOPBARV2") topbarv2?: TopbarV2Types.responsiveTopbarV2Tokens,
  @as("AVATAR") avatar?: AvatarTypes.responsiveAvatarTokens,
  @as("AVATAR_GROUP") avatarGroup?: AvatarGroupTypes.responsiveAvatarGroupTokens,
  @as("SIDEBAR") sidebar?: SidebarTypes.responsiveSidebarTokens,
  @as("DIRECTORY") directory?: DirectoryTypes.responsiveDirectoryTokens,
  @as("MOBILE_NAVIGATION") mobileNavigation?: SidebarTypes.responsiveMobileNavigationTokens,
  @as("MOBILE_NAVIGATION_V2") mobileNavigationV2?: SidebarV2Types.responsiveMobileNavigationV2Tokens,
  @as("UPLOAD") upload?: UploadTypes.responsiveUploadTokens,
  @as("CODE_BLOCK") codeBlock?: CodeBlockTypes.responsiveCodeBlockTokens,
  @as("CHAT_INPUT") chatInput?: ChatInputTypes.responsiveChatInputTokensType,
  @as("CHAT_INPUTV2") chatInputv2?: responsiveChatInputV2TokensType,
  @as("TIMELINE") timeline?: TimelineTypes.responsiveTimelineTokens,
  @as("BUTTONV2") buttonv2?: ButtonV2Types.responsiveButtonV2Tokens,
  @as("TAGV2") tagv2?: TagV2Types.responsiveTagV2Tokens,
  @as("ALERTV2") alertv2?: AlertV2Types.responsiveAlertV2Tokens,
  @as("ACCORDIONV2") accordionv2?: AccordionV2Types.responsiveAccordionV2Tokens,
  @as("SNACKBARV2") snackbarv2?: SnackbarV2Types.responsiveSnackbarV2Tokens,
  @as("SWITCHV2") switchv2?: SelectorV2Types.responsiveSwitchV2Tokens,
  @as("SINGLE_SELECT_V2") singleSelectV2?: responsiveSingleSelectV2Tokens,
  @as("MULTI_SELECT_V2") multiSelectV2?: responsiveMultiSelectV2Tokens,
  @as("AVATARV2") avatarv2?: AvatarV2Types.responsiveAvatarV2Tokens,
  @as("TEXT_INPUTV2") textInputv2?: responsiveTextInputV2Tokens,
  @as("CHARTSV2") chartsv2?: ChartsV2Types.responsiveChartV2Tokens,
  @as("CHECKBOXV2") checkboxv2?: SelectorV2Types.responsiveCheckboxV2Tokens,
  @as("KEYVALUEPAIRV2") keyvaluepairv2?: KeyValuePairV2Types.responsiveKeyValuePairV2Tokens,
  @as("STATCARDV2") statcardv2?: StatCardV2Types.responsiveStatCardV2Tokens,
  @as("TOOLTIPV2") tooltipv2?: TooltipV2Types.responsiveTooltipV2Tokens,
  @as("RADIOV2") radiov2?: SelectorV2Types.responsiveRadioV2Tokens,
  @as("POPOVERV2") popoverv2?: PopoverV2Types.responsivePopoverV2Tokens,
  @as("SIDEBARV2") sidebarv2?: SidebarV2Types.responsiveSidebarV2Tokens,
  @as("TABSV2") tabsv2?: TabsV2Types.responsiveTabsV2Tokens,
  @as("BREADCRUMBV2") breadcrumbv2?: BreadcrumbV2Types.responsiveBreadcrumbV2Tokens,
  @as("CODEEDITORV2") codeeditorv2?: responsiveCodeEditorV2Tokens,
  @as("PROGRESS_BARV2") progressBarv2?: ProgressBarV2Types.responsiveProgressBarV2Tokens,
  @as("MULTI_VALUE_INPUT_V2") multiValueInputV2?: responsiveMultiValueInputV2Tokens,
  @as("NUMBER_INPUT_V2") numberInputV2?: responsiveNumberInputV2Tokens,
  @as("OTP_INPUTV2") otpInputv2?: responsiveOTPInputV2Tokens,
  @as("BADGE") badge?: BadgeTypes.responsiveBadgeTokens,
  @as("SEARCH_INPUT_V2") searchInputV2?: responsiveSearchInputV2Tokens,
  @as("CHAT_INPUTV2_MOBILE") chatInputv2Mobile?: chatInputV2MobileTokensType,
  @as("STEPPERV2") stepperv2?: StepperV2Types.responsiveStepperV2Tokens,
}
type contextThemeContextTypeComponentTokensConfig = {
  @as("TAGS") tags: TagsTypes.responsiveTagTokens,
  @as("SEARCH_INPUT") searchInput: InputsTypes.responsiveSearchInputTokens,
  @as("TEXT_AREA") textArea: InputsTypes.responsiveTextAreaTokens,
  @as("TEXT_AREA_V2") textAreaV2: responsiveTextAreaV2Tokens,
  @as("RADIO") radio: RadioTypes.responsiveRadioTokens,
  @as("SWITCH") switch_: SwitchTypes.responsiveSwitchTokens,
  @as("TEXT_INPUT") textInput: InputsTypes.responsiveTextInputTokens,
  @as("NUMBER_INPUT") numberInput: InputsTypes.responsiveNumberInputTokens,
  @as("ALERT") alert: AlertTypes.responsiveAlertTokens,
  @as("OTP_INPUT") otpInput: InputsTypes.responsiveOTPInputTokens,
  @as("TOOLTIP") tooltip: TooltipTypes.responsiveTooltipTokens,
  @as("UNIT_INPUT") unitInput: InputsTypes.responsiveUnitInputTokens,
  @as("MULTI_VALUE_INPUT") multiValueInput: InputsTypes.responsiveMultiValueInputTokens,
  @as("DROPDOWN_INPUT") dropdownInput: InputsTypes.responsiveDropdownInputTokens,
  @as("CHECKBOX") checkbox: CheckboxTypes.responsiveCheckboxTokens,
  @as("TABS") tabs: TabsTypes.responsiveTabsTokens,
  @as("BUTTON") button: ButtonTypes.responsiveButtonTokens,
  @as("MODAL") modal: ModalTypes.responsiveModalTokens,
  @as("BREADCRUMB") breadcrumb: BreadcrumbTypes.responsiveBreadcrumbTokens,
  @as("POPOVER") popover: PopoverTypes.responsivePopoverTokens,
  @as("MENU") menu: MenuTypes.responsiveMenuTokensType,
  @as("MENU_V2") menuV2: MenuV2Types.responsiveMenuV2TokensType,
  @as("MULTI_SELECT") multiSelect: MultiSelectTypes.responsiveMultiSelectTokens,
  @as("SINGLE_SELECT") singleSelect: SingleSelectTypes.responsiveSingleSelectTokens,
  @as("TABLE") table: DataTableTypes.responsiveTableTokens,
  @as("CALENDAR") calendar: DateRangePickerTypes.responsiveCalendarTokens,
  @as("ACCORDION") accordion: AccordionTypes.responsiveAccordionTokens,
  @as("STAT_CARD") statCard: StatCardTypes.responsiveStatCardTokens,
  @as("PROGRESS_BAR") progressBar: ProgressBarTypes.responsiveProgressBarTokens,
  @as("DRAWER") drawer: DrawerTypes.responsiveDrawerTokens,
  @as("CHARTS") charts: ChartsTypes.responsiveChartTokens,
  @as("SNACKBAR") snackbar: SnackbarTypes.responsiveSnackbarTokens,
  @as("STEPPER") stepper: StepperTypes.responsiveStepperTokens,
  @as("KEYVALUEPAIR") keyvaluepair: KeyValuePairTypes.responsiveKeyValuePairTokens,
  @as("CARD") card: CardTypes.responsiveCardTokens,
  @as("SKELETON") skeleton: SkeletonTypes.responsiveSkeletonTokens,
  @as("TOPBAR") topbar: TopbarTypes.responsiveTopbarTokens,
  @as("TOPBARV2") topbarv2: TopbarV2Types.responsiveTopbarV2Tokens,
  @as("AVATAR") avatar: AvatarTypes.responsiveAvatarTokens,
  @as("AVATAR_GROUP") avatarGroup: AvatarGroupTypes.responsiveAvatarGroupTokens,
  @as("SIDEBAR") sidebar: SidebarTypes.responsiveSidebarTokens,
  @as("DIRECTORY") directory: DirectoryTypes.responsiveDirectoryTokens,
  @as("MOBILE_NAVIGATION") mobileNavigation: SidebarTypes.responsiveMobileNavigationTokens,
  @as("MOBILE_NAVIGATION_V2") mobileNavigationV2: SidebarV2Types.responsiveMobileNavigationV2Tokens,
  @as("UPLOAD") upload: UploadTypes.responsiveUploadTokens,
  @as("CODE_BLOCK") codeBlock: CodeBlockTypes.responsiveCodeBlockTokens,
  @as("CHAT_INPUT") chatInput: ChatInputTypes.responsiveChatInputTokensType,
  @as("CHAT_INPUTV2") chatInputv2: responsiveChatInputV2TokensType,
  @as("TIMELINE") timeline: TimelineTypes.responsiveTimelineTokens,
  @as("BUTTONV2") buttonv2: ButtonV2Types.responsiveButtonV2Tokens,
  @as("TAGV2") tagv2: TagV2Types.responsiveTagV2Tokens,
  @as("ALERTV2") alertv2: AlertV2Types.responsiveAlertV2Tokens,
  @as("ACCORDIONV2") accordionv2: AccordionV2Types.responsiveAccordionV2Tokens,
  @as("SNACKBARV2") snackbarv2: SnackbarV2Types.responsiveSnackbarV2Tokens,
  @as("SWITCHV2") switchv2: SelectorV2Types.responsiveSwitchV2Tokens,
  @as("SINGLE_SELECT_V2") singleSelectV2: responsiveSingleSelectV2Tokens,
  @as("MULTI_SELECT_V2") multiSelectV2: responsiveMultiSelectV2Tokens,
  @as("AVATARV2") avatarv2: AvatarV2Types.responsiveAvatarV2Tokens,
  @as("TEXT_INPUTV2") textInputv2: responsiveTextInputV2Tokens,
  @as("CHARTSV2") chartsv2: ChartsV2Types.responsiveChartV2Tokens,
  @as("CHECKBOXV2") checkboxv2: SelectorV2Types.responsiveCheckboxV2Tokens,
  @as("KEYVALUEPAIRV2") keyvaluepairv2: KeyValuePairV2Types.responsiveKeyValuePairV2Tokens,
  @as("STATCARDV2") statcardv2: StatCardV2Types.responsiveStatCardV2Tokens,
  @as("TOOLTIPV2") tooltipv2: TooltipV2Types.responsiveTooltipV2Tokens,
  @as("RADIOV2") radiov2: SelectorV2Types.responsiveRadioV2Tokens,
  @as("POPOVERV2") popoverv2: PopoverV2Types.responsivePopoverV2Tokens,
  @as("SIDEBARV2") sidebarv2: SidebarV2Types.responsiveSidebarV2Tokens,
  @as("TABSV2") tabsv2: TabsV2Types.responsiveTabsV2Tokens,
  @as("BREADCRUMBV2") breadcrumbv2: BreadcrumbV2Types.responsiveBreadcrumbV2Tokens,
  @as("CODEEDITORV2") codeeditorv2: responsiveCodeEditorV2Tokens,
  @as("PROGRESS_BARV2") progressBarv2: ProgressBarV2Types.responsiveProgressBarV2Tokens,
  @as("MULTI_VALUE_INPUT_V2") multiValueInputV2: responsiveMultiValueInputV2Tokens,
  @as("NUMBER_INPUT_V2") numberInputV2: responsiveNumberInputV2Tokens,
  @as("OTP_INPUTV2") otpInputv2: responsiveOTPInputV2Tokens,
  @as("BADGE") badge: BadgeTypes.responsiveBadgeTokens,
  @as("SEARCH_INPUT_V2") searchInputV2: responsiveSearchInputV2Tokens,
  @as("CHAT_INPUTV2_MOBILE") chatInputv2Mobile: chatInputV2MobileTokensType,
  @as("STEPPERV2") stepperv2: StepperV2Types.responsiveStepperV2Tokens,
}
type themeContextType = {
  foundationTokens: string,  // 🛑 BROKEN — contains `any`
  componentTokens: contextThemeContextTypeComponentTokensConfig,
  breakpoints: BreakpointsTypes.breakpointType,
  theme: string,
}
type shadowRootContextType = {
  shadowRoot: Nullable.t<Dom.shadowRoot>,
  target: Nullable.t<Dom.element>,
}
type inputsV2ErrorConfig = {
  show: bool,
  message?: string,
}
type rec singleSelectV2ItemType = {
  label: string,
  value: string,
  checked?: bool,
  subLabel?: string,
  slot1?: React.element,
  slot2?: React.element,
  slot3?: React.element,
  slot4?: React.element,
  disabled?: bool,
  onClick?: unit => unit,
  tooltip?: React.element,
  tooltipProps?: SelectV2Types.selectV2TooltipProps,
  disableTruncation?: bool,
  subMenu?: array<singleSelectV2ItemType>,
}
type singleSelectV2GroupType = {
  groupLabel?: string,
  items: array<singleSelectV2ItemType>,
  showSeparator?: bool,
}
type selectV2SearchConfig = {
  show?: bool,
  placeholder?: string,
}
type selectV2MenuPosition = {
  alignment?: SelectV2Types.selectV2Alignment,
  side?: SelectV2Types.selectV2Side,
  sideOffset?: float,
  alignOffset?: float,
}
type selectV2MenuDimensions = {
  minWidth?: string,
  maxWidth?: string,
  maxHeight?: string,
}
type selectV2TriggerDimensions = {
  minWidth?: string,
  maxWidth?: string,
  width?: string,
}
type selectV2ErrorState = {
  show?: bool,
  message?: string,
}
type textInputV2Dropdown = {
  label?: string,
  subLabel?: string,
  hintText?: string,
  required?: bool,
  helpIconText?: string,
  placeholder: string,
  size?: SelectV2Types.selectV2Size,
  variant?: SelectV2Types.selectV2Variant,
  items: array<singleSelectV2GroupType>,
  selected: string,
  onSelect: string => unit,
  search?: selectV2SearchConfig,
  slot?: React.element,
  customTrigger?: React.element,
  @as("open") open_?: bool,
  onOpenChange?: bool => unit,
  usePanelOnMobile?: bool,
  menuPosition?: selectV2MenuPosition,
  menuDimensions?: selectV2MenuDimensions,
  triggerDimensions?: selectV2TriggerDimensions,
  inline?: bool,
  error?: selectV2ErrorState,
  enableVirtualization?: bool,
  virtualListItemHeight?: float,
  virtualListOverscan?: float,
  onEndReached?: unit => unit,
  endReachedThreshold?: float,
  hasMore?: bool,
  loadingComponent?: React.element,
  skeleton?: SelectV2Types.selectV2SkeletonProps,
  allowCustomValue?: bool,
  customValueLabel?: string,
  singleSelectGroupPosition?: ButtonTypes.buttonButtonGroupPosition,
  position: textInputV2DropdownPosition,
}
type inputsV2LeftSlotConfig = {
  slot: React.element,
  maxHeight?: string,
}
type singleSelectV2Props = {
  label?: string,
  subLabel?: string,
  hintText?: string,
  required?: bool,
  helpIconText?: string,
  placeholder: string,
  size?: SelectV2Types.selectV2Size,
  variant?: SelectV2Types.selectV2Variant,
  items: array<singleSelectV2GroupType>,
  selected: string,
  onSelect: string => unit,
  search?: selectV2SearchConfig,
  slot?: React.element,
  customTrigger?: React.element,
  @as("open") open_?: bool,
  onOpenChange?: bool => unit,
  usePanelOnMobile?: bool,
  menuPosition?: selectV2MenuPosition,
  menuDimensions?: selectV2MenuDimensions,
  triggerDimensions?: selectV2TriggerDimensions,
  inline?: bool,
  error?: selectV2ErrorState,
  enableVirtualization?: bool,
  virtualListItemHeight?: float,
  virtualListOverscan?: float,
  onEndReached?: unit => unit,
  endReachedThreshold?: float,
  hasMore?: bool,
  loadingComponent?: React.element,
  skeleton?: SelectV2Types.selectV2SkeletonProps,
  allowCustomValue?: bool,
  customValueLabel?: string,
  singleSelectGroupPosition?: ButtonTypes.buttonButtonGroupPosition,
}
type embeddedSingleSelectOptions = {
  fieldLabel?: string,
  fieldDisabled: bool,
  singleSelectV2Size: SelectV2Types.selectV2Size,
  menuAlignment: SelectV2Types.selectV2Alignment,
  menuSideOffset: float,
  menuAlignOffset: float,
  defaultSingleSelectGroupPosition: ChartsTypes.chartsPlotOrganizationOptionsHangingSide,
}
type inputsV2FOCUSRINGSTYLESConfig = {
  boxShadow: string,  // ⚪ loose — was `"0 0 0 3px #EFF6FF"`
  backgroundColor: string,  // ⚪ loose — was `"rgba(239, 246, 255, 0.15)"`
}
type inputsV2GetInputStateErrorConfig = {
  show: bool,
}
type inputsV2GetVerticalInputPaddingV0Config = {
  isSmallScreenWithLargeSize: bool,
  inputFocusedOrWithValue: bool,
  paddingTop: float,
  paddingBottom: float,
}
type inputsV2GetVerticalInputPaddingConfig = {
  top: float,
  bottom: float,
}
type inputsV2TagsConfig = {
  value: array<string>,
  size: TagsTypes.tagSize,
  shape: TagsTypes.tagShape,
  variant: TagsTypes.tagVariant,
}
type inputsV2SlotConfig = {
  left?: React.element,
  right?: React.element,
}
type inputsV2LabelConfig = {
  text: string,
  subtext?: string,
}
type codeEditorV2HeaderConfig = {
  showHeader?: bool,
  title?: string,
  leftSlot?: React.element,
  rightSlot?: React.element,
  showCopyButton?: bool,
}
type editorMetrics = {
  fontSize: float,
  lineHeight: float,
  verticalPadding: float,
  codePaddingLeft: float,
  gutterWidth: float,
  lineDecorationsWidth: float,
  lineNumbersMinChars: float,
  scrollbarSize: float,
}
type codeEditorV2GetContainerDimensionsConfig = {
  minHeight?: string,
  maxHeight?: string,
  height?: string,
}
type codeEditorV2GetPlaceholderPositionConfig = {
  top: string,
  left: string,
}
type iDisposable = {
  dispose: unit => unit,
}
type iModelContentChange = {
  range: string,  // ⚪ loose — was `IRange`
  rangeOffset: float,
  rangeLength: float,
  text: string,
}
type iModelContentChangedEvent = {
  changes: array<iModelContentChange>,
  eol: string,
  versionId: float,
  isUndoing: bool,
  isRedoing: bool,
  isFlush: bool,
  isEolChange: bool,
  detailedReasonsChangeLengths: array<float>,
}
type iModelLanguageChangedEvent = {
  oldLanguage: string,
  newLanguage: string,
  source: string,
}
type iModelOptionsChangedEvent = {
  tabSize: bool,
  indentSize: bool,
  insertSpaces: bool,
  trimAutoWhitespace: bool,
}
type configurationChangedEvent = {
  hasChanged: editorOption => bool,
}
type rec position = {
  lineNumber: float,
  column: float,
  @as("with") with_: (option<float>, option<float>) => position,
  delta: (option<float>, option<float>) => position,
  equals: string => bool,  // ⚪ loose — was `IPosition`
  isBefore: string => bool,  // ⚪ loose — was `IPosition`
  isBeforeOrEqual: string => bool,  // ⚪ loose — was `IPosition`
  clone: unit => position,
  toString: unit => string,
  toJSON: unit => string,  // ⚪ loose — was `IPosition`
}
type iCursorPositionChangedEvent = {
  position: position,
  secondaryPositions: array<position>,
  reason: cursorChangeReason,
  source: string,
}
type rec selection = {
  selectionStartLineNumber: float,
  selectionStartColumn: float,
  positionLineNumber: float,
  positionColumn: float,
  toString: unit => string,
  equalsSelection: string => bool,  // ⚪ loose — was `ISelection`
  getDirection: unit => string,  // ⚪ loose — was `SelectionDirection`
  setEndPosition: (float, float) => selection,
  getPosition: unit => position,
  getSelectionStart: unit => position,
  setStartPosition: (float, float) => selection,
  startLineNumber: float,
  startColumn: float,
  endLineNumber: float,
  endColumn: float,
  isEmpty: unit => bool,
  containsPosition: string => bool,  // ⚪ loose — was `IPosition`
  containsRange: string => bool,  // ⚪ loose — was `IRange`
  strictContainsRange: string => bool,  // ⚪ loose — was `IRange`
  plusRange: string => string,  // ⚪ loose — was `Range`
  intersectRanges: string => string,  // ⚪ loose — was `Range`
  equalsRange: string => bool,  // ⚪ loose — was `IRange`
  getEndPosition: unit => position,
  getStartPosition: unit => position,
  collapseToStart: unit => string,  // ⚪ loose — was `Range`
  collapseToEnd: unit => string,  // ⚪ loose — was `Range`
  delta: float => string,  // ⚪ loose — was `Range`
  isSingleLine: unit => bool,
  toJSON: unit => string,  // ⚪ loose — was `IRange`
}
type iCursorSelectionChangedEvent = {
  selection: selection,
  secondarySelections: array<selection>,
  modelVersionId: float,
  oldSelections: Nullable.t<array<selection>>,
  oldModelVersionId: float,
  source: string,
  reason: cursorChangeReason,
}
type rec uri = {
  scheme: string,
  authority: string,
  path: string,
  query: string,
  fragment: string,
  fsPath: string,
  @as("with") with_: string => uri,  // ⚪ loose — was `{ scheme?: string; authority?: string; path?: string; query?: string; fragment?: string; }`
  toString: option<bool> => string,
  toJSON: unit => string,  // ⚪ loose — was `UriComponents`
}
type iModelChangedEvent = {
  oldModelUrl: Nullable.t<uri>,
  newModelUrl: Nullable.t<uri>,
}
type iModelDecorationsChangedEvent = {
  affectsMinimap: bool,
  affectsOverviewRuler: bool,
  affectsGlyphMargin: bool,
  affectsLineNumber: bool,
}
type rec range = {
  startLineNumber: float,
  startColumn: float,
  endLineNumber: float,
  endColumn: float,
  isEmpty: unit => bool,
  containsPosition: string => bool,  // ⚪ loose — was `IPosition`
  containsRange: string => bool,  // ⚪ loose — was `IRange`
  strictContainsRange: string => bool,  // ⚪ loose — was `IRange`
  plusRange: string => range,  // ⚪ loose — was `IRange`
  intersectRanges: string => Nullable.t<range>,  // ⚪ loose — was `IRange`
  equalsRange: string => bool,  // ⚪ loose — was `IRange`
  getEndPosition: unit => position,
  getStartPosition: unit => position,
  toString: unit => string,
  setEndPosition: (float, float) => range,
  setStartPosition: (float, float) => range,
  collapseToStart: unit => range,
  collapseToEnd: unit => range,
  delta: float => range,
  isSingleLine: unit => bool,
  toJSON: unit => string,  // ⚪ loose — was `IRange`
}
type iPasteEvent = {
  range: range,
  languageId: Nullable.t<string>,
  clipboardEvent?: Dom.event,
}
type iMouseEvent = {
  browserEvent: Dom.event,
  leftButton: bool,
  middleButton: bool,
  rightButton: bool,
  buttons: float,
  target: Dom.element,
  detail: float,
  posx: float,
  posy: float,
  ctrlKey: bool,
  shiftKey: bool,
  altKey: bool,
  metaKey: bool,
  timestamp: float,
  defaultPrevented: bool,
  preventDefault: unit => unit,
  stopPropagation: unit => unit,
}
type iMouseTargetUnknown = {
  @as("type") type_: float,
  element: string,  // ⚪ loose — was `HTMLElement`
  position: Nullable.t<position>,
  mouseColumn: float,
  range: Nullable.t<range>,
}
type iMouseTargetTextarea = {
  @as("type") type_: float,
  position: string,  // ⚪ loose — was `null`
  range: string,  // ⚪ loose — was `null`
  element: string,  // ⚪ loose — was `HTMLElement`
  mouseColumn: float,
}
type iMouseTargetMargin = {
  @as("type") type_: string,  // ⚪ loose — was `MouseTargetType.GUTTER_GLYPH_MARGIN | MouseTargetType.GUTTER_LINE_NUMBERS | MouseTargetType.GUTTER_LINE_DECORA`
  position: position,
  range: range,
  detail: string,  // ⚪ loose — was `IMouseTargetMarginData`
  element: string,  // ⚪ loose — was `HTMLElement`
  mouseColumn: float,
}
type iMouseTargetContentText = {
  @as("type") type_: float,
  position: position,
  range: range,
  detail: string,  // ⚪ loose — was `IMouseTargetContentTextData`
  element: string,  // ⚪ loose — was `HTMLElement`
  mouseColumn: float,
}
type iMouseTargetContentWidget = {
  @as("type") type_: float,
  position: string,  // ⚪ loose — was `null`
  range: string,  // ⚪ loose — was `null`
  detail: string,
  element: string,  // ⚪ loose — was `HTMLElement`
  mouseColumn: float,
}
type iMouseTargetScrollbar = {
  @as("type") type_: float,
  position: position,
  range: range,
  element: string,  // ⚪ loose — was `HTMLElement`
  mouseColumn: float,
}
type iMouseTargetOutsideEditor = {
  @as("type") type_: float,
  outsidePosition: string,  // ⚪ loose — was `"left" | "right" | "above" | "below"`
  outsideDistance: float,
  element: string,  // ⚪ loose — was `HTMLElement`
  position: Nullable.t<position>,
  mouseColumn: float,
  range: Nullable.t<range>,
}
module IMouseTarget = {
  type t
  external fromIMouseTargetUnknown: iMouseTargetUnknown => t = "%identity"
  external fromIMouseTargetTextarea: iMouseTargetTextarea => t = "%identity"
  external fromIMouseTargetMargin: iMouseTargetMargin => t = "%identity"
  external fromIMouseTargetViewZone: iMouseTargetMargin => t = "%identity"
  external fromIMouseTargetContentText: iMouseTargetContentText => t = "%identity"
  external fromIMouseTargetContentEmpty: iMouseTargetContentText => t = "%identity"
  external fromIMouseTargetContentWidget: iMouseTargetContentWidget => t = "%identity"
  external fromIMouseTargetOverlayWidget: iMouseTargetContentWidget => t = "%identity"
  external fromIMouseTargetScrollbar: iMouseTargetScrollbar => t = "%identity"
  external fromIMouseTargetOverviewRuler: iMouseTargetUnknown => t = "%identity"
  external fromIMouseTargetOutsideEditor: iMouseTargetOutsideEditor => t = "%identity"
}
type iEditorMouseEvent = {
  event: iMouseEvent,
  target: IMouseTarget.t,
}
type iKeyboardEvent = {
  _standardKeyboardEventBrand: bool,
  browserEvent: Dom.event,
  target: Dom.element,
  ctrlKey: bool,
  shiftKey: bool,
  altKey: bool,
  metaKey: bool,
  altGraphKey: bool,
  keyCode: keyCode,
  code: string,
  equals: float => bool,
  preventDefault: unit => unit,
  stopPropagation: unit => unit,
}
type editorMinimapLayoutInfo = {
  renderMinimap: renderMinimap,
  minimapLeft: float,
  minimapWidth: float,
  minimapHeightIsEditorHeight: bool,
  minimapIsSampling: bool,
  minimapScale: float,
  minimapLineHeight: float,
  minimapCanvasInnerWidth: float,
  minimapCanvasInnerHeight: float,
  minimapCanvasOuterWidth: float,
  minimapCanvasOuterHeight: float,
}
type overviewRulerPosition = {
  width: float,
  height: float,
  top: float,
  right: float,
}
type editorLayoutInfo = {
  width: float,
  height: float,
  glyphMarginLeft: float,
  glyphMarginWidth: float,
  glyphMarginDecorationLaneCount: float,
  lineNumbersLeft: float,
  lineNumbersWidth: float,
  decorationsLeft: float,
  decorationsWidth: float,
  contentLeft: float,
  contentWidth: float,
  minimap: editorMinimapLayoutInfo,
  viewportColumn: float,
  isWordWrapMinified: bool,
  isViewportWrapping: bool,
  wrappingColumn: float,
  verticalScrollbarWidth: float,
  horizontalScrollbarHeight: float,
  overviewRuler: overviewRulerPosition,
}
type iContentSizeChangedEvent = {
  contentWidth: float,
  contentHeight: float,
  contentWidthChanged: bool,
  contentHeightChanged: bool,
}
type iScrollEvent = {
  scrollTop: float,
  scrollLeft: float,
  scrollWidth: float,
  scrollHeight: float,
  scrollTopChanged: bool,
  scrollLeftChanged: bool,
  scrollWidthChanged: bool,
  scrollHeightChanged: bool,
}
type iPosition = {
  lineNumber: float,
  column: float,
}
type iCursorState = {
  inSelectionMode: bool,
  selectionStart: iPosition,
  position: iPosition,
}
type iViewState = {
  scrollTop?: float,
  scrollTopWithoutViewZones?: float,
  scrollLeft: float,
  firstPosition: iPosition,
  firstPositionDeltaTop: float,
}
type iCodeEditorViewState = {
  cursorState: array<iCursorState>,
  viewState: iViewState,
  contributionsState: Dict.t<string>,  // 🛑 BROKEN — contains `any`
}
type bracketPairColorizationOptions = {
  enabled: bool,
  independentColorPoolPerBracketType: bool,
}
type textModelResolvedOptions = {
  _textModelResolvedOptionsBrand: string,  // ⚪ loose — was `void`
  tabSize: float,
  indentSize: float,
  insertSpaces: bool,
  defaultEOL: defaultEndOfLine,
  trimAutoWhitespace: bool,
  bracketPairColorizationOptions: bracketPairColorizationOptions,
  originalIndentSize: CommonTypes.tabSizeOrNumber,
}
type iTextSnapshot = {
  read: unit => Nullable.t<string>,
}
type iRange = {
  startLineNumber: float,
  startColumn: float,
  endLineNumber: float,
  endColumn: float,
}
type findMatch = {
  _findMatchBrand: string,  // ⚪ loose — was `void`
  range: range,
  matches: array<string>,
}
type iWordAtPosition = {
  word: string,
  startColumn: float,
  endColumn: float,
}
type iModelDeltaDecoration = {
  range: iRange,
  options: string,  // ⚪ loose — was `IModelDecorationOptions`
}
type iModelDecorationOverviewRulerOptions = {
  position: string,  // ⚪ loose — was `OverviewRulerLane`
  color?: string,  // ⚪ loose — was `string | ThemeColor`
  darkColor?: string,  // ⚪ loose — was `string | ThemeColor`
}
type iModelDecorationMinimapOptions = {
  position: string,  // ⚪ loose — was `MinimapPosition`
  sectionHeaderStyle?: string,  // ⚪ loose — was `MinimapSectionHeaderStyle`
  sectionHeaderText?: Nullable.t<string>,
  color?: string,  // ⚪ loose — was `string | ThemeColor`
  darkColor?: string,  // ⚪ loose — was `string | ThemeColor`
}
type iModelDecorationGlyphMarginOptions = {
  position: string,  // ⚪ loose — was `GlyphMarginLane`
  persistLane?: bool,
}
type injectedTextOptions = {
  content: string,
  inlineClassName?: Nullable.t<string>,
  inlineClassNameAffectsLetterSpacing?: bool,
  attachedData?: JSON.t,
  cursorStops?: string,  // ⚪ loose — was `InjectedTextCursorStops`
}
type iModelDecorationOptions = {
  stickiness?: trackedRangeStickiness,
  className?: Nullable.t<string>,
  shouldFillLineOnLineBreak?: Nullable.t<bool>,
  blockClassName?: Nullable.t<string>,
  blockIsAfterEnd?: Nullable.t<bool>,
  blockDoesNotCollapse?: Nullable.t<bool>,
  blockPadding?: Nullable.t<(float, float, float, float)>,
  glyphMarginHoverMessage?: string,  // ⚠️ REVIEW — was `IMarkdownString | IMarkdownString[]` — match the real type by hand
  hoverMessage?: string,  // ⚠️ REVIEW — was `IMarkdownString | IMarkdownString[]` — match the real type by hand
  lineNumberHoverMessage?: string,  // ⚠️ REVIEW — was `IMarkdownString | IMarkdownString[]` — match the real type by hand
  isWholeLine?: bool,
  showIfCollapsed?: bool,
  zIndex?: int,
  overviewRuler?: Nullable.t<iModelDecorationOverviewRulerOptions>,
  minimap?: Nullable.t<iModelDecorationMinimapOptions>,
  glyphMarginClassName?: Nullable.t<string>,
  glyphMargin?: Nullable.t<iModelDecorationGlyphMarginOptions>,
  lineHeight?: Nullable.t<float>,
  fontFamily?: Nullable.t<string>,
  fontSize?: Nullable.t<string>,
  fontWeight?: Nullable.t<string>,
  fontStyle?: Nullable.t<string>,
  linesDecorationsClassName?: Nullable.t<string>,
  linesDecorationsTooltip?: Nullable.t<string>,
  lineNumberClassName?: Nullable.t<string>,
  firstLineDecorationClassName?: Nullable.t<string>,
  marginClassName?: Nullable.t<string>,
  inlineClassName?: Nullable.t<string>,
  inlineClassNameAffectsLetterSpacing?: bool,
  beforeContentClassName?: Nullable.t<string>,
  afterContentClassName?: Nullable.t<string>,
  after?: Nullable.t<injectedTextOptions>,
  before?: Nullable.t<injectedTextOptions>,
  textDirection?: Nullable.t<textDirection>,
}
type iModelDecoration = {
  id: string,
  ownerId: float,
  range: range,
  options: iModelDecorationOptions,
}
type iTextModelUpdateOptions = {
  tabSize?: float,
  indentSize?: CommonTypes.tabSizeOrNumber,
  insertSpaces?: bool,
  trimAutoWhitespace?: bool,
  bracketColorizationOptions?: bracketPairColorizationOptions,
}
type iIdentifiedSingleEditOperation = {
  range: iRange,
  text: Nullable.t<string>,
  forceMoveMarkers?: bool,
}
type iTextModel<'a> = {
  uri: uri,
  id: string,
  getOptions: unit => textModelResolvedOptions,
  getVersionId: unit => float,
  getAlternativeVersionId: unit => float,
  setValue: string => unit,  // ⚠️ REVIEW — was `string | ITextSnapshot` — match the real type by hand
  getValue: (option<endOfLinePreference>, option<bool>) => string,
  createSnapshot: option<bool> => iTextSnapshot,
  getValueLength: (option<endOfLinePreference>, option<bool>) => float,
  getValueInRange: (iRange, option<endOfLinePreference>) => string,
  getValueLengthInRange: (iRange, option<endOfLinePreference>) => float,
  getCharacterCountInRange: (iRange, option<endOfLinePreference>) => float,
  getLineCount: unit => float,
  getLineContent: float => string,
  getLineLength: float => float,
  getLinesContent: unit => array<string>,
  getEOL: unit => string,
  getEndOfLineSequence: unit => endOfLineSequence,
  getLineMinColumn: float => float,
  getLineMaxColumn: float => float,
  getLineFirstNonWhitespaceColumn: float => float,
  getLineLastNonWhitespaceColumn: float => float,
  validatePosition: iPosition => position,
  modifyPosition: (iPosition, float) => position,
  validateRange: iRange => range,
  isValidRange: iRange => bool,
  getOffsetAt: iPosition => float,
  getPositionAt: float => position,
  getFullModelRange: unit => range,
  isDisposed: unit => bool,
  findMatches: string,  // ⚠️ REVIEW — match the real type by hand
  findNextMatch: (string, iPosition, bool, bool, Nullable.t<string>, bool) => Nullable.t<findMatch>,
  findPreviousMatch: (string, iPosition, bool, bool, Nullable.t<string>, bool) => Nullable.t<findMatch>,
  getLanguageId: unit => string,
  getWordAtPosition: iPosition => Nullable.t<iWordAtPosition>,
  getWordUntilPosition: iPosition => iWordAtPosition,
  deltaDecorations: (array<string>, array<iModelDeltaDecoration>, option<float>) => array<string>,
  getDecorationOptions: string => Nullable.t<iModelDecorationOptions>,
  getDecorationRange: string => Nullable.t<range>,
  getLineDecorations: (float, option<float>, option<bool>, option<bool>) => array<iModelDecoration>,
  getLinesDecorations: (float, float, option<float>, option<bool>, option<bool>) => array<iModelDecoration>,
  getDecorationsInRange: (iRange, option<float>, option<bool>, option<bool>, option<bool>, option<bool>) => array<iModelDecoration>,
  getAllDecorations: (option<float>, option<bool>, option<bool>) => array<iModelDecoration>,
  getAllMarginDecorations: option<float> => array<iModelDecoration>,
  getOverviewRulerDecorations: (option<float>, option<bool>, option<bool>) => array<iModelDecoration>,
  getInjectedTextDecorations: option<float> => array<iModelDecoration>,
  getCustomLineHeightsDecorations: option<float> => array<iModelDecoration>,
  normalizeIndentation: string => string,
  updateOptions: iTextModelUpdateOptions => unit,
  detectIndentation: (bool, float) => unit,
  pushStackElement: unit => unit,
  popStackElement: unit => unit,
  pushEditOperations: (Nullable.t<array<selection>>, array<iIdentifiedSingleEditOperation>, array<string> => Nullable.t<array<selection>>) => Nullable.t<array<selection>>,  // ⚪ loose — was `IValidEditOperation`
  pushEOL: endOfLineSequence => unit,
  applyEdits: string,  // ⚠️ REVIEW — match the real type by hand
  setEOL: endOfLineSequence => unit,
  undo: unit => 'a,
  canUndo: unit => bool,
  redo: unit => 'a,
  canRedo: unit => bool,
  onDidChangeContent: iModelContentChangedEvent => unit => iDisposable,
  onDidChangeDecorations: (iModelDecorationsChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeOptions: (iModelOptionsChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeLanguage: (iModelLanguageChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeLanguageConfiguration: (JSON.t => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeAttached: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  onWillDispose: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  dispose: unit => unit,
  isAttachedToEditor: unit => bool,
}
type iComputedEditorOptions = {
  get: string => JSON.t,  // 🛑 BROKEN — contains `unknown`
}
type iRulerOption = {
  column: float,
  color: Nullable.t<string>,
}
module RulersTarget = {
  type t
  external fromNumber: float => t = "%identity"
  external fromIRulerOption: iRulerOption => t = "%identity"
}
type markdownStringTrustedOptions = {
  enabledCommands: array<string>,
}
module IsTrustedTarget = {
  type t
  external fromBool: bool => t = "%identity"
  external fromMarkdownStringTrustedOptions: markdownStringTrustedOptions => t = "%identity"
}
type uriComponents = {
  scheme: string,
  authority?: string,
  path?: string,
  query?: string,
  fragment?: string,
}
type iMarkdownString = {
  value: string,
  isTrusted?: IsTrustedTarget.t,
  supportThemeIcons?: bool,
  supportHtml?: bool,
  baseUri?: uriComponents,
  uris?: Dict.t<uriComponents>,
}
type iEditorScrollbarOptions = {
  arrowSize?: float,
  vertical?: codeEditorV2IEditorScrollbarOptionsVertical,
  horizontal?: codeEditorV2IEditorScrollbarOptionsVertical,
  useShadows?: bool,
  verticalHasArrows?: bool,
  horizontalHasArrows?: bool,
  handleMouseWheel?: bool,
  alwaysConsumeMouseWheel?: bool,
  horizontalScrollbarSize?: float,
  verticalScrollbarSize?: float,
  verticalSliderSize?: float,
  horizontalSliderSize?: float,
  scrollByPage?: bool,
  ignoreHorizontalScrollbarInContentHeight?: bool,
}
type iEditorStickyScrollOptions = {
  enabled?: bool,
  maxLineCount?: float,
  defaultModel?: codeEditorV2IEditorStickyScrollOptionsDefaultModel,
  scrollWithEditor?: bool,
}
type iEditorMinimapOptions = {
  enabled?: bool,
  autohide?: codeEditorV2IEditorMinimapOptionsAutohide,
  side?: ChartsTypes.chartsPlotOrganizationOptionsHangingSide,
  size?: codeEditorV2IEditorMinimapOptionsSize,
  showSlider?: codeEditorV2IEditorMinimapOptionsShowSlider,
  renderCharacters?: bool,
  maxColumn?: float,
  scale?: float,
  showRegionSectionHeaders?: bool,
  showMarkSectionHeaders?: bool,
  markSectionHeaderRegex?: string,
  sectionHeaderFontSize?: float,
  sectionHeaderLetterSpacing?: float,
}
type iEditorFindOptions = {
  cursorMoveOnType?: bool,
  findOnType?: bool,
  seedSearchStringFromSelection?: codeEditorV2IEditorFindOptionsSeedSearchStringFromSelection,
  autoFindInSelection?: codeEditorV2IEditorFindOptionsAutoFindInSelection,
  addExtraSpaceOnTop?: bool,
  loop?: bool,
}
type iEditorHoverOptions = {
  enabled?: bool,
  delay?: float,
  sticky?: bool,
  hidingDelay?: float,
  above?: bool,
}
type iEditorCommentsOptions = {
  insertSpace?: bool,
  ignoreEmptyLines?: bool,
}
type iSuggestOptions = {
  insertMode?: codeEditorV2ISuggestOptionsInsertMode,
  filterGraceful?: bool,
  snippetsPreventQuickSuggestions?: bool,
  localityBonus?: bool,
  shareSuggestSelections?: bool,
  selectionMode?: codeEditorV2ISuggestOptionsSelectionMode,
  showIcons?: bool,
  showStatusBar?: bool,
  preview?: bool,
  previewMode?: codeEditorV2ISuggestOptionsPreviewMode,
  showInlineDetails?: bool,
  showMethods?: bool,
  showFunctions?: bool,
  showConstructors?: bool,
  showDeprecated?: bool,
  matchOnWordStartOnly?: bool,
  showFields?: bool,
  showVariables?: bool,
  showClasses?: bool,
  showStructs?: bool,
  showInterfaces?: bool,
  showModules?: bool,
  showProperties?: bool,
  showEvents?: bool,
  showOperators?: bool,
  showUnits?: bool,
  showValues?: bool,
  showConstants?: bool,
  showEnums?: bool,
  showEnumMembers?: bool,
  showKeywords?: bool,
  showWords?: bool,
  showColors?: bool,
  showFiles?: bool,
  showReferences?: bool,
  showFolders?: bool,
  showTypeParameters?: bool,
  showIssues?: bool,
  showUsers?: bool,
  showSnippets?: bool,
}
type iInlineSuggestOptions = {
  enabled?: bool,
  mode?: codeEditorV2ISuggestOptionsPreviewMode,
  showToolbar?: codeEditorV2IInlineSuggestOptionsShowToolbar,
  syntaxHighlightingEnabled?: bool,
  suppressSuggestions?: bool,
  minShowDelay?: float,
  suppressInSnippetMode?: bool,
  keepOnBlur?: bool,
  fontFamily?: string,
}
type iSmartSelectOptions = {
  selectLeadingAndTrailingWhitespace?: bool,
  selectSubwords?: bool,
}
type iGotoLocationOptions = {
  multiple?: goToLocationValues,
  multipleDefinitions?: goToLocationValues,
  multipleTypeDefinitions?: goToLocationValues,
  multipleDeclarations?: goToLocationValues,
  multipleImplementations?: goToLocationValues,
  multipleReferences?: goToLocationValues,
  multipleTests?: goToLocationValues,
  alternativeDefinitionCommand?: string,
  alternativeTypeDefinitionCommand?: string,
  alternativeDeclarationCommand?: string,
  alternativeImplementationCommand?: string,
  alternativeReferenceCommand?: string,
  alternativeTestsCommand?: string,
}
type iQuickSuggestionsOptions = {
  other?: CommonTypes.boolOrInlineOrOffOrOn,
  comments?: CommonTypes.boolOrInlineOrOffOrOn,
  strings?: CommonTypes.boolOrInlineOrOffOrOn,
}
module QuickSuggestionsTarget = {
  type t
  external fromBool: bool => t = "%identity"
  external fromIQuickSuggestionsOptions: iQuickSuggestionsOptions => t = "%identity"
}
type iEditorPaddingOptions = {
  top?: float,
  bottom?: float,
}
type iEditorParameterHintOptions = {
  enabled?: bool,
  cycle?: bool,
}
type iEditorLightbulbOptions = {
  enabled?: showLightbulbIconMode,
}
type iEditorInlayHintsOptions = {
  enabled?: codeEditorV2IEditorInlayHintsOptionsEnabled,
  fontSize?: float,
  fontFamily?: string,
  padding?: bool,
  maximumLength?: float,
}
type iGuidesOptions = {
  bracketPairs?: CommonTypes.boolOrActive,
  bracketPairsHorizontal?: CommonTypes.boolOrActive,
  highlightActiveBracketPair?: bool,
  indentation?: bool,
  highlightActiveIndentation?: CommonTypes.boolOrAlways,
}
type iUnicodeHighlightOptions = {
  nonBasicASCII?: CommonTypes.boolOrInUntrustedWorkspace,
  invisibleCharacters?: bool,
  ambiguousCharacters?: bool,
  includeComments?: CommonTypes.boolOrInUntrustedWorkspace,
  includeStrings?: CommonTypes.boolOrInUntrustedWorkspace,
  allowedCharacters?: Dict.t<bool>,
  allowedLocales?: Dict.t<bool>,
}
type iBracketPairColorizationOptions = {
  enabled?: bool,
  independentColorPoolPerBracketType?: bool,
}
type iDropIntoEditorOptions = {
  enabled?: bool,
  showDropSelector?: codeEditorV2IDropIntoEditorOptionsShowDropSelector,
}
type iPasteAsOptions = {
  enabled?: bool,
  showPasteSelector?: codeEditorV2IPasteAsOptionsShowPasteSelector,
}
type iEditorOptions = {
  inDiffEditor?: bool,
  allowVariableLineHeights?: bool,
  allowVariableFonts?: bool,
  allowVariableFontsInAccessibilityMode?: bool,
  ariaLabel?: string,
  ariaRequired?: bool,
  screenReaderAnnounceInlineSuggestion?: bool,
  tabIndex?: int,
  rulers?: array<RulersTarget.t>,
  wordSegmenterLocales?: CommonTypes.stringOrStringArray,
  wordSeparators?: string,
  selectionClipboard?: bool,
  lineNumbers?: CommonTypes.editorIEditorOptionsLineNumbers,
  cursorSurroundingLines?: float,
  cursorSurroundingLinesStyle?: codeEditorV2IEditorOptionsCursorSurroundingLinesStyle,
  renderFinalNewline?: codeEditorV2IEditorOptionsRenderFinalNewline,
  unusualLineTerminators?: codeEditorV2IEditorOptionsUnusualLineTerminators,
  selectOnLineNumbers?: bool,
  lineNumbersMinChars?: float,
  glyphMargin?: bool,
  lineDecorationsWidth?: CommonTypes.stringOrNumber,
  revealHorizontalRightPadding?: float,
  roundedSelection?: bool,
  extraEditorClassName?: string,
  readOnly?: bool,
  readOnlyMessage?: iMarkdownString,
  domReadOnly?: bool,
  linkedEditing?: bool,
  renameOnType?: bool,
  renderValidationDecorations?: codeEditorV2IEditorOptionsRenderValidationDecorations,
  scrollbar?: iEditorScrollbarOptions,
  stickyScroll?: iEditorStickyScrollOptions,
  minimap?: iEditorMinimapOptions,
  find?: iEditorFindOptions,
  fixedOverflowWidgets?: bool,
  allowOverflow?: bool,
  overviewRulerLanes?: float,
  overviewRulerBorder?: bool,
  cursorBlinking?: codeEditorV2IEditorOptionsCursorBlinking,
  mouseWheelZoom?: bool,
  mouseStyle?: codeEditorV2IEditorOptionsMouseStyle,
  cursorSmoothCaretAnimation?: codeEditorV2IEditorOptionsCursorSmoothCaretAnimation,
  cursorStyle?: codeEditorV2IEditorOptionsCursorStyle,
  overtypeCursorStyle?: codeEditorV2IEditorOptionsCursorStyle,
  overtypeOnPaste?: bool,
  cursorWidth?: float,
  cursorHeight?: float,
  fontLigatures?: CommonTypes.boolOrString,
  fontVariations?: CommonTypes.boolOrString,
  defaultColorDecorators?: codeEditorV2IEditorOptionsDefaultColorDecorators,
  disableLayerHinting?: bool,
  disableMonospaceOptimizations?: bool,
  hideCursorInOverviewRuler?: bool,
  scrollBeyondLastLine?: bool,
  scrollOnMiddleClick?: bool,
  scrollBeyondLastColumn?: float,
  smoothScrolling?: bool,
  automaticLayout?: bool,
  wordWrap?: codeEditorV2IEditorOptionsWordWrap,
  wordWrapOverride1?: codeEditorV2IEditorOptionsWordWrapOverride1,
  wordWrapOverride2?: codeEditorV2IEditorOptionsWordWrapOverride1,
  wordWrapColumn?: float,
  wrappingIndent?: codeEditorV2IEditorOptionsWrappingIndent,
  wrappingStrategy?: codeEditorV2IEditorOptionsWrappingStrategy,
  wrapOnEscapedLineFeeds?: bool,
  wordWrapBreakBeforeCharacters?: string,
  wordWrapBreakAfterCharacters?: string,
  wordBreak?: codeEditorV2IEditorOptionsWordBreak,
  stopRenderingLineAfter?: float,
  hover?: iEditorHoverOptions,
  links?: bool,
  colorDecorators?: bool,
  colorDecoratorsActivatedOn?: codeEditorV2IEditorOptionsColorDecoratorsActivatedOn,
  colorDecoratorsLimit?: float,
  comments?: iEditorCommentsOptions,
  contextmenu?: bool,
  mouseWheelScrollSensitivity?: float,
  fastScrollSensitivity?: float,
  scrollPredominantAxis?: bool,
  inertialScroll?: bool,
  columnSelection?: bool,
  multiCursorModifier?: codeEditorV2IEditorOptionsMultiCursorModifier,
  multiCursorMergeOverlapping?: bool,
  multiCursorPaste?: codeEditorV2IEditorOptionsMultiCursorPaste,
  multiCursorLimit?: float,
  mouseMiddleClickAction?: mouseMiddleClickAction,
  accessibilitySupport?: codeEditorV2IEditorOptionsAccessibilitySupport,
  accessibilityPageSize?: float,
  suggest?: iSuggestOptions,
  inlineSuggest?: iInlineSuggestOptions,
  smartSelect?: iSmartSelectOptions,
  gotoLocation?: iGotoLocationOptions,
  quickSuggestions?: QuickSuggestionsTarget.t,
  quickSuggestionsDelay?: float,
  padding?: iEditorPaddingOptions,
  parameterHints?: iEditorParameterHintOptions,
  autoClosingBrackets?: editorAutoClosingStrategy,
  autoClosingComments?: editorAutoClosingStrategy,
  autoClosingQuotes?: editorAutoClosingStrategy,
  autoClosingDelete?: editorAutoClosingEditStrategy,
  autoClosingOvertype?: editorAutoClosingEditStrategy,
  autoSurround?: editorAutoSurroundStrategy,
  autoIndent?: codeEditorV2IEditorOptionsAutoIndent,
  autoIndentOnPaste?: bool,
  autoIndentOnPasteWithinString?: bool,
  stickyTabStops?: bool,
  formatOnType?: bool,
  formatOnPaste?: bool,
  dragAndDrop?: bool,
  suggestOnTriggerCharacters?: bool,
  acceptSuggestionOnEnter?: codeEditorV2IEditorOptionsAcceptSuggestionOnEnter,
  acceptSuggestionOnCommitCharacter?: bool,
  snippetSuggestions?: codeEditorV2IEditorOptionsSnippetSuggestions,
  emptySelectionClipboard?: bool,
  copyWithSyntaxHighlighting?: bool,
  suggestSelection?: codeEditorV2IEditorOptionsSuggestSelection,
  suggestFontSize?: float,
  suggestLineHeight?: float,
  tabCompletion?: codeEditorV2IEditorOptionsTabCompletion,
  selectionHighlight?: bool,
  selectionHighlightMultiline?: bool,
  selectionHighlightMaxLength?: float,
  occurrencesHighlight?: codeEditorV2IEditorOptionsOccurrencesHighlight,
  occurrencesHighlightDelay?: float,
  codeLens?: bool,
  codeLensFontFamily?: string,
  codeLensFontSize?: float,
  lightbulb?: iEditorLightbulbOptions,
  codeActionsOnSaveTimeout?: float,
  folding?: bool,
  foldingStrategy?: codeEditorV2IEditorOptionsFoldingStrategy,
  foldingHighlight?: bool,
  foldingImportsByDefault?: bool,
  foldingMaximumRegions?: float,
  showFoldingControls?: codeEditorV2IEditorOptionsShowFoldingControls,
  unfoldOnClickAfterEndOfLine?: bool,
  matchBrackets?: codeEditorV2IEditorOptionsMatchBrackets,
  experimentalGpuAcceleration?: codeEditorV2IEditorOptionsExperimentalGpuAcceleration,
  experimentalWhitespaceRendering?: codeEditorV2IEditorOptionsExperimentalWhitespaceRendering,
  renderWhitespace?: codeEditorV2IEditorOptionsRenderWhitespace,
  renderControlCharacters?: bool,
  renderLineHighlight?: codeEditorV2IEditorOptionsRenderLineHighlight,
  renderLineHighlightOnlyWhenFocus?: bool,
  useTabStops?: bool,
  trimWhitespaceOnDelete?: bool,
  fontFamily?: string,
  fontWeight?: string,
  fontSize?: float,
  lineHeight?: float,
  letterSpacing?: float,
  showUnused?: bool,
  peekWidgetDefaultFocus?: codeEditorV2IEditorOptionsPeekWidgetDefaultFocus,
  placeholder?: string,
  definitionLinkOpensInPeek?: bool,
  showDeprecated?: bool,
  matchOnWordStartOnly?: bool,
  inlayHints?: iEditorInlayHintsOptions,
  useShadowDOM?: bool,
  guides?: iGuidesOptions,
  unicodeHighlight?: iUnicodeHighlightOptions,
  bracketPairColorization?: iBracketPairColorizationOptions,
  dropIntoEditor?: iDropIntoEditorOptions,
  editContext?: bool,
  renderRichScreenReaderContent?: bool,
  pasteAs?: iPasteAsOptions,
  tabFocusMode?: bool,
  inlineCompletionsAccessibilityVerbose?: bool,
}
type editorICodeEditorGetValueConfig = {
  preserveBOM: bool,
  lineEnding: string,
}
type iNewScrollPosition = {
  scrollLeft?: float,
  scrollTop?: float,
}
type iLocalizedString = {
  original: string,
  value: string,
}
module DescriptionTarget = {
  type t
  external fromString: string => t = "%identity"
  external fromILocalizedString: iLocalizedString => t = "%identity"
  external fromUnit: unit => t = "%identity"
  let none: t = fromUnit()
}
type iCommandMetadata = {
  description: DescriptionTarget.t,
}
type iEditorAction = {
  id: string,
  label: string,
  alias: string,
  metadata?: iCommandMetadata,
  isSupported: unit => bool,
  run: option<JSON.t> => promise<unit>,
}
type iEditOperationBuilder = {
  addEditOperation: (iRange, Nullable.t<string>, option<bool>) => unit,
  addTrackedEditOperation: (iRange, Nullable.t<string>, option<bool>) => unit,
  trackSelection: (selection, option<bool>) => string,
}
type iCursorStateComputerData = {
  getInverseEditOperations: unit => array<JSON.t>,
  getTrackedSelection: string => selection,
}
type iCommand<'a> = {
  getEditOperations: (iTextModel<'a>, iEditOperationBuilder) => unit,
  computeCursorState: (iTextModel<'a>, iCursorStateComputerData) => selection,
}
type iValidEditOperation = {
  range: range,
  text: string,
}
@unboxed type codeEditorV2ICodeEditorExecuteEdits = Arr(array<selection>) | Fn(array<iValidEditOperation> => Nullable.t<array<selection>>)
type iContentWidgetPosition = {
  position: Nullable.t<iPosition>,
  secondaryPosition?: Nullable.t<iPosition>,
  preference: array<string>,  // ⚪ loose — was `ContentWidgetPositionPreference`
  positionAffinity?: positionAffinity,
}
type iDimension = {
  width: float,
  height: float,
}
type iContentWidgetRenderedCoordinate = {
  top: float,
  left: float,
}
type iContentWidget = {
  allowEditorOverflow?: bool,
  suppressMouseDown?: bool,
  getId: unit => string,
  getDomNode: unit => Dom.element,
  getPosition: unit => Nullable.t<iContentWidgetPosition>,
  beforeRender?: unit => Nullable.t<iDimension>,
  afterRender?: (Nullable.t<contentWidgetPositionPreference>, Nullable.t<iContentWidgetRenderedCoordinate>) => unit,
}
type iOverlayWidgetPosition = {
  preference: string,  // ⚠️ REVIEW — was `OverlayWidgetPositionPreference | IOverlayWidgetPositionCoordinates` — match the real type by hand
  stackOridinal?: float,
}
type iOverlayWidget = {
  onDidLayout?: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  allowEditorOverflow?: bool,
  getId: unit => string,
  getDomNode: unit => Dom.element,
  getPosition: unit => Nullable.t<iOverlayWidgetPosition>,
  getMinContentWidthInPx?: unit => float,
}
type iGlyphMarginWidgetPosition = {
  lane: glyphMarginLane,
  zIndex: int,
  range: iRange,
}
type iGlyphMarginWidget = {
  getId: unit => string,
  getDomNode: unit => Dom.element,
  getPosition: unit => iGlyphMarginWidgetPosition,
}
type iViewZone = {
  afterLineNumber: float,
  afterColumn?: float,
  afterColumnAffinity?: string,  // ⚪ loose — was `PositionAffinity`
  showInHiddenAreas?: bool,
  ordinal?: float,
  suppressMouseDown?: bool,
  heightInLines?: float,
  heightInPx?: float,
  minWidthInPx?: float,
  domNode: string,  // ⚪ loose — was `HTMLElement`
  marginDomNode?: string,  // ⚪ loose — was `HTMLElement`
  onDomNodeTop?: float => unit,
  onComputedHeight?: float => unit,
}
type iViewZoneChangeAccessor = {
  addZone: iViewZone => string,
  removeZone: string => unit,
  layoutZone: string => unit,
}
type editorICodeEditorGetScrolledVisiblePositionConfig = {
  top: float,
  left: float,
  height: float,
}
type iSelection = {
  selectionStartLineNumber: float,
  selectionStartColumn: float,
  positionLineNumber: float,
  positionColumn: float,
}
module SetSelection = {
  type t
  external asSelection: t => ((iRange, option<string>) => unit) = "%identity"
  external asSelection2: t => ((range, option<string>) => unit) = "%identity"
  external asSelection3: t => ((iSelection, option<string>) => unit) = "%identity"
  external asSelection4: t => ((selection, option<string>) => unit) = "%identity"
}
type iEditorDecorationsCollection = {
  onDidChange: (iModelDecorationsChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  length: float,
  getRange: float => Nullable.t<range>,
  getRanges: unit => array<range>,
  has: iModelDecoration => bool,
  set: array<iModelDeltaDecoration> => array<string>,
  append: array<iModelDeltaDecoration> => array<string>,
  clear: unit => unit,
}
type iCodeEditor<'a> = {
  onDidChangeModelContent: (iModelContentChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeModelLanguage: (iModelLanguageChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeModelLanguageConfiguration: (JSON.t => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeModelOptions: (iModelOptionsChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeConfiguration: (configurationChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeCursorPosition: (iCursorPositionChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeCursorSelection: (iCursorSelectionChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onWillChangeModel: (iModelChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeModel: (iModelChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeModelDecorations: (iModelDecorationsChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidFocusEditorText: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  onDidBlurEditorText: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  onDidFocusEditorWidget: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  onDidBlurEditorWidget: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  inComposition: bool,
  onDidCompositionStart: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  onDidCompositionEnd: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  onDidAttemptReadOnlyEdit: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  onDidPaste: (iPasteEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onMouseUp: (iEditorMouseEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onMouseDown: (iEditorMouseEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onContextMenu: (iEditorMouseEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onMouseMove: (iEditorMouseEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onMouseLeave: (iEditorMouseEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onKeyUp: (iKeyboardEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onKeyDown: (iKeyboardEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidLayoutChange: (editorLayoutInfo => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidContentSizeChange: (iContentSizeChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidScrollChange: (iScrollEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeHiddenAreas: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  onBeginUpdate: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  onEndUpdate: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  saveViewState: unit => Nullable.t<iCodeEditorViewState>,
  restoreViewState: Nullable.t<iCodeEditorViewState> => unit,
  hasWidgetFocus: unit => bool,
  getContribution: string => string,  // 🛑 BROKEN — contains `unknown`
  getModel: unit => Nullable.t<iTextModel<'a>>,
  setModel: Nullable.t<iTextModel<'a>> => unit,
  getOptions: unit => iComputedEditorOptions,
  getOption: string => JSON.t,  // 🛑 BROKEN — contains `unknown`
  getRawOptions: unit => iEditorOptions,
  getValue: option<editorICodeEditorGetValueConfig> => string,
  setValue: string => unit,
  getContentWidth: unit => float,
  getScrollWidth: unit => float,
  getScrollLeft: unit => float,
  getContentHeight: unit => float,
  getScrollHeight: unit => float,
  getScrollTop: unit => float,
  setScrollLeft: (float, option<scrollType>) => unit,
  setScrollTop: (float, option<scrollType>) => unit,
  setScrollPosition: (iNewScrollPosition, option<scrollType>) => unit,
  hasPendingScrollAnimation: unit => bool,
  getAction: string => Nullable.t<iEditorAction>,
  executeCommand: (Nullable.t<string>, iCommand<'a>) => unit,
  pushUndoStop: unit => bool,
  popUndoStop: unit => bool,
  executeEdits: (Nullable.t<string>, array<iIdentifiedSingleEditOperation>, option<codeEditorV2ICodeEditorExecuteEdits>) => bool,
  executeCommands: (Nullable.t<string>, array<iCommand<'a>>) => unit,
  getLineDecorations: float => Nullable.t<array<iModelDecoration>>,
  getDecorationsInRange: range => Nullable.t<array<iModelDecoration>>,
  getFontSizeAtPosition: iPosition => Nullable.t<string>,
  deltaDecorations: (array<string>, array<iModelDeltaDecoration>) => array<string>,
  removeDecorations: array<string> => unit,
  getLayoutInfo: unit => editorLayoutInfo,
  getVisibleRanges: unit => array<range>,
  getTopForLineNumber: (float, option<bool>) => float,
  getBottomForLineNumber: float => float,
  getTopForPosition: (float, float) => float,
  getLineHeightForPosition: iPosition => float,
  writeScreenReaderContent: string => unit,
  getContainerDomNode: unit => Dom.element,
  getDomNode: unit => Nullable.t<Dom.element>,
  addContentWidget: iContentWidget => unit,
  layoutContentWidget: iContentWidget => unit,
  removeContentWidget: iContentWidget => unit,
  addOverlayWidget: iOverlayWidget => unit,
  layoutOverlayWidget: iOverlayWidget => unit,
  removeOverlayWidget: iOverlayWidget => unit,
  addGlyphMarginWidget: iGlyphMarginWidget => unit,
  layoutGlyphMarginWidget: iGlyphMarginWidget => unit,
  removeGlyphMarginWidget: iGlyphMarginWidget => unit,
  changeViewZones: iViewZoneChangeAccessor => unit => unit,
  getOffsetForColumn: (float, float) => float,
  render: option<bool> => unit,
  getTargetAtClientPoint: (float, float) => IMouseTarget.t,
  getScrolledVisiblePosition: iPosition => Nullable.t<editorICodeEditorGetScrolledVisiblePositionConfig>,
  applyFontInfo: Dom.element => unit,
  setBanner: (Nullable.t<Dom.element>, float) => unit,
  handleInitialized?: unit => unit,
  onDidDispose: unit => unit => iDisposable,
  dispose: unit => unit,
  getId: unit => string,
  getEditorType: unit => string,
  updateOptions: iEditorOptions => unit,
  layout: (option<iDimension>, option<bool>) => unit,
  focus: unit => unit,
  hasTextFocus: unit => bool,
  getSupportedActions: unit => array<iEditorAction>,
  getVisibleColumnFromPosition: iPosition => float,
  getPosition: unit => Nullable.t<position>,
  setPosition: (iPosition, option<string>) => unit,
  revealLine: (float, option<scrollType>) => unit,
  revealLineInCenter: (float, option<scrollType>) => unit,
  revealLineInCenterIfOutsideViewport: (float, option<scrollType>) => unit,
  revealLineNearTop: (float, option<scrollType>) => unit,
  revealPosition: (iPosition, option<scrollType>) => unit,
  revealPositionInCenter: (iPosition, option<scrollType>) => unit,
  revealPositionInCenterIfOutsideViewport: (iPosition, option<scrollType>) => unit,
  revealPositionNearTop: (iPosition, option<scrollType>) => unit,
  getSelection: unit => Nullable.t<selection>,
  getSelections: unit => Nullable.t<array<selection>>,
  setSelection: SetSelection.t,
  setSelections: (array<iSelection>, option<string>) => unit,
  revealLines: (float, float, option<scrollType>) => unit,
  revealLinesInCenter: (float, float, option<scrollType>) => unit,
  revealLinesInCenterIfOutsideViewport: (float, float, option<scrollType>) => unit,
  revealLinesNearTop: (float, float, option<scrollType>) => unit,
  revealRange: (iRange, option<scrollType>) => unit,
  revealRangeInCenter: (iRange, option<scrollType>) => unit,
  revealRangeAtTop: (iRange, option<scrollType>) => unit,
  revealRangeInCenterIfOutsideViewport: (iRange, option<scrollType>) => unit,
  revealRangeNearTop: (iRange, option<scrollType>) => unit,
  revealRangeNearTopIfOutsideViewport: (iRange, option<scrollType>) => unit,
  trigger: (Nullable.t<string>, string, string) => unit,  // 🛑 BROKEN — contains `any`
  createDecorationsCollection: option<array<iModelDeltaDecoration>> => iEditorDecorationsCollection,
}
type editorGetMonacoViewModeOptionsConfig = {
  inDiffEditor?: bool,
  allowVariableLineHeights?: bool,
  allowVariableFonts?: bool,
  allowVariableFontsInAccessibilityMode?: bool,
  ariaLabel?: string,
  ariaRequired?: bool,
  screenReaderAnnounceInlineSuggestion?: bool,
  tabIndex?: int,
  rulers?: array<string>,  // ⚠️ REVIEW — was `number | IRulerOption` — match the real type by hand
  wordSegmenterLocales?: CommonTypes.stringOrStringArray,
  wordSeparators?: string,
  selectionClipboard?: bool,
  lineNumbers?: CommonTypes.editorGetMonacoViewModeOptionsLineNumbers,
  cursorSurroundingLines?: float,
  cursorSurroundingLinesStyle?: codeEditorV2IEditorOptionsCursorSurroundingLinesStyle,
  renderFinalNewline?: codeEditorV2IEditorOptionsRenderFinalNewline,
  unusualLineTerminators?: codeEditorV2IEditorOptionsUnusualLineTerminators,
  selectOnLineNumbers?: bool,
  lineNumbersMinChars?: float,
  glyphMargin?: bool,
  lineDecorationsWidth?: CommonTypes.stringOrNumber,
  revealHorizontalRightPadding?: float,
  roundedSelection?: bool,
  extraEditorClassName?: string,
  readOnly?: bool,
  readOnlyMessage?: iMarkdownString,
  domReadOnly?: bool,
  linkedEditing?: bool,
  renameOnType?: bool,
  renderValidationDecorations?: codeEditorV2IEditorOptionsRenderValidationDecorations,
  scrollbar?: iEditorScrollbarOptions,
  stickyScroll?: iEditorStickyScrollOptions,
  minimap?: iEditorMinimapOptions,
  find?: iEditorFindOptions,
  fixedOverflowWidgets?: bool,
  allowOverflow?: bool,
  overviewRulerLanes?: float,
  overviewRulerBorder?: bool,
  cursorBlinking?: codeEditorV2IEditorOptionsCursorBlinking,
  mouseWheelZoom?: bool,
  mouseStyle?: codeEditorV2IEditorOptionsMouseStyle,
  cursorSmoothCaretAnimation?: codeEditorV2IEditorOptionsCursorSmoothCaretAnimation,
  cursorStyle?: codeEditorV2IEditorOptionsCursorStyle,
  overtypeCursorStyle?: codeEditorV2IEditorOptionsCursorStyle,
  overtypeOnPaste?: bool,
  cursorWidth?: float,
  cursorHeight?: float,
  fontLigatures?: CommonTypes.boolOrString,
  fontVariations?: CommonTypes.boolOrString,
  defaultColorDecorators?: codeEditorV2IEditorOptionsDefaultColorDecorators,
  disableLayerHinting?: bool,
  disableMonospaceOptimizations?: bool,
  hideCursorInOverviewRuler?: bool,
  scrollBeyondLastLine?: bool,
  scrollOnMiddleClick?: bool,
  scrollBeyondLastColumn?: float,
  smoothScrolling?: bool,
  automaticLayout?: bool,
  wordWrap?: codeEditorV2IEditorOptionsWordWrap,
  wordWrapOverride1?: codeEditorV2IEditorOptionsWordWrapOverride1,
  wordWrapOverride2?: codeEditorV2IEditorOptionsWordWrapOverride1,
  wordWrapColumn?: float,
  wrappingIndent?: codeEditorV2IEditorOptionsWrappingIndent,
  wrappingStrategy?: codeEditorV2IEditorOptionsWrappingStrategy,
  wrapOnEscapedLineFeeds?: bool,
  wordWrapBreakBeforeCharacters?: string,
  wordWrapBreakAfterCharacters?: string,
  wordBreak?: codeEditorV2IEditorOptionsWordBreak,
  stopRenderingLineAfter?: float,
  hover?: iEditorHoverOptions,
  links?: bool,
  colorDecorators?: bool,
  colorDecoratorsActivatedOn?: codeEditorV2IEditorOptionsColorDecoratorsActivatedOn,
  colorDecoratorsLimit?: float,
  comments?: iEditorCommentsOptions,
  contextmenu?: bool,
  mouseWheelScrollSensitivity?: float,
  fastScrollSensitivity?: float,
  scrollPredominantAxis?: bool,
  inertialScroll?: bool,
  columnSelection?: bool,
  multiCursorModifier?: codeEditorV2IEditorOptionsMultiCursorModifier,
  multiCursorMergeOverlapping?: bool,
  multiCursorPaste?: codeEditorV2IEditorOptionsMultiCursorPaste,
  multiCursorLimit?: float,
  mouseMiddleClickAction?: mouseMiddleClickAction,
  accessibilitySupport?: codeEditorV2IEditorOptionsAccessibilitySupport,
  accessibilityPageSize?: float,
  suggest?: iSuggestOptions,
  inlineSuggest?: iInlineSuggestOptions,
  smartSelect?: iSmartSelectOptions,
  gotoLocation?: iGotoLocationOptions,
  quickSuggestions?: string,  // ⚠️ REVIEW — was `boolean | IQuickSuggestionsOptions` — match the real type by hand
  quickSuggestionsDelay?: float,
  padding?: iEditorPaddingOptions,
  parameterHints?: iEditorParameterHintOptions,
  autoClosingBrackets?: editorAutoClosingStrategy,
  autoClosingComments?: editorAutoClosingStrategy,
  autoClosingQuotes?: editorAutoClosingStrategy,
  autoClosingDelete?: editorAutoClosingEditStrategy,
  autoClosingOvertype?: editorAutoClosingEditStrategy,
  autoSurround?: editorAutoSurroundStrategy,
  autoIndent?: codeEditorV2IEditorOptionsAutoIndent,
  autoIndentOnPaste?: bool,
  autoIndentOnPasteWithinString?: bool,
  stickyTabStops?: bool,
  formatOnType?: bool,
  formatOnPaste?: bool,
  dragAndDrop?: bool,
  suggestOnTriggerCharacters?: bool,
  acceptSuggestionOnEnter?: codeEditorV2IEditorOptionsAcceptSuggestionOnEnter,
  acceptSuggestionOnCommitCharacter?: bool,
  snippetSuggestions?: codeEditorV2IEditorOptionsSnippetSuggestions,
  emptySelectionClipboard?: bool,
  copyWithSyntaxHighlighting?: bool,
  suggestSelection?: codeEditorV2IEditorOptionsSuggestSelection,
  suggestFontSize?: float,
  suggestLineHeight?: float,
  tabCompletion?: codeEditorV2IEditorOptionsTabCompletion,
  selectionHighlight?: bool,
  selectionHighlightMultiline?: bool,
  selectionHighlightMaxLength?: float,
  occurrencesHighlight?: codeEditorV2IEditorOptionsOccurrencesHighlight,
  occurrencesHighlightDelay?: float,
  codeLens?: bool,
  codeLensFontFamily?: string,
  codeLensFontSize?: float,
  lightbulb?: iEditorLightbulbOptions,
  codeActionsOnSaveTimeout?: float,
  folding?: bool,
  foldingStrategy?: codeEditorV2IEditorOptionsFoldingStrategy,
  foldingHighlight?: bool,
  foldingImportsByDefault?: bool,
  foldingMaximumRegions?: float,
  showFoldingControls?: codeEditorV2IEditorOptionsShowFoldingControls,
  unfoldOnClickAfterEndOfLine?: bool,
  matchBrackets?: codeEditorV2IEditorOptionsMatchBrackets,
  experimentalGpuAcceleration?: codeEditorV2IEditorOptionsExperimentalGpuAcceleration,
  experimentalWhitespaceRendering?: codeEditorV2IEditorOptionsExperimentalWhitespaceRendering,
  renderWhitespace?: codeEditorV2IEditorOptionsRenderWhitespace,
  renderControlCharacters?: bool,
  renderLineHighlight?: codeEditorV2IEditorOptionsRenderLineHighlight,
  renderLineHighlightOnlyWhenFocus?: bool,
  useTabStops?: bool,
  trimWhitespaceOnDelete?: bool,
  fontFamily?: string,
  fontWeight?: string,
  fontSize?: float,
  lineHeight?: float,
  letterSpacing?: float,
  showUnused?: bool,
  peekWidgetDefaultFocus?: codeEditorV2IEditorOptionsPeekWidgetDefaultFocus,
  placeholder?: string,
  definitionLinkOpensInPeek?: bool,
  showDeprecated?: bool,
  matchOnWordStartOnly?: bool,
  inlayHints?: iEditorInlayHintsOptions,
  useShadowDOM?: bool,
  guides?: iGuidesOptions,
  unicodeHighlight?: iUnicodeHighlightOptions,
  bracketPairColorization?: iBracketPairColorizationOptions,
  dropIntoEditor?: iDropIntoEditorOptions,
  editContext?: bool,
  renderRichScreenReaderContent?: bool,
  pasteAs?: iPasteAsOptions,
  tabFocusMode?: bool,
  inlineCompletionsAccessibilityVerbose?: bool,
}
type iContextKey = {
  set: string => unit,  // 🛑 BROKEN — contains `unknown`
  reset: unit => unit,
  get: unit => string,  // 🛑 BROKEN — contains `unknown`
}
type iActionDescriptor<'a, 'b> = {
  id: string,
  label: string,
  precondition?: string,
  keybindings?: array<float>,
  keybindingContext?: string,
  contextMenuGroupId?: string,
  contextMenuOrder?: float,
  run: (iCodeEditor<'a>, array<'b>) => 'a,
}
type codeEditorV2IStandaloneCodeEditorUpdateOptionsConfig = {
  inDiffEditor?: bool,
  allowVariableLineHeights?: bool,
  allowVariableFonts?: bool,
  allowVariableFontsInAccessibilityMode?: bool,
  ariaLabel?: string,
  ariaRequired?: bool,
  screenReaderAnnounceInlineSuggestion?: bool,
  tabIndex?: int,
  rulers?: array<string>,  // ⚪ loose — was `number | IRulerOption`
  wordSegmenterLocales?: CommonTypes.stringOrStringArray,
  wordSeparators?: string,
  selectionClipboard?: bool,
  lineNumbers?: CommonTypes.editorIStandaloneCodeEditorUpdateOptionsLineNumbers,
  cursorSurroundingLines?: float,
  cursorSurroundingLinesStyle?: codeEditorV2IEditorOptionsCursorSurroundingLinesStyle,
  renderFinalNewline?: codeEditorV2IEditorOptionsRenderFinalNewline,
  unusualLineTerminators?: codeEditorV2IEditorOptionsUnusualLineTerminators,
  selectOnLineNumbers?: bool,
  lineNumbersMinChars?: float,
  glyphMargin?: bool,
  lineDecorationsWidth?: CommonTypes.stringOrNumber,
  revealHorizontalRightPadding?: float,
  roundedSelection?: bool,
  extraEditorClassName?: string,
  readOnly?: bool,
  readOnlyMessage?: iMarkdownString,
  domReadOnly?: bool,
  linkedEditing?: bool,
  renameOnType?: bool,
  renderValidationDecorations?: codeEditorV2IEditorOptionsRenderValidationDecorations,
  scrollbar?: iEditorScrollbarOptions,
  stickyScroll?: iEditorStickyScrollOptions,
  minimap?: iEditorMinimapOptions,
  find?: iEditorFindOptions,
  fixedOverflowWidgets?: bool,
  allowOverflow?: bool,
  overviewRulerLanes?: float,
  overviewRulerBorder?: bool,
  cursorBlinking?: codeEditorV2IEditorOptionsCursorBlinking,
  mouseWheelZoom?: bool,
  mouseStyle?: codeEditorV2IEditorOptionsMouseStyle,
  cursorSmoothCaretAnimation?: codeEditorV2IEditorOptionsCursorSmoothCaretAnimation,
  cursorStyle?: codeEditorV2IEditorOptionsCursorStyle,
  overtypeCursorStyle?: codeEditorV2IEditorOptionsCursorStyle,
  overtypeOnPaste?: bool,
  cursorWidth?: float,
  cursorHeight?: float,
  fontLigatures?: CommonTypes.boolOrString,
  fontVariations?: CommonTypes.boolOrString,
  defaultColorDecorators?: codeEditorV2IEditorOptionsDefaultColorDecorators,
  disableLayerHinting?: bool,
  disableMonospaceOptimizations?: bool,
  hideCursorInOverviewRuler?: bool,
  scrollBeyondLastLine?: bool,
  scrollOnMiddleClick?: bool,
  scrollBeyondLastColumn?: float,
  smoothScrolling?: bool,
  automaticLayout?: bool,
  wordWrap?: codeEditorV2IEditorOptionsWordWrap,
  wordWrapOverride1?: codeEditorV2IEditorOptionsWordWrapOverride1,
  wordWrapOverride2?: codeEditorV2IEditorOptionsWordWrapOverride1,
  wordWrapColumn?: float,
  wrappingIndent?: codeEditorV2IEditorOptionsWrappingIndent,
  wrappingStrategy?: codeEditorV2IEditorOptionsWrappingStrategy,
  wrapOnEscapedLineFeeds?: bool,
  wordWrapBreakBeforeCharacters?: string,
  wordWrapBreakAfterCharacters?: string,
  wordBreak?: codeEditorV2IEditorOptionsWordBreak,
  stopRenderingLineAfter?: float,
  hover?: iEditorHoverOptions,
  links?: bool,
  colorDecorators?: bool,
  colorDecoratorsActivatedOn?: codeEditorV2IEditorOptionsColorDecoratorsActivatedOn,
  colorDecoratorsLimit?: float,
  comments?: iEditorCommentsOptions,
  contextmenu?: bool,
  mouseWheelScrollSensitivity?: float,
  fastScrollSensitivity?: float,
  scrollPredominantAxis?: bool,
  inertialScroll?: bool,
  columnSelection?: bool,
  multiCursorModifier?: codeEditorV2IEditorOptionsMultiCursorModifier,
  multiCursorMergeOverlapping?: bool,
  multiCursorPaste?: codeEditorV2IEditorOptionsMultiCursorPaste,
  multiCursorLimit?: float,
  mouseMiddleClickAction?: mouseMiddleClickAction,
  accessibilitySupport?: codeEditorV2IEditorOptionsAccessibilitySupport,
  accessibilityPageSize?: float,
  suggest?: iSuggestOptions,
  inlineSuggest?: iInlineSuggestOptions,
  smartSelect?: iSmartSelectOptions,
  gotoLocation?: iGotoLocationOptions,
  quickSuggestions?: string,  // ⚠️ REVIEW — was `boolean | IQuickSuggestionsOptions` — match the real type by hand
  quickSuggestionsDelay?: float,
  padding?: iEditorPaddingOptions,
  parameterHints?: iEditorParameterHintOptions,
  autoClosingBrackets?: editorAutoClosingStrategy,
  autoClosingComments?: editorAutoClosingStrategy,
  autoClosingQuotes?: editorAutoClosingStrategy,
  autoClosingDelete?: editorAutoClosingEditStrategy,
  autoClosingOvertype?: editorAutoClosingEditStrategy,
  autoSurround?: editorAutoSurroundStrategy,
  autoIndent?: codeEditorV2IEditorOptionsAutoIndent,
  autoIndentOnPaste?: bool,
  autoIndentOnPasteWithinString?: bool,
  stickyTabStops?: bool,
  formatOnType?: bool,
  formatOnPaste?: bool,
  dragAndDrop?: bool,
  suggestOnTriggerCharacters?: bool,
  acceptSuggestionOnEnter?: codeEditorV2IEditorOptionsAcceptSuggestionOnEnter,
  acceptSuggestionOnCommitCharacter?: bool,
  snippetSuggestions?: codeEditorV2IEditorOptionsSnippetSuggestions,
  emptySelectionClipboard?: bool,
  copyWithSyntaxHighlighting?: bool,
  suggestSelection?: codeEditorV2IEditorOptionsSuggestSelection,
  suggestFontSize?: float,
  suggestLineHeight?: float,
  tabCompletion?: codeEditorV2IEditorOptionsTabCompletion,
  selectionHighlight?: bool,
  selectionHighlightMultiline?: bool,
  selectionHighlightMaxLength?: float,
  occurrencesHighlight?: codeEditorV2IEditorOptionsOccurrencesHighlight,
  occurrencesHighlightDelay?: float,
  codeLens?: bool,
  codeLensFontFamily?: string,
  codeLensFontSize?: float,
  lightbulb?: iEditorLightbulbOptions,
  codeActionsOnSaveTimeout?: float,
  folding?: bool,
  foldingStrategy?: codeEditorV2IEditorOptionsFoldingStrategy,
  foldingHighlight?: bool,
  foldingImportsByDefault?: bool,
  foldingMaximumRegions?: float,
  showFoldingControls?: codeEditorV2IEditorOptionsShowFoldingControls,
  unfoldOnClickAfterEndOfLine?: bool,
  matchBrackets?: codeEditorV2IEditorOptionsMatchBrackets,
  experimentalGpuAcceleration?: codeEditorV2IEditorOptionsExperimentalGpuAcceleration,
  experimentalWhitespaceRendering?: codeEditorV2IEditorOptionsExperimentalWhitespaceRendering,
  renderWhitespace?: codeEditorV2IEditorOptionsRenderWhitespace,
  renderControlCharacters?: bool,
  renderLineHighlight?: codeEditorV2IEditorOptionsRenderLineHighlight,
  renderLineHighlightOnlyWhenFocus?: bool,
  useTabStops?: bool,
  trimWhitespaceOnDelete?: bool,
  fontFamily?: string,
  fontWeight?: string,
  fontSize?: float,
  lineHeight?: float,
  letterSpacing?: float,
  showUnused?: bool,
  peekWidgetDefaultFocus?: codeEditorV2IEditorOptionsPeekWidgetDefaultFocus,
  placeholder?: string,
  definitionLinkOpensInPeek?: bool,
  showDeprecated?: bool,
  matchOnWordStartOnly?: bool,
  inlayHints?: iEditorInlayHintsOptions,
  useShadowDOM?: bool,
  guides?: iGuidesOptions,
  unicodeHighlight?: iUnicodeHighlightOptions,
  bracketPairColorization?: iBracketPairColorizationOptions,
  dropIntoEditor?: iDropIntoEditorOptions,
  editContext?: bool,
  renderRichScreenReaderContent?: bool,
  pasteAs?: iPasteAsOptions,
  tabFocusMode?: bool,
  inlineCompletionsAccessibilityVerbose?: bool,
  tabSize?: float,
  insertSpaces?: bool,
  detectIndentation?: bool,
  trimAutoWhitespace?: bool,
  largeFileOptimizations?: bool,
  wordBasedSuggestions?: codeEditorV2IStandaloneCodeEditorUpdateOptionsWordBasedSuggestions,
  wordBasedSuggestionsOnlySameLanguage?: bool,
  @as("semanticHighlighting.enabled") semanticHighlighting_enabled?: CommonTypes.boolOrConfiguredByTheme,
  stablePeek?: bool,
  maxTokenizationLineLength?: float,
  theme?: string,
  autoDetectHighContrast?: bool,
}
@unboxed type codeEditorV2IStandaloneCodeEditorExecuteEdits = Arr(array<selection>) | Fn(array<iValidEditOperation> => Nullable.t<array<selection>>)
type iStandaloneCodeEditor<'a, 'b> = {
  updateOptions: codeEditorV2IStandaloneCodeEditorUpdateOptionsConfig => unit,
  addCommand: (float, array<string> => unit, option<string>) => Nullable.t<string>,  // ⚪ loose — was `any`
  createContextKey: (string, string) => iContextKey,  // 🛑 BROKEN — contains `unknown`
  addAction: iActionDescriptor<'a, 'b> => iDisposable,
  onDidChangeModelContent: (iModelContentChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeModelLanguage: (iModelLanguageChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeModelLanguageConfiguration: (JSON.t => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeModelOptions: (iModelOptionsChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeConfiguration: (configurationChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeCursorPosition: (iCursorPositionChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeCursorSelection: (iCursorSelectionChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onWillChangeModel: (iModelChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeModel: (iModelChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeModelDecorations: (iModelDecorationsChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidFocusEditorText: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  onDidBlurEditorText: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  onDidFocusEditorWidget: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  onDidBlurEditorWidget: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  inComposition: bool,
  onDidCompositionStart: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  onDidCompositionEnd: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  onDidAttemptReadOnlyEdit: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  onDidPaste: (iPasteEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onMouseUp: (iEditorMouseEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onMouseDown: (iEditorMouseEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onContextMenu: (iEditorMouseEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onMouseMove: (iEditorMouseEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onMouseLeave: (iEditorMouseEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onKeyUp: (iKeyboardEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onKeyDown: (iKeyboardEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidLayoutChange: (editorLayoutInfo => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidContentSizeChange: (iContentSizeChangedEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidScrollChange: (iScrollEvent => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeHiddenAreas: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  onBeginUpdate: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  onEndUpdate: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  saveViewState: unit => Nullable.t<iCodeEditorViewState>,
  restoreViewState: Nullable.t<iCodeEditorViewState> => unit,
  hasWidgetFocus: unit => bool,
  getContribution: string => string,  // 🛑 BROKEN — contains `unknown`
  getModel: unit => Nullable.t<iTextModel<'a>>,
  setModel: Nullable.t<iTextModel<'a>> => unit,
  getOptions: unit => iComputedEditorOptions,
  getOption: string => JSON.t,  // 🛑 BROKEN — contains `unknown`
  getRawOptions: unit => iEditorOptions,
  getValue: option<editorICodeEditorGetValueConfig> => string,
  setValue: string => unit,
  getContentWidth: unit => float,
  getScrollWidth: unit => float,
  getScrollLeft: unit => float,
  getContentHeight: unit => float,
  getScrollHeight: unit => float,
  getScrollTop: unit => float,
  setScrollLeft: (float, option<scrollType>) => unit,
  setScrollTop: (float, option<scrollType>) => unit,
  setScrollPosition: (iNewScrollPosition, option<scrollType>) => unit,
  hasPendingScrollAnimation: unit => bool,
  getAction: string => Nullable.t<iEditorAction>,
  executeCommand: (Nullable.t<string>, iCommand<'a>) => unit,
  pushUndoStop: unit => bool,
  popUndoStop: unit => bool,
  executeEdits: (Nullable.t<string>, array<iIdentifiedSingleEditOperation>, option<codeEditorV2IStandaloneCodeEditorExecuteEdits>) => bool,
  executeCommands: (Nullable.t<string>, array<iCommand<'a>>) => unit,
  getLineDecorations: float => Nullable.t<array<iModelDecoration>>,
  getDecorationsInRange: range => Nullable.t<array<iModelDecoration>>,
  getFontSizeAtPosition: iPosition => Nullable.t<string>,
  deltaDecorations: (array<string>, array<iModelDeltaDecoration>) => array<string>,
  removeDecorations: array<string> => unit,
  getLayoutInfo: unit => editorLayoutInfo,
  getVisibleRanges: unit => array<range>,
  getTopForLineNumber: (float, option<bool>) => float,
  getBottomForLineNumber: float => float,
  getTopForPosition: (float, float) => float,
  getLineHeightForPosition: iPosition => float,
  writeScreenReaderContent: string => unit,
  getContainerDomNode: unit => Dom.element,
  getDomNode: unit => Nullable.t<Dom.element>,
  addContentWidget: iContentWidget => unit,
  layoutContentWidget: iContentWidget => unit,
  removeContentWidget: iContentWidget => unit,
  addOverlayWidget: iOverlayWidget => unit,
  layoutOverlayWidget: iOverlayWidget => unit,
  removeOverlayWidget: iOverlayWidget => unit,
  addGlyphMarginWidget: iGlyphMarginWidget => unit,
  layoutGlyphMarginWidget: iGlyphMarginWidget => unit,
  removeGlyphMarginWidget: iGlyphMarginWidget => unit,
  changeViewZones: iViewZoneChangeAccessor => unit => unit,
  getOffsetForColumn: (float, float) => float,
  render: option<bool> => unit,
  getTargetAtClientPoint: (float, float) => IMouseTarget.t,
  getScrolledVisiblePosition: iPosition => Nullable.t<editorICodeEditorGetScrolledVisiblePositionConfig>,
  applyFontInfo: Dom.element => unit,
  setBanner: (Nullable.t<Dom.element>, float) => unit,
  handleInitialized?: unit => unit,
  onDidDispose: unit => unit => iDisposable,
  dispose: unit => unit,
  getId: unit => string,
  getEditorType: unit => string,
  layout: (option<iDimension>, option<bool>) => unit,
  focus: unit => unit,
  hasTextFocus: unit => bool,
  getSupportedActions: unit => array<iEditorAction>,
  getVisibleColumnFromPosition: iPosition => float,
  getPosition: unit => Nullable.t<position>,
  setPosition: (iPosition, option<string>) => unit,
  revealLine: (float, option<scrollType>) => unit,
  revealLineInCenter: (float, option<scrollType>) => unit,
  revealLineInCenterIfOutsideViewport: (float, option<scrollType>) => unit,
  revealLineNearTop: (float, option<scrollType>) => unit,
  revealPosition: (iPosition, option<scrollType>) => unit,
  revealPositionInCenter: (iPosition, option<scrollType>) => unit,
  revealPositionInCenterIfOutsideViewport: (iPosition, option<scrollType>) => unit,
  revealPositionNearTop: (iPosition, option<scrollType>) => unit,
  getSelection: unit => Nullable.t<selection>,
  getSelections: unit => Nullable.t<array<selection>>,
  setSelection: SetSelection.t,
  setSelections: (array<iSelection>, option<string>) => unit,
  revealLines: (float, float, option<scrollType>) => unit,
  revealLinesInCenter: (float, float, option<scrollType>) => unit,
  revealLinesInCenterIfOutsideViewport: (float, float, option<scrollType>) => unit,
  revealLinesNearTop: (float, float, option<scrollType>) => unit,
  revealRange: (iRange, option<scrollType>) => unit,
  revealRangeInCenter: (iRange, option<scrollType>) => unit,
  revealRangeAtTop: (iRange, option<scrollType>) => unit,
  revealRangeInCenterIfOutsideViewport: (iRange, option<scrollType>) => unit,
  revealRangeNearTop: (iRange, option<scrollType>) => unit,
  revealRangeNearTopIfOutsideViewport: (iRange, option<scrollType>) => unit,
  trigger: (Nullable.t<string>, string, string) => unit,  // 🛑 BROKEN — contains `any`
  createDecorationsCollection: option<array<iModelDeltaDecoration>> => iEditorDecorationsCollection,
}
type iDiffEditorViewState = {
  original: Nullable.t<iCodeEditorViewState>,
  modified: Nullable.t<iCodeEditorViewState>,
  modelState?: JSON.t,
}
type iDiffEditorModel<'a> = {
  original: iTextModel<'a>,
  modified: iTextModel<'a>,
}
type iDiffEditorViewModel<'a> = {
  model: iDiffEditorModel<'a>,
  waitForDiff: unit => promise<unit>,
  dispose: unit => unit,
}
module CodeEditorV2IStandaloneDiffEditorSetModel = {
  type t
  external fromIDiffEditorModel: iDiffEditorModel<'a> => t = "%identity"
  external fromIDiffEditorViewModel: iDiffEditorViewModel<'a> => t = "%identity"
}
type iCharChange = {
  originalStartColumn: float,
  originalEndColumn: float,
  modifiedStartColumn: float,
  modifiedEndColumn: float,
  originalStartLineNumber: float,
  originalEndLineNumber: float,
  modifiedStartLineNumber: float,
  modifiedEndLineNumber: float,
}
type iLineChange = {
  charChanges?: array<iCharChange>,
  originalStartLineNumber: float,
  originalEndLineNumber: float,
  modifiedStartLineNumber: float,
  modifiedEndLineNumber: float,
}
type editorIDiffEditorOptionsExperimentalConfig = {
  showMoves?: bool,
  showEmptyDecorations?: bool,
  useTrueInlineView?: bool,
}
type editorIDiffEditorOptionsHideUnchangedRegionsConfig = {
  enabled?: bool,
  revealLineCount?: float,
  minimumLineCount?: float,
  contextLineCount?: float,
}
type iDiffEditorOptions = {
  inDiffEditor?: bool,
  allowVariableLineHeights?: bool,
  allowVariableFonts?: bool,
  allowVariableFontsInAccessibilityMode?: bool,
  ariaLabel?: string,
  ariaRequired?: bool,
  screenReaderAnnounceInlineSuggestion?: bool,
  tabIndex?: int,
  rulers?: array<string>,  // ⚠️ REVIEW — was `number | IRulerOption` — match the real type by hand
  wordSegmenterLocales?: CommonTypes.stringOrStringArray,
  wordSeparators?: string,
  selectionClipboard?: bool,
  lineNumbers?: CommonTypes.editorIDiffEditorOptionsLineNumbers,
  cursorSurroundingLines?: float,
  cursorSurroundingLinesStyle?: codeEditorV2IEditorOptionsCursorSurroundingLinesStyle,
  renderFinalNewline?: codeEditorV2IEditorOptionsRenderFinalNewline,
  unusualLineTerminators?: codeEditorV2IEditorOptionsUnusualLineTerminators,
  selectOnLineNumbers?: bool,
  lineNumbersMinChars?: float,
  glyphMargin?: bool,
  lineDecorationsWidth?: CommonTypes.stringOrNumber,
  revealHorizontalRightPadding?: float,
  roundedSelection?: bool,
  extraEditorClassName?: string,
  readOnly?: bool,
  readOnlyMessage?: iMarkdownString,
  domReadOnly?: bool,
  linkedEditing?: bool,
  renameOnType?: bool,
  renderValidationDecorations?: codeEditorV2IEditorOptionsRenderValidationDecorations,
  scrollbar?: iEditorScrollbarOptions,
  stickyScroll?: iEditorStickyScrollOptions,
  minimap?: iEditorMinimapOptions,
  find?: iEditorFindOptions,
  fixedOverflowWidgets?: bool,
  allowOverflow?: bool,
  overviewRulerLanes?: float,
  overviewRulerBorder?: bool,
  cursorBlinking?: codeEditorV2IEditorOptionsCursorBlinking,
  mouseWheelZoom?: bool,
  mouseStyle?: codeEditorV2IEditorOptionsMouseStyle,
  cursorSmoothCaretAnimation?: codeEditorV2IEditorOptionsCursorSmoothCaretAnimation,
  cursorStyle?: codeEditorV2IEditorOptionsCursorStyle,
  overtypeCursorStyle?: codeEditorV2IEditorOptionsCursorStyle,
  overtypeOnPaste?: bool,
  cursorWidth?: float,
  cursorHeight?: float,
  fontLigatures?: CommonTypes.boolOrString,
  fontVariations?: CommonTypes.boolOrString,
  defaultColorDecorators?: codeEditorV2IEditorOptionsDefaultColorDecorators,
  disableLayerHinting?: bool,
  disableMonospaceOptimizations?: bool,
  hideCursorInOverviewRuler?: bool,
  scrollBeyondLastLine?: bool,
  scrollOnMiddleClick?: bool,
  scrollBeyondLastColumn?: float,
  smoothScrolling?: bool,
  automaticLayout?: bool,
  wordWrap?: codeEditorV2IEditorOptionsWordWrap,
  wordWrapOverride1?: codeEditorV2IEditorOptionsWordWrapOverride1,
  wordWrapOverride2?: codeEditorV2IEditorOptionsWordWrapOverride1,
  wordWrapColumn?: float,
  wrappingIndent?: codeEditorV2IEditorOptionsWrappingIndent,
  wrappingStrategy?: codeEditorV2IEditorOptionsWrappingStrategy,
  wrapOnEscapedLineFeeds?: bool,
  wordWrapBreakBeforeCharacters?: string,
  wordWrapBreakAfterCharacters?: string,
  wordBreak?: codeEditorV2IEditorOptionsWordBreak,
  stopRenderingLineAfter?: float,
  hover?: iEditorHoverOptions,
  links?: bool,
  colorDecorators?: bool,
  colorDecoratorsActivatedOn?: codeEditorV2IEditorOptionsColorDecoratorsActivatedOn,
  colorDecoratorsLimit?: float,
  comments?: iEditorCommentsOptions,
  contextmenu?: bool,
  mouseWheelScrollSensitivity?: float,
  fastScrollSensitivity?: float,
  scrollPredominantAxis?: bool,
  inertialScroll?: bool,
  columnSelection?: bool,
  multiCursorModifier?: codeEditorV2IEditorOptionsMultiCursorModifier,
  multiCursorMergeOverlapping?: bool,
  multiCursorPaste?: codeEditorV2IEditorOptionsMultiCursorPaste,
  multiCursorLimit?: float,
  mouseMiddleClickAction?: mouseMiddleClickAction,
  accessibilitySupport?: codeEditorV2IEditorOptionsAccessibilitySupport,
  accessibilityPageSize?: float,
  suggest?: iSuggestOptions,
  inlineSuggest?: iInlineSuggestOptions,
  smartSelect?: iSmartSelectOptions,
  gotoLocation?: iGotoLocationOptions,
  quickSuggestions?: string,  // ⚠️ REVIEW — was `boolean | IQuickSuggestionsOptions` — match the real type by hand
  quickSuggestionsDelay?: float,
  padding?: iEditorPaddingOptions,
  parameterHints?: iEditorParameterHintOptions,
  autoClosingBrackets?: editorAutoClosingStrategy,
  autoClosingComments?: editorAutoClosingStrategy,
  autoClosingQuotes?: editorAutoClosingStrategy,
  autoClosingDelete?: editorAutoClosingEditStrategy,
  autoClosingOvertype?: editorAutoClosingEditStrategy,
  autoSurround?: editorAutoSurroundStrategy,
  autoIndent?: codeEditorV2IEditorOptionsAutoIndent,
  autoIndentOnPaste?: bool,
  autoIndentOnPasteWithinString?: bool,
  stickyTabStops?: bool,
  formatOnType?: bool,
  formatOnPaste?: bool,
  dragAndDrop?: bool,
  suggestOnTriggerCharacters?: bool,
  acceptSuggestionOnEnter?: codeEditorV2IEditorOptionsAcceptSuggestionOnEnter,
  acceptSuggestionOnCommitCharacter?: bool,
  snippetSuggestions?: codeEditorV2IEditorOptionsSnippetSuggestions,
  emptySelectionClipboard?: bool,
  copyWithSyntaxHighlighting?: bool,
  suggestSelection?: codeEditorV2IEditorOptionsSuggestSelection,
  suggestFontSize?: float,
  suggestLineHeight?: float,
  tabCompletion?: codeEditorV2IEditorOptionsTabCompletion,
  selectionHighlight?: bool,
  selectionHighlightMultiline?: bool,
  selectionHighlightMaxLength?: float,
  occurrencesHighlight?: codeEditorV2IEditorOptionsOccurrencesHighlight,
  occurrencesHighlightDelay?: float,
  codeLens?: bool,
  codeLensFontFamily?: string,
  codeLensFontSize?: float,
  lightbulb?: iEditorLightbulbOptions,
  codeActionsOnSaveTimeout?: float,
  folding?: bool,
  foldingStrategy?: codeEditorV2IEditorOptionsFoldingStrategy,
  foldingHighlight?: bool,
  foldingImportsByDefault?: bool,
  foldingMaximumRegions?: float,
  showFoldingControls?: codeEditorV2IEditorOptionsShowFoldingControls,
  unfoldOnClickAfterEndOfLine?: bool,
  matchBrackets?: codeEditorV2IEditorOptionsMatchBrackets,
  experimentalGpuAcceleration?: codeEditorV2IEditorOptionsExperimentalGpuAcceleration,
  experimentalWhitespaceRendering?: codeEditorV2IEditorOptionsExperimentalWhitespaceRendering,
  renderWhitespace?: codeEditorV2IEditorOptionsRenderWhitespace,
  renderControlCharacters?: bool,
  renderLineHighlight?: codeEditorV2IEditorOptionsRenderLineHighlight,
  renderLineHighlightOnlyWhenFocus?: bool,
  useTabStops?: bool,
  trimWhitespaceOnDelete?: bool,
  fontFamily?: string,
  fontWeight?: string,
  fontSize?: float,
  lineHeight?: float,
  letterSpacing?: float,
  showUnused?: bool,
  peekWidgetDefaultFocus?: codeEditorV2IEditorOptionsPeekWidgetDefaultFocus,
  placeholder?: string,
  definitionLinkOpensInPeek?: bool,
  showDeprecated?: bool,
  matchOnWordStartOnly?: bool,
  inlayHints?: iEditorInlayHintsOptions,
  useShadowDOM?: bool,
  guides?: iGuidesOptions,
  unicodeHighlight?: iUnicodeHighlightOptions,
  bracketPairColorization?: iBracketPairColorizationOptions,
  dropIntoEditor?: iDropIntoEditorOptions,
  editContext?: bool,
  renderRichScreenReaderContent?: bool,
  pasteAs?: iPasteAsOptions,
  tabFocusMode?: bool,
  inlineCompletionsAccessibilityVerbose?: bool,
  enableSplitViewResizing?: bool,
  splitViewDefaultRatio?: float,
  renderSideBySide?: bool,
  renderSideBySideInlineBreakpoint?: float,
  useInlineViewWhenSpaceIsLimited?: bool,
  compactMode?: bool,
  maxComputationTime?: float,
  maxFileSize?: float,
  ignoreTrimWhitespace?: bool,
  renderIndicators?: bool,
  renderMarginRevertIcon?: bool,
  renderGutterMenu?: bool,
  originalEditable?: bool,
  diffCodeLens?: bool,
  renderOverviewRuler?: bool,
  diffWordWrap?: codeEditorV2IEditorOptionsWordWrapOverride1,
  diffAlgorithm?: codeEditorV2IDiffEditorOptionsDiffAlgorithm,
  accessibilityVerbose?: bool,
  experimental?: editorIDiffEditorOptionsExperimentalConfig,
  isInEmbeddedEditor?: bool,
  onlyShowAccessibleDiffViewer?: bool,
  hideUnchangedRegions?: editorIDiffEditorOptionsHideUnchangedRegionsConfig,
}
type iStandaloneDiffEditor<'a, 'b> = {
  addCommand: (float, array<'a> => unit, option<string>) => Nullable.t<string>,
  createContextKey: (string, string) => iContextKey,  // 🛑 BROKEN — contains `unknown`
  addAction: iActionDescriptor<'a, 'b> => iDisposable,
  getOriginalEditor: unit => iStandaloneCodeEditor<'a, 'b>,
  getModifiedEditor: unit => iStandaloneCodeEditor<'a, 'b>,
  getContainerDomNode: unit => Dom.element,
  onDidUpdateDiff: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  onDidChangeModel: (string => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any` — was `void`
  saveViewState: unit => Nullable.t<iDiffEditorViewState>,
  restoreViewState: Nullable.t<iDiffEditorViewState> => unit,
  getModel: unit => Nullable.t<iDiffEditorModel<'a>>,
  createViewModel: iDiffEditorModel<'a> => iDiffEditorViewModel<'a>,
  setModel: CodeEditorV2IStandaloneDiffEditorSetModel.t => unit,
  getLineChanges: unit => Nullable.t<array<iLineChange>>,
  updateOptions: iDiffEditorOptions => unit,
  goToDiff: codeEditorV2IStandaloneDiffEditorGoToDiff => unit,
  revealFirstDiff: unit => JSON.t,
  accessibleDiffViewerNext: unit => unit,
  accessibleDiffViewerPrev: unit => unit,
  handleInitialized: unit => unit,
  onDidDispose: unit => unit => iDisposable,
  dispose: unit => unit,
  getId: unit => string,
  getEditorType: unit => string,
  layout: (option<iDimension>, option<bool>) => unit,
  focus: unit => unit,
  hasTextFocus: unit => bool,
  getSupportedActions: unit => array<iEditorAction>,
  getVisibleColumnFromPosition: iPosition => float,
  getPosition: unit => Nullable.t<position>,
  setPosition: (iPosition, option<string>) => unit,
  revealLine: (float, option<scrollType>) => unit,
  revealLineInCenter: (float, option<scrollType>) => unit,
  revealLineInCenterIfOutsideViewport: (float, option<scrollType>) => unit,
  revealLineNearTop: (float, option<scrollType>) => unit,
  revealPosition: (iPosition, option<scrollType>) => unit,
  revealPositionInCenter: (iPosition, option<scrollType>) => unit,
  revealPositionInCenterIfOutsideViewport: (iPosition, option<scrollType>) => unit,
  revealPositionNearTop: (iPosition, option<scrollType>) => unit,
  getSelection: unit => Nullable.t<selection>,
  getSelections: unit => Nullable.t<array<selection>>,
  setSelection: SetSelection.t,
  setSelections: (array<iSelection>, option<string>) => unit,
  revealLines: (float, float, option<scrollType>) => unit,
  revealLinesInCenter: (float, float, option<scrollType>) => unit,
  revealLinesInCenterIfOutsideViewport: (float, float, option<scrollType>) => unit,
  revealLinesNearTop: (float, float, option<scrollType>) => unit,
  revealRange: (iRange, option<scrollType>) => unit,
  revealRangeInCenter: (iRange, option<scrollType>) => unit,
  revealRangeAtTop: (iRange, option<scrollType>) => unit,
  revealRangeInCenterIfOutsideViewport: (iRange, option<scrollType>) => unit,
  revealRangeNearTop: (iRange, option<scrollType>) => unit,
  revealRangeNearTopIfOutsideViewport: (iRange, option<scrollType>) => unit,
  trigger: (Nullable.t<string>, string, string) => unit,  // 🛑 BROKEN — contains `any`
  createDecorationsCollection: option<array<iModelDeltaDecoration>> => iEditorDecorationsCollection,
}
type iStandaloneEditorConstructionOptions<'a> = {
  model?: Nullable.t<iTextModel<'a>>,
  value?: string,
  language?: string,
  theme?: string,
  autoDetectHighContrast?: bool,
  accessibilityHelpUrl?: string,
  ariaContainerElement?: Dom.element,
  dimension?: iDimension,
  overflowWidgetsDomNode?: Dom.element,
  inDiffEditor?: bool,
  allowVariableLineHeights?: bool,
  allowVariableFonts?: bool,
  allowVariableFontsInAccessibilityMode?: bool,
  ariaLabel?: string,
  ariaRequired?: bool,
  screenReaderAnnounceInlineSuggestion?: bool,
  tabIndex?: int,
  rulers?: array<string>,  // ⚠️ REVIEW — was `number | IRulerOption` — match the real type by hand
  wordSegmenterLocales?: CommonTypes.stringOrStringArray,
  wordSeparators?: string,
  selectionClipboard?: bool,
  lineNumbers?: CommonTypes.editorIStandaloneEditorConstructionOptionsLineNumbers,
  cursorSurroundingLines?: float,
  cursorSurroundingLinesStyle?: codeEditorV2IEditorOptionsCursorSurroundingLinesStyle,
  renderFinalNewline?: codeEditorV2IEditorOptionsRenderFinalNewline,
  unusualLineTerminators?: codeEditorV2IEditorOptionsUnusualLineTerminators,
  selectOnLineNumbers?: bool,
  lineNumbersMinChars?: float,
  glyphMargin?: bool,
  lineDecorationsWidth?: CommonTypes.stringOrNumber,
  revealHorizontalRightPadding?: float,
  roundedSelection?: bool,
  extraEditorClassName?: string,
  readOnly?: bool,
  readOnlyMessage?: iMarkdownString,
  domReadOnly?: bool,
  linkedEditing?: bool,
  renameOnType?: bool,
  renderValidationDecorations?: codeEditorV2IEditorOptionsRenderValidationDecorations,
  scrollbar?: iEditorScrollbarOptions,
  stickyScroll?: iEditorStickyScrollOptions,
  minimap?: iEditorMinimapOptions,
  find?: iEditorFindOptions,
  fixedOverflowWidgets?: bool,
  allowOverflow?: bool,
  overviewRulerLanes?: float,
  overviewRulerBorder?: bool,
  cursorBlinking?: codeEditorV2IEditorOptionsCursorBlinking,
  mouseWheelZoom?: bool,
  mouseStyle?: codeEditorV2IEditorOptionsMouseStyle,
  cursorSmoothCaretAnimation?: codeEditorV2IEditorOptionsCursorSmoothCaretAnimation,
  cursorStyle?: codeEditorV2IEditorOptionsCursorStyle,
  overtypeCursorStyle?: codeEditorV2IEditorOptionsCursorStyle,
  overtypeOnPaste?: bool,
  cursorWidth?: float,
  cursorHeight?: float,
  fontLigatures?: CommonTypes.boolOrString,
  fontVariations?: CommonTypes.boolOrString,
  defaultColorDecorators?: codeEditorV2IEditorOptionsDefaultColorDecorators,
  disableLayerHinting?: bool,
  disableMonospaceOptimizations?: bool,
  hideCursorInOverviewRuler?: bool,
  scrollBeyondLastLine?: bool,
  scrollOnMiddleClick?: bool,
  scrollBeyondLastColumn?: float,
  smoothScrolling?: bool,
  automaticLayout?: bool,
  wordWrap?: codeEditorV2IEditorOptionsWordWrap,
  wordWrapOverride1?: codeEditorV2IEditorOptionsWordWrapOverride1,
  wordWrapOverride2?: codeEditorV2IEditorOptionsWordWrapOverride1,
  wordWrapColumn?: float,
  wrappingIndent?: codeEditorV2IEditorOptionsWrappingIndent,
  wrappingStrategy?: codeEditorV2IEditorOptionsWrappingStrategy,
  wrapOnEscapedLineFeeds?: bool,
  wordWrapBreakBeforeCharacters?: string,
  wordWrapBreakAfterCharacters?: string,
  wordBreak?: codeEditorV2IEditorOptionsWordBreak,
  stopRenderingLineAfter?: float,
  hover?: iEditorHoverOptions,
  links?: bool,
  colorDecorators?: bool,
  colorDecoratorsActivatedOn?: codeEditorV2IEditorOptionsColorDecoratorsActivatedOn,
  colorDecoratorsLimit?: float,
  comments?: iEditorCommentsOptions,
  contextmenu?: bool,
  mouseWheelScrollSensitivity?: float,
  fastScrollSensitivity?: float,
  scrollPredominantAxis?: bool,
  inertialScroll?: bool,
  columnSelection?: bool,
  multiCursorModifier?: codeEditorV2IEditorOptionsMultiCursorModifier,
  multiCursorMergeOverlapping?: bool,
  multiCursorPaste?: codeEditorV2IEditorOptionsMultiCursorPaste,
  multiCursorLimit?: float,
  mouseMiddleClickAction?: mouseMiddleClickAction,
  accessibilitySupport?: codeEditorV2IEditorOptionsAccessibilitySupport,
  accessibilityPageSize?: float,
  suggest?: iSuggestOptions,
  inlineSuggest?: iInlineSuggestOptions,
  smartSelect?: iSmartSelectOptions,
  gotoLocation?: iGotoLocationOptions,
  quickSuggestions?: string,  // ⚠️ REVIEW — was `boolean | IQuickSuggestionsOptions` — match the real type by hand
  quickSuggestionsDelay?: float,
  padding?: iEditorPaddingOptions,
  parameterHints?: iEditorParameterHintOptions,
  autoClosingBrackets?: editorAutoClosingStrategy,
  autoClosingComments?: editorAutoClosingStrategy,
  autoClosingQuotes?: editorAutoClosingStrategy,
  autoClosingDelete?: editorAutoClosingEditStrategy,
  autoClosingOvertype?: editorAutoClosingEditStrategy,
  autoSurround?: editorAutoSurroundStrategy,
  autoIndent?: codeEditorV2IEditorOptionsAutoIndent,
  autoIndentOnPaste?: bool,
  autoIndentOnPasteWithinString?: bool,
  stickyTabStops?: bool,
  formatOnType?: bool,
  formatOnPaste?: bool,
  dragAndDrop?: bool,
  suggestOnTriggerCharacters?: bool,
  acceptSuggestionOnEnter?: codeEditorV2IEditorOptionsAcceptSuggestionOnEnter,
  acceptSuggestionOnCommitCharacter?: bool,
  snippetSuggestions?: codeEditorV2IEditorOptionsSnippetSuggestions,
  emptySelectionClipboard?: bool,
  copyWithSyntaxHighlighting?: bool,
  suggestSelection?: codeEditorV2IEditorOptionsSuggestSelection,
  suggestFontSize?: float,
  suggestLineHeight?: float,
  tabCompletion?: codeEditorV2IEditorOptionsTabCompletion,
  selectionHighlight?: bool,
  selectionHighlightMultiline?: bool,
  selectionHighlightMaxLength?: float,
  occurrencesHighlight?: codeEditorV2IEditorOptionsOccurrencesHighlight,
  occurrencesHighlightDelay?: float,
  codeLens?: bool,
  codeLensFontFamily?: string,
  codeLensFontSize?: float,
  lightbulb?: iEditorLightbulbOptions,
  codeActionsOnSaveTimeout?: float,
  folding?: bool,
  foldingStrategy?: codeEditorV2IEditorOptionsFoldingStrategy,
  foldingHighlight?: bool,
  foldingImportsByDefault?: bool,
  foldingMaximumRegions?: float,
  showFoldingControls?: codeEditorV2IEditorOptionsShowFoldingControls,
  unfoldOnClickAfterEndOfLine?: bool,
  matchBrackets?: codeEditorV2IEditorOptionsMatchBrackets,
  experimentalGpuAcceleration?: codeEditorV2IEditorOptionsExperimentalGpuAcceleration,
  experimentalWhitespaceRendering?: codeEditorV2IEditorOptionsExperimentalWhitespaceRendering,
  renderWhitespace?: codeEditorV2IEditorOptionsRenderWhitespace,
  renderControlCharacters?: bool,
  renderLineHighlight?: codeEditorV2IEditorOptionsRenderLineHighlight,
  renderLineHighlightOnlyWhenFocus?: bool,
  useTabStops?: bool,
  trimWhitespaceOnDelete?: bool,
  fontFamily?: string,
  fontWeight?: string,
  fontSize?: float,
  lineHeight?: float,
  letterSpacing?: float,
  showUnused?: bool,
  peekWidgetDefaultFocus?: codeEditorV2IEditorOptionsPeekWidgetDefaultFocus,
  placeholder?: string,
  definitionLinkOpensInPeek?: bool,
  showDeprecated?: bool,
  matchOnWordStartOnly?: bool,
  inlayHints?: iEditorInlayHintsOptions,
  useShadowDOM?: bool,
  guides?: iGuidesOptions,
  unicodeHighlight?: iUnicodeHighlightOptions,
  bracketPairColorization?: iBracketPairColorizationOptions,
  dropIntoEditor?: iDropIntoEditorOptions,
  editContext?: bool,
  renderRichScreenReaderContent?: bool,
  pasteAs?: iPasteAsOptions,
  tabFocusMode?: bool,
  inlineCompletionsAccessibilityVerbose?: bool,
  tabSize?: float,
  insertSpaces?: bool,
  detectIndentation?: bool,
  trimAutoWhitespace?: bool,
  largeFileOptimizations?: bool,
  wordBasedSuggestions?: codeEditorV2IStandaloneCodeEditorUpdateOptionsWordBasedSuggestions,
  wordBasedSuggestionsOnlySameLanguage?: bool,
  @as("semanticHighlighting.enabled") semanticHighlighting_enabled?: CommonTypes.boolOrConfiguredByTheme,
  stablePeek?: bool,
  maxTokenizationLineLength?: float,
}
type iDiffEditorConstructionOptions = {
  overflowWidgetsDomNode?: Dom.element,
  originalAriaLabel?: string,
  modifiedAriaLabel?: string,
  inDiffEditor?: bool,
  allowVariableLineHeights?: bool,
  allowVariableFonts?: bool,
  allowVariableFontsInAccessibilityMode?: bool,
  ariaLabel?: string,
  ariaRequired?: bool,
  screenReaderAnnounceInlineSuggestion?: bool,
  tabIndex?: int,
  rulers?: array<string>,  // ⚠️ REVIEW — was `number | IRulerOption` — match the real type by hand
  wordSegmenterLocales?: CommonTypes.stringOrStringArray,
  wordSeparators?: string,
  selectionClipboard?: bool,
  lineNumbers?: CommonTypes.editorIDiffEditorConstructionOptionsLineNumbers,
  cursorSurroundingLines?: float,
  cursorSurroundingLinesStyle?: codeEditorV2IEditorOptionsCursorSurroundingLinesStyle,
  renderFinalNewline?: codeEditorV2IEditorOptionsRenderFinalNewline,
  unusualLineTerminators?: codeEditorV2IEditorOptionsUnusualLineTerminators,
  selectOnLineNumbers?: bool,
  lineNumbersMinChars?: float,
  glyphMargin?: bool,
  lineDecorationsWidth?: CommonTypes.stringOrNumber,
  revealHorizontalRightPadding?: float,
  roundedSelection?: bool,
  extraEditorClassName?: string,
  readOnly?: bool,
  readOnlyMessage?: iMarkdownString,
  domReadOnly?: bool,
  linkedEditing?: bool,
  renameOnType?: bool,
  renderValidationDecorations?: codeEditorV2IEditorOptionsRenderValidationDecorations,
  scrollbar?: iEditorScrollbarOptions,
  stickyScroll?: iEditorStickyScrollOptions,
  minimap?: iEditorMinimapOptions,
  find?: iEditorFindOptions,
  fixedOverflowWidgets?: bool,
  allowOverflow?: bool,
  overviewRulerLanes?: float,
  overviewRulerBorder?: bool,
  cursorBlinking?: codeEditorV2IEditorOptionsCursorBlinking,
  mouseWheelZoom?: bool,
  mouseStyle?: codeEditorV2IEditorOptionsMouseStyle,
  cursorSmoothCaretAnimation?: codeEditorV2IEditorOptionsCursorSmoothCaretAnimation,
  cursorStyle?: codeEditorV2IEditorOptionsCursorStyle,
  overtypeCursorStyle?: codeEditorV2IEditorOptionsCursorStyle,
  overtypeOnPaste?: bool,
  cursorWidth?: float,
  cursorHeight?: float,
  fontLigatures?: CommonTypes.boolOrString,
  fontVariations?: CommonTypes.boolOrString,
  defaultColorDecorators?: codeEditorV2IEditorOptionsDefaultColorDecorators,
  disableLayerHinting?: bool,
  disableMonospaceOptimizations?: bool,
  hideCursorInOverviewRuler?: bool,
  scrollBeyondLastLine?: bool,
  scrollOnMiddleClick?: bool,
  scrollBeyondLastColumn?: float,
  smoothScrolling?: bool,
  automaticLayout?: bool,
  wordWrap?: codeEditorV2IEditorOptionsWordWrap,
  wordWrapOverride1?: codeEditorV2IEditorOptionsWordWrapOverride1,
  wordWrapOverride2?: codeEditorV2IEditorOptionsWordWrapOverride1,
  wordWrapColumn?: float,
  wrappingIndent?: codeEditorV2IEditorOptionsWrappingIndent,
  wrappingStrategy?: codeEditorV2IEditorOptionsWrappingStrategy,
  wrapOnEscapedLineFeeds?: bool,
  wordWrapBreakBeforeCharacters?: string,
  wordWrapBreakAfterCharacters?: string,
  wordBreak?: codeEditorV2IEditorOptionsWordBreak,
  stopRenderingLineAfter?: float,
  hover?: iEditorHoverOptions,
  links?: bool,
  colorDecorators?: bool,
  colorDecoratorsActivatedOn?: codeEditorV2IEditorOptionsColorDecoratorsActivatedOn,
  colorDecoratorsLimit?: float,
  comments?: iEditorCommentsOptions,
  contextmenu?: bool,
  mouseWheelScrollSensitivity?: float,
  fastScrollSensitivity?: float,
  scrollPredominantAxis?: bool,
  inertialScroll?: bool,
  columnSelection?: bool,
  multiCursorModifier?: codeEditorV2IEditorOptionsMultiCursorModifier,
  multiCursorMergeOverlapping?: bool,
  multiCursorPaste?: codeEditorV2IEditorOptionsMultiCursorPaste,
  multiCursorLimit?: float,
  mouseMiddleClickAction?: mouseMiddleClickAction,
  accessibilitySupport?: codeEditorV2IEditorOptionsAccessibilitySupport,
  accessibilityPageSize?: float,
  suggest?: iSuggestOptions,
  inlineSuggest?: iInlineSuggestOptions,
  smartSelect?: iSmartSelectOptions,
  gotoLocation?: iGotoLocationOptions,
  quickSuggestions?: string,  // ⚠️ REVIEW — was `boolean | IQuickSuggestionsOptions` — match the real type by hand
  quickSuggestionsDelay?: float,
  padding?: iEditorPaddingOptions,
  parameterHints?: iEditorParameterHintOptions,
  autoClosingBrackets?: editorAutoClosingStrategy,
  autoClosingComments?: editorAutoClosingStrategy,
  autoClosingQuotes?: editorAutoClosingStrategy,
  autoClosingDelete?: editorAutoClosingEditStrategy,
  autoClosingOvertype?: editorAutoClosingEditStrategy,
  autoSurround?: editorAutoSurroundStrategy,
  autoIndent?: codeEditorV2IEditorOptionsAutoIndent,
  autoIndentOnPaste?: bool,
  autoIndentOnPasteWithinString?: bool,
  stickyTabStops?: bool,
  formatOnType?: bool,
  formatOnPaste?: bool,
  dragAndDrop?: bool,
  suggestOnTriggerCharacters?: bool,
  acceptSuggestionOnEnter?: codeEditorV2IEditorOptionsAcceptSuggestionOnEnter,
  acceptSuggestionOnCommitCharacter?: bool,
  snippetSuggestions?: codeEditorV2IEditorOptionsSnippetSuggestions,
  emptySelectionClipboard?: bool,
  copyWithSyntaxHighlighting?: bool,
  suggestSelection?: codeEditorV2IEditorOptionsSuggestSelection,
  suggestFontSize?: float,
  suggestLineHeight?: float,
  tabCompletion?: codeEditorV2IEditorOptionsTabCompletion,
  selectionHighlight?: bool,
  selectionHighlightMultiline?: bool,
  selectionHighlightMaxLength?: float,
  occurrencesHighlight?: codeEditorV2IEditorOptionsOccurrencesHighlight,
  occurrencesHighlightDelay?: float,
  codeLens?: bool,
  codeLensFontFamily?: string,
  codeLensFontSize?: float,
  lightbulb?: iEditorLightbulbOptions,
  codeActionsOnSaveTimeout?: float,
  folding?: bool,
  foldingStrategy?: codeEditorV2IEditorOptionsFoldingStrategy,
  foldingHighlight?: bool,
  foldingImportsByDefault?: bool,
  foldingMaximumRegions?: float,
  showFoldingControls?: codeEditorV2IEditorOptionsShowFoldingControls,
  unfoldOnClickAfterEndOfLine?: bool,
  matchBrackets?: codeEditorV2IEditorOptionsMatchBrackets,
  experimentalGpuAcceleration?: codeEditorV2IEditorOptionsExperimentalGpuAcceleration,
  experimentalWhitespaceRendering?: codeEditorV2IEditorOptionsExperimentalWhitespaceRendering,
  renderWhitespace?: codeEditorV2IEditorOptionsRenderWhitespace,
  renderControlCharacters?: bool,
  renderLineHighlight?: codeEditorV2IEditorOptionsRenderLineHighlight,
  renderLineHighlightOnlyWhenFocus?: bool,
  useTabStops?: bool,
  trimWhitespaceOnDelete?: bool,
  fontFamily?: string,
  fontWeight?: string,
  fontSize?: float,
  lineHeight?: float,
  letterSpacing?: float,
  showUnused?: bool,
  peekWidgetDefaultFocus?: codeEditorV2IEditorOptionsPeekWidgetDefaultFocus,
  placeholder?: string,
  definitionLinkOpensInPeek?: bool,
  showDeprecated?: bool,
  matchOnWordStartOnly?: bool,
  inlayHints?: iEditorInlayHintsOptions,
  useShadowDOM?: bool,
  guides?: iGuidesOptions,
  unicodeHighlight?: iUnicodeHighlightOptions,
  bracketPairColorization?: iBracketPairColorizationOptions,
  dropIntoEditor?: iDropIntoEditorOptions,
  editContext?: bool,
  renderRichScreenReaderContent?: bool,
  pasteAs?: iPasteAsOptions,
  tabFocusMode?: bool,
  inlineCompletionsAccessibilityVerbose?: bool,
  enableSplitViewResizing?: bool,
  splitViewDefaultRatio?: float,
  renderSideBySide?: bool,
  renderSideBySideInlineBreakpoint?: float,
  useInlineViewWhenSpaceIsLimited?: bool,
  compactMode?: bool,
  maxComputationTime?: float,
  maxFileSize?: float,
  ignoreTrimWhitespace?: bool,
  renderIndicators?: bool,
  renderMarginRevertIcon?: bool,
  renderGutterMenu?: bool,
  originalEditable?: bool,
  diffCodeLens?: bool,
  renderOverviewRuler?: bool,
  diffWordWrap?: codeEditorV2IEditorOptionsWordWrapOverride1,
  diffAlgorithm?: codeEditorV2IDiffEditorOptionsDiffAlgorithm,
  accessibilityVerbose?: bool,
  experimental?: editorIDiffEditorOptionsExperimentalConfig,
  isInEmbeddedEditor?: bool,
  onlyShowAccessibleDiffViewer?: bool,
  hideUnchangedRegions?: editorIDiffEditorOptionsHideUnchangedRegionsConfig,
  dimension?: iDimension,
}
type copyFeedbackTimeoutRef = {
  ...JsxDOM.domProps,
}
type codeEditorV2BackupColorBodyGutterConfig = {
  color: string,
  backgroundColor: codeEditorV2CodeEditorV2TokensBodyGutterBackgroundColorConfig,
  borderColor: codeEditorV2CodeEditorV2TokensBodyGutterBackgroundColorConfig,
}
type codeEditorV2BackupColorBodyHighlightedLineConfig = {
  backgroundColor: string,
}
type codeEditorV2BackupColorBodyConfig = {
  backgroundColor: string,
  gutter: codeEditorV2BackupColorBodyGutterConfig,
  highlightedLine: codeEditorV2BackupColorBodyHighlightedLineConfig,
}
type codeEditorV2BackupColorConfig = {
  body: codeEditorV2BackupColorBodyConfig,
  header: codeEditorV2BackupColorBodyHighlightedLineConfig,
}
type rec multiSelectV2ItemType = {
  label: string,
  value: string,
  checked?: bool,
  subLabel?: string,
  slot1?: React.element,
  slot2?: React.element,
  slot3?: React.element,
  slot4?: React.element,
  disabled?: bool,
  onClick?: unit => unit,
  tooltip?: React.element,
  tooltipProps?: SelectV2Types.selectV2TooltipProps,
  disableTruncation?: bool,
  alwaysSelected?: bool,
  subMenu?: array<multiSelectV2ItemType>,
}
type multiSelectV2GroupType = {
  groupLabel?: string,
  items: array<multiSelectV2ItemType>,
  showSeparator?: bool,
}
type multiSelectV2PrimaryActionConfig = {
  text: string,
  onClick: array<string> => unit,
  disabled?: bool,
  loading?: bool,
}
type multiSelectV2SecondaryActionConfig = {
  text: string,
  onClick: unit => unit,
  disabled?: bool,
  loading?: bool,
}
type flattenedMultiSelectV2Item = {
  id: string,
  @as("type") type_: multiSelectV2FlattenedMultiSelectV2ItemType,
  item?: multiSelectV2ItemType,
  label?: string,
  groupId?: float,
}
type multiSelectV2GetMultiSelectCrossBorderRadiusConfig = {
  borderRadius: string,
  borderRight?: string,
}
type multiSelectV2GetSelectAllStateConfig = {
  allSelected: bool,
  someSelected: bool,
}
type flattenedItem = {
  id: string,
  @as("type") type_: multiSelectV2FlattenedMultiSelectV2ItemType,
  item?: singleSelectV2ItemType,
  label?: string,
  groupId?: float,
}
type virtualItemShape = {
  key: CommonTypes.stringOrNumberOrBigInt,
  index: int,
  start: float,
}
type singleSelectV2GetSingleSelectV2BorderRadiusConfig = {
  borderRadius: string,
  borderRight?: string,
}
type singleSelectV2GenerateAccessibilityIdsOptionsConfig = {
  hasLabel?: bool,
  hasHintText?: bool,
  hasErrorMessage?: bool,
  needsMenuId?: bool,
}
type singleSelectV2GenerateAccessibilityIdsConfig = {
  labelId?: string,
  hintTextId?: string,
  errorMessageId?: string,
  menuId?: string,
}
type extractedAriaProps = {
  @as("aria-describedby") ariaDescribedby?: string,
  @as("aria-label") ariaLabel?: string,
  @as("aria-labelledby") ariaLabelledby?: string,
  restProps: Dict.t<JSON.t>,
}
type singleSelectV2BuildAriaAttributesOptionsConfig = {
  error?: bool,
  ariaLabelledBy?: string,
  ariaDescribedBy?: string,
  ariaLabel?: string,
  restProps?: Dict.t<JSON.t>,
}
type ariaAttributes = {
  @as("aria-describedby") ariaDescribedby?: string,
  @as("aria-label") ariaLabel?: string,
  @as("aria-labelledby") ariaLabelledby?: string,
  @as("aria-invalid") ariaInvalid?: bool,
}
type accessibilitySetupOptions = {
  name?: string,
  generatedId: string,
  label?: string,
  hintText?: string,
  error?: bool,
  errorMessage?: string,
  rest?: Dict.t<JSON.t>,
  prefix?: string,
  needsMenuId?: bool,
}
type accessibilitySetupResult = {
  uniqueName: string,
  labelId?: string,
  hintTextId?: string,
  errorMessageId?: string,
  menuId?: string,
  ariaAttributes: ariaAttributes,
}
type singleSelectV2VIRTUALROWESTIMATESConfig = {
  label: string,  // ⚪ loose — was `32`
  separator: string,  // ⚪ loose — was `8`
  item: string,  // ⚪ loose — was `38`
  itemWithSubLabel: string,  // ⚪ loose — was `58`
}
type chatInputV2TopQuery = {
  id: string,
  text: string,
}
type chatInputV2AttachedFile = {
  id: string,
  name: string,
  @as("type") type_: ChatInputTypes.chatInputAttachedFileType,
  size?: float,
  url?: string,
  preview?: string,
}
module InputsV2Dropdown = {
  type t
  external fromTextInputV2Dropdown: textInputV2Dropdown => t = "%identity"
  external fromTextInputV2Dropdowns: array<textInputV2Dropdown> => t = "%identity"
}
