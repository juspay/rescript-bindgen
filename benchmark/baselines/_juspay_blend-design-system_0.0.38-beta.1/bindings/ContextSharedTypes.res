type inputSizeV2 =
  | @as("sm") Sm
  | @as("md") Md
  | @as("lg") Lg
type uploadErrorReasonValue =
  | @as("oversized") Oversized
  | @as("maxFiles") MaxFiles
  | @as("invalidType") InvalidType
type uploadStateInputsV2 =
  | @as("idle") Idle
  | @as("uploading") Uploading
  | @as("success") Success
  | @as("error") Error
  | @as("disabled") Disabled
type contextComponentTokensMENUSmItemCheckmarkPosition =
  | @as("leading") Leading
  | @as("trailing") Trailing
type contextComponentTokensCODEEDITORV2SmTheme =
  | @as("dark") Dark
  | @as("light") Light
type menuItemVariant =
  | @as("default") Default
  | @as("action") Action
type menuItemActionType =
  | @as("primary") Primary
  | @as("danger") Danger
type menuSelectionStyle =
  | @as("checkmark") Checkmark
  | @as("highlight") HighlightSelectionStyle
type menuSelectionMode =
  | @as("multiple") Multiple
  | @as("single") Single
type menuAlignment =
  | @as("start") Start
  | @as("center") CenterMenuAlignment
  | @as("end") EndMenuAlignment
type menuSide =
  | @as("top") Top
  | @as("left") LeftMenuSide
  | @as("right") RightMenuSide
  | @as("bottom") Bottom
type menuItemSelectionStates =
  | @as("disabled") Disabled
  | @as("active") Active
  | @as("default") Default
  | @as("hover") HoverSelectionStates
  | @as("focus") Focus
  | @as("focusVisible") FocusVisible
  | @as("selected") Selected
type textInputV2DropdownPosition =
  | @as("left") LeftDropdownPosition
  | @as("right") RightDropdownPosition
type inputStateV2 =
  | @as("default") Default
  | @as("hover") HoverStateV2
  | @as("focus") Focus
  | @as("error") Error
  | @as("disabled") Disabled
type numberInputV2Direction =
  | @as("left") LeftV2Direction
  | @as("right") RightV2Direction
type codeEditorV2Variant =
  | @as("default") Default
  | @as("no-gutter") NoGutter
  | @as("diff") Diff
type codeEditorV2Language =
  | @as("ruby") Ruby
  | @as("plaintext") Plaintext
  | @as("c") C
  | @as("css") Css
  | @as("javascript") Javascript
  | @as("typescript") Typescript
  | @as("json") Json
  | @as("html") Html
  | @as("markdown") Markdown
  | @as("yaml") Yaml
  | @as("python") Python
  | @as("rust") Rust
  | @as("scss") Scss
  | @as("less") Less
  | @as("xml") Xml
  | @as("ini") Ini
  | @as("graphql") Graphql
  | @as("sql") Sql
  | @as("go") Go
  | @as("java") Java
  | @as("kotlin") Kotlin
  | @as("swift") Swift
  | @as("cpp") Cpp
  | @as("csharp") Csharp
  | @as("php") Php
  | @as("shell") Shell
  | @as("powershell") Powershell
  | @as("dockerfile") Dockerfile
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
  | @as(69) HoverEditorOption
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
  | @as(117) ScrollbarEditorOption
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
  | @as(152) WordWrapColumnEditorOption
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
  | @as(3) ExplicitChangeReason
  | @as(4) Paste
  | @as(5) Undo
  | @as(6) Redo
type codeEditorV2IMouseTargetOutsideEditorOutsidePosition =
  | @as("right") RightOutsidePosition
  | @as("left") LeftOutsidePosition
  | @as("above") Above
  | @as("below") Below
type keyCode =
  | @as(-1) DependsOnKbLayout
  | @as(0) Unknown
  | @as(1) Backspace
  | @as(2) Tab
  | @as(3) Enter
  | @as(4) Shift
  | @as(5) Ctrl
  | @as(6) AltKeyCode
  | @as(7) PauseBreak
  | @as(8) CapsLock
  | @as(9) Escape
  | @as(10) SpaceKeyCode
  | @as(11) PageUp
  | @as(12) PageDown
  | @as(13) EndKeyCode
  | @as(14) Home
  | @as(15) LeftArrow
  | @as(16) UpArrow
  | @as(17) RightArrow
  | @as(18) DownArrow
  | @as(19) InsertKeyCode
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
  | @as(58) ContextMenuKeyCode
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
  | @as(0) NoneRenderMinimap
  | @as(1) TextRenderMinimap
  | @as(2) Blocks
type defaultEndOfLine =
  | @as(1) LFOfLine
  | @as(2) CRLFOfLine
type endOfLinePreference =
  | @as(0) TextDefined
  | @as(1) LFLinePreference
  | @as(2) CRLFLinePreference
type endOfLineSequence =
  | @as(0) LFLineSequence
  | @as(1) CRLFLineSequence
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
  | @as("none") NoneOptionsAutohide
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
  | @as("blink") Blink
  | @as("solid") Solid
  | @as("smooth") SmoothCursorBlinking
  | @as("phase") Phase
  | @as("expand") Expand
type codeEditorV2IEditorOptionsMouseStyle =
  | @as("text") TextMouseStyle
  | @as("default") Default
  | @as("copy") Copy
type codeEditorV2IEditorOptionsCursorSmoothCaretAnimation =
  | @as("off") Off
  | @as("on") On
  | @as("explicit") ExplicitCaretAnimation
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
  | @as("wordWrapColumn") WordWrapColumnWordWrap
  | @as("bounded") Bounded
type codeEditorV2IEditorOptionsWordWrapOverride1 =
  | @as("inherit") Inherit
  | @as("off") Off
  | @as("on") On
type codeEditorV2IEditorOptionsWrappingIndent =
  | @as("none") NoneWrappingIndent
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
  | @as("hover") HoverActivatedOn
  | @as("click") Click
  | @as("clickAndHover") ClickAndHover
type codeEditorV2IEditorOptionsMultiCursorModifier =
  | @as("alt") AltCursorModifier
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
  | @as("insert") InsertInsertMode
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
  | @as("quotes") Quotes
  | @as("never") Never
  | @as("languageDefined") LanguageDefined
  | @as("brackets") Brackets
type codeEditorV2IEditorOptionsAutoIndent =
  | @as("none") NoneAutoIndent
  | @as("full") Full
  | @as("brackets") Brackets
  | @as("advanced") Advanced
  | @as("keep") Keep
type codeEditorV2IEditorOptionsAcceptSuggestionOnEnter =
  | @as("off") Off
  | @as("on") On
  | @as("smart") Smart
type codeEditorV2IEditorOptionsSnippetSuggestions =
  | @as("none") NoneSnippetSuggestions
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
  | @as("font") Font
  | @as("off") Off
  | @as("svg") Svg
type codeEditorV2IEditorOptionsRenderWhitespace =
  | @as("none") NoneRenderWhitespace
  | @as("all") All
  | @as("trailing") Trailing
  | @as("boundary") Boundary
  | @as("selection") Selection
type codeEditorV2IEditorOptionsRenderLineHighlight =
  | @as("none") NoneLineHighlight
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
  | @as(0) SmoothScrollType
  | @as(1) Immediate
type positionAffinity =
  | @as(0) LeftPositionAffinity
  | @as(1) RightPositionAffinity
  | @as(2) NonePositionAffinity
  | @as(3) LeftOfInjectedText
  | @as(4) RightOfInjectedText
type contentWidgetPositionPreference =
  | @as(0) EXACT
  | @as(1) ABOVE
  | @as(2) BELOW
type glyphMarginLane =
  | @as(1) LeftMarginLane
  | @as(2) CenterMarginLane
  | @as(3) RightMarginLane
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
type menuV2ItemVariant =
  | @as("default") Default
  | @as("action") Action
type menuV2ItemActionType =
  | @as("primary") Primary
  | @as("danger") Danger
type menuV2Alignment =
  | @as("start") Start
  | @as("center") CenterV2Alignment
  | @as("end") EndV2Alignment
type menuV2Side =
  | @as("top") Top
  | @as("left") LeftV2Side
  | @as("right") RightV2Side
  | @as("bottom") Bottom
type menuV2MatchRank =
  | @as(0) EXACT
  | @as(1) PREFIX
  | @as(2) SUBSTRING
  | @as(3) NONE
type multiSelectV2SelectionTagType =
  | @as("count") Count
  | @as("text") TextTagType
type multiSelectV2FlattenedMultiSelectV2ItemType =
  | @as("label") LabelItemType
  | @as("item") ItemItemType
  | @as("separator") SeparatorItemType
type uploadFileV2 = {
  id?: string,
  file: Webapi.File.t,
  isValid: bool,
  errorReason?: uploadErrorReasonValue,
}
type inputsV2ErrorConfig = {
  show: bool,
  message?: string,
}
type inputsV2UploadErrorReasonConfig = {
  @as("OVERSIZED") oversized: string,
  @as("MAX_FILES") maxFiles: string,
  @as("INVALID_TYPE") invalidType: string,
}
type contextComponentTokensTAGSSmMinWidthConfig = {
  ...JsxDOM.domProps,
}
@unboxed type mozInitialOrInheritOrInitialOrRevertEtc1owcx = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("-moz-fit-content") MozFitContent | @as("-moz-max-content") MozMaxContent | @as("-moz-min-content") MozMinContent | @as("-webkit-fit-content") WebkitFitContent | @as("-webkit-max-content") WebkitMaxContent | @as("auto") Auto | @as("fit-content") FitContent | @as("intrinsic") Intrinsic | @as("max-content") MaxContent | @as("min-content") MinContent | @as("min-intrinsic") MinIntrinsic | @as("-webkit-min-content") WebkitMinContent | Num(float) | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
@unboxed type mozInitialOrInheritOrInitialOrRevertEtc1x0av = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("none") NoneRevertEtc1x0av | @as("-moz-fit-content") MozFitContent | @as("-moz-max-content") MozMaxContent | @as("-moz-min-content") MozMinContent | @as("-webkit-fit-content") WebkitFitContent | @as("-webkit-max-content") WebkitMaxContent | @as("fit-content") FitContent | @as("intrinsic") Intrinsic | @as("max-content") MaxContent | @as("min-content") MinContent | @as("-webkit-min-content") WebkitMinContent | Num(float) | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
@unboxed type mozInitialOrInheritOrInitialOrRevertEtc1wbzz = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("-moz-fit-content") MozFitContent | @as("-moz-max-content") MozMaxContent | @as("-moz-min-content") MozMinContent | @as("-webkit-fit-content") WebkitFitContent | @as("-webkit-max-content") WebkitMaxContent | @as("auto") Auto | @as("fit-content") FitContent | @as("intrinsic") Intrinsic | @as("max-content") MaxContent | @as("min-content") MinContent | @as("min-intrinsic") MinIntrinsic | Num(float) | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
@unboxed type mozInitialOrInheritOrInitialOrRevertEtchhntk = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("normal") Normal | Num(float) | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
@unboxed type mozInitialOrInheritOrInitialOrRevertEtcgjquu = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("aliceblue") Aliceblue | @as("antiquewhite") Antiquewhite | @as("aqua") Aqua | @as("aquamarine") Aquamarine | @as("azure") Azure | @as("beige") Beige | @as("bisque") Bisque | @as("black") Black | @as("blanchedalmond") Blanchedalmond | @as("blue") Blue | @as("blueviolet") Blueviolet | @as("brown") Brown | @as("burlywood") Burlywood | @as("cadetblue") Cadetblue | @as("chartreuse") Chartreuse | @as("chocolate") Chocolate | @as("coral") Coral | @as("cornflowerblue") Cornflowerblue | @as("cornsilk") Cornsilk | @as("crimson") Crimson | @as("cyan") Cyan | @as("darkblue") Darkblue | @as("darkcyan") Darkcyan | @as("darkgoldenrod") Darkgoldenrod | @as("darkgray") Darkgray | @as("darkgreen") Darkgreen | @as("darkgrey") Darkgrey | @as("darkkhaki") Darkkhaki | @as("darkmagenta") Darkmagenta | @as("darkolivegreen") Darkolivegreen | @as("darkorange") Darkorange | @as("darkorchid") Darkorchid | @as("darkred") Darkred | @as("darksalmon") Darksalmon | @as("darkseagreen") Darkseagreen | @as("darkslateblue") Darkslateblue | @as("darkslategray") Darkslategray | @as("darkslategrey") Darkslategrey | @as("darkturquoise") Darkturquoise | @as("darkviolet") Darkviolet | @as("deeppink") Deeppink | @as("deepskyblue") Deepskyblue | @as("dimgray") Dimgray | @as("dimgrey") Dimgrey | @as("dodgerblue") Dodgerblue | @as("firebrick") Firebrick | @as("floralwhite") Floralwhite | @as("forestgreen") Forestgreen | @as("fuchsia") Fuchsia | @as("gainsboro") Gainsboro | @as("ghostwhite") Ghostwhite | @as("gold") Gold | @as("goldenrod") Goldenrod | @as("gray") Gray | @as("green") Green | @as("greenyellow") Greenyellow | @as("grey") Grey | @as("honeydew") Honeydew | @as("hotpink") Hotpink | @as("indianred") Indianred | @as("indigo") Indigo | @as("ivory") Ivory | @as("khaki") Khaki | @as("lavender") Lavender | @as("lavenderblush") Lavenderblush | @as("lawngreen") Lawngreen | @as("lemonchiffon") Lemonchiffon | @as("lightblue") Lightblue | @as("lightcoral") Lightcoral | @as("lightcyan") Lightcyan | @as("lightgoldenrodyellow") Lightgoldenrodyellow | @as("lightgray") Lightgray | @as("lightgreen") Lightgreen | @as("lightgrey") Lightgrey | @as("lightpink") Lightpink | @as("lightsalmon") Lightsalmon | @as("lightseagreen") Lightseagreen | @as("lightskyblue") Lightskyblue | @as("lightslategray") Lightslategray | @as("lightslategrey") Lightslategrey | @as("lightsteelblue") Lightsteelblue | @as("lightyellow") Lightyellow | @as("lime") Lime | @as("limegreen") Limegreen | @as("linen") Linen | @as("magenta") Magenta | @as("maroon") Maroon | @as("mediumaquamarine") Mediumaquamarine | @as("mediumblue") Mediumblue | @as("mediumorchid") Mediumorchid | @as("mediumpurple") Mediumpurple | @as("mediumseagreen") Mediumseagreen | @as("mediumslateblue") Mediumslateblue | @as("mediumspringgreen") Mediumspringgreen | @as("mediumturquoise") Mediumturquoise | @as("mediumvioletred") Mediumvioletred | @as("midnightblue") Midnightblue | @as("mintcream") Mintcream | @as("mistyrose") Mistyrose | @as("moccasin") Moccasin | @as("navajowhite") Navajowhite | @as("navy") Navy | @as("oldlace") Oldlace | @as("olive") Olive | @as("olivedrab") Olivedrab | @as("orange") Orange | @as("orangered") Orangered | @as("orchid") Orchid | @as("palegoldenrod") Palegoldenrod | @as("palegreen") Palegreen | @as("paleturquoise") Paleturquoise | @as("palevioletred") Palevioletred | @as("papayawhip") Papayawhip | @as("peachpuff") Peachpuff | @as("peru") Peru | @as("pink") Pink | @as("plum") Plum | @as("powderblue") Powderblue | @as("purple") Purple | @as("rebeccapurple") Rebeccapurple | @as("red") Red | @as("rosybrown") Rosybrown | @as("royalblue") Royalblue | @as("saddlebrown") Saddlebrown | @as("salmon") Salmon | @as("sandybrown") Sandybrown | @as("seagreen") Seagreen | @as("seashell") Seashell | @as("sienna") Sienna | @as("silver") Silver | @as("skyblue") Skyblue | @as("slateblue") Slateblue | @as("slategray") Slategray | @as("slategrey") Slategrey | @as("snow") Snow | @as("springgreen") Springgreen | @as("steelblue") Steelblue | @as("tan") Tan | @as("teal") Teal | @as("thistle") Thistle | @as("tomato") Tomato | @as("turquoise") Turquoise | @as("violet") Violet | @as("wheat") Wheat | @as("white") White | @as("whitesmoke") Whitesmoke | @as("yellow") Yellow | @as("yellowgreen") Yellowgreen | @as("transparent") Transparent | @as("AccentColor") AccentColor | @as("AccentColorText") AccentColorText | @as("ActiveText") ActiveText | @as("ButtonBorder") ButtonBorder | @as("ButtonFace") ButtonFace | @as("ButtonText") ButtonText | @as("Canvas") Canvas | @as("CanvasText") CanvasText | @as("Field") Field | @as("FieldText") FieldText | @as("GrayText") GrayText | @as("Highlight") HighlightRevertEtcgjquu | @as("HighlightText") HighlightText | @as("LinkText") LinkText | @as("Mark") Mark | @as("MarkText") MarkText | @as("SelectedItem") SelectedItem | @as("SelectedItemText") SelectedItemText | @as("VisitedText") VisitedText | @as("ActiveBorder") ActiveBorder | @as("ActiveCaption") ActiveCaption | @as("AppWorkspace") AppWorkspace | @as("Background") Background | @as("ButtonHighlight") ButtonHighlight | @as("ButtonShadow") ButtonShadow | @as("CaptionText") CaptionText | @as("InactiveBorder") InactiveBorder | @as("InactiveCaption") InactiveCaption | @as("InactiveCaptionText") InactiveCaptionText | @as("InfoBackground") InfoBackground | @as("InfoText") InfoText | @as("Menu") Menu | @as("MenuText") MenuText | @as("Scrollbar") ScrollbarRevertEtcgjquu | @as("ThreeDDarkShadow") ThreeDDarkShadow | @as("ThreeDFace") ThreeDFace | @as("ThreeDHighlight") ThreeDHighlight | @as("ThreeDLightShadow") ThreeDLightShadow | @as("ThreeDShadow") ThreeDShadow | @as("Window") Window | @as("WindowFrame") WindowFrame | @as("WindowText") WindowText | @as("currentColor") CurrentColor | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensTAGSSmBackgroundColorNoFillConfig = {
  neutral?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  primary?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  success?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  error?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  warning?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  purple?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensTAGSSmBackgroundColorConfig = {
  noFill?: contextComponentTokensTAGSSmBackgroundColorNoFillConfig,
  attentive?: contextComponentTokensTAGSSmBackgroundColorNoFillConfig,
  subtle?: contextComponentTokensTAGSSmBackgroundColorNoFillConfig,
}
@unboxed type mozInitialOrInheritOrInitialOrRevertEtcp2j1f = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | Num(float) | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensTAGSSmBorderRadiusXsConfig = {
  rounded?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  squarical?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensTAGSSmBorderRadiusConfig = {
  xs?: contextComponentTokensTAGSSmBorderRadiusXsConfig,
  sm?: contextComponentTokensTAGSSmBorderRadiusXsConfig,
  md?: contextComponentTokensTAGSSmBorderRadiusXsConfig,
  lg?: contextComponentTokensTAGSSmBorderRadiusXsConfig,
}
type contextComponentTokensTAGSSmPaddingConfig = {
  xs?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  sm?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  md?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  lg?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
@unboxed type mozInitialOrInheritOrInitialOrRevertEtc1yz1q = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("none") NoneRevertEtc1yz1q | @as("medium") Medium | @as("thick") Thick | @as("thin") Thin | @as("aliceblue") Aliceblue | @as("antiquewhite") Antiquewhite | @as("aqua") Aqua | @as("aquamarine") Aquamarine | @as("azure") Azure | @as("beige") Beige | @as("bisque") Bisque | @as("black") Black | @as("blanchedalmond") Blanchedalmond | @as("blue") Blue | @as("blueviolet") Blueviolet | @as("brown") Brown | @as("burlywood") Burlywood | @as("cadetblue") Cadetblue | @as("chartreuse") Chartreuse | @as("chocolate") Chocolate | @as("coral") Coral | @as("cornflowerblue") Cornflowerblue | @as("cornsilk") Cornsilk | @as("crimson") Crimson | @as("cyan") Cyan | @as("darkblue") Darkblue | @as("darkcyan") Darkcyan | @as("darkgoldenrod") Darkgoldenrod | @as("darkgray") Darkgray | @as("darkgreen") Darkgreen | @as("darkgrey") Darkgrey | @as("darkkhaki") Darkkhaki | @as("darkmagenta") Darkmagenta | @as("darkolivegreen") Darkolivegreen | @as("darkorange") Darkorange | @as("darkorchid") Darkorchid | @as("darkred") Darkred | @as("darksalmon") Darksalmon | @as("darkseagreen") Darkseagreen | @as("darkslateblue") Darkslateblue | @as("darkslategray") Darkslategray | @as("darkslategrey") Darkslategrey | @as("darkturquoise") Darkturquoise | @as("darkviolet") Darkviolet | @as("deeppink") Deeppink | @as("deepskyblue") Deepskyblue | @as("dimgray") Dimgray | @as("dimgrey") Dimgrey | @as("dodgerblue") Dodgerblue | @as("firebrick") Firebrick | @as("floralwhite") Floralwhite | @as("forestgreen") Forestgreen | @as("fuchsia") Fuchsia | @as("gainsboro") Gainsboro | @as("ghostwhite") Ghostwhite | @as("gold") Gold | @as("goldenrod") Goldenrod | @as("gray") Gray | @as("green") Green | @as("greenyellow") Greenyellow | @as("grey") Grey | @as("honeydew") Honeydew | @as("hotpink") Hotpink | @as("indianred") Indianred | @as("indigo") Indigo | @as("ivory") Ivory | @as("khaki") Khaki | @as("lavender") Lavender | @as("lavenderblush") Lavenderblush | @as("lawngreen") Lawngreen | @as("lemonchiffon") Lemonchiffon | @as("lightblue") Lightblue | @as("lightcoral") Lightcoral | @as("lightcyan") Lightcyan | @as("lightgoldenrodyellow") Lightgoldenrodyellow | @as("lightgray") Lightgray | @as("lightgreen") Lightgreen | @as("lightgrey") Lightgrey | @as("lightpink") Lightpink | @as("lightsalmon") Lightsalmon | @as("lightseagreen") Lightseagreen | @as("lightskyblue") Lightskyblue | @as("lightslategray") Lightslategray | @as("lightslategrey") Lightslategrey | @as("lightsteelblue") Lightsteelblue | @as("lightyellow") Lightyellow | @as("lime") Lime | @as("limegreen") Limegreen | @as("linen") Linen | @as("magenta") Magenta | @as("maroon") Maroon | @as("mediumaquamarine") Mediumaquamarine | @as("mediumblue") Mediumblue | @as("mediumorchid") Mediumorchid | @as("mediumpurple") Mediumpurple | @as("mediumseagreen") Mediumseagreen | @as("mediumslateblue") Mediumslateblue | @as("mediumspringgreen") Mediumspringgreen | @as("mediumturquoise") Mediumturquoise | @as("mediumvioletred") Mediumvioletred | @as("midnightblue") Midnightblue | @as("mintcream") Mintcream | @as("mistyrose") Mistyrose | @as("moccasin") Moccasin | @as("navajowhite") Navajowhite | @as("navy") Navy | @as("oldlace") Oldlace | @as("olive") Olive | @as("olivedrab") Olivedrab | @as("orange") Orange | @as("orangered") Orangered | @as("orchid") Orchid | @as("palegoldenrod") Palegoldenrod | @as("palegreen") Palegreen | @as("paleturquoise") Paleturquoise | @as("palevioletred") Palevioletred | @as("papayawhip") Papayawhip | @as("peachpuff") Peachpuff | @as("peru") Peru | @as("pink") Pink | @as("plum") Plum | @as("powderblue") Powderblue | @as("purple") Purple | @as("rebeccapurple") Rebeccapurple | @as("red") Red | @as("rosybrown") Rosybrown | @as("royalblue") Royalblue | @as("saddlebrown") Saddlebrown | @as("salmon") Salmon | @as("sandybrown") Sandybrown | @as("seagreen") Seagreen | @as("seashell") Seashell | @as("sienna") Sienna | @as("silver") Silver | @as("skyblue") Skyblue | @as("slateblue") Slateblue | @as("slategray") Slategray | @as("slategrey") Slategrey | @as("snow") Snow | @as("springgreen") Springgreen | @as("steelblue") Steelblue | @as("tan") Tan | @as("teal") Teal | @as("thistle") Thistle | @as("tomato") Tomato | @as("turquoise") Turquoise | @as("violet") Violet | @as("wheat") Wheat | @as("white") White | @as("whitesmoke") Whitesmoke | @as("yellow") Yellow | @as("yellowgreen") Yellowgreen | @as("transparent") Transparent | @as("AccentColor") AccentColor | @as("AccentColorText") AccentColorText | @as("ActiveText") ActiveText | @as("ButtonBorder") ButtonBorder | @as("ButtonFace") ButtonFace | @as("ButtonText") ButtonText | @as("Canvas") Canvas | @as("CanvasText") CanvasText | @as("Field") Field | @as("FieldText") FieldText | @as("GrayText") GrayText | @as("Highlight") HighlightRevertEtc1yz1q | @as("HighlightText") HighlightText | @as("LinkText") LinkText | @as("Mark") Mark | @as("MarkText") MarkText | @as("SelectedItem") SelectedItem | @as("SelectedItemText") SelectedItemText | @as("VisitedText") VisitedText | @as("ActiveBorder") ActiveBorder | @as("ActiveCaption") ActiveCaption | @as("AppWorkspace") AppWorkspace | @as("Background") Background | @as("ButtonHighlight") ButtonHighlight | @as("ButtonShadow") ButtonShadow | @as("CaptionText") CaptionText | @as("InactiveBorder") InactiveBorder | @as("InactiveCaption") InactiveCaption | @as("InactiveCaptionText") InactiveCaptionText | @as("InfoBackground") InfoBackground | @as("InfoText") InfoText | @as("Menu") Menu | @as("MenuText") MenuText | @as("Scrollbar") ScrollbarRevertEtc1yz1q | @as("ThreeDDarkShadow") ThreeDDarkShadow | @as("ThreeDFace") ThreeDFace | @as("ThreeDHighlight") ThreeDHighlight | @as("ThreeDLightShadow") ThreeDLightShadow | @as("ThreeDShadow") ThreeDShadow | @as("Window") Window | @as("WindowFrame") WindowFrame | @as("WindowText") WindowText | @as("currentColor") CurrentColor | @as("hidden") Hidden | @as("dashed") Dashed | @as("dotted") Dotted | @as("double") Double | @as("groove") Groove | @as("inset") Inset | @as("outset") Outset | @as("ridge") Ridge | @as("solid") Solid | Num(float) | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensTAGSSmBorderNoFillConfig = {
  neutral?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  primary?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  success?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  error?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  warning?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  purple?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensTAGSSmBorderConfig = {
  noFill?: contextComponentTokensTAGSSmBorderNoFillConfig,
  attentive?: contextComponentTokensTAGSSmBorderNoFillConfig,
  subtle?: contextComponentTokensTAGSSmBorderNoFillConfig,
}
@unboxed type mozInitialOrInheritOrInitialOrRevertEtcly7v7 = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("medium") Medium | @as("math") Math | @as("large") Large | @as("small") Small | @as("x-large") XLarge | @as("x-small") XSmall | @as("xx-large") XxLarge | @as("xx-small") XxSmall | @as("xxx-large") XxxLarge | @as("larger") Larger | @as("smaller") Smaller | Num(float) | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensTAGSSmTextFontSizeConfig = {
  xs?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  sm?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  md?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  lg?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
}
type contextComponentTokensTAGSSmTextFontWeightConfig = {
  xs?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  sm?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  md?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  lg?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
}
type contextComponentTokensTAGSSmTextConfig = {
  color?: contextComponentTokensTAGSSmBackgroundColorConfig,
  fontSize?: contextComponentTokensTAGSSmTextFontSizeConfig,
  fontWeight?: contextComponentTokensTAGSSmTextFontWeightConfig,
}
type contextComponentTokensTAGSSmConfig = {
  minWidth?: mozInitialOrInheritOrInitialOrRevertEtc1owcx,
  maxWidth?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  backgroundColor?: contextComponentTokensTAGSSmBackgroundColorConfig,
  borderRadius?: contextComponentTokensTAGSSmBorderRadiusConfig,
  padding?: contextComponentTokensTAGSSmPaddingConfig,
  border?: contextComponentTokensTAGSSmBorderConfig,
  text?: contextComponentTokensTAGSSmTextConfig,
}
type contextComponentTokensTAGSConfig = {
  sm?: contextComponentTokensTAGSSmConfig,
  lg?: contextComponentTokensTAGSSmConfig,
}
type contextComponentTokensSEARCHINPUTSmLabelColorConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  focus?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  error?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensSEARCHINPUTSmLabelConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
}
type contextComponentTokensSEARCHINPUTSmErrorMessageConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensSEARCHINPUTSmRequiredConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig = {
  x?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  y?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensSEARCHINPUTSmInputContainerBorderBottomConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  hover?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  focus?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  error?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
@unboxed type mozInitialOrInheritOrInitialOrRevertEtcsclw8 = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("none") NoneRevertEtcsclw8 | @as("medium") Medium | @as("thick") Thick | @as("thin") Thin | @as("auto") Auto | @as("aliceblue") Aliceblue | @as("antiquewhite") Antiquewhite | @as("aqua") Aqua | @as("aquamarine") Aquamarine | @as("azure") Azure | @as("beige") Beige | @as("bisque") Bisque | @as("black") Black | @as("blanchedalmond") Blanchedalmond | @as("blue") Blue | @as("blueviolet") Blueviolet | @as("brown") Brown | @as("burlywood") Burlywood | @as("cadetblue") Cadetblue | @as("chartreuse") Chartreuse | @as("chocolate") Chocolate | @as("coral") Coral | @as("cornflowerblue") Cornflowerblue | @as("cornsilk") Cornsilk | @as("crimson") Crimson | @as("cyan") Cyan | @as("darkblue") Darkblue | @as("darkcyan") Darkcyan | @as("darkgoldenrod") Darkgoldenrod | @as("darkgray") Darkgray | @as("darkgreen") Darkgreen | @as("darkgrey") Darkgrey | @as("darkkhaki") Darkkhaki | @as("darkmagenta") Darkmagenta | @as("darkolivegreen") Darkolivegreen | @as("darkorange") Darkorange | @as("darkorchid") Darkorchid | @as("darkred") Darkred | @as("darksalmon") Darksalmon | @as("darkseagreen") Darkseagreen | @as("darkslateblue") Darkslateblue | @as("darkslategray") Darkslategray | @as("darkslategrey") Darkslategrey | @as("darkturquoise") Darkturquoise | @as("darkviolet") Darkviolet | @as("deeppink") Deeppink | @as("deepskyblue") Deepskyblue | @as("dimgray") Dimgray | @as("dimgrey") Dimgrey | @as("dodgerblue") Dodgerblue | @as("firebrick") Firebrick | @as("floralwhite") Floralwhite | @as("forestgreen") Forestgreen | @as("fuchsia") Fuchsia | @as("gainsboro") Gainsboro | @as("ghostwhite") Ghostwhite | @as("gold") Gold | @as("goldenrod") Goldenrod | @as("gray") Gray | @as("green") Green | @as("greenyellow") Greenyellow | @as("grey") Grey | @as("honeydew") Honeydew | @as("hotpink") Hotpink | @as("indianred") Indianred | @as("indigo") Indigo | @as("ivory") Ivory | @as("khaki") Khaki | @as("lavender") Lavender | @as("lavenderblush") Lavenderblush | @as("lawngreen") Lawngreen | @as("lemonchiffon") Lemonchiffon | @as("lightblue") Lightblue | @as("lightcoral") Lightcoral | @as("lightcyan") Lightcyan | @as("lightgoldenrodyellow") Lightgoldenrodyellow | @as("lightgray") Lightgray | @as("lightgreen") Lightgreen | @as("lightgrey") Lightgrey | @as("lightpink") Lightpink | @as("lightsalmon") Lightsalmon | @as("lightseagreen") Lightseagreen | @as("lightskyblue") Lightskyblue | @as("lightslategray") Lightslategray | @as("lightslategrey") Lightslategrey | @as("lightsteelblue") Lightsteelblue | @as("lightyellow") Lightyellow | @as("lime") Lime | @as("limegreen") Limegreen | @as("linen") Linen | @as("magenta") Magenta | @as("maroon") Maroon | @as("mediumaquamarine") Mediumaquamarine | @as("mediumblue") Mediumblue | @as("mediumorchid") Mediumorchid | @as("mediumpurple") Mediumpurple | @as("mediumseagreen") Mediumseagreen | @as("mediumslateblue") Mediumslateblue | @as("mediumspringgreen") Mediumspringgreen | @as("mediumturquoise") Mediumturquoise | @as("mediumvioletred") Mediumvioletred | @as("midnightblue") Midnightblue | @as("mintcream") Mintcream | @as("mistyrose") Mistyrose | @as("moccasin") Moccasin | @as("navajowhite") Navajowhite | @as("navy") Navy | @as("oldlace") Oldlace | @as("olive") Olive | @as("olivedrab") Olivedrab | @as("orange") Orange | @as("orangered") Orangered | @as("orchid") Orchid | @as("palegoldenrod") Palegoldenrod | @as("palegreen") Palegreen | @as("paleturquoise") Paleturquoise | @as("palevioletred") Palevioletred | @as("papayawhip") Papayawhip | @as("peachpuff") Peachpuff | @as("peru") Peru | @as("pink") Pink | @as("plum") Plum | @as("powderblue") Powderblue | @as("purple") Purple | @as("rebeccapurple") Rebeccapurple | @as("red") Red | @as("rosybrown") Rosybrown | @as("royalblue") Royalblue | @as("saddlebrown") Saddlebrown | @as("salmon") Salmon | @as("sandybrown") Sandybrown | @as("seagreen") Seagreen | @as("seashell") Seashell | @as("sienna") Sienna | @as("silver") Silver | @as("skyblue") Skyblue | @as("slateblue") Slateblue | @as("slategray") Slategray | @as("slategrey") Slategrey | @as("snow") Snow | @as("springgreen") Springgreen | @as("steelblue") Steelblue | @as("tan") Tan | @as("teal") Teal | @as("thistle") Thistle | @as("tomato") Tomato | @as("turquoise") Turquoise | @as("violet") Violet | @as("wheat") Wheat | @as("white") White | @as("whitesmoke") Whitesmoke | @as("yellow") Yellow | @as("yellowgreen") Yellowgreen | @as("transparent") Transparent | @as("AccentColor") AccentColor | @as("AccentColorText") AccentColorText | @as("ActiveText") ActiveText | @as("ButtonBorder") ButtonBorder | @as("ButtonFace") ButtonFace | @as("ButtonText") ButtonText | @as("Canvas") Canvas | @as("CanvasText") CanvasText | @as("Field") Field | @as("FieldText") FieldText | @as("GrayText") GrayText | @as("Highlight") HighlightRevertEtcsclw8 | @as("HighlightText") HighlightText | @as("LinkText") LinkText | @as("Mark") Mark | @as("MarkText") MarkText | @as("SelectedItem") SelectedItem | @as("SelectedItemText") SelectedItemText | @as("VisitedText") VisitedText | @as("ActiveBorder") ActiveBorder | @as("ActiveCaption") ActiveCaption | @as("AppWorkspace") AppWorkspace | @as("Background") Background | @as("ButtonHighlight") ButtonHighlight | @as("ButtonShadow") ButtonShadow | @as("CaptionText") CaptionText | @as("InactiveBorder") InactiveBorder | @as("InactiveCaption") InactiveCaption | @as("InactiveCaptionText") InactiveCaptionText | @as("InfoBackground") InfoBackground | @as("InfoText") InfoText | @as("Menu") Menu | @as("MenuText") MenuText | @as("Scrollbar") ScrollbarRevertEtcsclw8 | @as("ThreeDDarkShadow") ThreeDDarkShadow | @as("ThreeDFace") ThreeDFace | @as("ThreeDHighlight") ThreeDHighlight | @as("ThreeDLightShadow") ThreeDLightShadow | @as("ThreeDShadow") ThreeDShadow | @as("Window") Window | @as("WindowFrame") WindowFrame | @as("WindowText") WindowText | @as("currentColor") CurrentColor | @as("dashed") Dashed | @as("dotted") Dotted | @as("double") Double | @as("groove") Groove | @as("inset") Inset | @as("outset") Outset | @as("ridge") Ridge | @as("solid") Solid | Num(float) | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
@unboxed type mozInitialOrInheritOrInitialOrRevertEtcz3a4s = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("none") NoneRevertEtcz3a4s | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensSEARCHINPUTSmInputContainerConfig = {
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  borderBottom?: contextComponentTokensSEARCHINPUTSmInputContainerBorderBottomConfig,
  outline?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
}
type contextComponentTokensSEARCHINPUTSmIconConfig = {
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
}
type contextComponentTokensSEARCHINPUTSmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  label?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  subLabel?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  hintText?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  errorMessage?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  required?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  inputContainer?: contextComponentTokensSEARCHINPUTSmInputContainerConfig,
  icon?: contextComponentTokensSEARCHINPUTSmIconConfig,
}
type contextComponentTokensSEARCHINPUTConfig = {
  sm?: contextComponentTokensSEARCHINPUTSmConfig,
  lg?: contextComponentTokensSEARCHINPUTSmConfig,
}
type contextComponentTokensTEXTAREASmPlaceholderConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
}
type contextComponentTokensTEXTAREASmHelpIconConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
}
type contextComponentTokensTEXTAREASmInputContainerConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  border?: contextComponentTokensSEARCHINPUTSmInputContainerBorderBottomConfig,
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  backgroundColor?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
}
type contextComponentTokensTEXTAREASmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  placeholder?: contextComponentTokensTEXTAREASmPlaceholderConfig,
  label?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  subLabel?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  helpIcon?: contextComponentTokensTEXTAREASmHelpIconConfig,
  hintText?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  errorMessage?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  required?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  inputContainer?: contextComponentTokensTEXTAREASmInputContainerConfig,
}
type contextComponentTokensTEXTAREAConfig = {
  sm?: contextComponentTokensTEXTAREASmConfig,
  lg?: contextComponentTokensTEXTAREASmConfig,
}
type contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig = {
  sm?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  md?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  lg?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
}
type contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig = {
  sm?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  md?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  lg?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
}
type contextComponentTokensTEXTAREAV2SmTopContainerLabelConfig = {
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  lineHeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
}
type contextComponentTokensTEXTAREAV2SmTopContainerHelpIconWidthConfig = {
  sm?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  md?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  lg?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
}
type contextComponentTokensTEXTAREAV2SmTopContainerHelpIconConfig = {
  width?: contextComponentTokensTEXTAREAV2SmTopContainerHelpIconWidthConfig,
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
}
type contextComponentTokensTEXTAREAV2SmTopContainerConfig = {
  label?: contextComponentTokensTEXTAREAV2SmTopContainerLabelConfig,
  subLabel?: contextComponentTokensTEXTAREAV2SmTopContainerLabelConfig,
  required?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  helpIcon?: contextComponentTokensTEXTAREAV2SmTopContainerHelpIconConfig,
}
@unboxed type mozInitialOrInheritOrInitialOrRevertEtcydel2 = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("none") NoneRevertEtcydel2 | @as("normal") Normal | @as("ease") Ease | @as("ease-in") EaseIn | @as("ease-in-out") EaseInOut | @as("ease-out") EaseOut | @as("step-end") StepEnd | @as("step-start") StepStart | @as("linear") Linear | @as("all") All | @as("allow-discrete") AllowDiscrete | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensTEXTAREAV2SmInputContainerPlaceholderConfig = {
  transition?: mozInitialOrInheritOrInitialOrRevertEtcydel2,
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  lineHeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
}
type contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig = {
  sm?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  md?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  lg?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensTEXTAREAV2SmInputContainerPaddingConfig = {
  top?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  right?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  bottom?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  left?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
}
type contextComponentTokensTEXTAREAV2SmInputContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  placeholder?: contextComponentTokensTEXTAREAV2SmInputContainerPlaceholderConfig,
  lineHeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  padding?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingConfig,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  border?: contextComponentTokensSEARCHINPUTSmInputContainerBorderBottomConfig,
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  backgroundColor?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
}
type contextComponentTokensTEXTAREAV2SmBottomContainerErrorMessageConfig = {
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  lineHeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensTEXTAREAV2SmBottomContainerConfig = {
  hintText?: contextComponentTokensTEXTAREAV2SmTopContainerLabelConfig,
  errorMessage?: contextComponentTokensTEXTAREAV2SmBottomContainerErrorMessageConfig,
}
type contextComponentTokensTEXTAREAV2SmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  topContainer?: contextComponentTokensTEXTAREAV2SmTopContainerConfig,
  inputContainer?: contextComponentTokensTEXTAREAV2SmInputContainerConfig,
  bottomContainer?: contextComponentTokensTEXTAREAV2SmBottomContainerConfig,
}
type contextComponentTokensTEXTAREAV2Config = {
  sm?: contextComponentTokensTEXTAREAV2SmConfig,
  lg?: contextComponentTokensTEXTAREAV2SmConfig,
}
type contextComponentTokensRADIOSmGroupConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensRADIOSmIndicatorActiveBackgroundColorConfig = {
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  error?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensRADIOSmIndicatorActiveConfig = {
  backgroundColor?: contextComponentTokensRADIOSmIndicatorActiveBackgroundColorConfig,
  borderColor?: contextComponentTokensRADIOSmIndicatorActiveBackgroundColorConfig,
}
type contextComponentTokensRADIOSmIndicatorConfig = {
  active?: contextComponentTokensRADIOSmIndicatorActiveConfig,
  inactive?: contextComponentTokensRADIOSmIndicatorActiveConfig,
}
type contextComponentTokensRADIOSmActiveIndicatorActiveBackgroundColorConfig = {
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensRADIOSmActiveIndicatorActiveConfig = {
  backgroundColor?: contextComponentTokensRADIOSmActiveIndicatorActiveBackgroundColorConfig,
}
type contextComponentTokensRADIOSmActiveIndicatorConfig = {
  active?: contextComponentTokensRADIOSmActiveIndicatorActiveConfig,
}
type contextComponentTokensRADIOSmContentLabelFontSizeConfig = {
  sm?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  md?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
}
type contextComponentTokensRADIOSmContentLabelFontWeightConfig = {
  sm?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  md?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
}
type contextComponentTokensRADIOSmContentLabelConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  color?: contextComponentTokensRADIOSmIndicatorActiveBackgroundColorConfig,
  fontSize?: contextComponentTokensRADIOSmContentLabelFontSizeConfig,
  fontWeight?: contextComponentTokensRADIOSmContentLabelFontWeightConfig,
}
type contextComponentTokensRADIOSmContentSublabelConfig = {
  color?: contextComponentTokensRADIOSmIndicatorActiveBackgroundColorConfig,
  fontSize?: contextComponentTokensRADIOSmContentLabelFontSizeConfig,
  fontWeight?: contextComponentTokensRADIOSmContentLabelFontWeightConfig,
}
type contextComponentTokensRADIOSmContentConfig = {
  label?: contextComponentTokensRADIOSmContentLabelConfig,
  sublabel?: contextComponentTokensRADIOSmContentSublabelConfig,
}
@unboxed type mozInitialOrInheritOrInitialOrRevertEtc1avg4 = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("-moz-fit-content") MozFitContent | @as("-moz-max-content") MozMaxContent | @as("-moz-min-content") MozMinContent | @as("-webkit-fit-content") WebkitFitContent | @as("auto") Auto | @as("fit-content") FitContent | @as("max-content") MaxContent | @as("min-content") MinContent | Num(float) | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensRADIOSmHeightConfig = {
  sm?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  md?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
}
type contextComponentTokensRADIOSmBorderWidthActiveConfig = {
  disabled?: float,
  default?: float,
  hover?: float,
  error?: float,
}
type contextComponentTokensRADIOSmBorderWidthConfig = {
  active?: contextComponentTokensRADIOSmBorderWidthActiveConfig,
  inactive?: contextComponentTokensRADIOSmBorderWidthActiveConfig,
}
type contextComponentTokensRADIOSmSlotConfig = {
  sm?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  md?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
}
type contextComponentTokensRADIOSmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  group?: contextComponentTokensRADIOSmGroupConfig,
  indicator?: contextComponentTokensRADIOSmIndicatorConfig,
  activeIndicator?: contextComponentTokensRADIOSmActiveIndicatorConfig,
  content?: contextComponentTokensRADIOSmContentConfig,
  height?: contextComponentTokensRADIOSmHeightConfig,
  borderWidth?: contextComponentTokensRADIOSmBorderWidthConfig,
  slot?: contextComponentTokensRADIOSmSlotConfig,
  required?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
}
type contextComponentTokensRADIOConfig = {
  sm?: contextComponentTokensRADIOSmConfig,
  lg?: contextComponentTokensRADIOSmConfig,
}
type contextComponentTokensSWITCHSmSwitchContainerBorderRadiusConfig = {
  sm?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  md?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensSWITCHSmSwitchContainerBackgroundColorConfig = {
  active?: contextComponentTokensRADIOSmIndicatorActiveBackgroundColorConfig,
  inactive?: contextComponentTokensRADIOSmIndicatorActiveBackgroundColorConfig,
}
@unboxed type mozInitialOrInheritOrInitialOrRevertEtcrrza2 = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("medium") Medium | @as("thick") Thick | @as("thin") Thin | Num(float) | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensSWITCHSmSwitchContainerThumbBorderConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  width?: mozInitialOrInheritOrInitialOrRevertEtcrrza2,
}
@unboxed type mozInitialOrInheritOrInitialOrRevertEtcrldf7 = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("auto") Auto | Num(float) | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensSWITCHSmSwitchContainerThumbSizeSmConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  top?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  left?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  offset?: string,  // ⚪ loose — was `{ active?: number | Globals | "auto" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?`
}
type contextComponentTokensSWITCHSmSwitchContainerThumbSizeConfig = {
  sm?: contextComponentTokensSWITCHSmSwitchContainerThumbSizeSmConfig,
  md?: contextComponentTokensSWITCHSmSwitchContainerThumbSizeSmConfig,
}
type contextComponentTokensSWITCHSmSwitchContainerThumbConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  border?: contextComponentTokensSWITCHSmSwitchContainerThumbBorderConfig,
  borderRadius?: contextComponentTokensSWITCHSmSwitchContainerBorderRadiusConfig,
  size?: contextComponentTokensSWITCHSmSwitchContainerThumbSizeConfig,
  outline?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
  outlineOffset?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
}
type contextComponentTokensSWITCHSmSwitchContainerConfig = {
  height?: contextComponentTokensRADIOSmHeightConfig,
  width?: contextComponentTokensRADIOSmSlotConfig,
  borderRadius?: contextComponentTokensSWITCHSmSwitchContainerBorderRadiusConfig,
  backgroundColor?: contextComponentTokensSWITCHSmSwitchContainerBackgroundColorConfig,
  thumb?: contextComponentTokensSWITCHSmSwitchContainerThumbConfig,
}
type contextComponentTokensSWITCHSmContentLabelConfig = {
  color?: contextComponentTokensRADIOSmIndicatorActiveBackgroundColorConfig,
  fontSize?: contextComponentTokensRADIOSmContentLabelFontSizeConfig,
  fontWeight?: contextComponentTokensRADIOSmContentLabelFontWeightConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensSWITCHSmContentConfig = {
  label?: contextComponentTokensSWITCHSmContentLabelConfig,
  subtext?: contextComponentTokensRADIOSmContentSublabelConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensSWITCHSmSlotConfig = {
  width?: contextComponentTokensRADIOSmSlotConfig,
  height?: contextComponentTokensRADIOSmHeightConfig,
}
type contextComponentTokensSWITCHSmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  switchContainer?: contextComponentTokensSWITCHSmSwitchContainerConfig,
  content?: contextComponentTokensSWITCHSmContentConfig,
  required?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  slot?: contextComponentTokensSWITCHSmSlotConfig,
}
type contextComponentTokensSWITCHConfig = {
  sm?: contextComponentTokensSWITCHSmConfig,
  lg?: contextComponentTokensSWITCHSmConfig,
}
type contextComponentTokensTEXTINPUTSmInputContainerPaddingConfig = {
  x?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  y?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
}
type contextComponentTokensTEXTINPUTSmInputContainerConfig = {
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  borderRadius?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  padding?: contextComponentTokensTEXTINPUTSmInputContainerPaddingConfig,
  border?: contextComponentTokensSEARCHINPUTSmInputContainerBorderBottomConfig,
  backgroundColor?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
}
type contextComponentTokensTEXTINPUTSmConfig = {
  placeholder?: contextComponentTokensTEXTAREASmPlaceholderConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  label?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  subLabel?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  hintText?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  helpIcon?: contextComponentTokensTEXTAREASmHelpIconConfig,
  errorMessage?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  required?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  inputContainer?: contextComponentTokensTEXTINPUTSmInputContainerConfig,
}
type contextComponentTokensTEXTINPUTConfig = {
  sm?: contextComponentTokensTEXTINPUTSmConfig,
  lg?: contextComponentTokensTEXTINPUTSmConfig,
}
type contextComponentTokensNUMBERINPUTSmInputContainerStepperButtonIconConfig = {
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  width?: contextComponentTokensTEXTAREAV2SmTopContainerHelpIconWidthConfig,
}
type contextComponentTokensNUMBERINPUTSmInputContainerStepperButtonConfig = {
  width?: contextComponentTokensTEXTAREAV2SmTopContainerHelpIconWidthConfig,
  backgroundColor?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  icon?: contextComponentTokensNUMBERINPUTSmInputContainerStepperButtonIconConfig,
}
type contextComponentTokensNUMBERINPUTSmInputContainerConfig = {
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  borderRadius?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  padding?: contextComponentTokensTEXTINPUTSmInputContainerPaddingConfig,
  border?: contextComponentTokensSEARCHINPUTSmInputContainerBorderBottomConfig,
  backgroundColor?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  stepperButton?: contextComponentTokensNUMBERINPUTSmInputContainerStepperButtonConfig,
}
type contextComponentTokensNUMBERINPUTSmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  label?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  subLabel?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  hintText?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  helpIcon?: contextComponentTokensTEXTAREASmHelpIconConfig,
  errorMessage?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  required?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  inputContainer?: contextComponentTokensNUMBERINPUTSmInputContainerConfig,
}
type contextComponentTokensNUMBERINPUTConfig = {
  sm?: contextComponentTokensNUMBERINPUTSmConfig,
  lg?: contextComponentTokensNUMBERINPUTSmConfig,
}
type contextComponentTokensALERTSmBackgroundPrimaryConfig = {
  subtle?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  noFill?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensALERTSmBackgroundConfig = {
  primary?: contextComponentTokensALERTSmBackgroundPrimaryConfig,
  success?: contextComponentTokensALERTSmBackgroundPrimaryConfig,
  warning?: contextComponentTokensALERTSmBackgroundPrimaryConfig,
  error?: contextComponentTokensALERTSmBackgroundPrimaryConfig,
  purple?: contextComponentTokensALERTSmBackgroundPrimaryConfig,
  orange?: contextComponentTokensALERTSmBackgroundPrimaryConfig,
  neutral?: contextComponentTokensALERTSmBackgroundPrimaryConfig,
}
type contextComponentTokensALERTSmTextHeadingColorConfig = {
  primary?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  success?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  warning?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  error?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  purple?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  orange?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  neutral?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensALERTSmTextHeadingConfig = {
  color?: contextComponentTokensALERTSmTextHeadingColorConfig,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
}
type contextComponentTokensALERTSmTextConfig = {
  heading?: contextComponentTokensALERTSmTextHeadingConfig,
  description?: contextComponentTokensALERTSmTextHeadingConfig,
}
type contextComponentTokensALERTSmButtonConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  primaryAction?: contextComponentTokensALERTSmTextHeadingConfig,
  secondaryAction?: contextComponentTokensALERTSmTextHeadingConfig,
  closeButton?: contextComponentTokensALERTSmTextHeadingConfig,
}
type contextComponentTokensALERTSmConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  maxWidth?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  minWidth?: mozInitialOrInheritOrInitialOrRevertEtc1owcx,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  background?: contextComponentTokensALERTSmBackgroundConfig,
  border?: contextComponentTokensALERTSmBackgroundConfig,
  text?: contextComponentTokensALERTSmTextConfig,
  button?: contextComponentTokensALERTSmButtonConfig,
}
type contextComponentTokensALERTConfig = {
  sm?: contextComponentTokensALERTSmConfig,
  lg?: contextComponentTokensALERTSmConfig,
}
type contextComponentTokensOTPINPUTSmInputContainerInputConfig = {
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  border?: contextComponentTokensSEARCHINPUTSmInputContainerBorderBottomConfig,
  backgroundColor?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
}
type contextComponentTokensOTPINPUTSmInputContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  input?: contextComponentTokensOTPINPUTSmInputContainerInputConfig,
}
type contextComponentTokensOTPINPUTSmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  label?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  subLabel?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  helpIcon?: contextComponentTokensTEXTAREASmHelpIconConfig,
  hintText?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  errorMessage?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  required?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  inputContainer?: contextComponentTokensOTPINPUTSmInputContainerConfig,
}
type contextComponentTokensOTPINPUTConfig = {
  sm?: contextComponentTokensOTPINPUTSmConfig,
  lg?: contextComponentTokensOTPINPUTSmConfig,
}
type contextComponentTokensTOOLTIPSmBorderRadiusConfig = {
  sm?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  lg?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensTOOLTIPSmMaxWidthConfig = {
  sm?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  lg?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
}
type contextComponentTokensTOOLTIPSmGapConfig = {
  sm?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  lg?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensTOOLTIPSmTextFontWeightConfig = {
  sm?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  lg?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
}
type contextComponentTokensTOOLTIPSmTextFontSizeConfig = {
  sm?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  lg?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
}
type contextComponentTokensTOOLTIPSmTextConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontWeight?: contextComponentTokensTOOLTIPSmTextFontWeightConfig,
  fontSize?: contextComponentTokensTOOLTIPSmTextFontSizeConfig,
  lineHeight?: contextComponentTokensTOOLTIPSmTextFontWeightConfig,
}
type contextComponentTokensTOOLTIPSmConfig = {
  background?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderRadius?: contextComponentTokensTOOLTIPSmBorderRadiusConfig,
  maxWidth?: contextComponentTokensTOOLTIPSmMaxWidthConfig,
  padding?: contextComponentTokensTOOLTIPSmBorderRadiusConfig,
  gap?: contextComponentTokensTOOLTIPSmGapConfig,
  text?: contextComponentTokensTOOLTIPSmTextConfig,
}
type contextComponentTokensTOOLTIPConfig = {
  sm?: contextComponentTokensTOOLTIPSmConfig,
  lg?: contextComponentTokensTOOLTIPSmConfig,
}
type contextComponentTokensUNITINPUTSmInputContainerUnitConfig = {
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  padding?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  backgroundColor?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
}
type contextComponentTokensUNITINPUTSmInputContainerConfig = {
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  borderRadius?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  padding?: contextComponentTokensTEXTINPUTSmInputContainerPaddingConfig,
  border?: contextComponentTokensSEARCHINPUTSmInputContainerBorderBottomConfig,
  backgroundColor?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  unit?: contextComponentTokensUNITINPUTSmInputContainerUnitConfig,
}
type contextComponentTokensUNITINPUTSmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  label?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  subLabel?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  helpIcon?: contextComponentTokensTEXTAREASmHelpIconConfig,
  hintText?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  errorMessage?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  required?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  placeholder?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  inputContainer?: contextComponentTokensUNITINPUTSmInputContainerConfig,
}
type contextComponentTokensUNITINPUTConfig = {
  sm?: contextComponentTokensUNITINPUTSmConfig,
  lg?: contextComponentTokensUNITINPUTSmConfig,
}
type contextComponentTokensMULTIVALUEINPUTSmInputContainerBoxShadowConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  focus?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  error?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
}
type contextComponentTokensMULTIVALUEINPUTSmInputContainerConfig = {
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  boxShadow?: contextComponentTokensMULTIVALUEINPUTSmInputContainerBoxShadowConfig,
  padding?: contextComponentTokensTEXTINPUTSmInputContainerPaddingConfig,
  border?: contextComponentTokensSEARCHINPUTSmInputContainerBorderBottomConfig,
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  backgroundColor?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
}
type contextComponentTokensMULTIVALUEINPUTSmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  label?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  subLabel?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  hintText?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  helpIcon?: contextComponentTokensTEXTAREASmHelpIconConfig,
  errorMessage?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  required?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  inputContainer?: contextComponentTokensMULTIVALUEINPUTSmInputContainerConfig,
}
type contextComponentTokensMULTIVALUEINPUTConfig = {
  sm?: contextComponentTokensMULTIVALUEINPUTSmConfig,
  lg?: contextComponentTokensMULTIVALUEINPUTSmConfig,
}
type contextComponentTokensDROPDOWNINPUTSmInputContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  borderRadius?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  padding?: contextComponentTokensTEXTINPUTSmInputContainerPaddingConfig,
  border?: contextComponentTokensSEARCHINPUTSmInputContainerBorderBottomConfig,
  backgroundColor?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
}
type contextComponentTokensDROPDOWNINPUTSmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  label?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  subLabel?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  hintText?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  errorMessage?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  required?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  placeholder?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  helpIcon?: contextComponentTokensTEXTAREASmHelpIconConfig,
  inputContainer?: contextComponentTokensDROPDOWNINPUTSmInputContainerConfig,
}
type contextComponentTokensDROPDOWNINPUTConfig = {
  sm?: contextComponentTokensDROPDOWNINPUTSmConfig,
  lg?: contextComponentTokensDROPDOWNINPUTSmConfig,
}
type contextComponentTokensCHECKBOXSmSlotConfig = {
  marginLeft?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensCHECKBOXSmIndicatorBackgroundColorCheckedConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  error?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensCHECKBOXSmIndicatorBackgroundColorConfig = {
  checked?: contextComponentTokensCHECKBOXSmIndicatorBackgroundColorCheckedConfig,
  unchecked?: contextComponentTokensCHECKBOXSmIndicatorBackgroundColorCheckedConfig,
  indeterminate?: contextComponentTokensCHECKBOXSmIndicatorBackgroundColorCheckedConfig,
}
type contextComponentTokensCHECKBOXSmIndicatorBorderCheckedConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  hover?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  error?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensCHECKBOXSmIndicatorBorderConfig = {
  checked?: contextComponentTokensCHECKBOXSmIndicatorBorderCheckedConfig,
  unchecked?: contextComponentTokensCHECKBOXSmIndicatorBorderCheckedConfig,
  indeterminate?: contextComponentTokensCHECKBOXSmIndicatorBorderCheckedConfig,
}
type contextComponentTokensCHECKBOXSmIndicatorIconColorCheckedConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensCHECKBOXSmIndicatorIconColorConfig = {
  checked?: contextComponentTokensCHECKBOXSmIndicatorIconColorCheckedConfig,
  unchecked?: contextComponentTokensCHECKBOXSmIndicatorIconColorCheckedConfig,
  indeterminate?: contextComponentTokensCHECKBOXSmIndicatorIconColorCheckedConfig,
}
type contextComponentTokensCHECKBOXSmIndicatorIconConfig = {
  color?: contextComponentTokensCHECKBOXSmIndicatorIconColorConfig,
  width?: contextComponentTokensRADIOSmSlotConfig,
  height?: contextComponentTokensRADIOSmHeightConfig,
  strokeWidth?: contextComponentTokensRADIOSmContentLabelFontWeightConfig,
}
type contextComponentTokensCHECKBOXSmIndicatorConfig = {
  width?: contextComponentTokensRADIOSmSlotConfig,
  height?: contextComponentTokensRADIOSmHeightConfig,
  backgroundColor?: contextComponentTokensCHECKBOXSmIndicatorBackgroundColorConfig,
  borderRadius?: contextComponentTokensSWITCHSmSwitchContainerBorderRadiusConfig,
  border?: contextComponentTokensCHECKBOXSmIndicatorBorderConfig,
  outline?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
  outlineOffset?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  icon?: contextComponentTokensCHECKBOXSmIndicatorIconConfig,
}
type contextComponentTokensCHECKBOXSmContentLabelConfig = {
  color?: contextComponentTokensCHECKBOXSmIndicatorBackgroundColorCheckedConfig,
  fontSize?: contextComponentTokensRADIOSmContentLabelFontSizeConfig,
  fontWeight?: contextComponentTokensRADIOSmContentLabelFontWeightConfig,
  lineHeight?: contextComponentTokensRADIOSmContentLabelFontWeightConfig,
}
type contextComponentTokensCHECKBOXSmContentSubtextConfig = {
  color?: contextComponentTokensCHECKBOXSmIndicatorBackgroundColorCheckedConfig,
  fontSize?: contextComponentTokensRADIOSmContentLabelFontSizeConfig,
  fontWeight?: contextComponentTokensRADIOSmContentLabelFontWeightConfig,
}
type contextComponentTokensCHECKBOXSmContentConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  label?: contextComponentTokensCHECKBOXSmContentLabelConfig,
  subtext?: contextComponentTokensCHECKBOXSmContentSubtextConfig,
}
type contextComponentTokensCHECKBOXSmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  slot?: contextComponentTokensCHECKBOXSmSlotConfig,
  indicator?: contextComponentTokensCHECKBOXSmIndicatorConfig,
  content?: contextComponentTokensCHECKBOXSmContentConfig,
  required?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
}
type contextComponentTokensCHECKBOXConfig = {
  sm?: contextComponentTokensCHECKBOXSmConfig,
  lg?: contextComponentTokensCHECKBOXSmConfig,
}
type contextComponentTokensTABSSmBackgroundColorBoxedConfig = {
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  active?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensTABSSmBackgroundColorConfig = {
  boxed?: contextComponentTokensTABSSmBackgroundColorBoxedConfig,
  floating?: contextComponentTokensTABSSmBackgroundColorBoxedConfig,
  underline?: contextComponentTokensTABSSmBackgroundColorBoxedConfig,
  pills?: contextComponentTokensTABSSmBackgroundColorBoxedConfig,
}
type contextComponentTokensTABSSmBorderRadiusSmConfig = {
  boxed?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  floating?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  underline?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  pills?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensTABSSmBorderRadiusConfig = {
  sm?: contextComponentTokensTABSSmBorderRadiusSmConfig,
  md?: contextComponentTokensTABSSmBorderRadiusSmConfig,
  lg?: contextComponentTokensTABSSmBorderRadiusSmConfig,
}
type contextComponentTokensTABSSmPaddingSmBoxedConfig = {
  top?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  right?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  bottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  left?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensTABSSmPaddingSmConfig = {
  boxed?: contextComponentTokensTABSSmPaddingSmBoxedConfig,
  floating?: contextComponentTokensTABSSmPaddingSmBoxedConfig,
  underline?: contextComponentTokensTABSSmPaddingSmBoxedConfig,
  pills?: contextComponentTokensTABSSmPaddingSmBoxedConfig,
}
type contextComponentTokensTABSSmPaddingConfig = {
  sm?: contextComponentTokensTABSSmPaddingSmConfig,
  md?: contextComponentTokensTABSSmPaddingSmConfig,
  lg?: contextComponentTokensTABSSmPaddingSmConfig,
}
type contextComponentTokensTABSSmBorderConfig = {
  boxed?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  floating?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  underline?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  pills?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensTABSSmContainerBackgroundColorConfig = {
  boxed?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  floating?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  underline?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  pills?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensTABSSmContainerConfig = {
  backgroundColor?: contextComponentTokensTABSSmContainerBackgroundColorConfig,
  borderRadius?: contextComponentTokensTABSSmBorderRadiusConfig,
  padding?: contextComponentTokensTABSSmPaddingConfig,
}
type contextComponentTokensTABSSmTriggerActiveIndicatorConfig = {
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensTABSSmTriggerTextConfig = {
  color?: contextComponentTokensTABSSmBackgroundColorConfig,
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
}
type contextComponentTokensTABSSmTriggerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  activeIndicator?: contextComponentTokensTABSSmTriggerActiveIndicatorConfig,
  text?: contextComponentTokensTABSSmTriggerTextConfig,
}
type contextComponentTokensTABSSmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  backgroundColor?: contextComponentTokensTABSSmBackgroundColorConfig,
  borderRadius?: contextComponentTokensTABSSmBorderRadiusConfig,
  padding?: contextComponentTokensTABSSmPaddingConfig,
  border?: contextComponentTokensTABSSmBorderConfig,
  borderBottom?: contextComponentTokensTABSSmBorderConfig,
  container?: contextComponentTokensTABSSmContainerConfig,
  trigger?: contextComponentTokensTABSSmTriggerConfig,
}
type contextComponentTokensTABSConfig = {
  sm?: contextComponentTokensTABSSmConfig,
  lg?: contextComponentTokensTABSSmConfig,
}
type contextComponentTokensBUTTONSmSlotMaxHeightConfig = {
  sm?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  md?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  lg?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
}
@unboxed type mozInitialOrInheritOrInitialOrRevertEtc1mkx8 = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("none") NoneRevertEtc1mkx8 | @as("aliceblue") Aliceblue | @as("antiquewhite") Antiquewhite | @as("aqua") Aqua | @as("aquamarine") Aquamarine | @as("azure") Azure | @as("beige") Beige | @as("bisque") Bisque | @as("black") Black | @as("blanchedalmond") Blanchedalmond | @as("blue") Blue | @as("blueviolet") Blueviolet | @as("brown") Brown | @as("burlywood") Burlywood | @as("cadetblue") Cadetblue | @as("chartreuse") Chartreuse | @as("chocolate") Chocolate | @as("coral") Coral | @as("cornflowerblue") Cornflowerblue | @as("cornsilk") Cornsilk | @as("crimson") Crimson | @as("cyan") Cyan | @as("darkblue") Darkblue | @as("darkcyan") Darkcyan | @as("darkgoldenrod") Darkgoldenrod | @as("darkgray") Darkgray | @as("darkgreen") Darkgreen | @as("darkgrey") Darkgrey | @as("darkkhaki") Darkkhaki | @as("darkmagenta") Darkmagenta | @as("darkolivegreen") Darkolivegreen | @as("darkorange") Darkorange | @as("darkorchid") Darkorchid | @as("darkred") Darkred | @as("darksalmon") Darksalmon | @as("darkseagreen") Darkseagreen | @as("darkslateblue") Darkslateblue | @as("darkslategray") Darkslategray | @as("darkslategrey") Darkslategrey | @as("darkturquoise") Darkturquoise | @as("darkviolet") Darkviolet | @as("deeppink") Deeppink | @as("deepskyblue") Deepskyblue | @as("dimgray") Dimgray | @as("dimgrey") Dimgrey | @as("dodgerblue") Dodgerblue | @as("firebrick") Firebrick | @as("floralwhite") Floralwhite | @as("forestgreen") Forestgreen | @as("fuchsia") Fuchsia | @as("gainsboro") Gainsboro | @as("ghostwhite") Ghostwhite | @as("gold") Gold | @as("goldenrod") Goldenrod | @as("gray") Gray | @as("green") Green | @as("greenyellow") Greenyellow | @as("grey") Grey | @as("honeydew") Honeydew | @as("hotpink") Hotpink | @as("indianred") Indianred | @as("indigo") Indigo | @as("ivory") Ivory | @as("khaki") Khaki | @as("lavender") Lavender | @as("lavenderblush") Lavenderblush | @as("lawngreen") Lawngreen | @as("lemonchiffon") Lemonchiffon | @as("lightblue") Lightblue | @as("lightcoral") Lightcoral | @as("lightcyan") Lightcyan | @as("lightgoldenrodyellow") Lightgoldenrodyellow | @as("lightgray") Lightgray | @as("lightgreen") Lightgreen | @as("lightgrey") Lightgrey | @as("lightpink") Lightpink | @as("lightsalmon") Lightsalmon | @as("lightseagreen") Lightseagreen | @as("lightskyblue") Lightskyblue | @as("lightslategray") Lightslategray | @as("lightslategrey") Lightslategrey | @as("lightsteelblue") Lightsteelblue | @as("lightyellow") Lightyellow | @as("lime") Lime | @as("limegreen") Limegreen | @as("linen") Linen | @as("magenta") Magenta | @as("maroon") Maroon | @as("mediumaquamarine") Mediumaquamarine | @as("mediumblue") Mediumblue | @as("mediumorchid") Mediumorchid | @as("mediumpurple") Mediumpurple | @as("mediumseagreen") Mediumseagreen | @as("mediumslateblue") Mediumslateblue | @as("mediumspringgreen") Mediumspringgreen | @as("mediumturquoise") Mediumturquoise | @as("mediumvioletred") Mediumvioletred | @as("midnightblue") Midnightblue | @as("mintcream") Mintcream | @as("mistyrose") Mistyrose | @as("moccasin") Moccasin | @as("navajowhite") Navajowhite | @as("navy") Navy | @as("oldlace") Oldlace | @as("olive") Olive | @as("olivedrab") Olivedrab | @as("orange") Orange | @as("orangered") Orangered | @as("orchid") Orchid | @as("palegoldenrod") Palegoldenrod | @as("palegreen") Palegreen | @as("paleturquoise") Paleturquoise | @as("palevioletred") Palevioletred | @as("papayawhip") Papayawhip | @as("peachpuff") Peachpuff | @as("peru") Peru | @as("pink") Pink | @as("plum") Plum | @as("powderblue") Powderblue | @as("purple") Purple | @as("rebeccapurple") Rebeccapurple | @as("red") Red | @as("rosybrown") Rosybrown | @as("royalblue") Royalblue | @as("saddlebrown") Saddlebrown | @as("salmon") Salmon | @as("sandybrown") Sandybrown | @as("seagreen") Seagreen | @as("seashell") Seashell | @as("sienna") Sienna | @as("silver") Silver | @as("skyblue") Skyblue | @as("slateblue") Slateblue | @as("slategray") Slategray | @as("slategrey") Slategrey | @as("snow") Snow | @as("springgreen") Springgreen | @as("steelblue") Steelblue | @as("tan") Tan | @as("teal") Teal | @as("thistle") Thistle | @as("tomato") Tomato | @as("turquoise") Turquoise | @as("violet") Violet | @as("wheat") Wheat | @as("white") White | @as("whitesmoke") Whitesmoke | @as("yellow") Yellow | @as("yellowgreen") Yellowgreen | @as("transparent") Transparent | @as("AccentColor") AccentColor | @as("AccentColorText") AccentColorText | @as("ActiveText") ActiveText | @as("ButtonBorder") ButtonBorder | @as("ButtonFace") ButtonFace | @as("ButtonText") ButtonText | @as("Canvas") Canvas | @as("CanvasText") CanvasText | @as("Field") Field | @as("FieldText") FieldText | @as("GrayText") GrayText | @as("Highlight") HighlightRevertEtc1mkx8 | @as("HighlightText") HighlightText | @as("LinkText") LinkText | @as("Mark") Mark | @as("MarkText") MarkText | @as("SelectedItem") SelectedItem | @as("SelectedItemText") SelectedItemText | @as("VisitedText") VisitedText | @as("ActiveBorder") ActiveBorder | @as("ActiveCaption") ActiveCaption | @as("AppWorkspace") AppWorkspace | @as("Background") Background | @as("ButtonHighlight") ButtonHighlight | @as("ButtonShadow") ButtonShadow | @as("CaptionText") CaptionText | @as("InactiveBorder") InactiveBorder | @as("InactiveCaption") InactiveCaption | @as("InactiveCaptionText") InactiveCaptionText | @as("InfoBackground") InfoBackground | @as("InfoText") InfoText | @as("Menu") Menu | @as("MenuText") MenuText | @as("Scrollbar") ScrollbarRevertEtc1mkx8 | @as("ThreeDDarkShadow") ThreeDDarkShadow | @as("ThreeDFace") ThreeDFace | @as("ThreeDHighlight") ThreeDHighlight | @as("ThreeDLightShadow") ThreeDLightShadow | @as("ThreeDShadow") ThreeDShadow | @as("Window") Window | @as("WindowFrame") WindowFrame | @as("WindowText") WindowText | @as("currentColor") CurrentColor | @as("repeat") Repeat | @as("fixed") Fixed | @as("top") Top | @as("right") RightRevertEtc1mkx8 | @as("bottom") Bottom | @as("left") LeftRevertEtc1mkx8 | @as("center") CenterRevertEtc1mkx8 | @as("no-repeat") NoRepeat | @as("repeat-x") RepeatX | @as("repeat-y") RepeatY | @as("round") Round | @as("space") SpaceRevertEtc1mkx8 | @as("local") Local | @as("scroll") Scroll | @as("border-box") BorderBox | @as("content-box") ContentBox | @as("padding-box") PaddingBox | Num(float) | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensBUTTONSmBackgroundColorPrimaryDefaultConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtc1mkx8,
  hover?: mozInitialOrInheritOrInitialOrRevertEtc1mkx8,
  active?: mozInitialOrInheritOrInitialOrRevertEtc1mkx8,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtc1mkx8,
}
type contextComponentTokensBUTTONSmBackgroundColorPrimaryConfig = {
  default?: contextComponentTokensBUTTONSmBackgroundColorPrimaryDefaultConfig,
  iconOnly?: contextComponentTokensBUTTONSmBackgroundColorPrimaryDefaultConfig,
  inline?: contextComponentTokensBUTTONSmBackgroundColorPrimaryDefaultConfig,
}
type contextComponentTokensBUTTONSmBackgroundColorConfig = {
  primary?: contextComponentTokensBUTTONSmBackgroundColorPrimaryConfig,
  secondary?: contextComponentTokensBUTTONSmBackgroundColorPrimaryConfig,
  danger?: contextComponentTokensBUTTONSmBackgroundColorPrimaryConfig,
  success?: contextComponentTokensBUTTONSmBackgroundColorPrimaryConfig,
}
type contextComponentTokensBUTTONSmBorderRadiusSmPrimaryDefaultConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  active?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensBUTTONSmBorderRadiusSmPrimaryConfig = {
  default?: contextComponentTokensBUTTONSmBorderRadiusSmPrimaryDefaultConfig,
  iconOnly?: contextComponentTokensBUTTONSmBorderRadiusSmPrimaryDefaultConfig,
  inline?: contextComponentTokensBUTTONSmBorderRadiusSmPrimaryDefaultConfig,
}
type contextComponentTokensBUTTONSmBorderRadiusSmConfig = {
  primary?: contextComponentTokensBUTTONSmBorderRadiusSmPrimaryConfig,
  secondary?: contextComponentTokensBUTTONSmBorderRadiusSmPrimaryConfig,
  danger?: contextComponentTokensBUTTONSmBorderRadiusSmPrimaryConfig,
  success?: contextComponentTokensBUTTONSmBorderRadiusSmPrimaryConfig,
}
type contextComponentTokensBUTTONSmBorderRadiusConfig = {
  sm?: contextComponentTokensBUTTONSmBorderRadiusSmConfig,
  md?: contextComponentTokensBUTTONSmBorderRadiusSmConfig,
  lg?: contextComponentTokensBUTTONSmBorderRadiusSmConfig,
}
type contextComponentTokensBUTTONSmPaddingSmPrimaryConfig = {
  default?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  iconOnly?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  inline?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
}
type contextComponentTokensBUTTONSmPaddingSmConfig = {
  primary?: contextComponentTokensBUTTONSmPaddingSmPrimaryConfig,
  secondary?: contextComponentTokensBUTTONSmPaddingSmPrimaryConfig,
  danger?: contextComponentTokensBUTTONSmPaddingSmPrimaryConfig,
  success?: contextComponentTokensBUTTONSmPaddingSmPrimaryConfig,
}
type contextComponentTokensBUTTONSmPaddingConfig = {
  sm?: contextComponentTokensBUTTONSmPaddingSmConfig,
  md?: contextComponentTokensBUTTONSmPaddingSmConfig,
  lg?: contextComponentTokensBUTTONSmPaddingSmConfig,
}
type contextComponentTokensBUTTONSmBorderPrimaryDefaultConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  hover?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  active?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensBUTTONSmBorderPrimaryConfig = {
  default?: contextComponentTokensBUTTONSmBorderPrimaryDefaultConfig,
  iconOnly?: contextComponentTokensBUTTONSmBorderPrimaryDefaultConfig,
  inline?: contextComponentTokensBUTTONSmBorderPrimaryDefaultConfig,
}
type contextComponentTokensBUTTONSmBorderConfig = {
  primary?: contextComponentTokensBUTTONSmBorderPrimaryConfig,
  secondary?: contextComponentTokensBUTTONSmBorderPrimaryConfig,
  danger?: contextComponentTokensBUTTONSmBorderPrimaryConfig,
  success?: contextComponentTokensBUTTONSmBorderPrimaryConfig,
}
type contextComponentTokensBUTTONSmShadowPrimaryDefaultConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  active?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
}
type contextComponentTokensBUTTONSmShadowPrimaryConfig = {
  default?: contextComponentTokensBUTTONSmShadowPrimaryDefaultConfig,
  iconOnly?: contextComponentTokensBUTTONSmShadowPrimaryDefaultConfig,
  inline?: contextComponentTokensBUTTONSmShadowPrimaryDefaultConfig,
}
type contextComponentTokensBUTTONSmShadowConfig = {
  primary?: contextComponentTokensBUTTONSmShadowPrimaryConfig,
  secondary?: contextComponentTokensBUTTONSmShadowPrimaryConfig,
  danger?: contextComponentTokensBUTTONSmShadowPrimaryConfig,
  success?: contextComponentTokensBUTTONSmShadowPrimaryConfig,
}
type contextComponentTokensBUTTONSmOutlinePrimaryDefaultConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
  active?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
}
type contextComponentTokensBUTTONSmOutlinePrimaryConfig = {
  default?: contextComponentTokensBUTTONSmOutlinePrimaryDefaultConfig,
  iconOnly?: contextComponentTokensBUTTONSmOutlinePrimaryDefaultConfig,
  inline?: contextComponentTokensBUTTONSmOutlinePrimaryDefaultConfig,
}
type contextComponentTokensBUTTONSmOutlineConfig = {
  primary?: contextComponentTokensBUTTONSmOutlinePrimaryConfig,
  secondary?: contextComponentTokensBUTTONSmOutlinePrimaryConfig,
  danger?: contextComponentTokensBUTTONSmOutlinePrimaryConfig,
  success?: contextComponentTokensBUTTONSmOutlinePrimaryConfig,
}
type contextComponentTokensBUTTONSmTextColorPrimaryDefaultConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  active?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensBUTTONSmTextColorPrimaryConfig = {
  default?: contextComponentTokensBUTTONSmTextColorPrimaryDefaultConfig,
  iconOnly?: contextComponentTokensBUTTONSmTextColorPrimaryDefaultConfig,
  inline?: contextComponentTokensBUTTONSmTextColorPrimaryDefaultConfig,
}
type contextComponentTokensBUTTONSmTextColorConfig = {
  primary?: contextComponentTokensBUTTONSmTextColorPrimaryConfig,
  secondary?: contextComponentTokensBUTTONSmTextColorPrimaryConfig,
  danger?: contextComponentTokensBUTTONSmTextColorPrimaryConfig,
  success?: contextComponentTokensBUTTONSmTextColorPrimaryConfig,
}
type contextComponentTokensBUTTONSmTextConfig = {
  color?: contextComponentTokensBUTTONSmTextColorConfig,
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
}
type contextComponentTokensBUTTONSmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  slotMaxHeight?: contextComponentTokensBUTTONSmSlotMaxHeightConfig,
  backgroundColor?: contextComponentTokensBUTTONSmBackgroundColorConfig,
  borderRadius?: contextComponentTokensBUTTONSmBorderRadiusConfig,
  padding?: contextComponentTokensBUTTONSmPaddingConfig,
  border?: contextComponentTokensBUTTONSmBorderConfig,
  shadow?: contextComponentTokensBUTTONSmShadowConfig,
  outline?: contextComponentTokensBUTTONSmOutlineConfig,
  text?: contextComponentTokensBUTTONSmTextConfig,
}
type contextComponentTokensBUTTONConfig = {
  sm?: contextComponentTokensBUTTONSmConfig,
  lg?: contextComponentTokensBUTTONSmConfig,
}
type contextComponentTokensMODALSmOverlayConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensMODALSmHeaderTextTitleConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
}
type contextComponentTokensMODALSmHeaderTextConfig = {
  title?: contextComponentTokensMODALSmHeaderTextTitleConfig,
  subtitle?: contextComponentTokensMODALSmHeaderTextTitleConfig,
}
type contextComponentTokensMODALSmHeaderConfig = {
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  borderBottom?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  text?: contextComponentTokensMODALSmHeaderTextConfig,
}
type contextComponentTokensMODALSmBodyConfig = {
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensMODALSmFooterConfig = {
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  borderTop?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensMODALSmConfig = {
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  overlay?: contextComponentTokensMODALSmOverlayConfig,
  header?: contextComponentTokensMODALSmHeaderConfig,
  body?: contextComponentTokensMODALSmBodyConfig,
  footer?: contextComponentTokensMODALSmFooterConfig,
  closeButton?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
}
type contextComponentTokensMODALConfig = {
  sm?: contextComponentTokensMODALSmConfig,
  lg?: contextComponentTokensMODALSmConfig,
}
type contextComponentTokensBREADCRUMBSmItemTextColorConfig = {
  active?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensBREADCRUMBSmItemTextConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  color?: contextComponentTokensBREADCRUMBSmItemTextColorConfig,
}
type contextComponentTokensBREADCRUMBSmItemConfig = {
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  text?: contextComponentTokensBREADCRUMBSmItemTextConfig,
}
type contextComponentTokensBREADCRUMBSmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  item?: contextComponentTokensBREADCRUMBSmItemConfig,
}
type contextComponentTokensBREADCRUMBConfig = {
  sm?: contextComponentTokensBREADCRUMBSmConfig,
  lg?: contextComponentTokensBREADCRUMBSmConfig,
}
type contextComponentTokensPOPOVERSmShadowConfig = {
  xs?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  sm?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  md?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  lg?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  xl?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  @as("2xl") _2xl?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  full?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  focusPrimary?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  focusError?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
}
@set_index external contextComponentTokensPOPOVERSmShadowConfigSet: (contextComponentTokensPOPOVERSmShadowConfig, string, mozInitialOrInheritOrInitialOrRevertEtcz3a4s) => unit = ""
type contextComponentTokensPOPOVERSmGapConfig = {
  small?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  medium?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensPOPOVERSmBorderRadiusConfig = {
  small?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  medium?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensPOPOVERSmPaddingConfig = {
  left?: contextComponentTokensPOPOVERSmBorderRadiusConfig,
  right?: contextComponentTokensPOPOVERSmBorderRadiusConfig,
  top?: contextComponentTokensPOPOVERSmBorderRadiusConfig,
  bottom?: contextComponentTokensPOPOVERSmBorderRadiusConfig,
}
type contextComponentTokensPOPOVERSmHeaderContainerHeadingFontSizeConfig = {
  small?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  medium?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
}
type contextComponentTokensPOPOVERSmHeaderContainerHeadingFontWeightConfig = {
  small?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  medium?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
}
type contextComponentTokensPOPOVERSmHeaderContainerHeadingConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontSize?: contextComponentTokensPOPOVERSmHeaderContainerHeadingFontSizeConfig,
  fontWeight?: contextComponentTokensPOPOVERSmHeaderContainerHeadingFontWeightConfig,
  lineHeight?: contextComponentTokensPOPOVERSmHeaderContainerHeadingFontWeightConfig,
}
type contextComponentTokensPOPOVERSmHeaderContainerConfig = {
  heading?: contextComponentTokensPOPOVERSmHeaderContainerHeadingConfig,
  description?: contextComponentTokensPOPOVERSmHeaderContainerHeadingConfig,
}
type contextComponentTokensPOPOVERSmFooterConfig = {
  gap?: contextComponentTokensPOPOVERSmGapConfig,
}
type contextComponentTokensPOPOVERSmConfig = {
  background?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  shadow?: contextComponentTokensPOPOVERSmShadowConfig,
  gap?: contextComponentTokensPOPOVERSmGapConfig,
  zIndex?: string,  // ⚪ loose — was `Globals | "auto" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; i`
  borderRadius?: contextComponentTokensPOPOVERSmBorderRadiusConfig,
  padding?: contextComponentTokensPOPOVERSmPaddingConfig,
  headerContainer?: contextComponentTokensPOPOVERSmHeaderContainerConfig,
  footer?: contextComponentTokensPOPOVERSmFooterConfig,
}
type contextComponentTokensPOPOVERConfig = {
  sm?: contextComponentTokensPOPOVERSmConfig,
  lg?: contextComponentTokensPOPOVERSmConfig,
}
type contextComponentTokensMENUSmItemMarginConfig = {
  x?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  y?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensMENUSmItemBackgroundColorDefaultEnabledConfig = {
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  active?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  focus?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  focusVisible?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  selected?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensMENUSmItemBackgroundColorDefaultConfig = {
  enabled?: contextComponentTokensMENUSmItemBackgroundColorDefaultEnabledConfig,
  disabled?: contextComponentTokensMENUSmItemBackgroundColorDefaultEnabledConfig,
}
type contextComponentTokensMENUSmItemBackgroundColorActionConfig = {
  primary?: contextComponentTokensMENUSmItemBackgroundColorDefaultConfig,
  danger?: contextComponentTokensMENUSmItemBackgroundColorDefaultConfig,
}
type contextComponentTokensMENUSmItemBackgroundColorConfig = {
  default?: contextComponentTokensMENUSmItemBackgroundColorDefaultConfig,
  action?: contextComponentTokensMENUSmItemBackgroundColorActionConfig,
}
type contextComponentTokensMENUSmItemCheckmarkConfig = {
  position?: contextComponentTokensMENUSmItemCheckmarkPosition,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensMENUSmItemOptionsLabelConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  margin?: contextComponentTokensMENUSmItemMarginConfig,
}
type contextComponentTokensMENUSmItemOptionColorDefaultConfig = {
  enabled?: contextComponentTokensMENUSmItemBackgroundColorDefaultEnabledConfig,
  disabled?: contextComponentTokensMENUSmItemBackgroundColorDefaultEnabledConfig,
}
type contextComponentTokensMENUSmItemOptionColorActionConfig = {
  primary?: contextComponentTokensMENUSmItemBackgroundColorDefaultConfig,
  danger?: contextComponentTokensMENUSmItemBackgroundColorDefaultConfig,
}
type contextComponentTokensMENUSmItemOptionColorConfig = {
  default?: contextComponentTokensMENUSmItemOptionColorDefaultConfig,
  action?: contextComponentTokensMENUSmItemOptionColorActionConfig,
}
type contextComponentTokensMENUSmItemOptionConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  color?: contextComponentTokensMENUSmItemOptionColorConfig,
}
type contextComponentTokensMENUSmItemSeperatorConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  margin?: contextComponentTokensMENUSmItemMarginConfig,
}
type contextComponentTokensMENUSmItemConfig = {
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  margin?: contextComponentTokensMENUSmItemMarginConfig,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  backgroundColor?: contextComponentTokensMENUSmItemBackgroundColorConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  checkmark?: contextComponentTokensMENUSmItemCheckmarkConfig,
  optionsLabel?: contextComponentTokensMENUSmItemOptionsLabelConfig,
  option?: contextComponentTokensMENUSmItemOptionConfig,
  description?: contextComponentTokensMENUSmItemOptionConfig,
  seperator?: contextComponentTokensMENUSmItemSeperatorConfig,
}
type contextComponentTokensMENUSmConfig = {
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  item?: contextComponentTokensMENUSmItemConfig,
}
type contextComponentTokensMENUConfig = {
  sm?: contextComponentTokensMENUSmConfig,
  lg?: contextComponentTokensMENUSmConfig,
}
type contextComponentTokensMENUV2SmSearchIconConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
}
type contextComponentTokensMENUV2SmGroupLabelConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  marginTop?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  marginRight?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  marginBottom?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  marginLeft?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensMENUV2SmGroupItemBackgroundColorActionConfig = {
  primary?: contextComponentTokensMENUSmItemBackgroundColorDefaultEnabledConfig,
  danger?: contextComponentTokensMENUSmItemBackgroundColorDefaultEnabledConfig,
}
type contextComponentTokensMENUV2SmGroupItemBackgroundColorConfig = {
  default?: contextComponentTokensMENUSmItemBackgroundColorDefaultEnabledConfig,
  action?: contextComponentTokensMENUV2SmGroupItemBackgroundColorActionConfig,
}
type contextComponentTokensMENUV2SmGroupItemTextColorConfig = {
  default?: contextComponentTokensMENUSmItemBackgroundColorDefaultEnabledConfig,
  action?: contextComponentTokensMENUV2SmGroupItemBackgroundColorActionConfig,
}
type contextComponentTokensMENUV2SmGroupItemTextSubTextConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
  color?: contextComponentTokensMENUV2SmGroupItemTextColorConfig,
}
type contextComponentTokensMENUV2SmGroupItemTextLeftSlotConfig = {
  maxWidth?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  maxHeight?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
}
type contextComponentTokensMENUV2SmGroupItemTextRightChevronConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
}
type contextComponentTokensMENUV2SmGroupItemTextConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
  color?: contextComponentTokensMENUV2SmGroupItemTextColorConfig,
  subText?: contextComponentTokensMENUV2SmGroupItemTextSubTextConfig,
  leftSlot?: contextComponentTokensMENUV2SmGroupItemTextLeftSlotConfig,
  checkmark?: contextComponentTokensMENUSmItemCheckmarkConfig,
  rightChevron?: contextComponentTokensMENUV2SmGroupItemTextRightChevronConfig,
}
type contextComponentTokensMENUV2SmGroupItemConfig = {
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  marginTop?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  marginRight?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  marginBottom?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  marginLeft?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  backgroundColor?: contextComponentTokensMENUV2SmGroupItemBackgroundColorConfig,
  text?: contextComponentTokensMENUV2SmGroupItemTextConfig,
}
type contextComponentTokensMENUV2SmGroupConfig = {
  label?: contextComponentTokensMENUV2SmGroupLabelConfig,
  item?: contextComponentTokensMENUV2SmGroupItemConfig,
}
type contextComponentTokensMENUV2SmSeparatorConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  marginTop?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  marginRight?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  marginBottom?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  marginLeft?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensMENUV2SmConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  zIndex?: string,  // ⚪ loose — was `Globals | "auto" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; i`
  minWidth?: mozInitialOrInheritOrInitialOrRevertEtc1owcx,
  maxWidth?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  searchIcon?: contextComponentTokensMENUV2SmSearchIconConfig,
  group?: contextComponentTokensMENUV2SmGroupConfig,
  separator?: contextComponentTokensMENUV2SmSeparatorConfig,
}
type contextComponentTokensMENUV2Config = {
  sm?: contextComponentTokensMENUV2SmConfig,
  lg?: contextComponentTokensMENUV2SmConfig,
}
type contextComponentTokensMULTISELECTSmLabelConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  color?: contextComponentTokensMENUSmItemBackgroundColorDefaultEnabledConfig,
}
type contextComponentTokensMULTISELECTSmTriggerHeightSmConfig = {
  container?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  @as("no-container") noContainer?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
}
type contextComponentTokensMULTISELECTSmTriggerHeightConfig = {
  sm?: contextComponentTokensMULTISELECTSmTriggerHeightSmConfig,
  md?: contextComponentTokensMULTISELECTSmTriggerHeightSmConfig,
  lg?: contextComponentTokensMULTISELECTSmTriggerHeightSmConfig,
}
type contextComponentTokensMULTISELECTSmTriggerPaddingSmConfig = {
  container?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  @as("no-container") noContainer?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
}
type contextComponentTokensMULTISELECTSmTriggerPaddingConfig = {
  sm?: contextComponentTokensMULTISELECTSmTriggerPaddingSmConfig,
  md?: contextComponentTokensMULTISELECTSmTriggerPaddingSmConfig,
  lg?: contextComponentTokensMULTISELECTSmTriggerPaddingSmConfig,
}
type contextComponentTokensMULTISELECTSmTriggerBorderRadiusSmConfig = {
  container?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  @as("no-container") noContainer?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensMULTISELECTSmTriggerBorderRadiusConfig = {
  sm?: contextComponentTokensMULTISELECTSmTriggerBorderRadiusSmConfig,
  md?: contextComponentTokensMULTISELECTSmTriggerBorderRadiusSmConfig,
  lg?: contextComponentTokensMULTISELECTSmTriggerBorderRadiusSmConfig,
}
type contextComponentTokensMULTISELECTSmTriggerBoxShadowConfig = {
  container?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  @as("no-container") noContainer?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
}
type contextComponentTokensMULTISELECTSmTriggerBackgroundColorContainerConfig = {
  hover?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  error?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  focus?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  @as("open") open_?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  closed?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensMULTISELECTSmTriggerBackgroundColorConfig = {
  container?: contextComponentTokensMULTISELECTSmTriggerBackgroundColorContainerConfig,
  @as("no-container") noContainer?: contextComponentTokensMULTISELECTSmTriggerBackgroundColorContainerConfig,
}
type contextComponentTokensMULTISELECTSmTriggerOutlineContainerConfig = {
  hover?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
  error?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
  focus?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
  @as("open") open_?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
  closed?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
}
type contextComponentTokensMULTISELECTSmTriggerOutlineConfig = {
  container?: contextComponentTokensMULTISELECTSmTriggerOutlineContainerConfig,
  @as("no-container") noContainer?: contextComponentTokensMULTISELECTSmTriggerOutlineContainerConfig,
}
type contextComponentTokensMULTISELECTSmTriggerSelectionTagContainerCountConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
}
type contextComponentTokensMULTISELECTSmTriggerSelectionTagContainerConfig = {
  count?: contextComponentTokensMULTISELECTSmTriggerSelectionTagContainerCountConfig,
  text?: contextComponentTokensMULTISELECTSmTriggerSelectionTagContainerCountConfig,
}
type contextComponentTokensMULTISELECTSmTriggerSelectionTagConfig = {
  container?: contextComponentTokensMULTISELECTSmTriggerSelectionTagContainerConfig,
  @as("no-container") noContainer?: contextComponentTokensMULTISELECTSmTriggerSelectionTagContainerConfig,
}
type contextComponentTokensMULTISELECTSmTriggerConfig = {
  height?: contextComponentTokensMULTISELECTSmTriggerHeightConfig,
  padding?: contextComponentTokensMULTISELECTSmTriggerPaddingConfig,
  borderRadius?: contextComponentTokensMULTISELECTSmTriggerBorderRadiusConfig,
  boxShadow?: contextComponentTokensMULTISELECTSmTriggerBoxShadowConfig,
  backgroundColor?: contextComponentTokensMULTISELECTSmTriggerBackgroundColorConfig,
  outline?: contextComponentTokensMULTISELECTSmTriggerOutlineConfig,
  selectionTag?: contextComponentTokensMULTISELECTSmTriggerSelectionTagConfig,
  placeholder?: contextComponentTokensMODALSmHeaderTextTitleConfig,
  selectedValue?: contextComponentTokensMODALSmHeaderTextTitleConfig,
}
type contextComponentTokensMULTISELECTSmMenuItemSeperatorConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  margin?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensMULTISELECTSmMenuItemConfig = {
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  margin?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  backgroundColor?: contextComponentTokensMENUSmItemBackgroundColorDefaultEnabledConfig,
  optionsLabel?: contextComponentTokensMULTISELECTSmLabelConfig,
  option?: contextComponentTokensMULTISELECTSmLabelConfig,
  description?: contextComponentTokensMULTISELECTSmLabelConfig,
  seperator?: contextComponentTokensMULTISELECTSmMenuItemSeperatorConfig,
}
type contextComponentTokensMULTISELECTSmMenuConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  padding?: contextComponentTokensMULTISELECTSmTriggerPaddingConfig,
  item?: contextComponentTokensMULTISELECTSmMenuItemConfig,
}
type contextComponentTokensMULTISELECTSmDrawerHeaderConfig = {
  paddingX?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  borderBottom?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensMULTISELECTSmDrawerSearchConfig = {
  paddingX?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  marginTop?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  marginBottom?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensMULTISELECTSmDrawerConfig = {
  header?: contextComponentTokensMULTISELECTSmDrawerHeaderConfig,
  search?: contextComponentTokensMULTISELECTSmDrawerSearchConfig,
  content?: contextComponentTokensRADIOSmGroupConfig,
}
type contextComponentTokensMULTISELECTSmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  label?: contextComponentTokensMULTISELECTSmLabelConfig,
  subLabel?: contextComponentTokensMULTISELECTSmLabelConfig,
  hintText?: contextComponentTokensMULTISELECTSmLabelConfig,
  errorMessage?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  required?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  trigger?: contextComponentTokensMULTISELECTSmTriggerConfig,
  menu?: contextComponentTokensMULTISELECTSmMenuConfig,
  drawer?: contextComponentTokensMULTISELECTSmDrawerConfig,
}
type contextComponentTokensMULTISELECTConfig = {
  sm?: contextComponentTokensMULTISELECTSmConfig,
  lg?: contextComponentTokensMULTISELECTSmConfig,
}
type contextComponentTokensSINGLESELECTSmTriggerConfig = {
  height?: contextComponentTokensMULTISELECTSmTriggerHeightConfig,
  padding?: contextComponentTokensMULTISELECTSmTriggerPaddingConfig,
  borderRadius?: contextComponentTokensMULTISELECTSmTriggerBorderRadiusConfig,
  boxShadow?: contextComponentTokensMULTISELECTSmTriggerBoxShadowConfig,
  backgroundColor?: contextComponentTokensMULTISELECTSmTriggerBackgroundColorConfig,
  outline?: contextComponentTokensMULTISELECTSmTriggerOutlineConfig,
  placeholder?: contextComponentTokensMODALSmHeaderTextTitleConfig,
  selectedValue?: contextComponentTokensMODALSmHeaderTextTitleConfig,
}
type contextComponentTokensSINGLESELECTSmDrawerConfig = {
  header?: contextComponentTokensMULTISELECTSmDrawerHeaderConfig,
}
type contextComponentTokensSINGLESELECTSmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  label?: contextComponentTokensMULTISELECTSmLabelConfig,
  subLabel?: contextComponentTokensMULTISELECTSmLabelConfig,
  hintText?: contextComponentTokensMULTISELECTSmLabelConfig,
  errorMessage?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  required?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  trigger?: contextComponentTokensSINGLESELECTSmTriggerConfig,
  menu?: contextComponentTokensMULTISELECTSmMenuConfig,
  drawer?: contextComponentTokensSINGLESELECTSmDrawerConfig,
}
type contextComponentTokensSINGLESELECTConfig = {
  sm?: contextComponentTokensSINGLESELECTSmConfig,
  lg?: contextComponentTokensSINGLESELECTSmConfig,
}
@unboxed type mozInitialOrInheritOrInitialOrRevertEtc1ufa7 = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("none") NoneRevertEtc1ufa7 | @as("block") Block | @as("inline") Inline | @as("run-in") RunIn | @as("-ms-flexbox") MsFlexbox | @as("-ms-grid") MsGrid | @as("-webkit-flex") WebkitFlex | @as("flex") Flex | @as("flow") Flow | @as("flow-root") FlowRoot | @as("grid") Grid | @as("ruby") Ruby | @as("table") Table | @as("ruby-base") RubyBase | @as("ruby-base-container") RubyBaseContainer | @as("ruby-text") RubyText | @as("ruby-text-container") RubyTextContainer | @as("table-caption") TableCaption | @as("table-cell") TableCell | @as("table-column") TableColumn | @as("table-column-group") TableColumnGroup | @as("table-footer-group") TableFooterGroup | @as("table-header-group") TableHeaderGroup | @as("table-row") TableRow | @as("table-row-group") TableRowGroup | @as("-ms-inline-flexbox") MsInlineFlexbox | @as("-ms-inline-grid") MsInlineGrid | @as("-webkit-inline-flex") WebkitInlineFlex | @as("inline-block") InlineBlock | @as("inline-flex") InlineFlex | @as("inline-grid") InlineGrid | @as("inline-list-item") InlineListItem | @as("inline-table") InlineTable | @as("contents") Contents | @as("list-item") ListItem | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
@unboxed type mozInitialOrInheritOrInitialOrRevertEtc1w3ez = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("normal") Normal | @as("right") RightRevertEtc1w3ez | @as("left") LeftRevertEtc1w3ez | @as("center") CenterRevertEtc1w3ez | @as("space-around") SpaceAround | @as("space-between") SpaceBetween | @as("space-evenly") SpaceEvenly | @as("stretch") Stretch | @as("end") EndRevertEtc1w3ez | @as("flex-end") FlexEnd | @as("flex-start") FlexStart | @as("start") Start | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
@unboxed type mozInitialOrInheritOrInitialOrRevertEtcoic7x = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("normal") Normal | @as("center") CenterRevertEtcoic7x | @as("stretch") Stretch | @as("end") EndRevertEtcoic7x | @as("flex-end") FlexEnd | @as("flex-start") FlexStart | @as("start") Start | @as("self-end") SelfEnd | @as("self-start") SelfStart | @as("anchor-center") AnchorCenter | @as("baseline") Baseline | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensTABLESmHeaderDescriptionConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
  maxWidth?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
}
type contextComponentTokensTABLESmHeaderHeaderSlot1Config = {
  maxHeight?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  flexShrink?: string,  // ⚪ loose — was `Globals | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; indexOf?: `
}
type contextComponentTokensTABLESmHeaderTitleRowConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  marginBottom?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  justifyContent?: mozInitialOrInheritOrInitialOrRevertEtc1w3ez,
  alignItems?: mozInitialOrInheritOrInitialOrRevertEtcoic7x,
}
type contextComponentTokensTABLESmHeaderDescriptionRowConfig = {
  marginTop?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensTABLESmHeaderActionIconsSearchIconConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
}
type contextComponentTokensTABLESmHeaderActionIconsColumnManagerIconConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensTABLESmHeaderActionIconsColumnManagerTriggerFocusVisibleConfig = {
  outline?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
  outlineOffset?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
}
type contextComponentTokensTABLESmHeaderActionIconsColumnManagerTriggerConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  opacity?: string,  // ⚠️ REVIEW — was `string | number | RuleSet<any> | { [x: string]: string | number | RuleSet<any> | ... | {}; accentColor?: Globa` — match the real type by hand
  focusVisible?: contextComponentTokensTABLESmHeaderActionIconsColumnManagerTriggerFocusVisibleConfig,
}
type contextComponentTokensTABLESmHeaderActionIconsConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  searchIcon?: contextComponentTokensTABLESmHeaderActionIconsSearchIconConfig,
  filterIcon?: contextComponentTokensTABLESmHeaderActionIconsSearchIconConfig,
  columnManagerIcon?: contextComponentTokensTABLESmHeaderActionIconsColumnManagerIconConfig,
  columnManagerTrigger?: contextComponentTokensTABLESmHeaderActionIconsColumnManagerTriggerConfig,
}
type contextComponentTokensTABLESmHeaderConfig = {
  display?: mozInitialOrInheritOrInitialOrRevertEtc1ufa7,
  justifyContent?: mozInitialOrInheritOrInitialOrRevertEtc1w3ez,
  alignItems?: mozInitialOrInheritOrInitialOrRevertEtcoic7x,
  marginBottom?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  maxWidth?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  overflowX?: string,
  overflowY?: string,
  title?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  description?: contextComponentTokensTABLESmHeaderDescriptionConfig,
  headerSlot1?: contextComponentTokensTABLESmHeaderHeaderSlot1Config,
  headerSlot2?: contextComponentTokensTABLESmHeaderHeaderSlot1Config,
  headerSlot3?: contextComponentTokensTABLESmHeaderHeaderSlot1Config,
  titleRow?: contextComponentTokensTABLESmHeaderTitleRowConfig,
  descriptionRow?: contextComponentTokensTABLESmHeaderDescriptionRowConfig,
  actionIcons?: contextComponentTokensTABLESmHeaderActionIconsConfig,
}
@unboxed type mozInitialOrInheritOrInitialOrRevertEtc96qi2 = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("-moz-fit-content") MozFitContent | @as("-moz-max-content") MozMaxContent | @as("-moz-min-content") MozMinContent | @as("-webkit-fit-content") WebkitFitContent | @as("-webkit-max-content") WebkitMaxContent | @as("auto") Auto | @as("fit-content") FitContent | @as("intrinsic") Intrinsic | @as("max-content") MaxContent | @as("min-content") MinContent | @as("-webkit-min-content") WebkitMinContent | Num(float) | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensTABLESmDataTableBulkActionsSelectTextConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  flex?: string,  // ⚪ loose — was `number | Globals | "none" | "auto" | "fit-content" | "max-content" | "min-content" | "content" | { readonly [x`
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensTABLESmDataTableBulkActionsConfig = {
  top?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  left?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  transform?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  zIndex?: string,  // ⚪ loose — was `Globals | "auto" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; i`
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  display?: mozInitialOrInheritOrInitialOrRevertEtc1ufa7,
  alignItems?: mozInitialOrInheritOrInitialOrRevertEtcoic7x,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  minWidth?: mozInitialOrInheritOrInitialOrRevertEtc1owcx,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  maxWidth?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  selectText?: contextComponentTokensTABLESmDataTableBulkActionsSelectTextConfig,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
}
type contextComponentTokensTABLESmDataTableTableHeaderRowConfig = {
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  @as("&:hover") __hover?: string,  // ⚪ loose — was `{ backgroundColor?: Globals | NamedColor | "transparent" | SystemColor | DeprecatedSystemColor | "currentColor`
}
type contextComponentTokensTABLESmDataTableTableHeaderCellConfig = {
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  textAlign?: string,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
@unboxed type mozInitialOrInheritOrInitialOrRevertEtcop7hp = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("none") NoneRevertEtcop7hp | @as("auto") Auto | @as("text") TextRevertEtcop7hp | @as("default") Default | @as("-moz-grab") MozGrab | @as("-moz-zoom-in") MozZoomIn | @as("-moz-zoom-out") MozZoomOut | @as("-webkit-grab") WebkitGrab | @as("-webkit-grabbing") WebkitGrabbing | @as("-webkit-zoom-in") WebkitZoomIn | @as("-webkit-zoom-out") WebkitZoomOut | @as("alias") Alias | @as("all-scroll") AllScroll | @as("cell") Cell | @as("col-resize") ColResize | @as("context-menu") ContextMenuRevertEtcop7hp | @as("copy") Copy | @as("crosshair") Crosshair | @as("e-resize") EResize | @as("ew-resize") EwResize | @as("grab") Grab | @as("grabbing") Grabbing | @as("help") Help | @as("move") Move | @as("n-resize") NResize | @as("ne-resize") NeResize | @as("nesw-resize") NeswResize | @as("no-drop") NoDrop | @as("not-allowed") NotAllowed | @as("ns-resize") NsResize | @as("nw-resize") NwResize | @as("nwse-resize") NwseResize | @as("pointer") Pointer | @as("progress") Progress | @as("row-resize") RowResize | @as("s-resize") SResize | @as("se-resize") SeResize | @as("sw-resize") SwResize | @as("vertical-text") VerticalText | @as("w-resize") WResize | @as("wait") Wait | @as("zoom-in") ZoomIn | @as("zoom-out") ZoomOut | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensTABLESmDataTableTableHeaderSortableConfig = {
  cursor?: mozInitialOrInheritOrInitialOrRevertEtcop7hp,
  userSelect?: string,
}
@unboxed type mozInitialOrInheritOrInitialOrRevertEtcc55tl = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("none") NoneRevertEtcc55tl | @as("full-width") FullWidth | @as("capitalize") Capitalize | @as("full-size-kana") FullSizeKana | @as("lowercase") Lowercase | @as("math-auto") MathAuto | @as("uppercase") Uppercase | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensTABLESmDataTableTableHeaderFilterConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  cursor?: mozInitialOrInheritOrInitialOrRevertEtcop7hp,
  textColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  maxHeight?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  overflowY?: string,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  sortOption?: string,  // ⚪ loose — was `{ padding?: number | Globals | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; co`
  selectedBackground?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hoverBackground?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  selectedTextColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  normalTextColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  selectedFontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  normalFontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  itemPadding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  itemGap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  itemBorderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  itemFontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  groupLabelFontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  groupLabelFontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  groupLabelColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  groupLabelPadding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  groupLabelTextTransform?: mozInitialOrInheritOrInitialOrRevertEtcc55tl,
  separatorHeight?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  separatorColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensTABLESmDataTableTableHeaderConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderBottom?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  row?: contextComponentTokensTABLESmDataTableTableHeaderRowConfig,
  cell?: contextComponentTokensTABLESmDataTableTableHeaderCellConfig,
  sortable?: contextComponentTokensTABLESmDataTableTableHeaderSortableConfig,
  filter?: contextComponentTokensTABLESmDataTableTableHeaderFilterConfig,
}
type contextComponentTokensTABLESmDataTableTableBodyRowConfig = {
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  @as("&:hover") __hover?: string,  // ⚪ loose — was `{ backgroundColor?: Globals | NamedColor | "transparent" | SystemColor | DeprecatedSystemColor | "currentColor`
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensTABLESmDataTableTableBodyCellConfig = {
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  borderTop?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  dateLabel?: string,  // ⚪ loose — was `{ fontSize?: number | Globals | "math" | AbsoluteSize | "larger" | "smaller" | { readonly [x: number]: string;`
  expandable?: string,  // ⚪ loose — was `{ padding?: number | Globals | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; co`
}
type contextComponentTokensTABLESmDataTableTableBodyConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderTop?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  row?: contextComponentTokensTABLESmDataTableTableBodyRowConfig,
  cell?: contextComponentTokensTABLESmDataTableTableBodyCellConfig,
}
type contextComponentTokensTABLESmDataTableTableFooterPaginationConfig = {
  pageText?: string,  // ⚪ loose — was `{ fontSize?: number | Globals | "math" | AbsoluteSize | "larger" | "smaller" | { readonly [x: number]: string;`
  pageSizeSelector?: string,  // ⚪ loose — was `{ gap?: number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?:`
  pageNavigation?: string,  // ⚪ loose — was `{ gap?: number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?:`
}
type contextComponentTokensTABLESmDataTableTableFooterConfig = {
  display?: mozInitialOrInheritOrInitialOrRevertEtc1ufa7,
  justifyContent?: mozInitialOrInheritOrInitialOrRevertEtc1w3ez,
  alignItems?: mozInitialOrInheritOrInitialOrRevertEtcoic7x,
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  borderTop?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  position?: string,
  bottom?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  zIndex?: string,  // ⚪ loose — was `Globals | "auto" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; i`
  flexShrink?: string,  // ⚪ loose — was `Globals | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; indexOf?: `
  pagination?: contextComponentTokensTABLESmDataTableTableFooterPaginationConfig,
}
type contextComponentTokensTABLESmDataTableTableConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  tableLayout?: string,
  borderCollapse?: string,
  borderSpacing?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  position?: string,
  minWidth?: mozInitialOrInheritOrInitialOrRevertEtc1owcx,
  header?: contextComponentTokensTABLESmDataTableTableHeaderConfig,
  body?: contextComponentTokensTABLESmDataTableTableBodyConfig,
  footer?: contextComponentTokensTABLESmDataTableTableFooterConfig,
}
type contextComponentTokensTABLESmDataTableConfig = {
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  maxHeight?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  minHeight?: mozInitialOrInheritOrInitialOrRevertEtc96qi2,
  bulkActions?: contextComponentTokensTABLESmDataTableBulkActionsConfig,
  table?: contextComponentTokensTABLESmDataTableTableConfig,
}
type contextComponentTokensTABLESmConfig = {
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  display?: mozInitialOrInheritOrInitialOrRevertEtc1ufa7,
  flexDirection?: string,
  position?: string,
  header?: contextComponentTokensTABLESmHeaderConfig,
  dataTable?: contextComponentTokensTABLESmDataTableConfig,
}
type contextComponentTokensTABLEConfig = {
  sm?: contextComponentTokensTABLESmConfig,
  lg?: contextComponentTokensTABLESmConfig,
}
type contextComponentTokensCALENDARSmTriggerQuickSelectorBorderRadiusConfig = {
  topLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  topRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  bottomLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  bottomRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensCALENDARSmTriggerQuickSelectorPaddingConfig = {
  sm?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  md?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  lg?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
}
type contextComponentTokensCALENDARSmTriggerQuickSelectorBorderDisabledConfig = {
  left?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  top?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  bottom?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  right?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensCALENDARSmTriggerQuickSelectorBorderConfig = {
  disabled?: contextComponentTokensCALENDARSmTriggerQuickSelectorBorderDisabledConfig,
  active?: contextComponentTokensCALENDARSmTriggerQuickSelectorBorderDisabledConfig,
  default?: contextComponentTokensCALENDARSmTriggerQuickSelectorBorderDisabledConfig,
  hover?: contextComponentTokensCALENDARSmTriggerQuickSelectorBorderDisabledConfig,
}
type contextComponentTokensCALENDARSmTriggerQuickSelectorTextConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
}
type contextComponentTokensCALENDARSmTriggerQuickSelectorConfig = {
  borderRadius?: contextComponentTokensCALENDARSmTriggerQuickSelectorBorderRadiusConfig,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  padding?: contextComponentTokensCALENDARSmTriggerQuickSelectorPaddingConfig,
  border?: contextComponentTokensCALENDARSmTriggerQuickSelectorBorderConfig,
  text?: contextComponentTokensCALENDARSmTriggerQuickSelectorTextConfig,
  iconSize?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
}
type contextComponentTokensCALENDARSmTriggerDateInputBorderRadiusConfig = {
  withQuickSelector?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  withoutQuickSelector?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensCALENDARSmTriggerDateInputTextConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
}
type contextComponentTokensCALENDARSmTriggerDateInputBorderConfig = {
  disabled?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  active?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  default?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  hover?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  error?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensCALENDARSmTriggerDateInputConfig = {
  borderRadius?: contextComponentTokensCALENDARSmTriggerDateInputBorderRadiusConfig,
  padding?: contextComponentTokensCALENDARSmTriggerQuickSelectorPaddingConfig,
  text?: contextComponentTokensCALENDARSmTriggerDateInputTextConfig,
  border?: contextComponentTokensCALENDARSmTriggerDateInputBorderConfig,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  iconSize?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensCALENDARSmTriggerConfig = {
  quickSelector?: contextComponentTokensCALENDARSmTriggerQuickSelectorConfig,
  dateInput?: contextComponentTokensCALENDARSmTriggerDateInputConfig,
}
type contextComponentTokensCALENDARSmCalendarHeaderDateInputConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  label?: contextComponentTokensMODALSmHeaderTextTitleConfig,
}
type contextComponentTokensCALENDARSmCalendarHeaderConfig = {
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  dateInput?: contextComponentTokensCALENDARSmCalendarHeaderDateInputConfig,
}
type contextComponentTokensCALENDARSmCalendarCalendarGridMonthHeaderConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  padding?: string,  // ⚪ loose — was `{ x?: number | Globals | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?:`
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensCALENDARSmCalendarCalendarGridMonthConfig = {
  header?: contextComponentTokensCALENDARSmCalendarCalendarGridMonthHeaderConfig,
}
type contextComponentTokensCALENDARSmCalendarCalendarGridWeekConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  row?: contextComponentTokensRADIOSmGroupConfig,
}
type contextComponentTokensCALENDARSmCalendarCalendarGridDayCellConfig = {
  padding?: string,  // ⚪ loose — was `{ x?: number | Globals | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?:`
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
  border?: string,  // ⚪ loose — was `{ disabled?: number | "-moz-initial" | "inherit" | "initial" | "revert" | "revert-layer" | "unset" | "none" | `
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensCALENDARSmCalendarCalendarGridDayStatesConfig = {
  startDate?: string,  // ⚪ loose — was `{ backgroundColor?: Globals | NamedColor | "transparent" | SystemColor | DeprecatedSystemColor | "currentColor`
  endDate?: string,  // ⚪ loose — was `{ backgroundColor?: Globals | NamedColor | "transparent" | SystemColor | DeprecatedSystemColor | "currentColor`
  singleDate?: string,  // ⚪ loose — was `{ backgroundColor?: Globals | NamedColor | "transparent" | SystemColor | DeprecatedSystemColor | "currentColor`
  rangeDay?: string,  // ⚪ loose — was `{ backgroundColor?: Globals | NamedColor | "transparent" | SystemColor | DeprecatedSystemColor | "currentColor`
  todayDay?: string,  // ⚪ loose — was `{ fontWeight?: Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?:`
  disabledDay?: string,  // ⚪ loose — was `{ color?: Globals | NamedColor | "transparent" | SystemColor | DeprecatedSystemColor | "currentColor" | { read`
}
type contextComponentTokensCALENDARSmCalendarCalendarGridDayTextConfig = {
  dayNumber?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  selectedDay?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  rangeDay?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  todayDay?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  disabledDate?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
}
type contextComponentTokensCALENDARSmCalendarCalendarGridDayTodayIndicatorConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensCALENDARSmCalendarCalendarGridDayConfig = {
  cell?: contextComponentTokensCALENDARSmCalendarCalendarGridDayCellConfig,
  states?: contextComponentTokensCALENDARSmCalendarCalendarGridDayStatesConfig,
  text?: contextComponentTokensCALENDARSmCalendarCalendarGridDayTextConfig,
  todayIndicator?: contextComponentTokensCALENDARSmCalendarCalendarGridDayTodayIndicatorConfig,
}
type contextComponentTokensCALENDARSmCalendarCalendarGridConfig = {
  month?: contextComponentTokensCALENDARSmCalendarCalendarGridMonthConfig,
  week?: contextComponentTokensCALENDARSmCalendarCalendarGridWeekConfig,
  day?: contextComponentTokensCALENDARSmCalendarCalendarGridDayConfig,
}
type contextComponentTokensCALENDARSmCalendarFooterConfig = {
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  borderTop?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensCALENDARSmCalendarConfig = {
  minWidth?: mozInitialOrInheritOrInitialOrRevertEtc1owcx,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  header?: contextComponentTokensCALENDARSmCalendarHeaderConfig,
  calendarGrid?: contextComponentTokensCALENDARSmCalendarCalendarGridConfig,
  footer?: contextComponentTokensCALENDARSmCalendarFooterConfig,
}
type contextComponentTokensCALENDARSmConfig = {
  trigger?: contextComponentTokensCALENDARSmTriggerConfig,
  calendar?: contextComponentTokensCALENDARSmCalendarConfig,
}
type contextComponentTokensCALENDARConfig = {
  sm?: contextComponentTokensCALENDARSmConfig,
  lg?: contextComponentTokensCALENDARSmConfig,
}
type contextComponentTokensTIMEPICKERSmDropdownColumnHeaderConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  paddingY?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensTIMEPICKERSmDropdownColumnConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  separator?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  header?: contextComponentTokensTIMEPICKERSmDropdownColumnHeaderConfig,
}
type contextComponentTokensTIMEPICKERSmDropdownOptionColorConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  selected?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensTIMEPICKERSmDropdownOptionBackgroundColorConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  selected?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensTIMEPICKERSmDropdownOptionConfig = {
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  paddingX?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  color?: contextComponentTokensTIMEPICKERSmDropdownOptionColorConfig,
  backgroundColor?: contextComponentTokensTIMEPICKERSmDropdownOptionBackgroundColorConfig,
  focusOutline?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
}
type contextComponentTokensTIMEPICKERSmDropdownConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  maxHeight?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  column?: contextComponentTokensTIMEPICKERSmDropdownColumnConfig,
  option?: contextComponentTokensTIMEPICKERSmDropdownOptionConfig,
}
type contextComponentTokensTIMEPICKERSmErrorMessageConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  marginTop?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensTIMEPICKERSmConfig = {
  dropdown?: contextComponentTokensTIMEPICKERSmDropdownConfig,
  errorMessage?: contextComponentTokensTIMEPICKERSmErrorMessageConfig,
}
type contextComponentTokensTIMEPICKERConfig = {
  sm?: contextComponentTokensTIMEPICKERSmConfig,
  lg?: contextComponentTokensTIMEPICKERSmConfig,
}
type contextComponentTokensACCORDIONSmGapConfig = {
  border?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  noBorder?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensACCORDIONSmBorderRadiusConfig = {
  border?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  noBorder?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensACCORDIONSmTriggerBackgroundColorBorderConfig = {
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  active?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  @as("open") open_?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensACCORDIONSmTriggerBackgroundColorConfig = {
  border?: contextComponentTokensACCORDIONSmTriggerBackgroundColorBorderConfig,
  noBorder?: contextComponentTokensACCORDIONSmTriggerBackgroundColorBorderConfig,
}
type contextComponentTokensACCORDIONSmTriggerBorderBorderConfig = {
  disabled?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  active?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  default?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  hover?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  @as("open") open_?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensACCORDIONSmTriggerBorderConfig = {
  border?: contextComponentTokensACCORDIONSmTriggerBorderBorderConfig,
  noBorder?: contextComponentTokensACCORDIONSmTriggerBorderBorderConfig,
}
type contextComponentTokensACCORDIONSmTriggerTextTitleConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  color?: contextComponentTokensACCORDIONSmTriggerBackgroundColorBorderConfig,
}
type contextComponentTokensACCORDIONSmTriggerTextSubtextConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  color?: contextComponentTokensACCORDIONSmTriggerBackgroundColorBorderConfig,
}
type contextComponentTokensACCORDIONSmTriggerTextConfig = {
  title?: contextComponentTokensACCORDIONSmTriggerTextTitleConfig,
  subtext?: contextComponentTokensACCORDIONSmTriggerTextSubtextConfig,
}
type contextComponentTokensACCORDIONSmTriggerSlotConfig = {
  maxWidth?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
}
type contextComponentTokensACCORDIONSmTriggerConfig = {
  backgroundColor?: contextComponentTokensACCORDIONSmTriggerBackgroundColorConfig,
  border?: contextComponentTokensACCORDIONSmTriggerBorderConfig,
  padding?: contextComponentTokensACCORDIONSmBorderRadiusConfig,
  text?: contextComponentTokensACCORDIONSmTriggerTextConfig,
  slot?: contextComponentTokensACCORDIONSmTriggerSlotConfig,
}
type contextComponentTokensACCORDIONSmSeparatorColorConfig = {
  border?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  noBorder?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensACCORDIONSmSeparatorConfig = {
  color?: contextComponentTokensACCORDIONSmSeparatorColorConfig,
}
type contextComponentTokensACCORDIONSmConfig = {
  gap?: contextComponentTokensACCORDIONSmGapConfig,
  borderRadius?: contextComponentTokensACCORDIONSmBorderRadiusConfig,
  trigger?: contextComponentTokensACCORDIONSmTriggerConfig,
  separator?: contextComponentTokensACCORDIONSmSeparatorConfig,
}
type contextComponentTokensACCORDIONConfig = {
  sm?: contextComponentTokensACCORDIONSmConfig,
  lg?: contextComponentTokensACCORDIONSmConfig,
}
type contextComponentTokensSTATCARDSmTextContainerHeaderHelpIconColorConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensSTATCARDSmTextContainerHeaderHelpIconConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  color?: contextComponentTokensSTATCARDSmTextContainerHeaderHelpIconColorConfig,
}
type contextComponentTokensSTATCARDSmTextContainerHeaderConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  title?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  titleIcon?: contextComponentTokensMENUV2SmSearchIconConfig,
  helpIcon?: contextComponentTokensSTATCARDSmTextContainerHeaderHelpIconConfig,
}
type contextComponentTokensSTATCARDSmTextContainerStatsTitleValueConfig = {
  line?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  progress?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  bar?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  number?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
}
type contextComponentTokensSTATCARDSmTextContainerStatsTitleChangeConfig = {
  margin?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  arrow?: string,  // ⚪ loose — was `{ width?: number | Globals | "-moz-fit-content" | "-moz-max-content" | "-moz-min-content" | "-webkit-fit-conte`
  text?: string,  // ⚪ loose — was `{ fontSize?: number | Globals | "math" | AbsoluteSize | "larger" | "smaller" | { readonly [x: number]: string;`
}
type contextComponentTokensSTATCARDSmTextContainerStatsTitleConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  value?: contextComponentTokensSTATCARDSmTextContainerStatsTitleValueConfig,
  change?: contextComponentTokensSTATCARDSmTextContainerStatsTitleChangeConfig,
}
type contextComponentTokensSTATCARDSmTextContainerStatsConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  title?: contextComponentTokensSTATCARDSmTextContainerStatsTitleConfig,
  subtitle?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
}
type contextComponentTokensSTATCARDSmTextContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  header?: contextComponentTokensSTATCARDSmTextContainerHeaderConfig,
  stats?: contextComponentTokensSTATCARDSmTextContainerStatsConfig,
}
type contextComponentTokensSTATCARDSmChartColorsLineConfig = {
  increase?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  decrease?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensSTATCARDSmChartColorsGradientConfig = {
  end?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  startOpacity?: float,
  endOpacity?: float,
}
type contextComponentTokensSTATCARDSmChartColorsConfig = {
  line?: contextComponentTokensSTATCARDSmChartColorsLineConfig,
  area?: contextComponentTokensSTATCARDSmChartColorsLineConfig,
  gradient?: contextComponentTokensSTATCARDSmChartColorsGradientConfig,
}
@unboxed type mozInitialOrInheritOrInitialOrRevertEtc1i3k7 = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("none") NoneRevertEtc1i3k7 | @as("aliceblue") Aliceblue | @as("antiquewhite") Antiquewhite | @as("aqua") Aqua | @as("aquamarine") Aquamarine | @as("azure") Azure | @as("beige") Beige | @as("bisque") Bisque | @as("black") Black | @as("blanchedalmond") Blanchedalmond | @as("blue") Blue | @as("blueviolet") Blueviolet | @as("brown") Brown | @as("burlywood") Burlywood | @as("cadetblue") Cadetblue | @as("chartreuse") Chartreuse | @as("chocolate") Chocolate | @as("coral") Coral | @as("cornflowerblue") Cornflowerblue | @as("cornsilk") Cornsilk | @as("crimson") Crimson | @as("cyan") Cyan | @as("darkblue") Darkblue | @as("darkcyan") Darkcyan | @as("darkgoldenrod") Darkgoldenrod | @as("darkgray") Darkgray | @as("darkgreen") Darkgreen | @as("darkgrey") Darkgrey | @as("darkkhaki") Darkkhaki | @as("darkmagenta") Darkmagenta | @as("darkolivegreen") Darkolivegreen | @as("darkorange") Darkorange | @as("darkorchid") Darkorchid | @as("darkred") Darkred | @as("darksalmon") Darksalmon | @as("darkseagreen") Darkseagreen | @as("darkslateblue") Darkslateblue | @as("darkslategray") Darkslategray | @as("darkslategrey") Darkslategrey | @as("darkturquoise") Darkturquoise | @as("darkviolet") Darkviolet | @as("deeppink") Deeppink | @as("deepskyblue") Deepskyblue | @as("dimgray") Dimgray | @as("dimgrey") Dimgrey | @as("dodgerblue") Dodgerblue | @as("firebrick") Firebrick | @as("floralwhite") Floralwhite | @as("forestgreen") Forestgreen | @as("fuchsia") Fuchsia | @as("gainsboro") Gainsboro | @as("ghostwhite") Ghostwhite | @as("gold") Gold | @as("goldenrod") Goldenrod | @as("gray") Gray | @as("green") Green | @as("greenyellow") Greenyellow | @as("grey") Grey | @as("honeydew") Honeydew | @as("hotpink") Hotpink | @as("indianred") Indianred | @as("indigo") Indigo | @as("ivory") Ivory | @as("khaki") Khaki | @as("lavender") Lavender | @as("lavenderblush") Lavenderblush | @as("lawngreen") Lawngreen | @as("lemonchiffon") Lemonchiffon | @as("lightblue") Lightblue | @as("lightcoral") Lightcoral | @as("lightcyan") Lightcyan | @as("lightgoldenrodyellow") Lightgoldenrodyellow | @as("lightgray") Lightgray | @as("lightgreen") Lightgreen | @as("lightgrey") Lightgrey | @as("lightpink") Lightpink | @as("lightsalmon") Lightsalmon | @as("lightseagreen") Lightseagreen | @as("lightskyblue") Lightskyblue | @as("lightslategray") Lightslategray | @as("lightslategrey") Lightslategrey | @as("lightsteelblue") Lightsteelblue | @as("lightyellow") Lightyellow | @as("lime") Lime | @as("limegreen") Limegreen | @as("linen") Linen | @as("magenta") Magenta | @as("maroon") Maroon | @as("mediumaquamarine") Mediumaquamarine | @as("mediumblue") Mediumblue | @as("mediumorchid") Mediumorchid | @as("mediumpurple") Mediumpurple | @as("mediumseagreen") Mediumseagreen | @as("mediumslateblue") Mediumslateblue | @as("mediumspringgreen") Mediumspringgreen | @as("mediumturquoise") Mediumturquoise | @as("mediumvioletred") Mediumvioletred | @as("midnightblue") Midnightblue | @as("mintcream") Mintcream | @as("mistyrose") Mistyrose | @as("moccasin") Moccasin | @as("navajowhite") Navajowhite | @as("navy") Navy | @as("oldlace") Oldlace | @as("olive") Olive | @as("olivedrab") Olivedrab | @as("orange") Orange | @as("orangered") Orangered | @as("orchid") Orchid | @as("palegoldenrod") Palegoldenrod | @as("palegreen") Palegreen | @as("paleturquoise") Paleturquoise | @as("palevioletred") Palevioletred | @as("papayawhip") Papayawhip | @as("peachpuff") Peachpuff | @as("peru") Peru | @as("pink") Pink | @as("plum") Plum | @as("powderblue") Powderblue | @as("purple") Purple | @as("rebeccapurple") Rebeccapurple | @as("red") Red | @as("rosybrown") Rosybrown | @as("royalblue") Royalblue | @as("saddlebrown") Saddlebrown | @as("salmon") Salmon | @as("sandybrown") Sandybrown | @as("seagreen") Seagreen | @as("seashell") Seashell | @as("sienna") Sienna | @as("silver") Silver | @as("skyblue") Skyblue | @as("slateblue") Slateblue | @as("slategray") Slategray | @as("slategrey") Slategrey | @as("snow") Snow | @as("springgreen") Springgreen | @as("steelblue") Steelblue | @as("tan") Tan | @as("teal") Teal | @as("thistle") Thistle | @as("tomato") Tomato | @as("turquoise") Turquoise | @as("violet") Violet | @as("wheat") Wheat | @as("white") White | @as("whitesmoke") Whitesmoke | @as("yellow") Yellow | @as("yellowgreen") Yellowgreen | @as("transparent") Transparent | @as("AccentColor") AccentColor | @as("AccentColorText") AccentColorText | @as("ActiveText") ActiveText | @as("ButtonBorder") ButtonBorder | @as("ButtonFace") ButtonFace | @as("ButtonText") ButtonText | @as("Canvas") Canvas | @as("CanvasText") CanvasText | @as("Field") Field | @as("FieldText") FieldText | @as("GrayText") GrayText | @as("Highlight") HighlightRevertEtc1i3k7 | @as("HighlightText") HighlightText | @as("LinkText") LinkText | @as("Mark") Mark | @as("MarkText") MarkText | @as("SelectedItem") SelectedItem | @as("SelectedItemText") SelectedItemText | @as("VisitedText") VisitedText | @as("ActiveBorder") ActiveBorder | @as("ActiveCaption") ActiveCaption | @as("AppWorkspace") AppWorkspace | @as("Background") Background | @as("ButtonHighlight") ButtonHighlight | @as("ButtonShadow") ButtonShadow | @as("CaptionText") CaptionText | @as("InactiveBorder") InactiveBorder | @as("InactiveCaption") InactiveCaption | @as("InactiveCaptionText") InactiveCaptionText | @as("InfoBackground") InfoBackground | @as("InfoText") InfoText | @as("Menu") Menu | @as("MenuText") MenuText | @as("Scrollbar") ScrollbarRevertEtc1i3k7 | @as("ThreeDDarkShadow") ThreeDDarkShadow | @as("ThreeDFace") ThreeDFace | @as("ThreeDHighlight") ThreeDHighlight | @as("ThreeDLightShadow") ThreeDLightShadow | @as("ThreeDShadow") ThreeDShadow | @as("Window") Window | @as("WindowFrame") WindowFrame | @as("WindowText") WindowText | @as("currentColor") CurrentColor | @as("context-fill") ContextFill | @as("context-stroke") ContextStroke | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensSTATCARDSmChartLineActiveDotConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  fill?: mozInitialOrInheritOrInitialOrRevertEtc1i3k7,
}
type contextComponentTokensSTATCARDSmChartLineConfig = {
  strokeWidth?: string,  // ⚪ loose — was `number | Globals | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; i`
  activeDot?: contextComponentTokensSTATCARDSmChartLineActiveDotConfig,
}
type contextComponentTokensSTATCARDSmChartBarFillConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtc1i3k7,
  hover?: mozInitialOrInheritOrInitialOrRevertEtc1i3k7,
}
type contextComponentTokensSTATCARDSmChartBarConfig = {
  borderTopRightRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  borderTopLeftRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  borderBottomRightRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  borderBottomLeftRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  fill?: contextComponentTokensSTATCARDSmChartBarFillConfig,
}
@unboxed type mozInitialOrInheritOrInitialOrRevertEtcyzzvl = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("auto") Auto | @as("contain") Contain | @as("cover") Cover | Num(float) | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensSTATCARDSmChartProgressBarBackgroundPatternConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  size?: mozInitialOrInheritOrInitialOrRevertEtcyzzvl,
}
type contextComponentTokensSTATCARDSmChartProgressBarBackgroundConfig = {
  fill?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  empty?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  pattern?: contextComponentTokensSTATCARDSmChartProgressBarBackgroundPatternConfig,
}
type contextComponentTokensSTATCARDSmChartProgressBarConfig = {
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  background?: contextComponentTokensSTATCARDSmChartProgressBarBackgroundConfig,
  label?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
}
type contextComponentTokensSTATCARDSmChartTooltipConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
}
type contextComponentTokensSTATCARDSmChartConfig = {
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  colors?: contextComponentTokensSTATCARDSmChartColorsConfig,
  line?: contextComponentTokensSTATCARDSmChartLineConfig,
  bar?: contextComponentTokensSTATCARDSmChartBarConfig,
  progressBar?: contextComponentTokensSTATCARDSmChartProgressBarConfig,
  tooltip?: contextComponentTokensSTATCARDSmChartTooltipConfig,
}
type contextComponentTokensSTATCARDSmConfig = {
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  maxWidth?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  textContainer?: contextComponentTokensSTATCARDSmTextContainerConfig,
  chart?: contextComponentTokensSTATCARDSmChartConfig,
}
type contextComponentTokensSTATCARDConfig = {
  sm?: contextComponentTokensSTATCARDSmConfig,
  lg?: contextComponentTokensSTATCARDSmConfig,
}
type contextComponentTokensPROGRESSBARSmLinearHeightConfig = {
  sm?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  md?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  lg?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
}
type contextComponentTokensPROGRESSBARSmLinearFillBackgroundColorConfig = {
  solid?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  segmented?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensPROGRESSBARSmLinearFillBorderRadiusConfig = {
  solid?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  segmented?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensPROGRESSBARSmLinearFillConfig = {
  backgroundColor?: contextComponentTokensPROGRESSBARSmLinearFillBackgroundColorConfig,
  borderRadius?: contextComponentTokensPROGRESSBARSmLinearFillBorderRadiusConfig,
}
type contextComponentTokensPROGRESSBARSmLinearEmptyBackgroundImageConfig = {
  segmented?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
}
type contextComponentTokensPROGRESSBARSmLinearEmptyBackgroundSizeConfig = {
  segmented?: mozInitialOrInheritOrInitialOrRevertEtcyzzvl,
}
type contextComponentTokensPROGRESSBARSmLinearEmptyConfig = {
  backgroundColor?: contextComponentTokensPROGRESSBARSmLinearFillBackgroundColorConfig,
  backgroundImage?: contextComponentTokensPROGRESSBARSmLinearEmptyBackgroundImageConfig,
  backgroundSize?: contextComponentTokensPROGRESSBARSmLinearEmptyBackgroundSizeConfig,
}
type contextComponentTokensPROGRESSBARSmLinearConfig = {
  height?: contextComponentTokensPROGRESSBARSmLinearHeightConfig,
  fill?: contextComponentTokensPROGRESSBARSmLinearFillConfig,
  empty?: contextComponentTokensPROGRESSBARSmLinearEmptyConfig,
  borderRadius?: contextComponentTokensPROGRESSBARSmLinearFillBorderRadiusConfig,
}
type contextComponentTokensPROGRESSBARSmCircularStrokeWidthConfig = {
  sm?: float,
  md?: float,
  lg?: float,
}
type contextComponentTokensPROGRESSBARSmCircularStrokeConfig = {
  solid?: mozInitialOrInheritOrInitialOrRevertEtc1i3k7,
  segmented?: mozInitialOrInheritOrInitialOrRevertEtc1i3k7,
}
type contextComponentTokensPROGRESSBARSmCircularDashArrayConfig = {
  solid?: string,
  segmented?: string,
}
type contextComponentTokensPROGRESSBARSmCircularConfig = {
  size?: contextComponentTokensTEXTAREAV2SmTopContainerHelpIconWidthConfig,
  strokeWidth?: contextComponentTokensPROGRESSBARSmCircularStrokeWidthConfig,
  stroke?: contextComponentTokensPROGRESSBARSmCircularStrokeConfig,
  background?: contextComponentTokensPROGRESSBARSmCircularStrokeConfig,
  dashArray?: contextComponentTokensPROGRESSBARSmCircularDashArrayConfig,
  dashOffset?: contextComponentTokensPROGRESSBARSmCircularDashArrayConfig,
}
type contextComponentTokensPROGRESSBARSmConfig = {
  linear?: contextComponentTokensPROGRESSBARSmLinearConfig,
  circular?: contextComponentTokensPROGRESSBARSmCircularConfig,
  label?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  transition?: string,
}
type contextComponentTokensPROGRESSBARConfig = {
  sm?: contextComponentTokensPROGRESSBARSmConfig,
  lg?: contextComponentTokensPROGRESSBARSmConfig,
}
type contextComponentTokensDRAWERSmOffsetConfig = {
  top?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  bottom?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  left?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  right?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensDRAWERSmContentHandleConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
}
type contextComponentTokensDRAWERSmContentConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  handle?: contextComponentTokensDRAWERSmContentHandleConfig,
}
type contextComponentTokensDRAWERSmConfig = {
  borderRadius?: contextComponentTokensCALENDARSmTriggerQuickSelectorBorderRadiusConfig,
  overlay?: contextComponentTokensMODALSmOverlayConfig,
  offset?: contextComponentTokensDRAWERSmOffsetConfig,
  content?: contextComponentTokensDRAWERSmContentConfig,
}
type contextComponentTokensDRAWERConfig = {
  sm?: contextComponentTokensDRAWERSmConfig,
  lg?: contextComponentTokensDRAWERSmConfig,
}
type contextComponentTokensCHARTSSmHeaderConfig = {
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderBottom?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  slots?: contextComponentTokensRADIOSmGroupConfig,
}
type contextComponentTokensCHARTSSmContentLegendDropdownConfig = {
  maxHeight?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
}
type contextComponentTokensCHARTSSmContentLegendItemColorConfig = {
  active?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  total?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensCHARTSSmContentLegendItemConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  color?: contextComponentTokensCHARTSSmContentLegendItemColorConfig,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
}
type contextComponentTokensCHARTSSmContentLegendConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  dropdown?: contextComponentTokensCHARTSSmContentLegendDropdownConfig,
  item?: contextComponentTokensCHARTSSmContentLegendItemConfig,
}
type contextComponentTokensCHARTSSmContentConfig = {
  legend?: contextComponentTokensCHARTSSmContentLegendConfig,
  padding?: contextComponentTokensTABSSmPaddingSmBoxedConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensCHARTSSmConfig = {
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  header?: contextComponentTokensCHARTSSmHeaderConfig,
  content?: contextComponentTokensCHARTSSmContentConfig,
}
type contextComponentTokensCHARTSConfig = {
  sm?: contextComponentTokensCHARTSSmConfig,
  lg?: contextComponentTokensCHARTSSmConfig,
}
type contextComponentTokensSNACKBARSmInfoIconColorConfig = {
  info?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  success?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  warning?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  error?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensSNACKBARSmInfoIconConfig = {
  color?: contextComponentTokensSNACKBARSmInfoIconColorConfig,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
}
type contextComponentTokensSNACKBARSmContentTextContainerHeaderConfig = {
  color?: contextComponentTokensSNACKBARSmInfoIconColorConfig,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
}
type contextComponentTokensSNACKBARSmContentTextContainerDescriptionConfig = {
  color?: contextComponentTokensSNACKBARSmInfoIconColorConfig,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
}
type contextComponentTokensSNACKBARSmContentTextContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  header?: contextComponentTokensSNACKBARSmContentTextContainerHeaderConfig,
  description?: contextComponentTokensSNACKBARSmContentTextContainerDescriptionConfig,
}
type contextComponentTokensSNACKBARSmContentConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  textContainer?: contextComponentTokensSNACKBARSmContentTextContainerConfig,
}
type contextComponentTokensSNACKBARSmActionsCloseButtonConfig = {
  height?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  color?: contextComponentTokensSNACKBARSmInfoIconColorConfig,
}
type contextComponentTokensSNACKBARSmActionsConfig = {
  primaryAction?: contextComponentTokensSNACKBARSmContentTextContainerDescriptionConfig,
  closeButton?: contextComponentTokensSNACKBARSmActionsCloseButtonConfig,
}
type contextComponentTokensSNACKBARSmConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  maxWidth?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  infoIcon?: contextComponentTokensSNACKBARSmInfoIconConfig,
  content?: contextComponentTokensSNACKBARSmContentConfig,
  actions?: contextComponentTokensSNACKBARSmActionsConfig,
}
type contextComponentTokensSNACKBARConfig = {
  sm?: contextComponentTokensSNACKBARSmConfig,
  lg?: contextComponentTokensSNACKBARSmConfig,
}
type contextComponentTokensSTEPPERSmContainerConfig = {
  default?: contextComponentTokensRADIOSmGroupConfig,
}
type contextComponentTokensSTEPPERSmStepCircleCompletedDisabledConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderWidth?: mozInitialOrInheritOrInitialOrRevertEtcrrza2,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  size?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  transition?: mozInitialOrInheritOrInitialOrRevertEtcydel2,
  outline?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
  outlineOffset?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensSTEPPERSmStepCircleCompletedConfig = {
  disabled?: contextComponentTokensSTEPPERSmStepCircleCompletedDisabledConfig,
  default?: contextComponentTokensSTEPPERSmStepCircleCompletedDisabledConfig,
  hover?: contextComponentTokensSTEPPERSmStepCircleCompletedDisabledConfig,
  focus?: contextComponentTokensSTEPPERSmStepCircleCompletedDisabledConfig,
}
type contextComponentTokensSTEPPERSmStepCircleConfig = {
  completed?: contextComponentTokensSTEPPERSmStepCircleCompletedConfig,
  current?: contextComponentTokensSTEPPERSmStepCircleCompletedConfig,
  pending?: contextComponentTokensSTEPPERSmStepCircleCompletedConfig,
  disabled?: contextComponentTokensSTEPPERSmStepCircleCompletedConfig,
  skipped?: contextComponentTokensSTEPPERSmStepCircleCompletedConfig,
}
type contextComponentTokensSTEPPERSmStepIconCompletedConfig = {
  disabled?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  default?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  hover?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  focus?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
}
type contextComponentTokensSTEPPERSmStepIconConfig = {
  completed?: contextComponentTokensSTEPPERSmStepIconCompletedConfig,
  current?: contextComponentTokensSTEPPERSmStepIconCompletedConfig,
  pending?: contextComponentTokensSTEPPERSmStepIconCompletedConfig,
  disabled?: contextComponentTokensSTEPPERSmStepIconCompletedConfig,
  skipped?: contextComponentTokensSTEPPERSmStepIconCompletedConfig,
}
type contextComponentTokensSTEPPERSmStepConfig = {
  circle?: contextComponentTokensSTEPPERSmStepCircleConfig,
  icon?: contextComponentTokensSTEPPERSmStepIconConfig,
}
type contextComponentTokensSTEPPERSmConnectorLineActiveDefaultConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
}
type contextComponentTokensSTEPPERSmConnectorLineActiveConfig = {
  default?: contextComponentTokensSTEPPERSmConnectorLineActiveDefaultConfig,
}
type contextComponentTokensSTEPPERSmConnectorLineConfig = {
  active?: contextComponentTokensSTEPPERSmConnectorLineActiveConfig,
  inactive?: contextComponentTokensSTEPPERSmConnectorLineActiveConfig,
}
type contextComponentTokensSTEPPERSmConnectorConfig = {
  line?: contextComponentTokensSTEPPERSmConnectorLineConfig,
}
type contextComponentTokensSTEPPERSmTitleTextCompletedDisabledConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensSTEPPERSmTitleTextCompletedConfig = {
  disabled?: contextComponentTokensSTEPPERSmTitleTextCompletedDisabledConfig,
  default?: contextComponentTokensSTEPPERSmTitleTextCompletedDisabledConfig,
  hover?: contextComponentTokensSTEPPERSmTitleTextCompletedDisabledConfig,
  focus?: contextComponentTokensSTEPPERSmTitleTextCompletedDisabledConfig,
}
type contextComponentTokensSTEPPERSmTitleTextConfig = {
  completed?: contextComponentTokensSTEPPERSmTitleTextCompletedConfig,
  current?: contextComponentTokensSTEPPERSmTitleTextCompletedConfig,
  pending?: contextComponentTokensSTEPPERSmTitleTextCompletedConfig,
  disabled?: contextComponentTokensSTEPPERSmTitleTextCompletedConfig,
  skipped?: contextComponentTokensSTEPPERSmTitleTextCompletedConfig,
}
type contextComponentTokensSTEPPERSmTitleConfig = {
  text?: contextComponentTokensSTEPPERSmTitleTextConfig,
}
type contextComponentTokensSTEPPERSmConfig = {
  container?: contextComponentTokensSTEPPERSmContainerConfig,
  step?: contextComponentTokensSTEPPERSmStepConfig,
  connector?: contextComponentTokensSTEPPERSmConnectorConfig,
  title?: contextComponentTokensSTEPPERSmTitleConfig,
}
type contextComponentTokensSTEPPERConfig = {
  sm?: contextComponentTokensSTEPPERSmConfig,
  lg?: contextComponentTokensSTEPPERSmConfig,
}
type contextComponentTokensKEYVALUEPAIRSmGapConfig = {
  horizontal?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  vertical?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensKEYVALUEPAIRSmValueConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensKEYVALUEPAIRSmConfig = {
  gap?: contextComponentTokensKEYVALUEPAIRSmGapConfig,
  key?: contextComponentTokensSTEPPERSmTitleTextCompletedDisabledConfig,
  value?: contextComponentTokensKEYVALUEPAIRSmValueConfig,
}
type contextComponentTokensKEYVALUEPAIRConfig = {
  sm?: contextComponentTokensKEYVALUEPAIRSmConfig,
  lg?: contextComponentTokensKEYVALUEPAIRSmConfig,
}
type contextComponentTokensCARDSmPaddingConfig = {
  default?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  aligned?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  custom?: unit,
}
type contextComponentTokensCARDSmHeaderTextTitleConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensCARDSmHeaderTextConfig = {
  title?: contextComponentTokensCARDSmHeaderTextTitleConfig,
  subTitle?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensCARDSmHeaderDefaultConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  borderBottom?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensCARDSmHeaderConfig = {
  text?: contextComponentTokensCARDSmHeaderTextConfig,
  default?: contextComponentTokensCARDSmHeaderDefaultConfig,
  aligned?: unit,
  custom?: unit,
}
type contextComponentTokensCARDSmBodyPaddingConfig = {
  default?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  aligned?: unit,
  custom?: unit,
}
type contextComponentTokensCARDSmBodyGapConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  aligned?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  custom?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensCARDSmBodyTextContentConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
}
type contextComponentTokensCARDSmBodyTextConfig = {
  title?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  content?: contextComponentTokensCARDSmBodyTextContentConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensCARDSmBodyActionsConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  centerAlignGap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensCARDSmBodyAlignmentAlignedCardSlotConfig = {
  vertical?: string,  // ⚪ loose — was `{ marginBottom?: number | Globals | "auto" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charC`
  horizontal?: string,  // ⚪ loose — was `{ marginRight?: number | Globals | "auto" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCo`
}
type contextComponentTokensCARDSmBodyAlignmentAlignedConfig = {
  cardSlot?: contextComponentTokensCARDSmBodyAlignmentAlignedCardSlotConfig,
}
type contextComponentTokensCARDSmBodyAlignmentConfig = {
  aligned?: contextComponentTokensCARDSmBodyAlignmentAlignedConfig,
  default?: unit,
  custom?: unit,
}
type contextComponentTokensCARDSmBodyConfig = {
  padding?: contextComponentTokensCARDSmBodyPaddingConfig,
  gap?: contextComponentTokensCARDSmBodyGapConfig,
  text?: contextComponentTokensCARDSmBodyTextConfig,
  actions?: contextComponentTokensCARDSmBodyActionsConfig,
  alignment?: contextComponentTokensCARDSmBodyAlignmentConfig,
}
type contextComponentTokensCARDSmConfig = {
  maxWidth?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  padding?: contextComponentTokensCARDSmPaddingConfig,
  header?: contextComponentTokensCARDSmHeaderConfig,
  body?: contextComponentTokensCARDSmBodyConfig,
}
type contextComponentTokensCARDConfig = {
  sm?: contextComponentTokensCARDSmConfig,
  lg?: contextComponentTokensCARDSmConfig,
}
type contextComponentTokensCARDV2SmBorderConfig = {
  outlined?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  elevated?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  ghost?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensCARDV2SmBackgroundColorConfig = {
  outlined?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  elevated?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  ghost?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensCARDV2SmBoxShadowConfig = {
  outlined?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  elevated?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  ghost?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
}
type contextComponentTokensCARDV2SmStateHoverConfig = {
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
}
type contextComponentTokensCARDV2SmStateFocusConfig = {
  outline?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
  outlineOffset?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensCARDV2SmStateConfig = {
  hover?: contextComponentTokensCARDV2SmStateHoverConfig,
  selected?: contextComponentTokensCARDV2SmStateHoverConfig,
  focus?: contextComponentTokensCARDV2SmStateFocusConfig,
}
type contextComponentTokensCARDV2SmPaddingConfig = {
  none?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  compact?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  comfortable?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
}
type contextComponentTokensCARDV2SmLayoutMediaGapConfig = {
  vertical?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  horizontal?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensCARDV2SmLayoutConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  mediaGap?: contextComponentTokensCARDV2SmLayoutMediaGapConfig,
}
type contextComponentTokensCARDV2SmMediaConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  minHeight?: mozInitialOrInheritOrInitialOrRevertEtc96qi2,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensCARDV2SmHeaderEyebrowConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensCARDV2SmHeaderConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  eyebrow?: contextComponentTokensCARDV2SmHeaderEyebrowConfig,
  title?: contextComponentTokensCARDV2SmHeaderEyebrowConfig,
  subtitle?: contextComponentTokensCARDV2SmHeaderEyebrowConfig,
}
type contextComponentTokensCARDV2SmBodyConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  description?: contextComponentTokensCARDV2SmHeaderEyebrowConfig,
}
type contextComponentTokensCARDV2SmFooterConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  borderTop?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensCARDV2SmConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  minWidth?: mozInitialOrInheritOrInitialOrRevertEtc1owcx,
  maxWidth?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  border?: contextComponentTokensCARDV2SmBorderConfig,
  backgroundColor?: contextComponentTokensCARDV2SmBackgroundColorConfig,
  boxShadow?: contextComponentTokensCARDV2SmBoxShadowConfig,
  state?: contextComponentTokensCARDV2SmStateConfig,
  padding?: contextComponentTokensCARDV2SmPaddingConfig,
  layout?: contextComponentTokensCARDV2SmLayoutConfig,
  media?: contextComponentTokensCARDV2SmMediaConfig,
  header?: contextComponentTokensCARDV2SmHeaderConfig,
  body?: contextComponentTokensCARDV2SmBodyConfig,
  footer?: contextComponentTokensCARDV2SmFooterConfig,
  actions?: contextComponentTokensRADIOSmGroupConfig,
}
type contextComponentTokensCARDV2Config = {
  sm?: contextComponentTokensCARDV2SmConfig,
  lg?: contextComponentTokensCARDV2SmConfig,
}
@unboxed type mozInitialOrInheritOrInitialOrRevertEtc12qc2 = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("auto") Auto | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
@unboxed type mozInitialOrInheritOrInitialOrRevertEtc1tr76 = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("ease") Ease | @as("ease-in") EaseIn | @as("ease-in-out") EaseInOut | @as("ease-out") EaseOut | @as("step-end") StepEnd | @as("step-start") StepStart | @as("linear") Linear | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
@unboxed type mozInitialOrInheritOrInitialOrRevertEtcvavy2 = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("normal") Normal | @as("reverse") Reverse | @as("alternate") Alternate | @as("alternate-reverse") AlternateReverse | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensSKELETONSmAnimationConfig = {
  duration?: mozInitialOrInheritOrInitialOrRevertEtc12qc2,
  timingFunction?: mozInitialOrInheritOrInitialOrRevertEtc1tr76,
  iterationCount?: string,  // ⚪ loose — was `Globals | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; indexOf?: `
  direction?: mozInitialOrInheritOrInitialOrRevertEtcvavy2,
}
type contextComponentTokensSKELETONSmColorsConfig = {
  base?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  highlight?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  shimmer?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensSKELETONSmBorderRadiusConfig = {
  rectangle?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  rounded?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  circle?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensSKELETONSmSpacingConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  margin?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensSKELETONSmSizesTextConfig = {
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  minWidth?: mozInitialOrInheritOrInitialOrRevertEtc1owcx,
}
type contextComponentTokensSKELETONSmSizesButtonConfig = {
  sm?: contextComponentTokensSKELETONSmSizesTextConfig,
  md?: contextComponentTokensSKELETONSmSizesTextConfig,
  lg?: contextComponentTokensSKELETONSmSizesTextConfig,
}
type contextComponentTokensSKELETONSmSizesConfig = {
  text?: contextComponentTokensSKELETONSmSizesTextConfig,
  avatar?: contextComponentTokensTEXTAREAV2SmTopContainerHelpIconWidthConfig,
  button?: contextComponentTokensSKELETONSmSizesButtonConfig,
}
type contextComponentTokensSKELETONSmConfig = {
  animation?: contextComponentTokensSKELETONSmAnimationConfig,
  colors?: contextComponentTokensSKELETONSmColorsConfig,
  borderRadius?: contextComponentTokensSKELETONSmBorderRadiusConfig,
  spacing?: contextComponentTokensSKELETONSmSpacingConfig,
  sizes?: contextComponentTokensSKELETONSmSizesConfig,
}
type contextComponentTokensSKELETONConfig = {
  sm?: contextComponentTokensSKELETONSmConfig,
  lg?: contextComponentTokensSKELETONSmConfig,
}
type contextComponentTokensSPINNERSmColorsConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  primary?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  inverse?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensSPINNERSmAnimationConfig = {
  duration?: string,
}
type contextComponentTokensSPINNERSmOverlayConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  zIndex?: string,  // ⚪ loose — was `Globals | "auto" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; i`
}
type contextComponentTokensSPINNERSmConfig = {
  size?: contextComponentTokensTEXTAREAV2SmTopContainerHelpIconWidthConfig,
  strokeWidth?: contextComponentTokensPROGRESSBARSmCircularStrokeWidthConfig,
  colors?: contextComponentTokensSPINNERSmColorsConfig,
  trackColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  animation?: contextComponentTokensSPINNERSmAnimationConfig,
  overlay?: contextComponentTokensSPINNERSmOverlayConfig,
}
type contextComponentTokensSPINNERConfig = {
  sm?: contextComponentTokensSPINNERSmConfig,
  lg?: contextComponentTokensSPINNERSmConfig,
}
type contextComponentTokensEMPTYSTATESmSmLayoutConfig = {
  minHeight?: mozInitialOrInheritOrInitialOrRevertEtc96qi2,
  maxWidth?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  contentGap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  actionGap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensEMPTYSTATESmSmTitleConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensEMPTYSTATESmSmDescriptionConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensEMPTYSTATESmSmConfig = {
  layout?: contextComponentTokensEMPTYSTATESmSmLayoutConfig,
  title?: contextComponentTokensEMPTYSTATESmSmTitleConfig,
  description?: contextComponentTokensEMPTYSTATESmSmDescriptionConfig,
}
type contextComponentTokensEMPTYSTATESmConfig = {
  sm?: contextComponentTokensEMPTYSTATESmSmConfig,
  md?: contextComponentTokensEMPTYSTATESmSmConfig,
  lg?: contextComponentTokensEMPTYSTATESmSmConfig,
}
type contextComponentTokensEMPTYSTATEConfig = {
  sm?: contextComponentTokensEMPTYSTATESmConfig,
  lg?: contextComponentTokensEMPTYSTATESmConfig,
}
type contextComponentTokensTOPBARSmToggleButtonIconConfig = {
  size?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensTOPBARSmToggleButtonConfig = {
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  backgroundColor?: contextComponentTokensBREADCRUMBSmItemTextColorConfig,
  transition?: mozInitialOrInheritOrInitialOrRevertEtcydel2,
  icon?: contextComponentTokensTOPBARSmToggleButtonIconConfig,
}
type contextComponentTokensTOPBARSmActionButtonConfig = {
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  minWidth?: mozInitialOrInheritOrInitialOrRevertEtc1owcx,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  backgroundColor?: contextComponentTokensBREADCRUMBSmItemTextColorConfig,
  transition?: mozInitialOrInheritOrInitialOrRevertEtcydel2,
  icon?: contextComponentTokensTOPBARSmToggleButtonIconConfig,
}
type contextComponentTokensTOPBARSmTenantIconButtonConfig = {
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  minHeight?: mozInitialOrInheritOrInitialOrRevertEtc96qi2,
  backgroundColor?: contextComponentTokensBREADCRUMBSmItemTextColorConfig,
  transition?: mozInitialOrInheritOrInitialOrRevertEtcydel2,
}
type contextComponentTokensTOPBARSmMerchantSelectTriggerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  icon?: contextComponentTokensTOPBARSmToggleButtonIconConfig,
  text?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
}
type contextComponentTokensTOPBARSmLeftSectionConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  maxHeight?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  divider?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
}
type contextComponentTokensTOPBARSmConfig = {
  zIndex?: string,  // ⚪ loose — was `Globals | "auto" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; i`
  borderBottom?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  backdropFilter?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  toggleButton?: contextComponentTokensTOPBARSmToggleButtonConfig,
  actionButton?: contextComponentTokensTOPBARSmActionButtonConfig,
  tenantIconButton?: contextComponentTokensTOPBARSmTenantIconButtonConfig,
  merchantSelectTrigger?: contextComponentTokensTOPBARSmMerchantSelectTriggerConfig,
  leftSection?: contextComponentTokensTOPBARSmLeftSectionConfig,
  rightSection?: contextComponentTokensRADIOSmGroupConfig,
  sidebarSection?: contextComponentTokensRADIOSmGroupConfig,
}
type contextComponentTokensTOPBARConfig = {
  sm?: contextComponentTokensTOPBARSmConfig,
  lg?: contextComponentTokensTOPBARSmConfig,
}
type contextComponentTokensTOPBARV2SmSeparatorConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensTOPBARV2SmConfig = {
  zIndex?: string,  // ⚪ loose — was `Globals | "auto" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; i`
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  borderBottom?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  backdropFilter?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  separator?: contextComponentTokensTOPBARV2SmSeparatorConfig,
  toggleButton?: contextComponentTokensTOPBARSmToggleButtonConfig,
  actionButton?: contextComponentTokensTOPBARSmActionButtonConfig,
  tenantIconButton?: contextComponentTokensTOPBARSmTenantIconButtonConfig,
  merchantSelectTrigger?: contextComponentTokensTOPBARSmMerchantSelectTriggerConfig,
  leftSection?: contextComponentTokensTOPBARSmLeftSectionConfig,
  rightSection?: contextComponentTokensRADIOSmGroupConfig,
  sidebarSection?: contextComponentTokensRADIOSmGroupConfig,
}
type contextComponentTokensTOPBARV2Config = {
  sm?: contextComponentTokensTOPBARV2SmConfig,
  lg?: contextComponentTokensTOPBARV2SmConfig,
}
type contextComponentTokensAVATARSmContainerSizeConfig = {
  sm?: contextComponentTokensTABLESmHeaderActionIconsSearchIconConfig,
  regular?: contextComponentTokensTABLESmHeaderActionIconsSearchIconConfig,
  md?: contextComponentTokensTABLESmHeaderActionIconsSearchIconConfig,
  lg?: contextComponentTokensTABLESmHeaderActionIconsSearchIconConfig,
  xl?: contextComponentTokensTABLESmHeaderActionIconsSearchIconConfig,
}
type contextComponentTokensAVATARSmContainerBackgroundColorWithImageConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  online?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensAVATARSmContainerBackgroundColorConfig = {
  withImage?: contextComponentTokensAVATARSmContainerBackgroundColorWithImageConfig,
  withoutImage?: contextComponentTokensAVATARSmContainerBackgroundColorWithImageConfig,
}
type contextComponentTokensAVATARSmContainerBorderWithImageConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  online?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensAVATARSmContainerBorderConfig = {
  withImage?: contextComponentTokensAVATARSmContainerBorderWithImageConfig,
  withoutImage?: contextComponentTokensAVATARSmContainerBorderWithImageConfig,
}
type contextComponentTokensAVATARSmContainerBorderRadiusConfig = {
  circular?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  rounded?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensAVATARSmContainerConfig = {
  size?: contextComponentTokensAVATARSmContainerSizeConfig,
  backgroundColor?: contextComponentTokensAVATARSmContainerBackgroundColorConfig,
  border?: contextComponentTokensAVATARSmContainerBorderConfig,
  borderRadius?: contextComponentTokensAVATARSmContainerBorderRadiusConfig,
}
type contextComponentTokensAVATARSmTextFontSizeConfig = {
  sm?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  regular?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  md?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  lg?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  xl?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
}
type contextComponentTokensAVATARSmTextFontWeightConfig = {
  sm?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  regular?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  md?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  lg?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  xl?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
}
type contextComponentTokensAVATARSmTextConfig = {
  color?: contextComponentTokensAVATARSmContainerBackgroundColorWithImageConfig,
  fontSize?: contextComponentTokensAVATARSmTextFontSizeConfig,
  fontWeight?: contextComponentTokensAVATARSmTextFontWeightConfig,
}
type contextComponentTokensAVATARSmIndicatorBorderSmConfig = {
  default?: contextComponentTokensSWITCHSmSwitchContainerThumbBorderConfig,
  online?: contextComponentTokensSWITCHSmSwitchContainerThumbBorderConfig,
}
type contextComponentTokensAVATARSmIndicatorBorderConfig = {
  sm?: contextComponentTokensAVATARSmIndicatorBorderSmConfig,
  regular?: contextComponentTokensAVATARSmIndicatorBorderSmConfig,
  md?: contextComponentTokensAVATARSmIndicatorBorderSmConfig,
  lg?: contextComponentTokensAVATARSmIndicatorBorderSmConfig,
  xl?: contextComponentTokensAVATARSmIndicatorBorderSmConfig,
}
type contextComponentTokensAVATARSmIndicatorConfig = {
  backgroundColor?: contextComponentTokensAVATARSmContainerBackgroundColorWithImageConfig,
  border?: contextComponentTokensAVATARSmIndicatorBorderConfig,
  size?: contextComponentTokensAVATARSmContainerSizeConfig,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
}
type contextComponentTokensAVATARSmSlotConfig = {
  spacing?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  color?: contextComponentTokensAVATARSmContainerBackgroundColorWithImageConfig,
}
type contextComponentTokensAVATARSmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  container?: contextComponentTokensAVATARSmContainerConfig,
  text?: contextComponentTokensAVATARSmTextConfig,
  indicator?: contextComponentTokensAVATARSmIndicatorConfig,
  slot?: contextComponentTokensAVATARSmSlotConfig,
}
type contextComponentTokensAVATARConfig = {
  sm?: contextComponentTokensAVATARSmConfig,
  lg?: contextComponentTokensAVATARSmConfig,
}
type contextComponentTokensAVATARGROUPSmContainerMarginLeftConfig = {
  sm?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  regular?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  md?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  lg?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  xl?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensAVATARGROUPSmContainerConfig = {
  marginLeft?: contextComponentTokensAVATARGROUPSmContainerMarginLeftConfig,
}
@unboxed type mozInitialOrInheritOrInitialOrRevertEtc1270i = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("auto") Auto | @as("aliceblue") Aliceblue | @as("antiquewhite") Antiquewhite | @as("aqua") Aqua | @as("aquamarine") Aquamarine | @as("azure") Azure | @as("beige") Beige | @as("bisque") Bisque | @as("black") Black | @as("blanchedalmond") Blanchedalmond | @as("blue") Blue | @as("blueviolet") Blueviolet | @as("brown") Brown | @as("burlywood") Burlywood | @as("cadetblue") Cadetblue | @as("chartreuse") Chartreuse | @as("chocolate") Chocolate | @as("coral") Coral | @as("cornflowerblue") Cornflowerblue | @as("cornsilk") Cornsilk | @as("crimson") Crimson | @as("cyan") Cyan | @as("darkblue") Darkblue | @as("darkcyan") Darkcyan | @as("darkgoldenrod") Darkgoldenrod | @as("darkgray") Darkgray | @as("darkgreen") Darkgreen | @as("darkgrey") Darkgrey | @as("darkkhaki") Darkkhaki | @as("darkmagenta") Darkmagenta | @as("darkolivegreen") Darkolivegreen | @as("darkorange") Darkorange | @as("darkorchid") Darkorchid | @as("darkred") Darkred | @as("darksalmon") Darksalmon | @as("darkseagreen") Darkseagreen | @as("darkslateblue") Darkslateblue | @as("darkslategray") Darkslategray | @as("darkslategrey") Darkslategrey | @as("darkturquoise") Darkturquoise | @as("darkviolet") Darkviolet | @as("deeppink") Deeppink | @as("deepskyblue") Deepskyblue | @as("dimgray") Dimgray | @as("dimgrey") Dimgrey | @as("dodgerblue") Dodgerblue | @as("firebrick") Firebrick | @as("floralwhite") Floralwhite | @as("forestgreen") Forestgreen | @as("fuchsia") Fuchsia | @as("gainsboro") Gainsboro | @as("ghostwhite") Ghostwhite | @as("gold") Gold | @as("goldenrod") Goldenrod | @as("gray") Gray | @as("green") Green | @as("greenyellow") Greenyellow | @as("grey") Grey | @as("honeydew") Honeydew | @as("hotpink") Hotpink | @as("indianred") Indianred | @as("indigo") Indigo | @as("ivory") Ivory | @as("khaki") Khaki | @as("lavender") Lavender | @as("lavenderblush") Lavenderblush | @as("lawngreen") Lawngreen | @as("lemonchiffon") Lemonchiffon | @as("lightblue") Lightblue | @as("lightcoral") Lightcoral | @as("lightcyan") Lightcyan | @as("lightgoldenrodyellow") Lightgoldenrodyellow | @as("lightgray") Lightgray | @as("lightgreen") Lightgreen | @as("lightgrey") Lightgrey | @as("lightpink") Lightpink | @as("lightsalmon") Lightsalmon | @as("lightseagreen") Lightseagreen | @as("lightskyblue") Lightskyblue | @as("lightslategray") Lightslategray | @as("lightslategrey") Lightslategrey | @as("lightsteelblue") Lightsteelblue | @as("lightyellow") Lightyellow | @as("lime") Lime | @as("limegreen") Limegreen | @as("linen") Linen | @as("magenta") Magenta | @as("maroon") Maroon | @as("mediumaquamarine") Mediumaquamarine | @as("mediumblue") Mediumblue | @as("mediumorchid") Mediumorchid | @as("mediumpurple") Mediumpurple | @as("mediumseagreen") Mediumseagreen | @as("mediumslateblue") Mediumslateblue | @as("mediumspringgreen") Mediumspringgreen | @as("mediumturquoise") Mediumturquoise | @as("mediumvioletred") Mediumvioletred | @as("midnightblue") Midnightblue | @as("mintcream") Mintcream | @as("mistyrose") Mistyrose | @as("moccasin") Moccasin | @as("navajowhite") Navajowhite | @as("navy") Navy | @as("oldlace") Oldlace | @as("olive") Olive | @as("olivedrab") Olivedrab | @as("orange") Orange | @as("orangered") Orangered | @as("orchid") Orchid | @as("palegoldenrod") Palegoldenrod | @as("palegreen") Palegreen | @as("paleturquoise") Paleturquoise | @as("palevioletred") Palevioletred | @as("papayawhip") Papayawhip | @as("peachpuff") Peachpuff | @as("peru") Peru | @as("pink") Pink | @as("plum") Plum | @as("powderblue") Powderblue | @as("purple") Purple | @as("rebeccapurple") Rebeccapurple | @as("red") Red | @as("rosybrown") Rosybrown | @as("royalblue") Royalblue | @as("saddlebrown") Saddlebrown | @as("salmon") Salmon | @as("sandybrown") Sandybrown | @as("seagreen") Seagreen | @as("seashell") Seashell | @as("sienna") Sienna | @as("silver") Silver | @as("skyblue") Skyblue | @as("slateblue") Slateblue | @as("slategray") Slategray | @as("slategrey") Slategrey | @as("snow") Snow | @as("springgreen") Springgreen | @as("steelblue") Steelblue | @as("tan") Tan | @as("teal") Teal | @as("thistle") Thistle | @as("tomato") Tomato | @as("turquoise") Turquoise | @as("violet") Violet | @as("wheat") Wheat | @as("white") White | @as("whitesmoke") Whitesmoke | @as("yellow") Yellow | @as("yellowgreen") Yellowgreen | @as("transparent") Transparent | @as("AccentColor") AccentColor | @as("AccentColorText") AccentColorText | @as("ActiveText") ActiveText | @as("ButtonBorder") ButtonBorder | @as("ButtonFace") ButtonFace | @as("ButtonText") ButtonText | @as("Canvas") Canvas | @as("CanvasText") CanvasText | @as("Field") Field | @as("FieldText") FieldText | @as("GrayText") GrayText | @as("Highlight") HighlightRevertEtc1270i | @as("HighlightText") HighlightText | @as("LinkText") LinkText | @as("Mark") Mark | @as("MarkText") MarkText | @as("SelectedItem") SelectedItem | @as("SelectedItemText") SelectedItemText | @as("VisitedText") VisitedText | @as("ActiveBorder") ActiveBorder | @as("ActiveCaption") ActiveCaption | @as("AppWorkspace") AppWorkspace | @as("Background") Background | @as("ButtonHighlight") ButtonHighlight | @as("ButtonShadow") ButtonShadow | @as("CaptionText") CaptionText | @as("InactiveBorder") InactiveBorder | @as("InactiveCaption") InactiveCaption | @as("InactiveCaptionText") InactiveCaptionText | @as("InfoBackground") InfoBackground | @as("InfoText") InfoText | @as("Menu") Menu | @as("MenuText") MenuText | @as("Scrollbar") ScrollbarRevertEtc1270i | @as("ThreeDDarkShadow") ThreeDDarkShadow | @as("ThreeDFace") ThreeDFace | @as("ThreeDHighlight") ThreeDHighlight | @as("ThreeDLightShadow") ThreeDLightShadow | @as("ThreeDShadow") ThreeDShadow | @as("Window") Window | @as("WindowFrame") WindowFrame | @as("WindowText") WindowText | @as("currentColor") CurrentColor | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensAVATARGROUPSmAvatarSelectedConfig = {
  ringColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  ringWidth?: mozInitialOrInheritOrInitialOrRevertEtcrrza2,
  ringOffset?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  outlineColor?: mozInitialOrInheritOrInitialOrRevertEtc1270i,
}
type contextComponentTokensAVATARGROUPSmAvatarBorderConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtcrrza2,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensAVATARGROUPSmAvatarConfig = {
  selected?: contextComponentTokensAVATARGROUPSmAvatarSelectedConfig,
  border?: contextComponentTokensAVATARGROUPSmAvatarBorderConfig,
}
type contextComponentTokensAVATARGROUPSmOverflowCounterBackgroundConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  active?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensAVATARGROUPSmOverflowCounterSizeSmConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
}
type contextComponentTokensAVATARGROUPSmOverflowCounterSizeConfig = {
  sm?: contextComponentTokensAVATARGROUPSmOverflowCounterSizeSmConfig,
  regular?: contextComponentTokensAVATARGROUPSmOverflowCounterSizeSmConfig,
  md?: contextComponentTokensAVATARGROUPSmOverflowCounterSizeSmConfig,
  lg?: contextComponentTokensAVATARGROUPSmOverflowCounterSizeSmConfig,
  xl?: contextComponentTokensAVATARGROUPSmOverflowCounterSizeSmConfig,
}
type contextComponentTokensAVATARGROUPSmOverflowCounterConfig = {
  background?: contextComponentTokensAVATARGROUPSmOverflowCounterBackgroundConfig,
  text?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  border?: contextComponentTokensAVATARGROUPSmAvatarBorderConfig,
  size?: contextComponentTokensAVATARGROUPSmOverflowCounterSizeConfig,
  borderRadius?: contextComponentTokensAVATARSmContainerBorderRadiusConfig,
}
type contextComponentTokensAVATARGROUPSmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  container?: contextComponentTokensAVATARGROUPSmContainerConfig,
  avatar?: contextComponentTokensAVATARGROUPSmAvatarConfig,
  overflowCounter?: contextComponentTokensAVATARGROUPSmOverflowCounterConfig,
  menu?: contextComponentTokensTABLESmHeaderDescriptionRowConfig,
}
type contextComponentTokensAVATARGROUPConfig = {
  sm?: contextComponentTokensAVATARGROUPSmConfig,
  lg?: contextComponentTokensAVATARGROUPSmConfig,
}
type contextComponentTokensSIDEBARSmMaxWidthConfig = {
  withLeftPanel?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  withoutLeftPanel?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  iconOnly?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
}
type contextComponentTokensSIDEBARSmLeftPanelItemBorderConfig = {
  active?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  default?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  hover?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensSIDEBARSmLeftPanelItemConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  border?: contextComponentTokensSIDEBARSmLeftPanelItemBorderConfig,
  backgroundColor?: contextComponentTokensBREADCRUMBSmItemTextColorConfig,
}
type contextComponentTokensSIDEBARSmLeftPanelConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderRight?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  item?: contextComponentTokensSIDEBARSmLeftPanelItemConfig,
}
type contextComponentTokensSIDEBARSmHeaderToggleButtonConfig = {
  backgroundColor?: contextComponentTokensBREADCRUMBSmItemTextColorConfig,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
}
type contextComponentTokensSIDEBARSmHeaderConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  borderBottom?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  toggleButton?: contextComponentTokensSIDEBARSmHeaderToggleButtonConfig,
}
type contextComponentTokensSIDEBARSmDirectoryConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  paddingX?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingY?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensSIDEBARSmFooterConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  borderTop?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensSIDEBARSmConfig = {
  maxWidth?: contextComponentTokensSIDEBARSmMaxWidthConfig,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderRight?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  leftPanel?: contextComponentTokensSIDEBARSmLeftPanelConfig,
  header?: contextComponentTokensSIDEBARSmHeaderConfig,
  directory?: contextComponentTokensSIDEBARSmDirectoryConfig,
  footer?: contextComponentTokensSIDEBARSmFooterConfig,
}
type contextComponentTokensSIDEBARConfig = {
  sm?: contextComponentTokensSIDEBARSmConfig,
  lg?: contextComponentTokensSIDEBARSmConfig,
}
type contextComponentTokensDIRECTORYSmSectionHeaderConfig = {
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  label?: contextComponentTokensCARDSmBodyTextContentConfig,
  chevron?: contextComponentTokensTOPBARV2SmSeparatorConfig,
}
type contextComponentTokensDIRECTORYSmSectionItemListItemIconOnlyPaddingConfig = {
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensDIRECTORYSmSectionItemListItemBackgroundColorConfig = {
  active?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  activePath?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  muted?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensDIRECTORYSmSectionItemListItemConfig = {
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  iconOnlyPadding?: contextComponentTokensDIRECTORYSmSectionItemListItemIconOnlyPaddingConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  transition?: mozInitialOrInheritOrInitialOrRevertEtcydel2,
  backgroundColor?: contextComponentTokensDIRECTORYSmSectionItemListItemBackgroundColorConfig,
  color?: contextComponentTokensDIRECTORYSmSectionItemListItemBackgroundColorConfig,
  icon?: contextComponentTokensMENUV2SmSearchIconConfig,
  chevron?: contextComponentTokensTOPBARV2SmSeparatorConfig,
}
type contextComponentTokensDIRECTORYSmSectionItemListNestedBorderConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  leftOffset?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensDIRECTORYSmSectionItemListNestedConnectorConfig = {
  itemInset?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  itemPaddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  elbowTop?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  elbowHeight?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  elbowWidthOffset?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
}
type contextComponentTokensDIRECTORYSmSectionItemListNestedConfig = {
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  marginTop?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  border?: contextComponentTokensDIRECTORYSmSectionItemListNestedBorderConfig,
  connector?: contextComponentTokensDIRECTORYSmSectionItemListNestedConnectorConfig,
}
type contextComponentTokensDIRECTORYSmSectionItemListConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  item?: contextComponentTokensDIRECTORYSmSectionItemListItemConfig,
  nested?: contextComponentTokensDIRECTORYSmSectionItemListNestedConfig,
}
type contextComponentTokensDIRECTORYSmSectionConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  header?: contextComponentTokensDIRECTORYSmSectionHeaderConfig,
  itemList?: contextComponentTokensDIRECTORYSmSectionItemListConfig,
}
type contextComponentTokensDIRECTORYSmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  paddingX?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingY?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  section?: contextComponentTokensDIRECTORYSmSectionConfig,
}
type contextComponentTokensDIRECTORYConfig = {
  sm?: contextComponentTokensDIRECTORYSmConfig,
  lg?: contextComponentTokensDIRECTORYSmConfig,
}
type contextComponentTokensMOBILENAVIGATIONSmContainerConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  background?: mozInitialOrInheritOrInitialOrRevertEtc1mkx8,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  backdropFilter?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  zIndex?: string,  // ⚪ loose — was `Globals | "auto" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; i`
  transition?: mozInitialOrInheritOrInitialOrRevertEtcydel2,
}
type contextComponentTokensMOBILENAVIGATIONSmDrawerConfig = {
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  borderTop?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensMOBILENAVIGATIONSmRowItemBackgroundColorConfig = {
  active?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensMOBILENAVIGATIONSmRowItemIconConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  transition?: mozInitialOrInheritOrInitialOrRevertEtcydel2,
}
type contextComponentTokensMOBILENAVIGATIONSmRowItemTextConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  textAlign?: string,
}
type contextComponentTokensMOBILENAVIGATIONSmRowItemConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  backgroundColor?: contextComponentTokensMOBILENAVIGATIONSmRowItemBackgroundColorConfig,
  color?: contextComponentTokensMOBILENAVIGATIONSmRowItemBackgroundColorConfig,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  icon?: contextComponentTokensMOBILENAVIGATIONSmRowItemIconConfig,
  text?: contextComponentTokensMOBILENAVIGATIONSmRowItemTextConfig,
}
type contextComponentTokensMOBILENAVIGATIONSmRowPrimaryActionConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  background?: mozInitialOrInheritOrInitialOrRevertEtc1mkx8,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  icon?: contextComponentTokensTABLESmHeaderActionIconsSearchIconConfig,
}
type contextComponentTokensMOBILENAVIGATIONSmRowConfig = {
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  item?: contextComponentTokensMOBILENAVIGATIONSmRowItemConfig,
  primaryAction?: contextComponentTokensMOBILENAVIGATIONSmRowPrimaryActionConfig,
}
type contextComponentTokensMOBILENAVIGATIONSmConfig = {
  container?: contextComponentTokensMOBILENAVIGATIONSmContainerConfig,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  drawer?: contextComponentTokensMOBILENAVIGATIONSmDrawerConfig,
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  row?: contextComponentTokensMOBILENAVIGATIONSmRowConfig,
}
type contextComponentTokensMOBILENAVIGATIONConfig = {
  sm?: contextComponentTokensMOBILENAVIGATIONSmConfig,
  lg?: contextComponentTokensMOBILENAVIGATIONSmConfig,
}
type contextComponentTokensMOBILENAVIGATIONV2SmContainerConfig = {
  zIndex?: string,  // ⚪ loose — was `Globals | "auto" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; i`
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  background?: mozInitialOrInheritOrInitialOrRevertEtc1mkx8,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderWidth?: mozInitialOrInheritOrInitialOrRevertEtcrrza2,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  backdropFilter?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  transition?: mozInitialOrInheritOrInitialOrRevertEtcydel2,
}
type contextComponentTokensMOBILENAVIGATIONV2SmLayoutConfig = {
  safeAreaOffset?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  floatingPadding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  primaryActionMarginX?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  itemLabelMarginTop?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  itemLabelLineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  rowPaddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  rowPaddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  rowPaddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  rowPaddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  rowGap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensMOBILENAVIGATIONV2SmItemIconConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  transition?: mozInitialOrInheritOrInitialOrRevertEtcydel2,
  strokeWidth?: float,
}
type contextComponentTokensMOBILENAVIGATIONV2SmItemConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  backgroundColor?: contextComponentTokensMOBILENAVIGATIONSmRowItemBackgroundColorConfig,
  color?: contextComponentTokensMOBILENAVIGATIONSmRowItemBackgroundColorConfig,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  icon?: contextComponentTokensMOBILENAVIGATIONV2SmItemIconConfig,
  text?: contextComponentTokensMOBILENAVIGATIONSmRowItemTextConfig,
}
type contextComponentTokensMOBILENAVIGATIONV2SmPrimaryActionIconConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  strokeWidth?: float,
}
type contextComponentTokensMOBILENAVIGATIONV2SmPrimaryActionConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  background?: mozInitialOrInheritOrInitialOrRevertEtc1mkx8,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  icon?: contextComponentTokensMOBILENAVIGATIONV2SmPrimaryActionIconConfig,
}
type contextComponentTokensMOBILENAVIGATIONV2SmConfig = {
  container?: contextComponentTokensMOBILENAVIGATIONV2SmContainerConfig,
  layout?: contextComponentTokensMOBILENAVIGATIONV2SmLayoutConfig,
  item?: contextComponentTokensMOBILENAVIGATIONV2SmItemConfig,
  primaryAction?: contextComponentTokensMOBILENAVIGATIONV2SmPrimaryActionConfig,
}
type contextComponentTokensMOBILENAVIGATIONV2Config = {
  sm?: contextComponentTokensMOBILENAVIGATIONV2SmConfig,
  lg?: contextComponentTokensMOBILENAVIGATIONV2SmConfig,
}
type contextComponentTokensUPLOADSmHeaderLabelConfig = {
  text?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  marginBottom?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensUPLOADSmHeaderRequiredConfig = {
  text?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensUPLOADSmHeaderSubLabelConfig = {
  text?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensUPLOADSmHeaderConfig = {
  label?: contextComponentTokensUPLOADSmHeaderLabelConfig,
  required?: contextComponentTokensUPLOADSmHeaderRequiredConfig,
  subLabel?: contextComponentTokensUPLOADSmHeaderSubLabelConfig,
  helpIcon?: contextComponentTokensTOPBARV2SmSeparatorConfig,
}
type contextComponentTokensUPLOADSmContainerBorderConfig = {
  idle?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  uploading?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  success?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  error?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  dragActive?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensUPLOADSmContainerBackgroundColorConfig = {
  idle?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  uploading?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  success?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  error?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  dragActive?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensUPLOADSmContainerContentSlotConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensUPLOADSmContainerContentTextConfig = {
  title?: contextComponentTokensMODALSmHeaderTextTitleConfig,
  subtitle?: contextComponentTokensMODALSmHeaderTextTitleConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensUPLOADSmContainerContentActionableConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  errorText?: contextComponentTokensMODALSmHeaderTextTitleConfig,
}
type contextComponentTokensUPLOADSmContainerContentConfig = {
  slot?: contextComponentTokensUPLOADSmContainerContentSlotConfig,
  text?: contextComponentTokensUPLOADSmContainerContentTextConfig,
  actionable?: contextComponentTokensUPLOADSmContainerContentActionableConfig,
}
type contextComponentTokensUPLOADSmContainerConfig = {
  border?: contextComponentTokensUPLOADSmContainerBorderConfig,
  backgroundColor?: contextComponentTokensUPLOADSmContainerBackgroundColorConfig,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  content?: contextComponentTokensUPLOADSmContainerContentConfig,
}
type contextComponentTokensUPLOADSmConfig = {
  header?: contextComponentTokensUPLOADSmHeaderConfig,
  container?: contextComponentTokensUPLOADSmContainerConfig,
}
type contextComponentTokensUPLOADConfig = {
  sm?: contextComponentTokensUPLOADSmConfig,
  lg?: contextComponentTokensUPLOADSmConfig,
}
type contextComponentTokensCODEBLOCKSmHeaderConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderBottom?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  icon?: contextComponentTokensMENUV2SmSearchIconConfig,
  text?: contextComponentTokensCARDV2SmHeaderEyebrowConfig,
}
type contextComponentTokensCODEBLOCKSmBodyGutterBackgroundColorConfig = {
  added?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  removed?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  unchanged?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensCODEBLOCKSmBodyGutterBorderLeftConfig = {
  added?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  removed?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  unchanged?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensCODEBLOCKSmBodyGutterConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  backgroundColor?: contextComponentTokensCODEBLOCKSmBodyGutterBackgroundColorConfig,
  borderLeft?: contextComponentTokensCODEBLOCKSmBodyGutterBorderLeftConfig,
  borderColor?: contextComponentTokensCODEBLOCKSmBodyGutterBackgroundColorConfig,
}
@unboxed type mozInitialOrInheritOrInitialOrRevertEtc12oc1 = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("-apple-system") AppleSystem | @as("cursive") Cursive | @as("fantasy") Fantasy | @as("math") Math | @as("monospace") Monospace | @as("sans-serif") SansSerif | @as("serif") Serif | @as("system-ui") SystemUi | @as("ui-monospace") UiMonospace | @as("ui-rounded") UiRounded | @as("ui-sans-serif") UiSansSerif | @as("ui-serif") UiSerif | @as("emoji") Emoji | @as("fangsong") Fangsong | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensCODEBLOCKSmBodyCodePaddingXConfig = {
  left?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  right?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensCODEBLOCKSmBodyCodePaddingConfig = {
  x?: contextComponentTokensCODEBLOCKSmBodyCodePaddingXConfig,
  y?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensCODEBLOCKSmBodyCodeConfig = {
  fontFamily?: mozInitialOrInheritOrInitialOrRevertEtc12oc1,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
  padding?: contextComponentTokensCODEBLOCKSmBodyCodePaddingConfig,
}
type contextComponentTokensCODEBLOCKSmBodyHighlightedLineConfig = {
  backgroundColor?: contextComponentTokensCODEBLOCKSmBodyGutterBackgroundColorConfig,
}
type contextComponentTokensCODEBLOCKSmBodySyntaxConfig = {
  keyword?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  function?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  string?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  number?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  operator?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  variable?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  comment?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  text?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensCODEBLOCKSmBodyExpandContextButtonConfig = {
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  dotsPadding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  opacity?: string,  // ⚪ loose — was `Globals | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; indexOf?: `
  disabledOpacity?: string,  // ⚪ loose — was `Globals | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; indexOf?: `
  hoverBackgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  iconSize?: float,
}
type contextComponentTokensCODEBLOCKSmBodyExpandContextConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderTop?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderBottom?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  letterSpacing?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  button?: contextComponentTokensCODEBLOCKSmBodyExpandContextButtonConfig,
}
type contextComponentTokensCODEBLOCKSmBodyConfig = {
  padding?: contextComponentTokensSEARCHINPUTSmInputContainerPaddingConfig,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  gutter?: contextComponentTokensCODEBLOCKSmBodyGutterConfig,
  code?: contextComponentTokensCODEBLOCKSmBodyCodeConfig,
  highlightedLine?: contextComponentTokensCODEBLOCKSmBodyHighlightedLineConfig,
  syntax?: contextComponentTokensCODEBLOCKSmBodySyntaxConfig,
  expandContext?: contextComponentTokensCODEBLOCKSmBodyExpandContextConfig,
}
type contextComponentTokensCODEBLOCKSmConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  header?: contextComponentTokensCODEBLOCKSmHeaderConfig,
  body?: contextComponentTokensCODEBLOCKSmBodyConfig,
}
type contextComponentTokensCODEBLOCKConfig = {
  sm?: contextComponentTokensCODEBLOCKSmConfig,
  lg?: contextComponentTokensCODEBLOCKSmConfig,
}
type contextComponentTokensBUTTONGROUPSmGapConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  stacked?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensBUTTONGROUPSmConfig = {
  gap?: contextComponentTokensBUTTONGROUPSmGapConfig,
  separator?: contextComponentTokensAVATARGROUPSmAvatarBorderConfig,
}
type contextComponentTokensBUTTONGROUPConfig = {
  sm?: contextComponentTokensBUTTONGROUPSmConfig,
  lg?: contextComponentTokensBUTTONGROUPSmConfig,
}
type contextComponentTokensCHATINPUTSmBackgroundColorConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensCHATINPUTSmBorderRadiusConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  focus?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensCHATINPUTSmBorderConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  focus?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensCHATINPUTSmTextColorConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  focus?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensCHATINPUTSmTextFontSizeConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  focus?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
}
type contextComponentTokensCHATINPUTSmTextFontWeightConfig = {
  default?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  hover?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  focus?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  disabled?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
}
type contextComponentTokensCHATINPUTSmTextLineHeightConfig = {
  default?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
  hover?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
  focus?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
}
type contextComponentTokensCHATINPUTSmTextConfig = {
  color?: contextComponentTokensCHATINPUTSmTextColorConfig,
  fontSize?: contextComponentTokensCHATINPUTSmTextFontSizeConfig,
  fontWeight?: contextComponentTokensCHATINPUTSmTextFontWeightConfig,
  lineHeight?: contextComponentTokensCHATINPUTSmTextLineHeightConfig,
}
@unboxed type mozInitialOrInheritOrInitialOrRevertEtc1cx47 = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("auto") Auto | @as("hidden") Hidden | @as("scroll") Scroll | @as("overlay") Overlay | @as("-moz-hidden-unscrollable") MozHiddenUnscrollable | @as("clip") Clip | @as("visible") Visible | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensCHATINPUTSmContainerBoxShadowConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  focus?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
}
type contextComponentTokensCHATINPUTSmContainerConfig = {
  backgroundColor?: contextComponentTokensCHATINPUTSmBackgroundColorConfig,
  border?: contextComponentTokensCHATINPUTSmBorderConfig,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  minHeight?: mozInitialOrInheritOrInitialOrRevertEtc96qi2,
  transition?: mozInitialOrInheritOrInitialOrRevertEtcydel2,
  boxShadow?: contextComponentTokensCHATINPUTSmContainerBoxShadowConfig,
}
type contextComponentTokensCHATINPUTSmAttachmentContainerConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensCHATINPUTSmTextareaConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  placeholder?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  resize?: string,
  fontFamily?: mozInitialOrInheritOrInitialOrRevertEtc12oc1,
  minHeight?: mozInitialOrInheritOrInitialOrRevertEtc96qi2,
  maxHeight?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  overflowY?: string,
}
type contextComponentTokensCHATINPUTSmFilesContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  paddingX?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingY?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  maxHeight?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  overflowY?: string,
  margin?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensCHATINPUTSmBottomActionsConfig = {
  paddingX?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingY?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  justifyContent?: mozInitialOrInheritOrInitialOrRevertEtc1w3ez,
}
type contextComponentTokensCHATINPUTSmOverflowTagConfig = {
  backgroundColor?: contextComponentTokensAVATARGROUPSmOverflowCounterBackgroundConfig,
  color?: contextComponentTokensAVATARGROUPSmOverflowCounterBackgroundConfig,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingX?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingY?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  transition?: mozInitialOrInheritOrInitialOrRevertEtcydel2,
  cursor?: mozInitialOrInheritOrInitialOrRevertEtcop7hp,
}
type contextComponentTokensCHATINPUTSmTopQueriesContainerConfig = {
  borderTop?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensCHATINPUTSmTopQueriesHeaderConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  paddingX?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingY?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  textTransform?: mozInitialOrInheritOrInitialOrRevertEtcc55tl,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  flexShrink?: string,  // ⚪ loose — was `Globals | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; indexOf?: `
}
type contextComponentTokensCHATINPUTSmTopQueriesScrollContainerConfig = {
  overflowY?: string,
  maxHeightOffset?: float,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  scrollbarColor?: string,
}
type contextComponentTokensCHATINPUTSmTopQueriesItemOpacityConfig = {
  default?: string,  // ⚪ loose — was `Globals | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; indexOf?: `
  disabled?: string,  // ⚪ loose — was `Globals | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; indexOf?: `
}
type contextComponentTokensCHATINPUTSmTopQueriesItemConfig = {
  backgroundColor?: contextComponentTokensBUTTONSmTextColorPrimaryDefaultConfig,
  color?: contextComponentTokensBUTTONSmTextColorPrimaryDefaultConfig,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  paddingX?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingY?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  transition?: mozInitialOrInheritOrInitialOrRevertEtcydel2,
  cursor?: mozInitialOrInheritOrInitialOrRevertEtcop7hp,
  opacity?: contextComponentTokensCHATINPUTSmTopQueriesItemOpacityConfig,
}
type contextComponentTokensCHATINPUTSmTopQueriesConfig = {
  container?: contextComponentTokensCHATINPUTSmTopQueriesContainerConfig,
  header?: contextComponentTokensCHATINPUTSmTopQueriesHeaderConfig,
  scrollContainer?: contextComponentTokensCHATINPUTSmTopQueriesScrollContainerConfig,
  item?: contextComponentTokensCHATINPUTSmTopQueriesItemConfig,
}
type contextComponentTokensCHATINPUTSmConfig = {
  backgroundColor?: contextComponentTokensCHATINPUTSmBackgroundColorConfig,
  borderRadius?: contextComponentTokensCHATINPUTSmBorderRadiusConfig,
  border?: contextComponentTokensCHATINPUTSmBorderConfig,
  minHeight?: mozInitialOrInheritOrInitialOrRevertEtc96qi2,
  maxHeight?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  text?: contextComponentTokensCHATINPUTSmTextConfig,
  resize?: string,
  overflow?: mozInitialOrInheritOrInitialOrRevertEtc1cx47,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  container?: contextComponentTokensCHATINPUTSmContainerConfig,
  attachmentContainer?: contextComponentTokensCHATINPUTSmAttachmentContainerConfig,
  textarea?: contextComponentTokensCHATINPUTSmTextareaConfig,
  filesContainer?: contextComponentTokensCHATINPUTSmFilesContainerConfig,
  bottomActions?: contextComponentTokensCHATINPUTSmBottomActionsConfig,
  overflowTag?: contextComponentTokensCHATINPUTSmOverflowTagConfig,
  topQueries?: contextComponentTokensCHATINPUTSmTopQueriesConfig,
}
type contextComponentTokensCHATINPUTConfig = {
  sm?: contextComponentTokensCHATINPUTSmConfig,
  lg?: contextComponentTokensCHATINPUTSmConfig,
}
type contextComponentTokensCHATINPUTV2SmContainerAttachedFilesContainerOverflowMenuConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  backgroundColor?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  top?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  right?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  maxHeight?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
}
type contextComponentTokensCHATINPUTV2SmContainerAttachedFilesContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  overflowMenu?: contextComponentTokensCHATINPUTV2SmContainerAttachedFilesContainerOverflowMenuConfig,
}
type contextComponentTokensCHATINPUTV2SmContainerTagContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  text?: contextComponentTokensMODALSmHeaderTextTitleConfig,
}
type contextComponentTokensCHATINPUTV2SmContainerInputContainerOutlineConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
  focus?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
  error?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
}
type contextComponentTokensCHATINPUTV2SmContainerInputContainerInputConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  placeholder?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  minHeight?: mozInitialOrInheritOrInitialOrRevertEtc96qi2,
  maxHeight?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
}
type contextComponentTokensCHATINPUTV2SmContainerInputContainerActionContainerConfig = {
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensCHATINPUTV2SmContainerInputContainerTopQueriesContainerHeaderConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  textTransform?: mozInitialOrInheritOrInitialOrRevertEtcc55tl,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensCHATINPUTV2SmContainerInputContainerTopQueriesContainerItemConfig = {
  backgroundColor?: string,  // ⚪ loose — was `{ default?: Globals | NamedColor | "transparent" | SystemColor | DeprecatedSystemColor | "currentColor" | { re`
  color?: string,  // ⚪ loose — was `{ default?: Globals | NamedColor | "transparent" | SystemColor | DeprecatedSystemColor | "currentColor" | { re`
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  transition?: mozInitialOrInheritOrInitialOrRevertEtcydel2,
  cursor?: mozInitialOrInheritOrInitialOrRevertEtcop7hp,
  opacity?: string,  // ⚪ loose — was `{ default?: Globals | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}`
}
type contextComponentTokensCHATINPUTV2SmContainerInputContainerTopQueriesContainerConfig = {
  marginRight?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  marginLeft?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  borderTop?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  header?: contextComponentTokensCHATINPUTV2SmContainerInputContainerTopQueriesContainerHeaderConfig,
  item?: contextComponentTokensCHATINPUTV2SmContainerInputContainerTopQueriesContainerItemConfig,
}
type contextComponentTokensCHATINPUTV2SmContainerInputContainerConfig = {
  outline?: contextComponentTokensCHATINPUTV2SmContainerInputContainerOutlineConfig,
  boxShadow?: contextComponentTokensMULTIVALUEINPUTSmInputContainerBoxShadowConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  input?: contextComponentTokensCHATINPUTV2SmContainerInputContainerInputConfig,
  actionContainer?: contextComponentTokensCHATINPUTV2SmContainerInputContainerActionContainerConfig,
  topQueriesContainer?: contextComponentTokensCHATINPUTV2SmContainerInputContainerTopQueriesContainerConfig,
}
type contextComponentTokensCHATINPUTV2SmContainerConfig = {
  backgroundColor?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  border?: contextComponentTokensSEARCHINPUTSmInputContainerBorderBottomConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  attachedFilesContainer?: contextComponentTokensCHATINPUTV2SmContainerAttachedFilesContainerConfig,
  tagContainer?: contextComponentTokensCHATINPUTV2SmContainerTagContainerConfig,
  inputContainer?: contextComponentTokensCHATINPUTV2SmContainerInputContainerConfig,
}
type contextComponentTokensCHATINPUTV2SmConfig = {
  container?: contextComponentTokensCHATINPUTV2SmContainerConfig,
}
type contextComponentTokensCHATINPUTV2Config = {
  sm?: contextComponentTokensCHATINPUTV2SmConfig,
  lg?: contextComponentTokensCHATINPUTV2SmConfig,
}
type contextComponentTokensTIMELINESmTrackConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  left?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensTIMELINESmIndicatorConfig = {
  left?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
}
type contextComponentTokensTIMELINESmStatusColorsConfig = {
  success?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  warning?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  error?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  neutral?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensTIMELINESmLabelCircleConfig = {
  left?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensTIMELINESmLabelMaskConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
}
type contextComponentTokensTIMELINESmLabelConfig = {
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  marginBottom?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  circle?: contextComponentTokensTIMELINESmLabelCircleConfig,
  mask?: contextComponentTokensTIMELINESmLabelMaskConfig,
  text?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
}
type contextComponentTokensTIMELINESmHeaderRowConfig = {
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  marginBottom?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensTIMELINESmHeaderSectionConfig = {
  marginBottom?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensTIMELINESmHeaderTimestampConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensTIMELINESmHeaderConfig = {
  row?: contextComponentTokensTIMELINESmHeaderRowConfig,
  section?: contextComponentTokensTIMELINESmHeaderSectionConfig,
  title?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  timestamp?: contextComponentTokensTIMELINESmHeaderTimestampConfig,
}
type contextComponentTokensTIMELINESmSubsectionRootIndicatorConfig = {
  top?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensTIMELINESmSubsectionDescriptionConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  marginTop?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  marginBottom?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
}
type contextComponentTokensTIMELINESmSubsectionConnectorConfig = {
  left?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensTIMELINESmSubsectionAvatarConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  marginTop?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensTIMELINESmSubsectionUserConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  marginLeft?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensTIMELINESmSubsectionTimeConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensTIMELINESmSubsectionSeparatorConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  marginLeft?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  marginRight?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensTIMELINESmSubsectionConfig = {
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  marginTop?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  marginBottom?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  marginLeft?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  rootIndicator?: contextComponentTokensTIMELINESmSubsectionRootIndicatorConfig,
  headerRow?: contextComponentTokensRADIOSmGroupConfig,
  titleRow?: contextComponentTokensRADIOSmGroupConfig,
  datetimeGroup?: contextComponentTokensRADIOSmGroupConfig,
  title?: contextComponentTokensCARDSmHeaderTextTitleConfig,
  description?: contextComponentTokensTIMELINESmSubsectionDescriptionConfig,
  datetime?: contextComponentTokensTIMELINESmHeaderTimestampConfig,
  connector?: contextComponentTokensTIMELINESmSubsectionConnectorConfig,
  avatar?: contextComponentTokensTIMELINESmSubsectionAvatarConfig,
  user?: contextComponentTokensTIMELINESmSubsectionUserConfig,
  time?: contextComponentTokensTIMELINESmSubsectionTimeConfig,
  separator?: contextComponentTokensTIMELINESmSubsectionSeparatorConfig,
}
type contextComponentTokensTIMELINESmShowMoreConfig = {
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  marginTop?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensTIMELINESmConfig = {
  track?: contextComponentTokensTIMELINESmTrackConfig,
  indicator?: contextComponentTokensTIMELINESmIndicatorConfig,
  statusColors?: contextComponentTokensTIMELINESmStatusColorsConfig,
  label?: contextComponentTokensTIMELINESmLabelConfig,
  header?: contextComponentTokensTIMELINESmHeaderConfig,
  subsection?: contextComponentTokensTIMELINESmSubsectionConfig,
  showMore?: contextComponentTokensTIMELINESmShowMoreConfig,
}
type contextComponentTokensTIMELINEConfig = {
  sm?: contextComponentTokensTIMELINESmConfig,
  lg?: contextComponentTokensTIMELINESmConfig,
}
@unboxed type stringOrNumberOrContextComponentTokensTAGSSmMinWidthConfig = Str(string) | Num(float) | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensBUTTONV2SmSlotMaxHeightConfig = {
  sm?: CommonTypes.stringOrNumber,
  md?: CommonTypes.stringOrNumber,
  lg?: CommonTypes.stringOrNumber,
}
type contextComponentTokensBUTTONV2SmFocusRingPrimaryConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  iconOnly?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  inline?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
}
type contextComponentTokensBUTTONV2SmFocusRingConfig = {
  primary?: contextComponentTokensBUTTONV2SmFocusRingPrimaryConfig,
  secondary?: contextComponentTokensBUTTONV2SmFocusRingPrimaryConfig,
  danger?: contextComponentTokensBUTTONV2SmFocusRingPrimaryConfig,
  success?: contextComponentTokensBUTTONV2SmFocusRingPrimaryConfig,
}
type contextComponentTokensBUTTONV2SmBackgroundColorPrimaryDefaultConfig = {
  default?: stringOrNumberOrContextComponentTokensTAGSSmMinWidthConfig,
  hover?: stringOrNumberOrContextComponentTokensTAGSSmMinWidthConfig,
  active?: stringOrNumberOrContextComponentTokensTAGSSmMinWidthConfig,
  disabled?: stringOrNumberOrContextComponentTokensTAGSSmMinWidthConfig,
}
type contextComponentTokensBUTTONV2SmBackgroundColorPrimaryConfig = {
  default?: contextComponentTokensBUTTONV2SmBackgroundColorPrimaryDefaultConfig,
  iconOnly?: contextComponentTokensBUTTONV2SmBackgroundColorPrimaryDefaultConfig,
  inline?: contextComponentTokensBUTTONV2SmBackgroundColorPrimaryDefaultConfig,
}
type contextComponentTokensBUTTONV2SmBackgroundColorConfig = {
  primary?: contextComponentTokensBUTTONV2SmBackgroundColorPrimaryConfig,
  secondary?: contextComponentTokensBUTTONV2SmBackgroundColorPrimaryConfig,
  danger?: contextComponentTokensBUTTONV2SmBackgroundColorPrimaryConfig,
  success?: contextComponentTokensBUTTONV2SmBackgroundColorPrimaryConfig,
}
type contextComponentTokensBUTTONV2SmBorderRadiusSmPrimaryConfig = {
  default?: stringOrNumberOrContextComponentTokensTAGSSmMinWidthConfig,
  iconOnly?: stringOrNumberOrContextComponentTokensTAGSSmMinWidthConfig,
  inline?: stringOrNumberOrContextComponentTokensTAGSSmMinWidthConfig,
}
type contextComponentTokensBUTTONV2SmBorderRadiusSmConfig = {
  primary?: contextComponentTokensBUTTONV2SmBorderRadiusSmPrimaryConfig,
  secondary?: contextComponentTokensBUTTONV2SmBorderRadiusSmPrimaryConfig,
  danger?: contextComponentTokensBUTTONV2SmBorderRadiusSmPrimaryConfig,
  success?: contextComponentTokensBUTTONV2SmBorderRadiusSmPrimaryConfig,
}
type contextComponentTokensBUTTONV2SmBorderRadiusConfig = {
  sm?: contextComponentTokensBUTTONV2SmBorderRadiusSmConfig,
  md?: contextComponentTokensBUTTONV2SmBorderRadiusSmConfig,
  lg?: contextComponentTokensBUTTONV2SmBorderRadiusSmConfig,
}
type contextComponentTokensBUTTONV2SmPaddingConfig = {
  top?: contextComponentTokensBUTTONV2SmBorderRadiusConfig,
  right?: contextComponentTokensBUTTONV2SmBorderRadiusConfig,
  bottom?: contextComponentTokensBUTTONV2SmBorderRadiusConfig,
  left?: contextComponentTokensBUTTONV2SmBorderRadiusConfig,
}
type contextComponentTokensBUTTONV2SmTextFontSizeConfig = {
  sm?: stringOrNumberOrContextComponentTokensTAGSSmMinWidthConfig,
  md?: stringOrNumberOrContextComponentTokensTAGSSmMinWidthConfig,
  lg?: stringOrNumberOrContextComponentTokensTAGSSmMinWidthConfig,
}
type contextComponentTokensBUTTONV2SmTextConfig = {
  color?: contextComponentTokensBUTTONSmTextColorConfig,
  fontSize?: contextComponentTokensBUTTONV2SmTextFontSizeConfig,
  fontWeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  lineHeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
}
type contextComponentTokensBUTTONV2SmConfig = {
  gap?: stringOrNumberOrContextComponentTokensTAGSSmMinWidthConfig,
  slotMaxHeight?: contextComponentTokensBUTTONV2SmSlotMaxHeightConfig,
  focusRing?: contextComponentTokensBUTTONV2SmFocusRingConfig,
  backgroundColor?: contextComponentTokensBUTTONV2SmBackgroundColorConfig,
  borderRadius?: contextComponentTokensBUTTONV2SmBorderRadiusConfig,
  padding?: contextComponentTokensBUTTONV2SmPaddingConfig,
  border?: contextComponentTokensBUTTONV2SmBackgroundColorConfig,
  shadow?: contextComponentTokensBUTTONSmShadowConfig,
  text?: contextComponentTokensBUTTONV2SmTextConfig,
}
type contextComponentTokensBUTTONV2Config = {
  sm?: contextComponentTokensBUTTONV2SmConfig,
  lg?: contextComponentTokensBUTTONV2SmConfig,
}
type contextComponentTokensTAGV2SmHeightConfig = {
  xs?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  sm?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  md?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  lg?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
}
type contextComponentTokensTAGV2SmPaddingConfig = {
  top?: contextComponentTokensTAGSSmPaddingConfig,
  bottom?: contextComponentTokensTAGSSmPaddingConfig,
  left?: contextComponentTokensTAGSSmPaddingConfig,
  right?: contextComponentTokensTAGSSmPaddingConfig,
}
type contextComponentTokensTAGV2SmLeftSlotMaxHeightConfig = {
  xs?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  sm?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  md?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  lg?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
}
type contextComponentTokensTAGV2SmLeftSlotConfig = {
  maxHeight?: contextComponentTokensTAGV2SmLeftSlotMaxHeightConfig,
}
type contextComponentTokensTAGV2SmTextConfig = {
  color?: contextComponentTokensTAGSSmBackgroundColorConfig,
  fontSize?: contextComponentTokensTAGSSmTextFontSizeConfig,
  fontWeight?: contextComponentTokensTAGSSmTextFontWeightConfig,
  lineHeight?: contextComponentTokensTAGSSmTextFontWeightConfig,
}
type contextComponentTokensTAGV2SmConfig = {
  border?: contextComponentTokensTAGSSmBorderConfig,
  borderRadius?: contextComponentTokensTAGSSmBorderRadiusConfig,
  backgroundColor?: contextComponentTokensTAGSSmBackgroundColorConfig,
  height?: contextComponentTokensTAGV2SmHeightConfig,
  padding?: contextComponentTokensTAGV2SmPaddingConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  leftSlot?: contextComponentTokensTAGV2SmLeftSlotConfig,
  rightSlot?: contextComponentTokensTAGV2SmLeftSlotConfig,
  text?: contextComponentTokensTAGV2SmTextConfig,
}
type contextComponentTokensTAGV2Config = {
  sm?: contextComponentTokensTAGV2SmConfig,
  lg?: contextComponentTokensTAGV2SmConfig,
}
type contextComponentTokensALERTV2SmPaddingConfig = {
  top?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  bottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  left?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  right?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensALERTV2SmGapConfig = {
  bottom?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  right?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensALERTV2SmMainContainerContentTextContainerHeadingConfig = {
  color?: string,  // ⚪ loose — was `{ primary?: Globals | NamedColor | "transparent" | SystemColor | DeprecatedSystemColor | "currentColor" | { re`
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
}
type contextComponentTokensALERTV2SmMainContainerContentTextContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  heading?: contextComponentTokensALERTV2SmMainContainerContentTextContainerHeadingConfig,
  description?: contextComponentTokensALERTV2SmMainContainerContentTextContainerHeadingConfig,
}
type contextComponentTokensALERTV2SmMainContainerContentActionContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  primaryAction?: contextComponentTokensALERTV2SmMainContainerContentTextContainerHeadingConfig,
  secondaryAction?: contextComponentTokensALERTV2SmMainContainerContentTextContainerHeadingConfig,
}
type contextComponentTokensALERTV2SmMainContainerContentConfig = {
  gap?: contextComponentTokensALERTV2SmGapConfig,
  textContainer?: contextComponentTokensALERTV2SmMainContainerContentTextContainerConfig,
  actionContainer?: contextComponentTokensALERTV2SmMainContainerContentActionContainerConfig,
}
type contextComponentTokensALERTV2SmMainContainerCloseButtonConfig = {
  color?: contextComponentTokensALERTSmTextHeadingColorConfig,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
}
type contextComponentTokensALERTV2SmMainContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  content?: contextComponentTokensALERTV2SmMainContainerContentConfig,
  closeButton?: contextComponentTokensALERTV2SmMainContainerCloseButtonConfig,
}
type contextComponentTokensALERTV2SmConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  maxWidth?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  minWidth?: mozInitialOrInheritOrInitialOrRevertEtc1owcx,
  border?: contextComponentTokensALERTSmBackgroundConfig,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  backgroundColor?: contextComponentTokensALERTSmBackgroundConfig,
  padding?: contextComponentTokensALERTV2SmPaddingConfig,
  gap?: contextComponentTokensALERTV2SmGapConfig,
  slot?: contextComponentTokensCHARTSSmContentLegendDropdownConfig,
  mainContainer?: contextComponentTokensALERTV2SmMainContainerConfig,
}
type contextComponentTokensALERTV2Config = {
  sm?: contextComponentTokensALERTV2SmConfig,
  lg?: contextComponentTokensALERTV2SmConfig,
}
type contextComponentTokensACCORDIONV2SmTriggerTextTitleConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
  color?: contextComponentTokensACCORDIONSmTriggerBackgroundColorBorderConfig,
}
type contextComponentTokensACCORDIONV2SmTriggerTextSubtextConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  color?: contextComponentTokensACCORDIONSmTriggerBackgroundColorBorderConfig,
}
type contextComponentTokensACCORDIONV2SmTriggerTextConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  title?: contextComponentTokensACCORDIONV2SmTriggerTextTitleConfig,
  subtext?: contextComponentTokensACCORDIONV2SmTriggerTextSubtextConfig,
}
type contextComponentTokensACCORDIONV2SmTriggerSlotConfig = {
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
}
type contextComponentTokensACCORDIONV2SmTriggerConfig = {
  content?: contextComponentTokensRADIOSmGroupConfig,
  backgroundColor?: contextComponentTokensACCORDIONSmTriggerBackgroundColorConfig,
  border?: contextComponentTokensACCORDIONSmTriggerBorderConfig,
  padding?: contextComponentTokensACCORDIONSmBorderRadiusConfig,
  text?: contextComponentTokensACCORDIONV2SmTriggerTextConfig,
  slot?: contextComponentTokensACCORDIONV2SmTriggerSlotConfig,
}
type contextComponentTokensACCORDIONV2SmChevronConfig = {
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  color?: contextComponentTokensACCORDIONSmTriggerBackgroundColorBorderConfig,
}
type contextComponentTokensACCORDIONV2SmConfig = {
  gap?: contextComponentTokensACCORDIONSmGapConfig,
  borderRadius?: contextComponentTokensACCORDIONSmBorderRadiusConfig,
  trigger?: contextComponentTokensACCORDIONV2SmTriggerConfig,
  separator?: contextComponentTokensACCORDIONSmSeparatorConfig,
  chevron?: contextComponentTokensACCORDIONV2SmChevronConfig,
}
type contextComponentTokensACCORDIONV2Config = {
  sm?: contextComponentTokensACCORDIONV2SmConfig,
  lg?: contextComponentTokensACCORDIONV2SmConfig,
}
type contextComponentTokensSNACKBARV2SmSlotConfig = {
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  color?: contextComponentTokensSNACKBARSmInfoIconColorConfig,
}
type contextComponentTokensSNACKBARV2SmMainContainerContentTextContainerHeaderConfig = {
  color?: string,  // ⚪ loose — was `{ info?: Globals | NamedColor | "transparent" | SystemColor | DeprecatedSystemColor | "currentColor" | { reado`
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
}
type contextComponentTokensSNACKBARV2SmMainContainerContentTextContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  header?: contextComponentTokensSNACKBARV2SmMainContainerContentTextContainerHeaderConfig,
  description?: contextComponentTokensSNACKBARV2SmMainContainerContentTextContainerHeaderConfig,
}
type contextComponentTokensSNACKBARV2SmMainContainerContentActionContainerConfig = {
  primaryAction?: contextComponentTokensSNACKBARV2SmMainContainerContentTextContainerHeaderConfig,
}
type contextComponentTokensSNACKBARV2SmMainContainerContentConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  textContainer?: contextComponentTokensSNACKBARV2SmMainContainerContentTextContainerConfig,
  actionContainer?: contextComponentTokensSNACKBARV2SmMainContainerContentActionContainerConfig,
}
type contextComponentTokensSNACKBARV2SmMainContainerCloseButtonConfig = {
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  color?: contextComponentTokensSNACKBARSmInfoIconColorConfig,
}
type contextComponentTokensSNACKBARV2SmMainContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  content?: contextComponentTokensSNACKBARV2SmMainContainerContentConfig,
  closeButton?: contextComponentTokensSNACKBARV2SmMainContainerCloseButtonConfig,
}
type contextComponentTokensSNACKBARV2SmConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  maxWidth?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  minWidth?: mozInitialOrInheritOrInitialOrRevertEtc1owcx,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  slot?: contextComponentTokensSNACKBARV2SmSlotConfig,
  mainContainer?: contextComponentTokensSNACKBARV2SmMainContainerConfig,
}
type contextComponentTokensSNACKBARV2Config = {
  sm?: contextComponentTokensSNACKBARV2SmConfig,
  lg?: contextComponentTokensSNACKBARV2SmConfig,
}
type contextComponentTokensSWITCHV2SmSwitchBackgroundColorConfig = {
  checked?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  unchecked?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
}
type contextComponentTokensSWITCHV2SmSwitchThumbConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  width?: contextComponentTokensTEXTAREAV2SmTopContainerHelpIconWidthConfig,
  height?: contextComponentTokensPROGRESSBARSmLinearHeightConfig,
  outline?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
}
type contextComponentTokensSWITCHV2SmSwitchConfig = {
  height?: contextComponentTokensPROGRESSBARSmLinearHeightConfig,
  width?: contextComponentTokensTEXTAREAV2SmTopContainerHelpIconWidthConfig,
  backgroundColor?: contextComponentTokensSWITCHV2SmSwitchBackgroundColorConfig,
  thumb?: contextComponentTokensSWITCHV2SmSwitchThumbConfig,
}
type contextComponentTokensSWITCHV2SmContentLabelSlotConfig = {
  maxHeight?: contextComponentTokensBUTTONSmSlotMaxHeightConfig,
}
type contextComponentTokensSWITCHV2SmContentLabelConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  lineHeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  slot?: contextComponentTokensSWITCHV2SmContentLabelSlotConfig,
}
type contextComponentTokensSWITCHV2SmContentSubLabelConfig = {
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  lineHeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
}
type contextComponentTokensSWITCHV2SmContentConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  label?: contextComponentTokensSWITCHV2SmContentLabelConfig,
  subLabel?: contextComponentTokensSWITCHV2SmContentSubLabelConfig,
  required?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
}
type contextComponentTokensSWITCHV2SmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  @as("switch") switch_?: contextComponentTokensSWITCHV2SmSwitchConfig,
  content?: contextComponentTokensSWITCHV2SmContentConfig,
}
type contextComponentTokensSWITCHV2Config = {
  sm?: contextComponentTokensSWITCHV2SmConfig,
  lg?: contextComponentTokensSWITCHV2SmConfig,
}
type contextComponentTokensSINGLESELECTV2SmTriggerPaddingSmConfig = {
  container?: contextComponentTokensTABSSmPaddingSmBoxedConfig,
  @as("no-container") noContainer?: contextComponentTokensTABSSmPaddingSmBoxedConfig,
}
type contextComponentTokensSINGLESELECTV2SmTriggerPaddingConfig = {
  sm?: contextComponentTokensSINGLESELECTV2SmTriggerPaddingSmConfig,
  md?: contextComponentTokensSINGLESELECTV2SmTriggerPaddingSmConfig,
  lg?: contextComponentTokensSINGLESELECTV2SmTriggerPaddingSmConfig,
}
type contextComponentTokensSINGLESELECTV2SmTriggerSlotConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
}
type contextComponentTokensSINGLESELECTV2SmTriggerConfig = {
  height?: contextComponentTokensMULTISELECTSmTriggerHeightConfig,
  padding?: contextComponentTokensSINGLESELECTV2SmTriggerPaddingConfig,
  borderRadius?: contextComponentTokensMULTISELECTSmTriggerBorderRadiusConfig,
  boxShadow?: contextComponentTokensMULTISELECTSmTriggerBoxShadowConfig,
  backgroundColor?: contextComponentTokensMULTISELECTSmTriggerBackgroundColorConfig,
  outline?: contextComponentTokensMULTISELECTSmTriggerOutlineConfig,
  slot?: contextComponentTokensSINGLESELECTV2SmTriggerSlotConfig,
  placeholder?: contextComponentTokensMODALSmHeaderTextTitleConfig,
  selectedValue?: contextComponentTokensMODALSmHeaderTextTitleConfig,
}
type contextComponentTokensSINGLESELECTV2SmMenuContentConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
}
type contextComponentTokensSINGLESELECTV2SmMenuGroupLabelConfig = {
  margin?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  color?: contextComponentTokensMENUSmItemBackgroundColorDefaultEnabledConfig,
}
type contextComponentTokensSINGLESELECTV2SmMenuItemConfig = {
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  margin?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  backgroundColor?: contextComponentTokensMENUSmItemBackgroundColorDefaultEnabledConfig,
  groupLabelText?: contextComponentTokensMULTISELECTSmLabelConfig,
  option?: contextComponentTokensMULTISELECTSmLabelConfig,
  description?: contextComponentTokensMULTISELECTSmLabelConfig,
  separator?: contextComponentTokensMULTISELECTSmMenuItemSeperatorConfig,
}
type contextComponentTokensSINGLESELECTV2SmMenuSubmenuTriggerBackgroundColorConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  focus?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensSINGLESELECTV2SmMenuSubmenuTriggerConfig = {
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  margin?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  backgroundColor?: contextComponentTokensSINGLESELECTV2SmMenuSubmenuTriggerBackgroundColorConfig,
}
type contextComponentTokensSINGLESELECTV2SmMenuSubmenuContentConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
}
type contextComponentTokensSINGLESELECTV2SmMenuSubmenuConfig = {
  trigger?: contextComponentTokensSINGLESELECTV2SmMenuSubmenuTriggerConfig,
  content?: contextComponentTokensSINGLESELECTV2SmMenuSubmenuContentConfig,
  optionText?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  iconColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensSINGLESELECTV2SmMenuFooterConfig = {
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderTop?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensSINGLESELECTV2SmMenuConfig = {
  content?: contextComponentTokensSINGLESELECTV2SmMenuContentConfig,
  padding?: contextComponentTokensSINGLESELECTV2SmTriggerPaddingConfig,
  groupLabel?: contextComponentTokensSINGLESELECTV2SmMenuGroupLabelConfig,
  item?: contextComponentTokensSINGLESELECTV2SmMenuItemConfig,
  submenu?: contextComponentTokensSINGLESELECTV2SmMenuSubmenuConfig,
  footer?: contextComponentTokensSINGLESELECTV2SmMenuFooterConfig,
}
type contextComponentTokensSINGLESELECTV2SmMobilePanelHeaderConfig = {
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  borderBottom?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensSINGLESELECTV2SmMobilePanelConfig = {
  header?: contextComponentTokensSINGLESELECTV2SmMobilePanelHeaderConfig,
}
type contextComponentTokensSINGLESELECTV2SmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  label?: contextComponentTokensMULTISELECTSmLabelConfig,
  subLabel?: contextComponentTokensMULTISELECTSmLabelConfig,
  hintText?: contextComponentTokensMULTISELECTSmLabelConfig,
  errorMessage?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  required?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  trigger?: contextComponentTokensSINGLESELECTV2SmTriggerConfig,
  menu?: contextComponentTokensSINGLESELECTV2SmMenuConfig,
  mobilePanel?: contextComponentTokensSINGLESELECTV2SmMobilePanelConfig,
}
type contextComponentTokensSINGLESELECTV2Config = {
  sm?: contextComponentTokensSINGLESELECTV2SmConfig,
  lg?: contextComponentTokensSINGLESELECTV2SmConfig,
}
type contextComponentTokensMULTISELECTV2SmTriggerSelectionTagContainerCountConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensMULTISELECTV2SmTriggerSelectionTagContainerConfig = {
  count?: contextComponentTokensMULTISELECTV2SmTriggerSelectionTagContainerCountConfig,
  text?: contextComponentTokensMULTISELECTV2SmTriggerSelectionTagContainerCountConfig,
}
type contextComponentTokensMULTISELECTV2SmTriggerSelectionTagConfig = {
  container?: contextComponentTokensMULTISELECTV2SmTriggerSelectionTagContainerConfig,
  @as("no-container") noContainer?: contextComponentTokensMULTISELECTV2SmTriggerSelectionTagContainerConfig,
  marginLeft?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensMULTISELECTV2SmTriggerChevronConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  iconSize?: float,
}
type contextComponentTokensMULTISELECTV2SmTriggerClearButtonConfig = {
  backgroundColor?: contextComponentTokensMULTISELECTSmTriggerBackgroundColorContainerConfig,
  outline?: contextComponentTokensMULTISELECTSmTriggerOutlineContainerConfig,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
}
type contextComponentTokensMULTISELECTV2SmTriggerFloatingLabelConfig = {
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensMULTISELECTV2SmTriggerConfig = {
  height?: contextComponentTokensMULTISELECTSmTriggerHeightConfig,
  padding?: contextComponentTokensSINGLESELECTV2SmTriggerPaddingConfig,
  borderRadius?: contextComponentTokensMULTISELECTSmTriggerBorderRadiusConfig,
  boxShadow?: contextComponentTokensMULTISELECTSmTriggerBoxShadowConfig,
  backgroundColor?: contextComponentTokensMULTISELECTSmTriggerBackgroundColorConfig,
  outline?: contextComponentTokensMULTISELECTSmTriggerOutlineConfig,
  slot?: contextComponentTokensSINGLESELECTV2SmTriggerSlotConfig,
  selectionTag?: contextComponentTokensMULTISELECTV2SmTriggerSelectionTagConfig,
  chevron?: contextComponentTokensMULTISELECTV2SmTriggerChevronConfig,
  clearButton?: contextComponentTokensMULTISELECTV2SmTriggerClearButtonConfig,
  floatingLabel?: contextComponentTokensMULTISELECTV2SmTriggerFloatingLabelConfig,
  placeholder?: contextComponentTokensMODALSmHeaderTextTitleConfig,
  selectedValue?: contextComponentTokensMODALSmHeaderTextTitleConfig,
}
type contextComponentTokensMULTISELECTV2SmMenuScrollConfig = {
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  maxHeight?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
}
type contextComponentTokensMULTISELECTV2SmMenuHeaderConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderBottom?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  selectAllRowPaddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  selectAllRowPaddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensMULTISELECTV2SmMenuSelectAllConfig = {
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensMULTISELECTV2SmMenuActionsConfig = {
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderTop?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensMULTISELECTV2SmMenuItemOptionsLabelConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  color?: contextComponentTokensMENUSmItemBackgroundColorDefaultEnabledConfig,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensMULTISELECTV2SmMenuItemConfig = {
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  margin?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  backgroundColor?: contextComponentTokensMENUSmItemBackgroundColorDefaultEnabledConfig,
  optionsLabel?: contextComponentTokensMULTISELECTV2SmMenuItemOptionsLabelConfig,
  option?: contextComponentTokensMULTISELECTSmLabelConfig,
  description?: contextComponentTokensMULTISELECTSmLabelConfig,
  seperator?: contextComponentTokensMULTISELECTSmMenuItemSeperatorConfig,
}
type contextComponentTokensMULTISELECTV2SmMenuConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  padding?: contextComponentTokensSINGLESELECTV2SmTriggerPaddingConfig,
  minWidth?: mozInitialOrInheritOrInitialOrRevertEtc1owcx,
  scroll?: contextComponentTokensMULTISELECTV2SmMenuScrollConfig,
  header?: contextComponentTokensMULTISELECTV2SmMenuHeaderConfig,
  selectAll?: contextComponentTokensMULTISELECTV2SmMenuSelectAllConfig,
  list?: contextComponentTokensMULTISELECTV2SmTriggerFloatingLabelConfig,
  actions?: contextComponentTokensMULTISELECTV2SmMenuActionsConfig,
  item?: contextComponentTokensMULTISELECTV2SmMenuItemConfig,
}
type contextComponentTokensMULTISELECTV2SmSubMenuTriggerConfig = {
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  margin?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensMULTISELECTV2SmSubMenuContentConfig = {
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensMULTISELECTV2SmSubMenuConfig = {
  trigger?: contextComponentTokensMULTISELECTV2SmSubMenuTriggerConfig,
  content?: contextComponentTokensMULTISELECTV2SmSubMenuContentConfig,
}
type contextComponentTokensMULTISELECTV2SmDrawerSearchConfig = {
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  marginTop?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  marginBottom?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensMULTISELECTV2SmDrawerConfig = {
  header?: contextComponentTokensSINGLESELECTV2SmMobilePanelHeaderConfig,
  search?: contextComponentTokensMULTISELECTV2SmDrawerSearchConfig,
  content?: contextComponentTokensRADIOSmGroupConfig,
}
type contextComponentTokensMULTISELECTV2SmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  label?: contextComponentTokensMULTISELECTSmLabelConfig,
  subLabel?: contextComponentTokensMULTISELECTSmLabelConfig,
  hintText?: contextComponentTokensMULTISELECTSmLabelConfig,
  errorMessage?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  required?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  trigger?: contextComponentTokensMULTISELECTV2SmTriggerConfig,
  menu?: contextComponentTokensMULTISELECTV2SmMenuConfig,
  subMenu?: contextComponentTokensMULTISELECTV2SmSubMenuConfig,
  drawer?: contextComponentTokensMULTISELECTV2SmDrawerConfig,
}
type contextComponentTokensMULTISELECTV2Config = {
  sm?: contextComponentTokensMULTISELECTV2SmConfig,
  lg?: contextComponentTokensMULTISELECTV2SmConfig,
}
type contextComponentTokensAVATARV2SmContainerWidthConfig = {
  sm?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  regular?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  md?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  lg?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  xl?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
}
type contextComponentTokensAVATARV2SmContainerHeightConfig = {
  sm?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  regular?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  md?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  lg?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  xl?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
}
type contextComponentTokensAVATARV2SmContainerImageConfig = {
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensAVATARV2SmContainerFallbackTextConfig = {
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  fontSize?: contextComponentTokensAVATARSmTextFontSizeConfig,
  fontWeight?: contextComponentTokensAVATARSmTextFontWeightConfig,
  lineHeight?: contextComponentTokensAVATARSmTextFontWeightConfig,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensAVATARV2SmContainerStatusBorderConfig = {
  sm?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  regular?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  md?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  lg?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  xl?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensAVATARV2SmContainerStatusBackgroundColorConfig = {
  none?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  online?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  offline?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  away?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  busy?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensAVATARV2SmContainerStatusPositionConfig = {
  circular?: contextComponentTokensAVATARSmTextFontWeightConfig,
  rounded?: contextComponentTokensAVATARSmTextFontWeightConfig,
}
type contextComponentTokensAVATARV2SmContainerStatusConfig = {
  width?: contextComponentTokensAVATARV2SmContainerWidthConfig,
  height?: contextComponentTokensAVATARV2SmContainerHeightConfig,
  border?: contextComponentTokensAVATARV2SmContainerStatusBorderConfig,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  backgroundColor?: contextComponentTokensAVATARV2SmContainerStatusBackgroundColorConfig,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  position?: contextComponentTokensAVATARV2SmContainerStatusPositionConfig,
}
type contextComponentTokensAVATARV2SmContainerConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  width?: contextComponentTokensAVATARV2SmContainerWidthConfig,
  height?: contextComponentTokensAVATARV2SmContainerHeightConfig,
  borderRadius?: contextComponentTokensAVATARSmContainerBorderRadiusConfig,
  image?: contextComponentTokensAVATARV2SmContainerImageConfig,
  fallbackText?: contextComponentTokensAVATARV2SmContainerFallbackTextConfig,
  status?: contextComponentTokensAVATARV2SmContainerStatusConfig,
}
type contextComponentTokensAVATARV2SmSlotConfig = {
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
}
type contextComponentTokensAVATARV2SmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  container?: contextComponentTokensAVATARV2SmContainerConfig,
  slot?: contextComponentTokensAVATARV2SmSlotConfig,
}
type contextComponentTokensAVATARV2Config = {
  sm?: contextComponentTokensAVATARV2SmConfig,
  lg?: contextComponentTokensAVATARV2SmConfig,
}
type contextComponentTokensTEXTINPUTV2SmInputContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  placeholder?: contextComponentTokensSWITCHV2SmContentSubLabelConfig,
  inputText?: contextComponentTokensTEXTAREAV2SmTopContainerLabelConfig,
  borderRadius?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  padding?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingConfig,
  border?: contextComponentTokensSEARCHINPUTSmInputContainerBorderBottomConfig,
  backgroundColor?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
}
type contextComponentTokensTEXTINPUTV2SmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  topContainer?: contextComponentTokensTEXTAREAV2SmTopContainerConfig,
  inputContainer?: contextComponentTokensTEXTINPUTV2SmInputContainerConfig,
  bottomContainer?: contextComponentTokensTEXTAREAV2SmBottomContainerConfig,
}
type contextComponentTokensTEXTINPUTV2Config = {
  sm?: contextComponentTokensTEXTINPUTV2SmConfig,
  lg?: contextComponentTokensTEXTINPUTV2SmConfig,
}
type contextComponentTokensCHARTSV2SmHeaderConfig = {
  padding?: contextComponentTokensTABSSmPaddingSmBoxedConfig,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderBottom?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensCHARTSV2SmLegendsLegendItemShapeConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensCHARTSV2SmLegendsLegendItemTextSeparatorConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
}
type contextComponentTokensCHARTSV2SmLegendsLegendItemTextConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  name?: contextComponentTokensCARDV2SmHeaderEyebrowConfig,
  value?: contextComponentTokensCARDV2SmHeaderEyebrowConfig,
  separator?: contextComponentTokensCHARTSV2SmLegendsLegendItemTextSeparatorConfig,
}
type contextComponentTokensCHARTSV2SmLegendsLegendItemConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  shape?: contextComponentTokensCHARTSV2SmLegendsLegendItemShapeConfig,
  text?: contextComponentTokensCHARTSV2SmLegendsLegendItemTextConfig,
}
type contextComponentTokensCHARTSV2SmLegendsConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  legendItem?: contextComponentTokensCHARTSV2SmLegendsLegendItemConfig,
}
type contextComponentTokensCHARTSV2SmChartXAxisTitleConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
}
type contextComponentTokensCHARTSV2SmChartXAxisConfig = {
  title?: contextComponentTokensCHARTSV2SmChartXAxisTitleConfig,
  labels?: contextComponentTokensCHARTSV2SmChartXAxisTitleConfig,
  line?: contextComponentTokensTOPBARV2SmSeparatorConfig,
  gridLine?: contextComponentTokensTOPBARV2SmSeparatorConfig,
}
type contextComponentTokensCHARTSV2SmChartConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  xAxis?: contextComponentTokensCHARTSV2SmChartXAxisConfig,
  yAxis?: contextComponentTokensCHARTSV2SmChartXAxisConfig,
}
type contextComponentTokensCHARTSV2SmConfig = {
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  header?: contextComponentTokensCHARTSV2SmHeaderConfig,
  legends?: contextComponentTokensCHARTSV2SmLegendsConfig,
  chart?: contextComponentTokensCHARTSV2SmChartConfig,
}
type contextComponentTokensCHARTSV2Config = {
  sm?: contextComponentTokensCHARTSV2SmConfig,
  lg?: contextComponentTokensCHARTSV2SmConfig,
}
type contextComponentTokensCHECKBOXV2SmCheckboxBackgroundColorConfig = {
  checked?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  unchecked?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  indeterminate?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
}
type contextComponentTokensCHECKBOXV2SmCheckboxBorderConfig = {
  checked?: contextComponentTokensSEARCHINPUTSmInputContainerBorderBottomConfig,
  unchecked?: contextComponentTokensSEARCHINPUTSmInputContainerBorderBottomConfig,
  indeterminate?: contextComponentTokensSEARCHINPUTSmInputContainerBorderBottomConfig,
}
type contextComponentTokensCHECKBOXV2SmCheckboxIconConfig = {
  color?: contextComponentTokensCHECKBOXSmIndicatorIconColorConfig,
  width?: contextComponentTokensTEXTAREAV2SmTopContainerHelpIconWidthConfig,
  height?: contextComponentTokensPROGRESSBARSmLinearHeightConfig,
  strokeWidth?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
}
type contextComponentTokensCHECKBOXV2SmCheckboxConfig = {
  height?: contextComponentTokensPROGRESSBARSmLinearHeightConfig,
  width?: contextComponentTokensTEXTAREAV2SmTopContainerHelpIconWidthConfig,
  opacity?: string,  // ⚪ loose — was `Globals | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; indexOf?: `
  backgroundColor?: contextComponentTokensCHECKBOXV2SmCheckboxBackgroundColorConfig,
  borderRadius?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  border?: contextComponentTokensCHECKBOXV2SmCheckboxBorderConfig,
  outline?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
  outlineOffset?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  icon?: contextComponentTokensCHECKBOXV2SmCheckboxIconConfig,
}
type contextComponentTokensCHECKBOXV2SmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  checkbox?: contextComponentTokensCHECKBOXV2SmCheckboxConfig,
  content?: contextComponentTokensSWITCHV2SmContentConfig,
}
type contextComponentTokensCHECKBOXV2Config = {
  sm?: contextComponentTokensCHECKBOXV2SmConfig,
  lg?: contextComponentTokensCHECKBOXV2SmConfig,
}
type contextComponentTokensSTATCARDV2SmTopContainerDataContainerTitleContainerTitleConfig = {
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
}
type contextComponentTokensSTATCARDV2SmTopContainerDataContainerTitleContainerHelpIconConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  color?: string,  // ⚪ loose — was `{ default?: Globals | NamedColor | "transparent" | SystemColor | DeprecatedSystemColor | "currentColor" | { re`
}
type contextComponentTokensSTATCARDV2SmTopContainerDataContainerTitleContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  title?: contextComponentTokensSTATCARDV2SmTopContainerDataContainerTitleContainerTitleConfig,
  helpIcon?: contextComponentTokensSTATCARDV2SmTopContainerDataContainerTitleContainerHelpIconConfig,
}
type contextComponentTokensSTATCARDV2SmTopContainerDataContainerStatsContainerValueConfig = {
  chart?: contextComponentTokensSTATCARDV2SmTopContainerDataContainerTitleContainerTitleConfig,
  progress?: contextComponentTokensSTATCARDV2SmTopContainerDataContainerTitleContainerTitleConfig,
  number?: contextComponentTokensSTATCARDV2SmTopContainerDataContainerTitleContainerTitleConfig,
}
type contextComponentTokensSTATCARDV2SmTopContainerDataContainerStatsContainerChangeContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  change?: string,  // ⚪ loose — was `{ fontSize?: number | Globals | "math" | AbsoluteSize | "larger" | "smaller" | { readonly [x: number]: string;`
  arrow?: string,  // ⚪ loose — was `{ width?: number | Globals | "-moz-fit-content" | "-moz-max-content" | "-moz-min-content" | "-webkit-fit-conte`
}
type contextComponentTokensSTATCARDV2SmTopContainerDataContainerStatsContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  value?: contextComponentTokensSTATCARDV2SmTopContainerDataContainerStatsContainerValueConfig,
  changeContainer?: contextComponentTokensSTATCARDV2SmTopContainerDataContainerStatsContainerChangeContainerConfig,
}
type contextComponentTokensSTATCARDV2SmTopContainerDataContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  titleContainer?: contextComponentTokensSTATCARDV2SmTopContainerDataContainerTitleContainerConfig,
  statsContainer?: contextComponentTokensSTATCARDV2SmTopContainerDataContainerStatsContainerConfig,
  subtitle?: contextComponentTokensSTATCARDV2SmTopContainerDataContainerTitleContainerTitleConfig,
}
type contextComponentTokensSTATCARDV2SmTopContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  dataContainer?: contextComponentTokensSTATCARDV2SmTopContainerDataContainerConfig,
}
type contextComponentTokensSTATCARDV2SmConfig = {
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  maxWidth?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  minWidth?: mozInitialOrInheritOrInitialOrRevertEtc1owcx,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  topContainer?: contextComponentTokensSTATCARDV2SmTopContainerConfig,
}
type contextComponentTokensSTATCARDV2Config = {
  sm?: contextComponentTokensSTATCARDV2SmConfig,
  lg?: contextComponentTokensSTATCARDV2SmConfig,
}
type contextComponentTokensTOOLTIPV2SmGapConfig = {
  sm?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  md?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  lg?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensTOOLTIPV2SmTextConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontWeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  lineHeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
}
type contextComponentTokensTOOLTIPV2SmConfig = {
  background?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderRadius?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  maxWidth?: contextComponentTokensBUTTONSmSlotMaxHeightConfig,
  padding?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  gap?: contextComponentTokensTOOLTIPV2SmGapConfig,
  text?: contextComponentTokensTOOLTIPV2SmTextConfig,
  zIndex?: string,  // ⚪ loose — was `Globals | "auto" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; i`
}
type contextComponentTokensTOOLTIPV2Config = {
  sm?: contextComponentTokensTOOLTIPV2SmConfig,
  lg?: contextComponentTokensTOOLTIPV2SmConfig,
}
type contextComponentTokensRADIOV2SmRadioIndicatorActiveConfig = {
  backgroundColor?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  borderColor?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
}
type contextComponentTokensRADIOV2SmRadioIndicatorConfig = {
  active?: contextComponentTokensRADIOV2SmRadioIndicatorActiveConfig,
  inactive?: contextComponentTokensRADIOV2SmRadioIndicatorActiveConfig,
}
type contextComponentTokensRADIOV2SmRadioActiveIndicatorActiveBackgroundColorConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  focus?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensRADIOV2SmRadioActiveIndicatorActiveConfig = {
  backgroundColor?: contextComponentTokensRADIOV2SmRadioActiveIndicatorActiveBackgroundColorConfig,
}
type contextComponentTokensRADIOV2SmRadioActiveIndicatorConfig = {
  active?: contextComponentTokensRADIOV2SmRadioActiveIndicatorActiveConfig,
}
type contextComponentTokensRADIOV2SmRadioBorderWidthActiveConfig = {
  default?: float,
  hover?: float,
  focus?: float,
  error?: float,
  disabled?: float,
}
type contextComponentTokensRADIOV2SmRadioBorderWidthConfig = {
  active?: contextComponentTokensRADIOV2SmRadioBorderWidthActiveConfig,
  inactive?: contextComponentTokensRADIOV2SmRadioBorderWidthActiveConfig,
}
type contextComponentTokensRADIOV2SmRadioConfig = {
  indicator?: contextComponentTokensRADIOV2SmRadioIndicatorConfig,
  activeIndicator?: contextComponentTokensRADIOV2SmRadioActiveIndicatorConfig,
  height?: contextComponentTokensPROGRESSBARSmLinearHeightConfig,
  borderWidth?: contextComponentTokensRADIOV2SmRadioBorderWidthConfig,
}
type contextComponentTokensRADIOV2SmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  group?: contextComponentTokensRADIOSmGroupConfig,
  radio?: contextComponentTokensRADIOV2SmRadioConfig,
  content?: contextComponentTokensSWITCHV2SmContentConfig,
}
type contextComponentTokensRADIOV2Config = {
  sm?: contextComponentTokensRADIOV2SmConfig,
  lg?: contextComponentTokensRADIOV2SmConfig,
}
type contextComponentTokensPOPOVERV2SmPaddingConfig = {
  left?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  right?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  top?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  bottom?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
}
type contextComponentTokensPOPOVERV2SmTopContainerHeadingConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  lineHeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  @as("IconSize") iconSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
}
type contextComponentTokensPOPOVERV2SmTopContainerDescriptionConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  lineHeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
}
type contextComponentTokensPOPOVERV2SmTopContainerConfig = {
  gap?: contextComponentTokensTOOLTIPV2SmGapConfig,
  heading?: contextComponentTokensPOPOVERV2SmTopContainerHeadingConfig,
  description?: contextComponentTokensPOPOVERV2SmTopContainerDescriptionConfig,
}
type contextComponentTokensPOPOVERV2SmBottomContainerConfig = {
  gap?: contextComponentTokensTOOLTIPV2SmGapConfig,
}
type contextComponentTokensPOPOVERV2SmConfig = {
  background?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  shadow?: contextComponentTokensPOPOVERSmShadowConfig,
  gap?: contextComponentTokensTOOLTIPV2SmGapConfig,
  zIndex?: string,  // ⚪ loose — was `Globals | "auto" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; i`
  borderRadius?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  padding?: contextComponentTokensPOPOVERV2SmPaddingConfig,
  @as("TopContainer") topContainer?: contextComponentTokensPOPOVERV2SmTopContainerConfig,
  bottomContainer?: contextComponentTokensPOPOVERV2SmBottomContainerConfig,
}
type contextComponentTokensPOPOVERV2Config = {
  sm?: contextComponentTokensPOPOVERV2SmConfig,
  lg?: contextComponentTokensPOPOVERV2SmConfig,
}
type contextComponentTokensSIDEBARV2SmContainerHoverPreviewConfig = {
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
}
type contextComponentTokensSIDEBARV2SmContainerConfig = {
  zIndex?: string,  // ⚪ loose — was `Globals | "auto" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; i`
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderRight?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  hoverPreview?: contextComponentTokensSIDEBARV2SmContainerHoverPreviewConfig,
  maxWidth?: contextComponentTokensSIDEBARSmMaxWidthConfig,
}
type contextComponentTokensSIDEBARV2SmLeftPanelConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderRight?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  item?: contextComponentTokensSIDEBARSmLeftPanelItemConfig,
}
type contextComponentTokensSIDEBARV2SmHeaderToggleButtonConfig = {
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  backgroundColor?: contextComponentTokensBREADCRUMBSmItemTextColorConfig,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  iconColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensSIDEBARV2SmHeaderConfig = {
  zIndex?: string,  // ⚪ loose — was `Globals | "auto" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; i`
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  borderBottom?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderBottomWidth?: mozInitialOrInheritOrInitialOrRevertEtcrrza2,
  scrolledBorderColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  toggleButton?: contextComponentTokensSIDEBARV2SmHeaderToggleButtonConfig,
}
type contextComponentTokensSIDEBARV2SmDirectoryConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensSIDEBARV2SmFooterConfig = {
  zIndex?: string,  // ⚪ loose — was `Globals | "auto" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; i`
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  borderTop?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensSIDEBARV2SmSecondarySidebarItemConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  border?: contextComponentTokensSIDEBARSmLeftPanelItemBorderConfig,
  backgroundColor?: contextComponentTokensBREADCRUMBSmItemTextColorConfig,
}
type contextComponentTokensSIDEBARV2SmSecondarySidebarConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  borderRight?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  item?: contextComponentTokensSIDEBARV2SmSecondarySidebarItemConfig,
}
type contextComponentTokensSIDEBARV2SmConfig = {
  container?: contextComponentTokensSIDEBARV2SmContainerConfig,
  leftPanel?: contextComponentTokensSIDEBARV2SmLeftPanelConfig,
  header?: contextComponentTokensSIDEBARV2SmHeaderConfig,
  directory?: contextComponentTokensSIDEBARV2SmDirectoryConfig,
  footer?: contextComponentTokensSIDEBARV2SmFooterConfig,
  primarySidebar?: contextComponentTokensMENUV2SmSearchIconConfig,
  secondarySidebar?: contextComponentTokensSIDEBARV2SmSecondarySidebarConfig,
}
type contextComponentTokensSIDEBARV2Config = {
  sm?: contextComponentTokensSIDEBARV2SmConfig,
  lg?: contextComponentTokensSIDEBARV2SmConfig,
}
type contextComponentTokensTABSV2SmTabListActiveIndicatorPositionConfig = {
  bottom?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensTABSV2SmTabListActiveIndicatorConfig = {
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  position?: contextComponentTokensTABSV2SmTabListActiveIndicatorPositionConfig,
  transition?: mozInitialOrInheritOrInitialOrRevertEtcydel2,
  zIndex?: string,  // ⚪ loose — was `Globals | "auto" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; i`
}
type contextComponentTokensTABSV2SmTabListStickyHeaderConfig = {
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  zIndex?: string,  // ⚪ loose — was `Globals | "auto" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; i`
}
type contextComponentTokensTABSV2SmTabListTriggerPaddingSmConfig = {
  boxed?: contextComponentTokensTABSSmPaddingSmBoxedConfig,
  floating?: contextComponentTokensTABSSmPaddingSmBoxedConfig,
  underline?: contextComponentTokensTABSSmPaddingSmBoxedConfig,
  pills?: contextComponentTokensTABSSmPaddingSmBoxedConfig,
}
type contextComponentTokensTABSV2SmTabListTriggerPaddingConfig = {
  sm?: contextComponentTokensTABSV2SmTabListTriggerPaddingSmConfig,
  md?: contextComponentTokensTABSV2SmTabListTriggerPaddingSmConfig,
  lg?: contextComponentTokensTABSV2SmTabListTriggerPaddingSmConfig,
}
type contextComponentTokensTABSV2SmTabListTriggerTextConfig = {
  color?: contextComponentTokensTABSV2SmTabListTriggerPaddingSmConfig,
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
}
type contextComponentTokensTABSV2SmTabListTriggerCloseButtonConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  backgroundColor?: contextComponentTokensTABSSmBackgroundColorBoxedConfig,
}
type contextComponentTokensTABSV2SmTabListTriggerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  icon?: contextComponentTokensACCORDIONSmTriggerSlotConfig,
  backgroundColor?: contextComponentTokensTABSSmBackgroundColorConfig,
  borderRadius?: contextComponentTokensTABSSmBorderRadiusConfig,
  border?: contextComponentTokensTABSSmBorderConfig,
  padding?: contextComponentTokensTABSV2SmTabListTriggerPaddingConfig,
  text?: contextComponentTokensTABSV2SmTabListTriggerTextConfig,
  closeButton?: contextComponentTokensTABSV2SmTabListTriggerCloseButtonConfig,
  transition?: mozInitialOrInheritOrInitialOrRevertEtcydel2,
}
type contextComponentTokensTABSV2SmTabListConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  backgroundColor?: contextComponentTokensTABSSmContainerBackgroundColorConfig,
  borderRadius?: contextComponentTokensTABSSmBorderRadiusConfig,
  padding?: contextComponentTokensTABSSmPaddingConfig,
  borderBottom?: contextComponentTokensTABSSmBorderConfig,
  activeIndicator?: contextComponentTokensTABSV2SmTabListActiveIndicatorConfig,
  stickyHeader?: contextComponentTokensTABSV2SmTabListStickyHeaderConfig,
  trigger?: contextComponentTokensTABSV2SmTabListTriggerConfig,
}
type contextComponentTokensTABSV2SmConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  outline?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
  tabList?: contextComponentTokensTABSV2SmTabListConfig,
}
type contextComponentTokensTABSV2Config = {
  sm?: contextComponentTokensTABSV2SmConfig,
  lg?: contextComponentTokensTABSV2SmConfig,
}
type contextComponentTokensBREADCRUMBV2SmEllipsisConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  size?: float,
}
type contextComponentTokensBREADCRUMBV2SmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  item?: contextComponentTokensBREADCRUMBSmItemConfig,
  ellipsis?: contextComponentTokensBREADCRUMBV2SmEllipsisConfig,
  separator?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
}
type contextComponentTokensBREADCRUMBV2Config = {
  sm?: contextComponentTokensBREADCRUMBV2SmConfig,
  lg?: contextComponentTokensBREADCRUMBV2SmConfig,
}
type contextComponentTokensCODEEDITORV2SmHeaderConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderBottom?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  icon?: contextComponentTokensMENUV2SmSearchIconConfig,
  text?: contextComponentTokensCARDV2SmHeaderEyebrowConfig,
}
type contextComponentTokensCODEEDITORV2SmBodyCodeConfig = {
  fontFamily?: mozInitialOrInheritOrInitialOrRevertEtc12oc1,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensCODEEDITORV2SmBodySyntaxConfig = {
  keyword?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  function?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  string?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  number?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  operator?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  variable?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  comment?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  text?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
}
type contextComponentTokensCODEEDITORV2SmBodyConfig = {
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  gutter?: contextComponentTokensCODEBLOCKSmBodyGutterConfig,
  code?: contextComponentTokensCODEEDITORV2SmBodyCodeConfig,
  highlightedLine?: contextComponentTokensCODEBLOCKSmBodyHighlightedLineConfig,
  syntax?: contextComponentTokensCODEEDITORV2SmBodySyntaxConfig,
}
type contextComponentTokensCODEEDITORV2SmConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  theme?: contextComponentTokensCODEEDITORV2SmTheme,
  header?: contextComponentTokensCODEEDITORV2SmHeaderConfig,
  body?: contextComponentTokensCODEEDITORV2SmBodyConfig,
}
type contextComponentTokensCODEEDITORV2Config = {
  sm?: contextComponentTokensCODEEDITORV2SmConfig,
  lg?: contextComponentTokensCODEEDITORV2SmConfig,
}
type contextComponentTokensPROGRESSBARV2SmLinearEmptyBackgroundImageConfig = {
  solid?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  segmented?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
}
type contextComponentTokensPROGRESSBARV2SmLinearEmptyBackgroundSizeConfig = {
  solid?: mozInitialOrInheritOrInitialOrRevertEtcyzzvl,
  segmented?: mozInitialOrInheritOrInitialOrRevertEtcyzzvl,
}
type contextComponentTokensPROGRESSBARV2SmLinearEmptyConfig = {
  backgroundColor?: contextComponentTokensPROGRESSBARSmLinearFillBackgroundColorConfig,
  backgroundImage?: contextComponentTokensPROGRESSBARV2SmLinearEmptyBackgroundImageConfig,
  backgroundSize?: contextComponentTokensPROGRESSBARV2SmLinearEmptyBackgroundSizeConfig,
}
type contextComponentTokensPROGRESSBARV2SmLinearConfig = {
  height?: contextComponentTokensPROGRESSBARSmLinearHeightConfig,
  fill?: contextComponentTokensPROGRESSBARSmLinearFillConfig,
  empty?: contextComponentTokensPROGRESSBARV2SmLinearEmptyConfig,
  borderRadius?: contextComponentTokensPROGRESSBARSmLinearFillBorderRadiusConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensPROGRESSBARV2SmCircularConfig = {
  size?: contextComponentTokensTEXTAREAV2SmTopContainerHelpIconWidthConfig,
  strokeWidth?: contextComponentTokensPROGRESSBARSmCircularStrokeWidthConfig,
  stroke?: contextComponentTokensPROGRESSBARSmCircularStrokeConfig,
  background?: contextComponentTokensPROGRESSBARSmCircularStrokeConfig,
  dashArray?: contextComponentTokensPROGRESSBARSmCircularDashArrayConfig,
  motion?: string,
}
type contextComponentTokensPROGRESSBARV2SmConfig = {
  linear?: contextComponentTokensPROGRESSBARV2SmLinearConfig,
  circular?: contextComponentTokensPROGRESSBARV2SmCircularConfig,
  label?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  transition?: string,
}
type contextComponentTokensPROGRESSBARV2Config = {
  sm?: contextComponentTokensPROGRESSBARV2SmConfig,
  lg?: contextComponentTokensPROGRESSBARV2SmConfig,
}
type contextComponentTokensMULTIVALUEINPUTV2SmInputContainerPlaceholderColorConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  focus?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  error?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensMULTIVALUEINPUTV2SmInputContainerSlotAlignTopConfig = {
  withTags?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  withoutTags?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensMULTIVALUEINPUTV2SmInputContainerConfig = {
  offSet?: float,
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  boxShadow?: contextComponentTokensMULTIVALUEINPUTSmInputContainerBoxShadowConfig,
  paddingTop?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  paddingRight?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  paddingBottom?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  paddingLeft?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  border?: contextComponentTokensSEARCHINPUTSmInputContainerBorderBottomConfig,
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  placeholderColor?: contextComponentTokensMULTIVALUEINPUTV2SmInputContainerPlaceholderColorConfig,
  backgroundColor?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  closeButton?: contextComponentTokensMENUV2SmSearchIconConfig,
  leftSlot?: contextComponentTokensTABLESmHeaderActionIconsSearchIconConfig,
  rightSlot?: contextComponentTokensTABLESmHeaderActionIconsSearchIconConfig,
  slotAlignTop?: contextComponentTokensMULTIVALUEINPUTV2SmInputContainerSlotAlignTopConfig,
}
type contextComponentTokensMULTIVALUEINPUTV2SmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  topContainer?: contextComponentTokensTEXTAREAV2SmTopContainerConfig,
  inputContainer?: contextComponentTokensMULTIVALUEINPUTV2SmInputContainerConfig,
  bottomContainer?: contextComponentTokensTEXTAREAV2SmBottomContainerConfig,
}
type contextComponentTokensMULTIVALUEINPUTV2Config = {
  sm?: contextComponentTokensMULTIVALUEINPUTV2SmConfig,
  lg?: contextComponentTokensMULTIVALUEINPUTV2SmConfig,
}
type contextComponentTokensNUMBERINPUTV2SmInputContainerSlotLeftMarginConfig = {
  sm?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  md?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  lg?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensNUMBERINPUTV2SmInputContainerSlotLeftConfig = {
  width?: contextComponentTokensTEXTAREAV2SmTopContainerHelpIconWidthConfig,
  height?: contextComponentTokensPROGRESSBARSmLinearHeightConfig,
  margin?: contextComponentTokensNUMBERINPUTV2SmInputContainerSlotLeftMarginConfig,
}
type contextComponentTokensNUMBERINPUTV2SmInputContainerSlotConfig = {
  left?: contextComponentTokensNUMBERINPUTV2SmInputContainerSlotLeftConfig,
  right?: contextComponentTokensNUMBERINPUTV2SmInputContainerSlotLeftConfig,
}
type contextComponentTokensNUMBERINPUTV2SmInputContainerConfig = {
  placeholder?: contextComponentTokensSWITCHV2SmContentSubLabelConfig,
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  borderRadius?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  paddingTop?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  paddingRight?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  paddingBottom?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  paddingLeft?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  border?: contextComponentTokensSEARCHINPUTSmInputContainerBorderBottomConfig,
  lineHeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  backgroundColor?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  stepperButton?: contextComponentTokensNUMBERINPUTSmInputContainerStepperButtonConfig,
  slot?: contextComponentTokensNUMBERINPUTV2SmInputContainerSlotConfig,
}
type contextComponentTokensNUMBERINPUTV2SmUnitConfig = {
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
  paddingTop?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  paddingRight?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  paddingBottom?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  paddingLeft?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  borderRadius?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  border?: contextComponentTokensSEARCHINPUTSmInputContainerBorderBottomConfig,
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
}
type contextComponentTokensNUMBERINPUTV2SmFloatingLabelsConfig = {
  placeholder?: contextComponentTokensSWITCHV2SmContentSubLabelConfig,
  required?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
}
type contextComponentTokensNUMBERINPUTV2SmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  topContainer?: contextComponentTokensTEXTAREAV2SmTopContainerConfig,
  inputContainer?: contextComponentTokensNUMBERINPUTV2SmInputContainerConfig,
  unit?: contextComponentTokensNUMBERINPUTV2SmUnitConfig,
  floatingLabels?: contextComponentTokensNUMBERINPUTV2SmFloatingLabelsConfig,
  bottomContainer?: contextComponentTokensTEXTAREAV2SmBottomContainerConfig,
}
type contextComponentTokensNUMBERINPUTV2Config = {
  sm?: contextComponentTokensNUMBERINPUTV2SmConfig,
  lg?: contextComponentTokensNUMBERINPUTV2SmConfig,
}
type contextComponentTokensOTPINPUTV2SmInputContainerInputConfig = {
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  border?: contextComponentTokensSEARCHINPUTSmInputContainerBorderBottomConfig,
  backgroundColor?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
}
type contextComponentTokensOTPINPUTV2SmInputContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  input?: contextComponentTokensOTPINPUTV2SmInputContainerInputConfig,
}
type contextComponentTokensOTPINPUTV2SmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  topContainer?: contextComponentTokensTEXTAREAV2SmTopContainerConfig,
  inputContainer?: contextComponentTokensOTPINPUTV2SmInputContainerConfig,
  bottomContainer?: contextComponentTokensTEXTAREAV2SmBottomContainerConfig,
}
type contextComponentTokensOTPINPUTV2Config = {
  sm?: contextComponentTokensOTPINPUTV2SmConfig,
  lg?: contextComponentTokensOTPINPUTV2SmConfig,
}
type contextComponentTokensBADGESmDotConfig = {
  width?: contextComponentTokensTEXTAREAV2SmTopContainerHelpIconWidthConfig,
  height?: contextComponentTokensPROGRESSBARSmLinearHeightConfig,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensBADGESmPillMinWidthConfig = {
  sm?: mozInitialOrInheritOrInitialOrRevertEtc1owcx,
  md?: mozInitialOrInheritOrInitialOrRevertEtc1owcx,
  lg?: mozInitialOrInheritOrInitialOrRevertEtc1owcx,
}
type contextComponentTokensBADGESmPillConfig = {
  minWidth?: contextComponentTokensBADGESmPillMinWidthConfig,
  height?: contextComponentTokensPROGRESSBARSmLinearHeightConfig,
  paddingLeft?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  paddingRight?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  borderRadius?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
}
type contextComponentTokensBADGESmBackgroundColorConfig = {
  alert?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  neutral?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  warning?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  primary?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  success?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensBADGESmTextConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontSize?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontSizeConfig,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  lineHeight?: contextComponentTokensTEXTAREAV2SmTopContainerLabelFontWeightConfig,
}
type contextComponentTokensBADGESmPositionConfig = {
  offset?: contextComponentTokensNUMBERINPUTV2SmInputContainerSlotLeftMarginConfig,
}
type contextComponentTokensBADGESmConfig = {
  dot?: contextComponentTokensBADGESmDotConfig,
  pill?: contextComponentTokensBADGESmPillConfig,
  backgroundColor?: contextComponentTokensBADGESmBackgroundColorConfig,
  text?: contextComponentTokensBADGESmTextConfig,
  position?: contextComponentTokensBADGESmPositionConfig,
}
type contextComponentTokensBADGEConfig = {
  sm?: contextComponentTokensBADGESmConfig,
  lg?: contextComponentTokensBADGESmConfig,
}
type contextComponentTokensSEARCHINPUTV2SmInputContainerSlotLeftConfig = {
  top?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  left?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  bottom?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensSEARCHINPUTV2SmInputContainerSlotRightConfig = {
  top?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  right?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  bottom?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensSEARCHINPUTV2SmInputContainerSlotConfig = {
  left?: contextComponentTokensSEARCHINPUTV2SmInputContainerSlotLeftConfig,
  right?: contextComponentTokensSEARCHINPUTV2SmInputContainerSlotRightConfig,
  transition?: mozInitialOrInheritOrInitialOrRevertEtcydel2,
  transform?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
}
type contextComponentTokensSEARCHINPUTV2SmInputContainerConfig = {
  paddingTop?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  paddingRight?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  paddingBottom?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  paddingLeft?: contextComponentTokensTEXTAREAV2SmInputContainerPaddingTopConfig,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  borderBottom?: contextComponentTokensSEARCHINPUTSmInputContainerBorderBottomConfig,
  outline?: mozInitialOrInheritOrInitialOrRevertEtcsclw8,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  color?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  placeholderColor?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  slot?: contextComponentTokensSEARCHINPUTV2SmInputContainerSlotConfig,
}
type contextComponentTokensSEARCHINPUTV2SmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  label?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  subLabel?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  hintText?: contextComponentTokensSEARCHINPUTSmLabelConfig,
  errorMessage?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  required?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  inputContainer?: contextComponentTokensSEARCHINPUTV2SmInputContainerConfig,
  icon?: contextComponentTokensSEARCHINPUTSmIconConfig,
}
type contextComponentTokensSEARCHINPUTV2Config = {
  sm?: contextComponentTokensSEARCHINPUTV2SmConfig,
  lg?: contextComponentTokensSEARCHINPUTV2SmConfig,
}
type contextComponentTokensCHATINPUTV2MOBILEAttachmentButtonDimensionsConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  backgroundColor?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensCHATINPUTV2MOBILEInputContainerBorderRadiusConfig = {
  default?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  hover?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  focus?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  error?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensCHATINPUTV2MOBILEInputContainerConfig = {
  border?: contextComponentTokensSEARCHINPUTSmInputContainerBorderBottomConfig,
  borderRadius?: contextComponentTokensCHATINPUTV2MOBILEInputContainerBorderRadiusConfig,
  boxShadow?: contextComponentTokensMULTIVALUEINPUTSmInputContainerBoxShadowConfig,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  placeholder?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  minHeight?: mozInitialOrInheritOrInitialOrRevertEtc96qi2,
  maxHeight?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  minWidth?: mozInitialOrInheritOrInitialOrRevertEtc1owcx,
  maxWidth?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
}
type contextComponentTokensCHATINPUTV2MOBILESecondaryActionConfig = {
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  right?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  bottom?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
  backgroundColor?: contextComponentTokensSEARCHINPUTSmLabelColorConfig,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensCHATINPUTV2MOBILEConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  attachmentButtonDimensions?: contextComponentTokensCHATINPUTV2MOBILEAttachmentButtonDimensionsConfig,
  inputContainer?: contextComponentTokensCHATINPUTV2MOBILEInputContainerConfig,
  secondaryAction?: contextComponentTokensCHATINPUTV2MOBILESecondaryActionConfig,
}
type contextComponentTokensSTEPPERV2SmContainerStepCircleDefaultConfig = {
  disabled?: string,  // ⚪ loose — was `{ backgroundColor?: Globals | NamedColor | "transparent" | SystemColor | DeprecatedSystemColor | "currentColor`
  default?: string,  // ⚪ loose — was `{ backgroundColor?: Globals | NamedColor | "transparent" | SystemColor | DeprecatedSystemColor | "currentColor`
  hover?: string,  // ⚪ loose — was `{ backgroundColor?: Globals | NamedColor | "transparent" | SystemColor | DeprecatedSystemColor | "currentColor`
  focus?: string,  // ⚪ loose — was `{ backgroundColor?: Globals | NamedColor | "transparent" | SystemColor | DeprecatedSystemColor | "currentColor`
}
type contextComponentTokensSTEPPERV2SmContainerStepCircleConfig = {
  default?: contextComponentTokensSTEPPERV2SmContainerStepCircleDefaultConfig,
  completed?: contextComponentTokensSTEPPERV2SmContainerStepCircleDefaultConfig,
  current?: contextComponentTokensSTEPPERV2SmContainerStepCircleDefaultConfig,
  pending?: contextComponentTokensSTEPPERV2SmContainerStepCircleDefaultConfig,
  disabled?: contextComponentTokensSTEPPERV2SmContainerStepCircleDefaultConfig,
  skipped?: contextComponentTokensSTEPPERV2SmContainerStepCircleDefaultConfig,
}
type contextComponentTokensSTEPPERV2SmContainerStepConfig = {
  circle?: contextComponentTokensSTEPPERV2SmContainerStepCircleConfig,
  icon?: contextComponentTokensSTEPPERV2SmContainerStepCircleConfig,
}
type contextComponentTokensSTEPPERV2SmContainerConnectorConfig = {
  line?: contextComponentTokensSTEPPERSmConnectorLineActiveDefaultConfig,
}
type contextComponentTokensSTEPPERV2SmContainerSubConnectorDotConfig = {
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensSTEPPERV2SmContainerSubConnectorExpanderConfig = {
  icon?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
}
type contextComponentTokensSTEPPERV2SmContainerSubConnectorTextConfig = {
  default?: contextComponentTokensMODALSmHeaderTextTitleConfig,
  completed?: contextComponentTokensMODALSmHeaderTextTitleConfig,
  current?: contextComponentTokensMODALSmHeaderTextTitleConfig,
  pending?: contextComponentTokensMODALSmHeaderTextTitleConfig,
  disabled?: contextComponentTokensMODALSmHeaderTextTitleConfig,
  skipped?: contextComponentTokensMODALSmHeaderTextTitleConfig,
}
type contextComponentTokensSTEPPERV2SmContainerSubConnectorConfig = {
  line?: contextComponentTokensSTEPPERSmConnectorLineActiveDefaultConfig,
  dot?: contextComponentTokensSTEPPERV2SmContainerSubConnectorDotConfig,
  expander?: contextComponentTokensSTEPPERV2SmContainerSubConnectorExpanderConfig,
  text?: contextComponentTokensSTEPPERV2SmContainerSubConnectorTextConfig,
}
type contextComponentTokensSTEPPERV2SmContainerTitleConfig = {
  text?: contextComponentTokensSTEPPERV2SmContainerStepCircleConfig,
}
type contextComponentTokensSTEPPERV2SmContainerDescriptionConfig = {
  text?: contextComponentTokensMODALSmHeaderTextTitleConfig,
}
type contextComponentTokensSTEPPERV2SmContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  step?: contextComponentTokensSTEPPERV2SmContainerStepConfig,
  connector?: contextComponentTokensSTEPPERV2SmContainerConnectorConfig,
  subConnector?: contextComponentTokensSTEPPERV2SmContainerSubConnectorConfig,
  title?: contextComponentTokensSTEPPERV2SmContainerTitleConfig,
  description?: contextComponentTokensSTEPPERV2SmContainerDescriptionConfig,
}
type contextComponentTokensSTEPPERV2SmConfig = {
  container?: contextComponentTokensSTEPPERV2SmContainerConfig,
}
type contextComponentTokensSTEPPERV2Config = {
  sm?: contextComponentTokensSTEPPERV2SmConfig,
  lg?: contextComponentTokensSTEPPERV2SmConfig,
}
type contextComponentTokensUPLOADV2SmUploadContainerBorderConfig = {
  idle?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  uploading?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  success?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  error?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  drag_enter?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  drag_leave?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  drag_over?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  drop?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensUPLOADV2SmUploadContainerBackgroundColorConfig = {
  idle?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  uploading?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  success?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  error?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  disabled?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  drag_enter?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  drag_leave?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  drag_over?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  drop?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensUPLOADV2SmUploadContainerHeaderConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  title?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  description?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
  errorText?: contextComponentTokensSEARCHINPUTSmErrorMessageConfig,
}
type contextComponentTokensUPLOADV2SmUploadContainerFileTagConfig = {
  maxWidth?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensUPLOADV2SmUploadContainerConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  border?: contextComponentTokensUPLOADV2SmUploadContainerBorderConfig,
  backgroundColor?: contextComponentTokensUPLOADV2SmUploadContainerBackgroundColorConfig,
  header?: contextComponentTokensUPLOADV2SmUploadContainerHeaderConfig,
  fileTag?: contextComponentTokensUPLOADV2SmUploadContainerFileTagConfig,
}
type contextComponentTokensUPLOADV2SmConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  topContainer?: contextComponentTokensTEXTAREAV2SmTopContainerConfig,
  uploadContainer?: contextComponentTokensUPLOADV2SmUploadContainerConfig,
  bottomContainer?: contextComponentTokensTEXTAREAV2SmBottomContainerConfig,
}
type contextComponentTokensUPLOADV2Config = {
  sm?: contextComponentTokensUPLOADV2SmConfig,
  lg?: contextComponentTokensUPLOADV2SmConfig,
}
@unboxed type mozInitialOrInheritOrInitialOrRevertEtc2zoye = @as("-moz-initial") MozInitial | @as("inherit") Inherit | @as("initial") Initial | @as("revert") Revert | @as("revert-layer") RevertLayer | @as("unset") Unset | @as("none") NoneRevertEtc2zoye | @as("normal") Normal | @as("auto") Auto | @as("top") Top | @as("right") RightRevertEtc2zoye | @as("bottom") Bottom | @as("left") LeftRevertEtc2zoye | @as("center") CenterRevertEtc2zoye | @as("border-box") BorderBox | @as("content-box") ContentBox | @as("padding-box") PaddingBox | @as("fill-box") FillBox | @as("stroke-box") StrokeBox | @as("view-box") ViewBox | Num(float) | ContextComponentTokensTAGSSmMinWidthConfig(contextComponentTokensTAGSSmMinWidthConfig)
type contextComponentTokensMODALV2SmOverlayConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  offset?: mozInitialOrInheritOrInitialOrRevertEtc2zoye,
}
type contextComponentTokensMODALV2SmHeaderTextTitleConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  lineHeight?: string,  // ⚪ loose — was `number | Globals | "normal" | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; con`
}
type contextComponentTokensMODALV2SmHeaderTextConfig = {
  title?: contextComponentTokensMODALV2SmHeaderTextTitleConfig,
  subtitle?: contextComponentTokensMODALV2SmHeaderTextTitleConfig,
}
type contextComponentTokensMODALV2SmHeaderConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  maxHeight?: mozInitialOrInheritOrInitialOrRevertEtc1x0av,
  borderBottom?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  borderTopLeftRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  borderTopRightRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  slot?: contextComponentTokensRADIOSmGroupConfig,
  text?: contextComponentTokensMODALV2SmHeaderTextConfig,
}
type contextComponentTokensMODALV2SmDividerConfig = {
  borderColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensMODALV2SmSkeletonHeaderConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  borderBottom?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensMODALV2SmSkeletonBodyConfig = {
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
  width?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
}
type contextComponentTokensMODALV2SmSkeletonConfig = {
  header?: contextComponentTokensMODALV2SmSkeletonHeaderConfig,
  body?: contextComponentTokensMODALV2SmSkeletonBodyConfig,
}
type contextComponentTokensMODALV2SmBodyConfig = {
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensMODALV2SmFooterConfig = {
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  borderTop?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  gap?: mozInitialOrInheritOrInitialOrRevertEtchhntk,
}
type contextComponentTokensMODALV2SmConfig = {
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  overlay?: contextComponentTokensMODALV2SmOverlayConfig,
  paddingTop?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingRight?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingBottom?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  paddingLeft?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  header?: contextComponentTokensMODALV2SmHeaderConfig,
  divider?: contextComponentTokensMODALV2SmDividerConfig,
  skeleton?: contextComponentTokensMODALV2SmSkeletonConfig,
  body?: contextComponentTokensMODALV2SmBodyConfig,
  footer?: contextComponentTokensMODALV2SmFooterConfig,
  closeButton?: contextComponentTokensCHARTSV2SmLegendsLegendItemTextSeparatorConfig,
}
type contextComponentTokensMODALV2Config = {
  sm?: contextComponentTokensMODALV2SmConfig,
  lg?: contextComponentTokensMODALV2SmConfig,
}
type contextComponentTokensSLIDERSmSmConfig = {
  height?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  trackHeight?: mozInitialOrInheritOrInitialOrRevertEtc1avg4,
  thumbSize?: mozInitialOrInheritOrInitialOrRevertEtc1wbzz,
  thumbBorder?: mozInitialOrInheritOrInitialOrRevertEtcrrza2,
}
type contextComponentTokensSLIDERSmPrimaryConfig = {
  trackBackground?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  rangeBackground?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  thumbBackground?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  thumbBorder?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  thumbFocusRing?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensSLIDERSmLabelConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  boxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  padding?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  margin?: mozInitialOrInheritOrInitialOrRevertEtcrldf7,
}
type contextComponentTokensSLIDERSmConfig = {
  sm?: contextComponentTokensSLIDERSmSmConfig,
  md?: contextComponentTokensSLIDERSmSmConfig,
  lg?: contextComponentTokensSLIDERSmSmConfig,
  primary?: contextComponentTokensSLIDERSmPrimaryConfig,
  secondary?: contextComponentTokensSLIDERSmPrimaryConfig,
  borderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  thumbBorderRadius?: mozInitialOrInheritOrInitialOrRevertEtcp2j1f,
  thumbBoxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  thumbHoverBoxShadow?: mozInitialOrInheritOrInitialOrRevertEtcz3a4s,
  disabledOpacity?: string,  // ⚪ loose — was `Globals | { readonly [x: number]: string; toString?: {}; charAt?: {}; charCodeAt?: {}; concat?: {}; indexOf?: `
  label?: contextComponentTokensSLIDERSmLabelConfig,
}
type contextComponentTokensSLIDERConfig = {
  sm?: contextComponentTokensSLIDERSmConfig,
  lg?: contextComponentTokensSLIDERSmConfig,
}
type contextComponentTokensSELECTSmTriggerLabelConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  fontWeight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  fontSize?: mozInitialOrInheritOrInitialOrRevertEtcly7v7,
}
type contextComponentTokensSELECTSmTriggerSelectedValueFontSizeConfig = {
  sm?: string,
  md?: string,
  lg?: string,
}
type contextComponentTokensSELECTSmTriggerSelectedValueFontConfig = {
  weight?: string,  // ⚪ loose — was `Globals | "bold" | "normal" | "bolder" | "lighter" | { readonly [x: number]: string; toString?: {}; charAt?: {`
  size?: contextComponentTokensSELECTSmTriggerSelectedValueFontSizeConfig,
}
type contextComponentTokensSELECTSmTriggerSelectedValueConfig = {
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  font?: contextComponentTokensSELECTSmTriggerSelectedValueFontConfig,
  padding?: contextComponentTokensCALENDARSmTriggerQuickSelectorPaddingConfig,
}
type contextComponentTokensSELECTSmTriggerConfig = {
  container?: contextComponentTokensRADIOSmGroupConfig,
  label?: contextComponentTokensSELECTSmTriggerLabelConfig,
  selectedValue?: contextComponentTokensSELECTSmTriggerSelectedValueConfig,
}
type contextComponentTokensSELECTSmContainerConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  border?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
}
type contextComponentTokensSELECTSmItemConfig = {
  selectedBackgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hoverBackgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  highlightedBackgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  selectedColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  subLabelColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  checkmarkColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensSELECTSmSubTriggerConfig = {
  hoverBackgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  highlightedBackgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  subLabelColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensSELECTSmSubContentConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  color?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensSELECTSmTriggerColorsConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hoverBackgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  focusBackgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  outlineBorder?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  outlineBorderFocus?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  caretColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  chevronIconColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  placeholderColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensSELECTSmClearButtonConfig = {
  backgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hoverBackgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  focusBackgroundColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  outlineBorder?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  outlineBorderFocus?: mozInitialOrInheritOrInitialOrRevertEtc1yz1q,
  iconColor?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensSELECTSmLabelColorsConfig = {
  subLabel?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  hintText?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  required?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
  helpIcon?: mozInitialOrInheritOrInitialOrRevertEtcgjquu,
}
type contextComponentTokensSELECTSmConfig = {
  trigger?: contextComponentTokensSELECTSmTriggerConfig,
  container?: contextComponentTokensSELECTSmContainerConfig,
  item?: contextComponentTokensSELECTSmItemConfig,
  groupLabel?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
  subTrigger?: contextComponentTokensSELECTSmSubTriggerConfig,
  subContent?: contextComponentTokensSELECTSmSubContentConfig,
  separator?: contextComponentTokensMODALSmOverlayConfig,
  triggerColors?: contextComponentTokensSELECTSmTriggerColorsConfig,
  clearButton?: contextComponentTokensSELECTSmClearButtonConfig,
  labelColors?: contextComponentTokensSELECTSmLabelColorsConfig,
  selectionTag?: contextComponentTokensSELECTSmSubContentConfig,
  selectedLabels?: contextComponentTokensSEARCHINPUTSmRequiredConfig,
}
type contextComponentTokensSELECTConfig = {
  sm?: contextComponentTokensSELECTSmConfig,
  lg?: contextComponentTokensSELECTSmConfig,
}
type contextComponentTokensConfig = {
  @as("TAGS") tags?: contextComponentTokensTAGSConfig,
  @as("SEARCH_INPUT") searchInput?: contextComponentTokensSEARCHINPUTConfig,
  @as("TEXT_AREA") textArea?: contextComponentTokensTEXTAREAConfig,
  @as("TEXT_AREA_V2") textAreaV2?: contextComponentTokensTEXTAREAV2Config,
  @as("RADIO") radio?: contextComponentTokensRADIOConfig,
  @as("SWITCH") switch_?: contextComponentTokensSWITCHConfig,
  @as("TEXT_INPUT") textInput?: contextComponentTokensTEXTINPUTConfig,
  @as("NUMBER_INPUT") numberInput?: contextComponentTokensNUMBERINPUTConfig,
  @as("ALERT") alert?: contextComponentTokensALERTConfig,
  @as("OTP_INPUT") otpInput?: contextComponentTokensOTPINPUTConfig,
  @as("TOOLTIP") tooltip?: contextComponentTokensTOOLTIPConfig,
  @as("UNIT_INPUT") unitInput?: contextComponentTokensUNITINPUTConfig,
  @as("MULTI_VALUE_INPUT") multiValueInput?: contextComponentTokensMULTIVALUEINPUTConfig,
  @as("DROPDOWN_INPUT") dropdownInput?: contextComponentTokensDROPDOWNINPUTConfig,
  @as("CHECKBOX") checkbox?: contextComponentTokensCHECKBOXConfig,
  @as("TABS") tabs?: contextComponentTokensTABSConfig,
  @as("BUTTON") button?: contextComponentTokensBUTTONConfig,
  @as("MODAL") modal?: contextComponentTokensMODALConfig,
  @as("BREADCRUMB") breadcrumb?: contextComponentTokensBREADCRUMBConfig,
  @as("POPOVER") popover?: contextComponentTokensPOPOVERConfig,
  @as("MENU") menu?: contextComponentTokensMENUConfig,
  @as("MENU_V2") menuV2?: contextComponentTokensMENUV2Config,
  @as("MULTI_SELECT") multiSelect?: contextComponentTokensMULTISELECTConfig,
  @as("SINGLE_SELECT") singleSelect?: contextComponentTokensSINGLESELECTConfig,
  @as("TABLE") table?: contextComponentTokensTABLEConfig,
  @as("CALENDAR") calendar?: contextComponentTokensCALENDARConfig,
  @as("TIME_PICKER") timePicker?: contextComponentTokensTIMEPICKERConfig,
  @as("ACCORDION") accordion?: contextComponentTokensACCORDIONConfig,
  @as("STAT_CARD") statCard?: contextComponentTokensSTATCARDConfig,
  @as("PROGRESS_BAR") progressBar?: contextComponentTokensPROGRESSBARConfig,
  @as("DRAWER") drawer?: contextComponentTokensDRAWERConfig,
  @as("CHARTS") charts?: contextComponentTokensCHARTSConfig,
  @as("SNACKBAR") snackbar?: contextComponentTokensSNACKBARConfig,
  @as("STEPPER") stepper?: contextComponentTokensSTEPPERConfig,
  @as("KEYVALUEPAIR") keyvaluepair?: contextComponentTokensKEYVALUEPAIRConfig,
  @as("CARD") card?: contextComponentTokensCARDConfig,
  @as("CARDV2") cardv2?: contextComponentTokensCARDV2Config,
  @as("SKELETON") skeleton?: contextComponentTokensSKELETONConfig,
  @as("SPINNER") spinner?: contextComponentTokensSPINNERConfig,
  @as("EMPTY_STATE") emptyState?: contextComponentTokensEMPTYSTATEConfig,
  @as("TOPBAR") topbar?: contextComponentTokensTOPBARConfig,
  @as("TOPBARV2") topbarv2?: contextComponentTokensTOPBARV2Config,
  @as("AVATAR") avatar?: contextComponentTokensAVATARConfig,
  @as("AVATAR_GROUP") avatarGroup?: contextComponentTokensAVATARGROUPConfig,
  @as("SIDEBAR") sidebar?: contextComponentTokensSIDEBARConfig,
  @as("DIRECTORY") directory?: contextComponentTokensDIRECTORYConfig,
  @as("MOBILE_NAVIGATION") mobileNavigation?: contextComponentTokensMOBILENAVIGATIONConfig,
  @as("MOBILE_NAVIGATION_V2") mobileNavigationV2?: contextComponentTokensMOBILENAVIGATIONV2Config,
  @as("UPLOAD") upload?: contextComponentTokensUPLOADConfig,
  @as("CODE_BLOCK") codeBlock?: contextComponentTokensCODEBLOCKConfig,
  @as("BUTTON_GROUP") buttonGroup?: contextComponentTokensBUTTONGROUPConfig,
  @as("CHAT_INPUT") chatInput?: contextComponentTokensCHATINPUTConfig,
  @as("CHAT_INPUTV2") chatInputv2?: contextComponentTokensCHATINPUTV2Config,
  @as("TIMELINE") timeline?: contextComponentTokensTIMELINEConfig,
  @as("BUTTONV2") buttonv2?: contextComponentTokensBUTTONV2Config,
  @as("TAGV2") tagv2?: contextComponentTokensTAGV2Config,
  @as("ALERTV2") alertv2?: contextComponentTokensALERTV2Config,
  @as("ACCORDIONV2") accordionv2?: contextComponentTokensACCORDIONV2Config,
  @as("SNACKBARV2") snackbarv2?: contextComponentTokensSNACKBARV2Config,
  @as("SWITCHV2") switchv2?: contextComponentTokensSWITCHV2Config,
  @as("SINGLE_SELECT_V2") singleSelectV2?: contextComponentTokensSINGLESELECTV2Config,
  @as("MULTI_SELECT_V2") multiSelectV2?: contextComponentTokensMULTISELECTV2Config,
  @as("AVATARV2") avatarv2?: contextComponentTokensAVATARV2Config,
  @as("TEXT_INPUTV2") textInputv2?: contextComponentTokensTEXTINPUTV2Config,
  @as("CHARTSV2") chartsv2?: contextComponentTokensCHARTSV2Config,
  @as("CHECKBOXV2") checkboxv2?: contextComponentTokensCHECKBOXV2Config,
  @as("KEYVALUEPAIRV2") keyvaluepairv2?: contextComponentTokensKEYVALUEPAIRConfig,
  @as("STATCARDV2") statcardv2?: contextComponentTokensSTATCARDV2Config,
  @as("TOOLTIPV2") tooltipv2?: contextComponentTokensTOOLTIPV2Config,
  @as("RADIOV2") radiov2?: contextComponentTokensRADIOV2Config,
  @as("POPOVERV2") popoverv2?: contextComponentTokensPOPOVERV2Config,
  @as("SIDEBARV2") sidebarv2?: contextComponentTokensSIDEBARV2Config,
  @as("TABSV2") tabsv2?: contextComponentTokensTABSV2Config,
  @as("BREADCRUMBV2") breadcrumbv2?: contextComponentTokensBREADCRUMBV2Config,
  @as("CODEEDITORV2") codeeditorv2?: contextComponentTokensCODEEDITORV2Config,
  @as("PROGRESS_BARV2") progressBarv2?: contextComponentTokensPROGRESSBARV2Config,
  @as("MULTI_VALUE_INPUT_V2") multiValueInputV2?: contextComponentTokensMULTIVALUEINPUTV2Config,
  @as("NUMBER_INPUT_V2") numberInputV2?: contextComponentTokensNUMBERINPUTV2Config,
  @as("OTP_INPUTV2") otpInputv2?: contextComponentTokensOTPINPUTV2Config,
  @as("BADGE") badge?: contextComponentTokensBADGEConfig,
  @as("SEARCH_INPUT_V2") searchInputV2?: contextComponentTokensSEARCHINPUTV2Config,
  @as("CHAT_INPUTV2_MOBILE") chatInputv2Mobile?: contextComponentTokensCHATINPUTV2MOBILEConfig,
  @as("STEPPERV2") stepperv2?: contextComponentTokensSTEPPERV2Config,
  @as("UPLOADV2") uploadv2?: contextComponentTokensUPLOADV2Config,
  @as("MODALV2") modalv2?: contextComponentTokensMODALV2Config,
  @as("SLIDER") slider?: contextComponentTokensSLIDERConfig,
  @as("SELECT") select?: contextComponentTokensSELECTConfig,
}
type inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig = {
  sm: string,
  md: string,
  lg: string,
}
type inputsV2TextAreaV2TokensTypeInputContainerBorderConfig = {
  default: string,
  hover: string,
  focus: string,
  error: string,
  disabled: string,
}
type inputsV2InputLabelsV2TokensLabelConfig = {
  fontSize: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  fontWeight: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  lineHeight: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  color: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
}
type inputsV2InputLabelsV2TokensRequiredConfig = {
  color: string,
}
type inputsV2InputLabelsV2TokensHelpIconConfig = {
  width: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  color: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
}
type inputLabelsV2Tokens = {
  label: inputsV2InputLabelsV2TokensLabelConfig,
  subLabel: inputsV2InputLabelsV2TokensLabelConfig,
  required: inputsV2InputLabelsV2TokensRequiredConfig,
  helpIcon: inputsV2InputLabelsV2TokensHelpIconConfig,
}
type inputsV2TextAreaV2TokensTypeInputContainerPlaceholderConfig = {
  transition: string,
  color: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
  fontSize: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  fontWeight: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  lineHeight: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
}
type inputsV2TextAreaV2TokensTypeInputContainerPaddingConfig = {
  top: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  right: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  bottom: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  left: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
}
type inputsV2TextAreaV2TokensTypeInputContainerConfig = {
  gap: string,
  placeholder: inputsV2TextAreaV2TokensTypeInputContainerPlaceholderConfig,
  lineHeight: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  fontSize: string,
  fontWeight: string,
  padding: inputsV2TextAreaV2TokensTypeInputContainerPaddingConfig,
  borderRadius: string,
  boxShadow: string,
  border: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
  color: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
  backgroundColor: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
}
type inputsV2InputFooterV2TokensErrorMessageConfig = {
  fontSize: string,  // ⚪ loose — was `{ sm: FontSize<number | (string & {})>; md: FontSize<number | (string & {})>; lg: FontSize<number | (string & `
  fontWeight: string,  // ⚪ loose — was `{ sm: FontWeight; md: FontWeight; lg: FontWeight; }`
  lineHeight: string,  // ⚪ loose — was `{ sm: LineHeight<number | (string & {})>; md: LineHeight<number | (string & {})>; lg: LineHeight<number | (str`
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
type menuMenuTokensTypePaddingConfig = {
  x: string,
  y: string,
}
type menuMenuTokensTypeItemBackgroundColorConfig = {
  default: string,  // ⚪ loose — was `{ enabled: MenuItemStateTokens<BackgroundColor>; disabled: MenuItemStateTokens<BackgroundColor>; }`
  action: string,  // ⚪ loose — was `{ primary: { enabled: MenuItemStateTokens<BackgroundColor>; disabled: MenuItemStateTokens<BackgroundColor>; };`
}
type menuMenuTokensTypeItemCheckmarkConfig = {
  position?: contextComponentTokensMENUSmItemCheckmarkPosition,
  width?: string,
  color?: string,
}
type menuMenuTokensTypeItemOptionsLabelConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
  padding: string,  // ⚪ loose — was `{ x: Padding<number | (string & {})>; y: Padding<number | (string & {})>; }`
  margin: string,  // ⚪ loose — was `{ x: Margin<number | (string & {})>; y: Margin<number | (string & {})>; }`
}
type menuMenuTokensTypeItemOptionConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,  // ⚪ loose — was `{ default: { enabled: MenuItemStateTokens<Color>; disabled: MenuItemStateTokens<Color>; }; action: { primary: `
}
type menuMenuTokensTypeItemSeperatorConfig = {
  color: string,
  height: string,
  margin: string,  // ⚪ loose — was `{ x: Margin<number | (string & {})>; y: Margin<number | (string & {})>; }`
}
type menuMenuTokensTypeItemConfig = {
  padding: menuMenuTokensTypePaddingConfig,
  margin: menuMenuTokensTypePaddingConfig,
  borderRadius: string,
  backgroundColor: menuMenuTokensTypeItemBackgroundColorConfig,
  gap: string,
  checkmark?: menuMenuTokensTypeItemCheckmarkConfig,
  optionsLabel: menuMenuTokensTypeItemOptionsLabelConfig,
  option: menuMenuTokensTypeItemOptionConfig,
  description: menuMenuTokensTypeItemOptionConfig,
  seperator: menuMenuTokensTypeItemSeperatorConfig,
}
type menuTokensType = {
  boxShadow: string,
  backgroundColor: string,
  padding: menuMenuTokensTypePaddingConfig,
  border: string,
  borderRadius: string,
  item: menuMenuTokensTypeItemConfig,
}
type responsiveMenuTokensType = {
  sm: menuTokensType,
  lg: menuTokensType,
}
type menuV2MenuV2TokensTypeSearchIconConfig = {
  width: string,
}
type menuV2MenuV2TokensTypeGroupLabelConfig = {
  fontSize: string,
  fontWeight: string,
  lineHeight: string,
  color: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  marginTop: string,
  marginRight: string,
  marginBottom: string,
  marginLeft: string,
}
type menuV2MenuV2TokensTypeGroupItemConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  marginTop: string,
  marginRight: string,
  marginBottom: string,
  marginLeft: string,
  gap: string,
  borderRadius: string,
  backgroundColor: string,  // ⚪ loose — was `MenuV2VariantToken<StateToken<BackgroundColor>>`
  text: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; lineHeight: LineHeight<number | (string `
}
type menuV2MenuV2TokensTypeGroupConfig = {
  label: menuV2MenuV2TokensTypeGroupLabelConfig,
  item: menuV2MenuV2TokensTypeGroupItemConfig,
}
type menuV2MenuV2TokensTypeSeparatorConfig = {
  color: string,
  height: string,
  marginTop: string,
  marginRight: string,
  marginBottom: string,
  marginLeft: string,
}
type menuV2TokensType = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  boxShadow: string,
  zIndex: string,
  minWidth: string,
  maxWidth: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  searchIcon: menuV2MenuV2TokensTypeSearchIconConfig,
  group: menuV2MenuV2TokensTypeGroupConfig,
  separator: menuV2MenuV2TokensTypeSeparatorConfig,
}
type responsiveMenuV2TokensType = {
  sm: menuV2TokensType,
  lg: menuV2TokensType,
}
type inputsV2ChatInputV2TokensTypeContainerAttachedFilesContainerConfig = {
  gap: string,
  overflowMenu: string,  // ⚪ loose — was `{ gap: Gap<number | (string & {})>; backgroundColor: { default: BackgroundColor; hover: BackgroundColor; focus`
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
  text: string,  // ⚪ loose — was `{ color: Color; fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; }`
}
type inputsV2ChatInputV2TokensTypeContainerInputContainerConfig = {
  outline: string,  // ⚪ loose — was `{ default: Outline<number | (string & {})>; hover: Outline<number | (string & {})>; focus: Outline<number | (s`
  boxShadow: string,  // ⚪ loose — was `{ default: BoxShadow; hover: BoxShadow; focus: BoxShadow; error: BoxShadow; disabled: BoxShadow; }`
  gap: string,
  borderRadius: string,
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  border: string,
  backgroundColor: string,
  input: string,  // ⚪ loose — was `{ color: Color; placeholder: Color; paddingTop: PaddingTop<number | (string & {})>; paddingRight: PaddingRight`
  actionContainer: string,  // ⚪ loose — was `{ paddingRight: PaddingRight<number | (string & {})>; paddingBottom: PaddingBottom<number | (string & {})>; pa`
  topQueriesContainer: string,  // ⚪ loose — was `{ marginRight: MarginRight<number | (string & {})>; marginLeft: MarginLeft<number | (string & {})>; paddingTop`
}
type inputsV2ChatInputV2TokensTypeContainerConfig = {
  backgroundColor: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
  borderRadius: string,
  border: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
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
  disabled: string,
  active: string,
  default: string,
  hover: string,
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
type variantTokenV1p7v1 = {
  container: string,
  @as("no-container") noContainer: string,
}
type sizeTokenSingleSelectV2 = {
  sm: variantTokenV1p7v1,
  md: variantTokenV1p7v1,
  lg: variantTokenV1p7v1,
}
type variantTokenV5bktf = {
  container: string,  // ⚪ loose — was `TriggerStateToken<BackgroundColor>`
  @as("no-container") noContainer: string,  // ⚪ loose — was `TriggerStateToken<BackgroundColor>`
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
  height: sizeTokenSingleSelectV2,
  padding: sizeTokenSingleSelectV2,
  borderRadius: sizeTokenSingleSelectV2,
  boxShadow: variantTokenV1p7v1,
  backgroundColor: variantTokenV5bktf,
  outline: variantTokenV5bktf,
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
type singleSelectV2SingleSelectV2TokensTypeMenuItemConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  margin: string,
  borderRadius: string,
  gap: string,
  backgroundColor: string,  // ⚪ loose — was `StateToken<BackgroundColor>`
  groupLabelText: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: StateToken<Color>; }`
  option: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: StateToken<Color>; }`
  description: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: StateToken<Color>; }`
  separator: string,  // ⚪ loose — was `{ color: Color; height: Height<number | (string & {})>; margin: Margin<number | (string & {})>; }`
}
type singleSelectV2SingleSelectV2TokensTypeMenuSubmenuConfig = {
  trigger: string,  // ⚪ loose — was `{ paddingTop: PaddingTop<number | (string & {})>; paddingRight: PaddingRight<number | (string & {})>; paddingB`
  content: string,  // ⚪ loose — was `{ backgroundColor: BackgroundColor; border: Border<number | (string & {})>; borderRadius: BorderRadius<number `
  optionText: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: Color; }`
  iconColor: string,
}
type singleSelectV2SingleSelectV2TokensTypeMenuFooterConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  backgroundColor: string,
  borderTop: string,
}
type singleSelectV2SingleSelectV2TokensTypeMenuConfig = {
  content: singleSelectV2SingleSelectV2TokensTypeMenuContentConfig,
  padding: sizeTokenSingleSelectV2,
  groupLabel: singleSelectV2SingleSelectV2TokensTypeMenuGroupLabelConfig,
  item: singleSelectV2SingleSelectV2TokensTypeMenuItemConfig,
  submenu: singleSelectV2SingleSelectV2TokensTypeMenuSubmenuConfig,
  footer: singleSelectV2SingleSelectV2TokensTypeMenuFooterConfig,
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
  disabled: string,
  active: string,
  default: string,
  hover: string,
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
type variantTokenV1p7v12 = {
  container: string,
  @as("no-container") noContainer: string,
}
type sizeTokenMultiSelectV2 = {
  sm: variantTokenV1p7v12,
  md: variantTokenV1p7v12,
  lg: variantTokenV1p7v12,
}
type variantTokenV5bktf2 = {
  container: string,  // ⚪ loose — was `TriggerStateToken<BackgroundColor>`
  @as("no-container") noContainer: string,  // ⚪ loose — was `TriggerStateToken<BackgroundColor>`
}
type multiSelectV2MultiSelectV2TokensTypeTriggerSlotConfig = {
  gap: string,
  width: string,
}
type contextMultiSelectV2TokensTypeTriggerSelectionTagConfig = {
  container: string,  // ⚪ loose — was `SelectionTagTypeToken<{ color: Color; backgroundColor: BackgroundColor; fontWeight: FontWeight; paddingTop: Pa`
  @as("no-container") noContainer: string,  // ⚪ loose — was `SelectionTagTypeToken<{ color: Color; backgroundColor: BackgroundColor; fontWeight: FontWeight; paddingTop: Pa`
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
  backgroundColor: string,  // ⚪ loose — was `TriggerStateToken<BackgroundColor>`
  outline: string,  // ⚪ loose — was `TriggerStateToken<Outline<number | (string & {})>>`
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
  height: sizeTokenMultiSelectV2,
  padding: sizeTokenMultiSelectV2,
  borderRadius: sizeTokenMultiSelectV2,
  boxShadow: variantTokenV1p7v12,
  backgroundColor: variantTokenV5bktf2,
  outline: variantTokenV5bktf2,
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
type multiSelectV2MultiSelectV2TokensTypeMenuItemConfig = {
  paddingTop: string,
  paddingRight: string,
  paddingBottom: string,
  paddingLeft: string,
  margin: string,
  borderRadius: string,
  gap: string,
  backgroundColor: string,  // ⚪ loose — was `StateToken<BackgroundColor>`
  optionsLabel: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: StateToken<Color>; paddingTop: Pa`
  option: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: StateToken<Color>; }`
  description: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: StateToken<Color>; }`
  seperator: string,  // ⚪ loose — was `{ color: Color; height: Height<number | (string & {})>; margin: Margin<number | (string & {})>; }`
}
type multiSelectV2MultiSelectV2TokensTypeMenuConfig = {
  backgroundColor: string,
  border: string,
  borderRadius: string,
  padding: sizeTokenMultiSelectV2,
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
  color: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
  fontSize: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  fontWeight: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  lineHeight: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
}
type inputsV2TextInputV2TokensTypeInputContainerConfig = {
  gap: string,
  placeholder: inputsV2TextInputV2TokensTypeInputContainerPlaceholderConfig,
  inputText: inputsV2InputLabelsV2TokensLabelConfig,
  borderRadius: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  boxShadow: string,
  padding: inputsV2TextAreaV2TokensTypeInputContainerPaddingConfig,
  border: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
  backgroundColor: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
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
type codeEditorV2CodeEditorV2TokensBodyGutterConfig = {
  width: string,
  color: string,
  backgroundColor: string,  // ⚪ loose — was `{ added: BackgroundColor; removed: BackgroundColor; unchanged: BackgroundColor; }`
  borderLeft: string,  // ⚪ loose — was `{ added: BorderLeft<number | (string & {})>; removed: BorderLeft<number | (string & {})>; unchanged: BorderLef`
  borderColor: string,  // ⚪ loose — was `{ added: Color; removed: Color; unchanged: Color; }`
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
type codeEditorV2BackupColorBodyGutterBackgroundColorConfig = {
  added: string,
  removed: string,
  unchanged: string,
}
type codeEditorV2CodeEditorV2TokensBodyHighlightedLineConfig = {
  backgroundColor: codeEditorV2BackupColorBodyGutterBackgroundColorConfig,
}
type codeEditorV2CodeEditorV2TokensBodySyntaxConfig = {
  keyword: string,  // ⚪ loose — was `{ color: Color; }`
  function: string,  // ⚪ loose — was `{ color: Color; }`
  string: string,  // ⚪ loose — was `{ color: Color; }`
  number: string,  // ⚪ loose — was `{ color: Color; }`
  operator: string,  // ⚪ loose — was `{ color: Color; }`
  variable: string,  // ⚪ loose — was `{ color: Color; }`
  comment: string,  // ⚪ loose — was `{ color: Color; }`
  text: string,  // ⚪ loose — was `{ color: Color; }`
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
  theme: contextComponentTokensCODEEDITORV2SmTheme,
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
  fontSize: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  fontWeight: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  gap: string,
  borderRadius?: string,
  boxShadow: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
  paddingTop: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  paddingRight: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  paddingBottom: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  paddingLeft: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  border: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
  color: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
  placeholderColor: inputsV2MultiValueInputV2TokensTypeInputContainerPlaceholderColorConfig,
  backgroundColor: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
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
type inputsV2NumberInputV2TokensTypeInputContainerStepperButtonConfig = {
  width: string,  // ⚪ loose — was `{ sm: Width<number | (string & {})>; md: Width<number | (string & {})>; lg: Width<number | (string & {})>; }`
  backgroundColor: string,  // ⚪ loose — was `{ default: BackgroundColor; hover: BackgroundColor; focus: BackgroundColor; error: BackgroundColor; disabled: `
  icon: string,  // ⚪ loose — was `{ color: { default: Color; hover: Color; focus: Color; error: Color; disabled: Color; }; width: { sm: Width<nu`
}
type inputsV2NumberInputV2TokensTypeInputContainerSlotConfig = {
  left: string,  // ⚪ loose — was `{ width: { sm: Width<number | (string & {})>; md: Width<number | (string & {})>; lg: Width<number | (string & `
  right: string,  // ⚪ loose — was `{ width: { sm: Width<number | (string & {})>; md: Width<number | (string & {})>; lg: Width<number | (string & `
}
type inputsV2NumberInputV2TokensTypeInputContainerConfig = {
  placeholder: inputsV2TextInputV2TokensTypeInputContainerPlaceholderConfig,
  fontSize: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  fontWeight: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  color: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
  borderRadius: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  boxShadow: string,
  paddingTop: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  paddingRight: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  paddingBottom: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  paddingLeft: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  border: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
  lineHeight: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  backgroundColor: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
  stepperButton: inputsV2NumberInputV2TokensTypeInputContainerStepperButtonConfig,
  slot: inputsV2NumberInputV2TokensTypeInputContainerSlotConfig,
}
type inputsV2NumberInputV2TokensTypeUnitConfig = {
  fontSize: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  fontWeight: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  paddingTop: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  paddingRight: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  paddingBottom: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  paddingLeft: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  borderRadius: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  border: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
  color: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
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
  color: string,  // ⚪ loose — was `{ default: Color; hover: Color; focus: Color; error: Color; disabled: Color; }`
  borderRadius: string,
  border: string,  // ⚪ loose — was `{ default: Border<number | (string & {})>; hover: Border<number | (string & {})>; focus: Border<number | (stri`
  backgroundColor: string,  // ⚪ loose — was `{ default: BackgroundColor; hover: BackgroundColor; focus: BackgroundColor; error: BackgroundColor; disabled: `
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
  color: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
}
type inputsV2SearchInputV2TokensTypeErrorMessageConfig = {
  fontSize: string,
  fontWeight: string,
  color: string,
}
type inputsV2SearchInputV2TokensTypeInputContainerSlotConfig = {
  left: string,  // ⚪ loose — was `{ top: Top<number | (string & {})>; left: Left<number | (string & {})>; bottom: Bottom<number | (string & {})>`
  right: string,  // ⚪ loose — was `{ top: Top<number | (string & {})>; right: Right<number | (string & {})>; bottom: Bottom<number | (string & {}`
  transition: string,
  transform: string,
  color: string,  // ⚪ loose — was `{ default: Color; hover: Color; focus: Color; error: Color; disabled: Color; }`
}
type inputsV2SearchInputV2TokensTypeInputContainerConfig = {
  paddingTop: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  paddingRight: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  paddingBottom: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  paddingLeft: inputsV2TextAreaV2TokensTypeInputContainerLineHeightConfig,
  borderRadius: string,
  borderBottom: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
  outline: string,
  boxShadow: string,
  color: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
  placeholderColor: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
  fontSize: string,
  fontWeight: string,
  slot: inputsV2SearchInputV2TokensTypeInputContainerSlotConfig,
}
type inputsV2SearchInputV2TokensTypeIconConfig = {
  color: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
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
  backgroundColor: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
  color: string,
}
type contextChatInputV2MobileTokensTypeInputContainerConfig = {
  border: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
  borderRadius: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
  boxShadow: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
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
  backgroundColor: inputsV2TextAreaV2TokensTypeInputContainerBorderConfig,
  color: string,
}
type chatInputV2MobileTokensType = {
  gap: string,
  attachmentButtonDimensions: inputsV2ChatInputV2MobileTokensTypeAttachmentButtonDimensionsConfig,
  inputContainer: contextChatInputV2MobileTokensTypeInputContainerConfig,
  secondaryAction: inputsV2ChatInputV2MobileTokensTypeSecondaryActionConfig,
}
type inputsV2UploadV2TokensTypeUploadContainerBorderConfig = {
  idle: string,
  uploading: string,
  success: string,
  error: string,
  disabled: string,
  drag_enter: string,
  drag_leave: string,
  drag_over: string,
  drop: string,
}
type inputsV2UploadV2TokensTypeUploadContainerHeaderConfig = {
  gap: string,
  title: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: Color; }`
  description: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: Color; }`
  errorText: string,  // ⚪ loose — was `{ fontSize: FontSize<number | (string & {})>; fontWeight: FontWeight; color: Color; }`
}
type inputsV2UploadV2TokensTypeUploadContainerFileTagConfig = {
  maxWidth: string,
  gap: string,
}
type inputsV2UploadV2TokensTypeUploadContainerConfig = {
  gap: string,
  paddingTop: string,
  paddingBottom: string,
  paddingLeft: string,
  paddingRight: string,
  borderRadius: string,
  border: inputsV2UploadV2TokensTypeUploadContainerBorderConfig,
  backgroundColor: inputsV2UploadV2TokensTypeUploadContainerBorderConfig,
  header: inputsV2UploadV2TokensTypeUploadContainerHeaderConfig,
  fileTag: inputsV2UploadV2TokensTypeUploadContainerFileTagConfig,
}
type uploadV2TokensType = {
  gap: string,
  topContainer: inputLabelsV2Tokens,
  uploadContainer: inputsV2UploadV2TokensTypeUploadContainerConfig,
  bottomContainer: inputFooterV2Tokens,
}
type responsiveUploadV2Tokens = {
  sm: uploadV2TokensType,
  lg: uploadV2TokensType,
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
  @as("MENU") menu: responsiveMenuTokensType,
  @as("MENU_V2") menuV2: responsiveMenuV2TokensType,
  @as("MULTI_SELECT") multiSelect: MultiSelectTypes.responsiveMultiSelectTokens,
  @as("SINGLE_SELECT") singleSelect: SingleSelectTypes.responsiveSingleSelectTokens,
  @as("TABLE") table: DataTableTypes.responsiveTableTokens,
  @as("CALENDAR") calendar: DateRangePickerTypes.responsiveCalendarTokens,
  @as("TIME_PICKER") timePicker: TimePickerTypes.responsiveTimePickerTokens,
  @as("ACCORDION") accordion: AccordionTypes.responsiveAccordionTokens,
  @as("STAT_CARD") statCard: StatCardTypes.responsiveStatCardTokens,
  @as("PROGRESS_BAR") progressBar: ProgressBarTypes.responsiveProgressBarTokens,
  @as("DRAWER") drawer: DrawerTypes.responsiveDrawerTokens,
  @as("CHARTS") charts: ChartsSharedTypes.responsiveChartTokens,
  @as("SNACKBAR") snackbar: SnackbarTypes.responsiveSnackbarTokens,
  @as("STEPPER") stepper: StepperTypes.responsiveStepperTokens,
  @as("KEYVALUEPAIR") keyvaluepair: KeyValuePairTypes.responsiveKeyValuePairTokens,
  @as("CARD") card: CardTypes.responsiveCardTokens,
  @as("CARDV2") cardv2: CardV2Types.responsiveCardV2Tokens,
  @as("SKELETON") skeleton: SkeletonTypes.responsiveSkeletonTokens,
  @as("SPINNER") spinner: SpinnerTypes.responsiveSpinnerTokens,
  @as("EMPTY_STATE") emptyState: EmptyStateTypes.responsiveEmptyStateTokens,
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
  @as("BUTTON_GROUP") buttonGroup: ButtonGroupTypes.responsiveButtonGroupTokens,
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
  @as("UPLOADV2") uploadv2: responsiveUploadV2Tokens,
  @as("MODALV2") modalv2: ModalV2Types.responsiveModalV2Tokens,
  @as("SLIDER") slider: SliderTypes.responsiveSliderTokens,
  @as("SELECT") select: SelectTypes.responsiveSelectTokens,
}
type themeContextType = {
  foundationTokens: TokensTypes.foundationTokenType,
  componentTokens: contextThemeContextTypeComponentTokensConfig,
  breakpoints: BreakpointsTypes.breakpointType,
  theme: string,
}
type shadowRootContextType = {
  shadowRoot: Nullable.t<Dom.shadowRoot>,
  target: Nullable.t<Dom.element>,
}
type menuMenuItemTypeTooltipPropsConfig = {
  side?: TooltipTypes.tooltipSide,
  align?: TooltipTypes.tooltipAlign,
  size?: TooltipTypes.tooltipSize,
  showArrow?: bool,
  delayDuration?: float,
  offset?: float,
}
type rec menuItemType = {
  label: string,
  subLabel?: string,
  slot1?: React.element,
  slot2?: React.element,
  slot3?: React.element,
  slot4?: React.element,
  variant?: menuItemVariant,
  actionType?: menuItemActionType,
  disabled?: bool,
  selected?: bool,
  onClick?: unit => unit,
  subMenu?: array<menuItemType>,
  enableSubMenuSearch?: bool,
  subMenuSearchPlaceholder?: string,
  subMenuSearchSortFn?: (array<menuItemType>, string) => array<menuItemType>,
  onSubMenuSearchEnter?: (string, array<menuItemType>) => unit,
  tooltip?: React.element,
  tooltipProps?: menuMenuItemTypeTooltipPropsConfig,
  enableSubMenuVirtualScrolling?: bool,
  subMenuVirtualItemHeight?: float,
  subMenuVirtualOverscan?: float,
  subMenuVirtualScrollThreshold?: float,
}
type menuGroupType = {
  label?: string,
  items: array<menuItemType>,
  showSeparator?: bool,
  selectionStyle?: menuSelectionStyle,
  selectionMode?: menuSelectionMode,
}
@unboxed type menuItemTypeVirtualItemHeight = Num(float) | Fn((menuItemType, float) => float)
type menuSkeletonProps = {
  count?: int,
  show?: bool,
  variant?: SkeletonTypes.skeletonVariant,
}
type menuOverflowMenuPropsConfig = {
  trigger?: React.element,
  items?: array<menuGroupType>,
  maxHeight?: float,
  minHeight?: float,
  maxWidth?: float,
  minWidth?: float,
  enableSearch?: bool,
  searchPlaceholder?: string,
  searchSortFn?: (array<menuItemType>, string) => array<menuItemType>,
  onEnter?: (string, array<menuGroupType>) => unit,
  enableVirtualScrolling?: bool,
  virtualItemHeight?: menuItemTypeVirtualItemHeight,
  virtualOverscan?: float,
  virtualScrollThreshold?: float,
  @as("open") open_?: bool,
  onOpenChange?: bool => unit,
  asModal?: bool,
  selectionStyle?: menuSelectionStyle,
  selectionMode?: menuSelectionMode,
  closeOnSelect?: bool,
  alignment?: menuAlignment,
  side?: menuSide,
  sideOffset?: float,
  alignOffset?: float,
  collisonBoundaryRef?: ChatInputTypes.ChatInputOverflowMenuPropsCollisonBoundaryRef.t,
  skeleton?: menuSkeletonProps,
}
type menuItemStateTokens<'a> = {
  disabled: 'a,
  active: 'a,
  default: 'a,
  hover: 'a,
  focus: 'a,
  focusVisible: 'a,
  selected?: 'a,
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
  searchText?: string,
  onSearchChange?: string => unit,
  isSearchLoading?: bool,
  emptyStateText?: string,
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
  menuFooter?: React.element,
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
  menuFooter?: React.element,
}
type embeddedSingleSelectOptions = {
  fieldLabel?: string,
  fieldDisabled: bool,
  singleSelectV2Size: SelectV2Types.selectV2Size,
  menuAlignment: SelectV2Types.selectV2Alignment,
  menuSideOffset: float,
  menuAlignOffset: float,
  defaultSingleSelectGroupPosition: ChartsSharedTypes.chartsSeriesOrganizationOptionsHangingSide,
}
type inputsV2FOCUSRINGSTYLESConfig = {
  boxShadow: string,
  backgroundColor: string,
}
type inputsV2GetInputStateErrorConfig = {
  show: bool,
}
type inputsV2GetVerticalInputPaddingV0Config = {
  isSmallScreenWithLargeSize: bool,
  inputFocusedOrWithValue: bool,
  hasLabel: bool,
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
type codeEditorV2Dimensions = {
  width?: string,
  maxWidth?: string,
  minWidth?: string,
  height?: string,
  maxHeight?: string,
  minHeight?: string,
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
type iRange = {
  startLineNumber: float,
  startColumn: float,
  endLineNumber: float,
  endColumn: float,
}
type iModelContentChange = {
  range: iRange,
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
type iPosition = {
  lineNumber: float,
  column: float,
}
type rec position = {
  lineNumber: float,
  column: float,
  @as("with") with_: (option<float>, option<float>) => position,
  delta: (option<float>, option<float>) => position,
  equals: iPosition => bool,
  isBefore: iPosition => bool,
  isBeforeOrEqual: iPosition => bool,
  clone: unit => position,
  toString: unit => string,
  toJSON: unit => iPosition,
}
type iCursorPositionChangedEvent = {
  position: position,
  secondaryPositions: array<position>,
  reason: cursorChangeReason,
  source: string,
}
type iSelection = {
  selectionStartLineNumber: float,
  selectionStartColumn: float,
  positionLineNumber: float,
  positionColumn: float,
}
type rec range = {
  startLineNumber: float,
  startColumn: float,
  endLineNumber: float,
  endColumn: float,
  isEmpty: unit => bool,
  containsPosition: iPosition => bool,
  containsRange: iRange => bool,
  strictContainsRange: iRange => bool,
  plusRange: iRange => range,
  intersectRanges: iRange => Nullable.t<range>,
  equalsRange: Nullable.t<iRange> => bool,
  getEndPosition: unit => position,
  getStartPosition: unit => position,
  toString: unit => string,
  setEndPosition: (float, float) => range,
  setStartPosition: (float, float) => range,
  collapseToStart: unit => range,
  collapseToEnd: unit => range,
  delta: float => range,
  isSingleLine: unit => bool,
  toJSON: unit => iRange,
}
type rec selection = {
  selectionStartLineNumber: float,
  selectionStartColumn: float,
  positionLineNumber: float,
  positionColumn: float,
  toString: unit => string,
  equalsSelection: iSelection => bool,
  getDirection: unit => CommonTypes.v0OrV1,
  setEndPosition: (float, float) => selection,
  getPosition: unit => position,
  getSelectionStart: unit => position,
  setStartPosition: (float, float) => selection,
  startLineNumber: float,
  startColumn: float,
  endLineNumber: float,
  endColumn: float,
  isEmpty: unit => bool,
  containsPosition: iPosition => bool,
  containsRange: iRange => bool,
  strictContainsRange: iRange => bool,
  plusRange: iRange => range,
  intersectRanges: iRange => Nullable.t<range>,
  equalsRange: Nullable.t<iRange> => bool,
  getEndPosition: unit => position,
  getStartPosition: unit => position,
  collapseToStart: unit => range,
  collapseToEnd: unit => range,
  delta: float => range,
  isSingleLine: unit => bool,
  toJSON: unit => iRange,
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
type uriComponents = {
  scheme: string,
  authority?: string,
  path?: string,
  query?: string,
  fragment?: string,
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
  toJSON: unit => uriComponents,
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
type iMouseTargetMarginData = {
  isAfterLines: bool,
  glyphMarginLeft: float,
  glyphMarginWidth: float,
  glyphMarginLane?: CommonTypes.v1OrV2OrV3,
  lineNumbersWidth: float,
  offsetX: float,
}
type iMouseTargetMargin = {
  @as("type") type_: CommonTypes.v2OrV3OrV4,
  position: position,
  range: range,
  detail: iMouseTargetMarginData,
  element: string,  // ⚪ loose — was `HTMLElement`
  mouseColumn: float,
}
type iMouseTargetViewZoneData = {
  viewZoneId: string,
  positionBefore: Nullable.t<position>,
  positionAfter: Nullable.t<position>,
  position: position,
  afterLineNumber: float,
}
type iMouseTargetViewZone = {
  @as("type") type_: CommonTypes.v5OrV8,
  position: position,
  range: range,
  detail: iMouseTargetViewZoneData,
  element: string,  // ⚪ loose — was `HTMLElement`
  mouseColumn: float,
}
type iMouseTargetContentTextData = {
  mightBeForeignElement: bool,
}
type iMouseTargetContentText = {
  @as("type") type_: float,
  position: position,
  range: range,
  detail: iMouseTargetContentTextData,
  element: string,  // ⚪ loose — was `HTMLElement`
  mouseColumn: float,
}
type iMouseTargetContentEmptyData = {
  isAfterLines: bool,
  horizontalDistanceToText?: float,
}
type iMouseTargetContentEmpty = {
  @as("type") type_: float,
  position: position,
  range: range,
  detail: iMouseTargetContentEmptyData,
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
  outsidePosition: codeEditorV2IMouseTargetOutsideEditorOutsidePosition,
  outsideDistance: float,
  element: string,  // ⚪ loose — was `HTMLElement`
  position: Nullable.t<position>,
  mouseColumn: float,
  range: Nullable.t<range>,
}
module IMouseTarget = {
  type t
  external fromIMouseTargetUnknown: iMouseTargetUnknown => t = "%identity"
  external asIMouseTargetUnknown: t => (iMouseTargetUnknown) = "%identity"
  external fromIMouseTargetTextarea: iMouseTargetTextarea => t = "%identity"
  external asIMouseTargetTextarea: t => (iMouseTargetTextarea) = "%identity"
  external fromIMouseTargetMargin: iMouseTargetMargin => t = "%identity"
  external asIMouseTargetMargin: t => (iMouseTargetMargin) = "%identity"
  external fromIMouseTargetViewZone: iMouseTargetViewZone => t = "%identity"
  external asIMouseTargetViewZone: t => (iMouseTargetViewZone) = "%identity"
  external fromIMouseTargetContentText: iMouseTargetContentText => t = "%identity"
  external asIMouseTargetContentText: t => (iMouseTargetContentText) = "%identity"
  external fromIMouseTargetContentEmpty: iMouseTargetContentEmpty => t = "%identity"
  external asIMouseTargetContentEmpty: t => (iMouseTargetContentEmpty) = "%identity"
  external fromIMouseTargetContentWidget: iMouseTargetContentWidget => t = "%identity"
  external asIMouseTargetContentWidget: t => (iMouseTargetContentWidget) = "%identity"
  external fromIMouseTargetOverlayWidget: iMouseTargetContentWidget => t = "%identity"
  external asIMouseTargetOverlayWidget: t => (iMouseTargetContentWidget) = "%identity"
  external fromIMouseTargetScrollbar: iMouseTargetScrollbar => t = "%identity"
  external asIMouseTargetScrollbar: t => (iMouseTargetScrollbar) = "%identity"
  external fromIMouseTargetOverviewRuler: iMouseTargetUnknown => t = "%identity"
  external asIMouseTargetOverviewRuler: t => (iMouseTargetUnknown) = "%identity"
  external fromIMouseTargetOutsideEditor: iMouseTargetOutsideEditor => t = "%identity"
  external asIMouseTargetOutsideEditor: t => (iMouseTargetOutsideEditor) = "%identity"
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
  _textModelResolvedOptionsBrand: unit,
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
@unboxed type stringOrITextSnapshot = Str(string) | ITextSnapshot(iTextSnapshot)
type findMatch = {
  _findMatchBrand: unit,
  range: range,
  matches: array<string>,
}
@unboxed type iRangeOrIRangeArray = IRange(iRange) | IRangeArr(array<iRange>)
module FindMatches = {
  type t
  external asSearchString: t => ((string, bool, bool, bool, Nullable.t<string>, bool, option<float>) => array<findMatch>) = "%identity"
  external asSearchString2: t => ((string, iRangeOrIRangeArray, bool, bool, Nullable.t<string>, bool, option<float>) => array<findMatch>) = "%identity"
}
type iWordAtPosition = {
  word: string,
  startColumn: float,
  endColumn: float,
}
type markdownStringTrustedOptions = {
  enabledCommands: array<string>,
}
@unboxed type boolOrMarkdownStringTrustedOptions = Bool(bool) | MarkdownStringTrustedOptions(markdownStringTrustedOptions)
type iMarkdownString = {
  value: string,
  isTrusted?: boolOrMarkdownStringTrustedOptions,
  supportThemeIcons?: bool,
  supportHtml?: bool,
  baseUri?: uriComponents,
  uris?: Dict.t<uriComponents>,
}
@unboxed type iMarkdownStringOrIMarkdownStringArray = IMarkdownString(iMarkdownString) | IMarkdownStringArr(array<iMarkdownString>)
type themeColor = {
  id: string,
}
@unboxed type stringOrThemeColor = Str(string) | ThemeColor(themeColor)
type iModelDecorationOverviewRulerOptions = {
  position: CommonTypes.v1OrV2OrV4OrV7,
  color?: stringOrThemeColor,
  darkColor?: stringOrThemeColor,
}
type iModelDecorationMinimapOptions = {
  position: CommonTypes.v1OrV2,
  sectionHeaderStyle?: Nullable.t<CommonTypes.v1OrV2>,
  sectionHeaderText?: Nullable.t<string>,
  color?: stringOrThemeColor,
  darkColor?: stringOrThemeColor,
}
type iModelDecorationGlyphMarginOptions = {
  position: CommonTypes.v1OrV2OrV3,
  persistLane?: bool,
}
type injectedTextOptions = {
  content: string,
  inlineClassName?: Nullable.t<string>,
  inlineClassNameAffectsLetterSpacing?: bool,
  attachedData?: JSON.t,
  cursorStops?: Nullable.t<CommonTypes.v0OrV1OrV2OrV3>,
}
type iModelDecorationOptions = {
  stickiness?: CommonTypes.v0OrV1OrV2OrV3,
  className?: Nullable.t<string>,
  shouldFillLineOnLineBreak?: Nullable.t<bool>,
  blockClassName?: Nullable.t<string>,
  blockIsAfterEnd?: Nullable.t<bool>,
  blockDoesNotCollapse?: Nullable.t<bool>,
  blockPadding?: Nullable.t<array<float>>,
  glyphMarginHoverMessage?: Nullable.t<iMarkdownStringOrIMarkdownStringArray>,
  hoverMessage?: Nullable.t<iMarkdownStringOrIMarkdownStringArray>,
  lineNumberHoverMessage?: Nullable.t<iMarkdownStringOrIMarkdownStringArray>,
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
  textDirection?: Nullable.t<CommonTypes.v0OrV1>,
}
type iModelDeltaDecoration = {
  range: iRange,
  options: iModelDecorationOptions,
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
type iValidEditOperation = {
  range: range,
  text: string,
}
module ApplyEdits = {
  type t
  external asOperations: t => (array<iIdentifiedSingleEditOperation> => unit) = "%identity"
  external asOperations2: t => ((array<iIdentifiedSingleEditOperation>, bool) => unit) = "%identity"
  external asOperations3: t => ((array<iIdentifiedSingleEditOperation>, bool) => array<iValidEditOperation>) = "%identity"
}
type iTextModel<'a> = {
  uri: uri,
  id: string,
  getOptions: unit => textModelResolvedOptions,
  getVersionId: unit => float,
  getAlternativeVersionId: unit => float,
  setValue: stringOrITextSnapshot => unit,
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
  findMatches: FindMatches.t,
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
  pushEditOperations: (Nullable.t<array<selection>>, array<iIdentifiedSingleEditOperation>, array<iValidEditOperation> => Nullable.t<array<selection>>) => Nullable.t<array<selection>>,
  pushEOL: endOfLineSequence => unit,
  applyEdits: ApplyEdits.t,
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
  onDidChangeAttached: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onWillDispose: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
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
@unboxed type numberOrIRulerOption = Num(float) | IRulerOption(iRulerOption)
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
  side?: ChartsSharedTypes.chartsSeriesOrganizationOptionsHangingSide,
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
@unboxed type boolOrIQuickSuggestionsOptions = Bool(bool) | IQuickSuggestionsOptions(iQuickSuggestionsOptions)
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
  rulers?: array<numberOrIRulerOption>,
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
  quickSuggestions?: boolOrIQuickSuggestionsOptions,
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
@unboxed type stringOrILocalizedString = Str(string) | ILocalizedString(iLocalizedString)
type iCommandMetadata = {
  description: stringOrILocalizedString,
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
  getInverseEditOperations: unit => array<iValidEditOperation>,
  getTrackedSelection: string => selection,
}
type iCommand<'a> = {
  getEditOperations: (iTextModel<'a>, iEditOperationBuilder) => unit,
  computeCursorState: (iTextModel<'a>, iCursorStateComputerData) => selection,
}
@unboxed type codeEditorV2ICodeEditorExecuteEdits = SelectionArr(array<selection>) | Fn(array<iValidEditOperation> => Nullable.t<array<selection>>)
type iContentWidgetPosition = {
  position: Nullable.t<iPosition>,
  secondaryPosition?: Nullable.t<iPosition>,
  preference: array<CommonTypes.v0OrV1OrV2>,
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
@unboxed type v0OrV1OrV2OrIContentWidgetRenderedCoordinate = @as(0) N0 | @as(1) N1 | @as(2) N2 | IContentWidgetRenderedCoordinate(iContentWidgetRenderedCoordinate)
type iOverlayWidgetPosition = {
  preference: Nullable.t<v0OrV1OrV2OrIContentWidgetRenderedCoordinate>,
  stackOridinal?: float,
}
type iOverlayWidget = {
  onDidLayout?: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
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
  afterColumnAffinity?: CommonTypes.v0OrV1OrV2OrV3OrV4,
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
  onDidFocusEditorText: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidBlurEditorText: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidFocusEditorWidget: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidBlurEditorWidget: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  inComposition: bool,
  onDidCompositionStart: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidCompositionEnd: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidAttemptReadOnlyEdit: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
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
  onDidChangeHiddenAreas: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onBeginUpdate: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onEndUpdate: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
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
  rulers?: array<numberOrIRulerOption>,
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
  quickSuggestions?: boolOrIQuickSuggestionsOptions,
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
  get: unit => option<string>,  // 🛑 BROKEN — contains `unknown`
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
  rulers?: array<numberOrIRulerOption>,
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
  quickSuggestions?: boolOrIQuickSuggestionsOptions,
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
@unboxed type codeEditorV2IStandaloneCodeEditorExecuteEdits = SelectionArr(array<selection>) | Fn(array<iValidEditOperation> => Nullable.t<array<selection>>)
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
  onDidFocusEditorText: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidBlurEditorText: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidFocusEditorWidget: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidBlurEditorWidget: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  inComposition: bool,
  onDidCompositionStart: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidCompositionEnd: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidAttemptReadOnlyEdit: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
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
  onDidChangeHiddenAreas: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onBeginUpdate: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onEndUpdate: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
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
  external asIDiffEditorModel: t => (iDiffEditorModel<'a>) = "%identity"
  external fromIDiffEditorViewModel: iDiffEditorViewModel<'a> => t = "%identity"
  external asIDiffEditorViewModel: t => (iDiffEditorViewModel<'a>) = "%identity"
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
  rulers?: array<numberOrIRulerOption>,
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
  quickSuggestions?: boolOrIQuickSuggestionsOptions,
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
  onDidUpdateDiff: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
  onDidChangeModel: (unit => string, option<string>) => iDisposable,  // 🛑 BROKEN — contains `any`
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
  rulers?: array<numberOrIRulerOption>,
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
  quickSuggestions?: boolOrIQuickSuggestionsOptions,
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
  rulers?: array<numberOrIRulerOption>,
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
  quickSuggestions?: boolOrIQuickSuggestionsOptions,
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
  backgroundColor: codeEditorV2BackupColorBodyGutterBackgroundColorConfig,
  borderColor: codeEditorV2BackupColorBodyGutterBackgroundColorConfig,
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
type menuV2ItemLabel = {
  text: string,
  leftSlot?: React.element,
}
type menuV2ItemTooltipProps = {
  side?: TooltipTypes.tooltipSide,
  align?: TooltipTypes.tooltipAlign,
  size?: TooltipTypes.tooltipSize,
  showArrow?: bool,
  delayDuration?: float,
  offset?: float,
}
type rec menuV2ItemType = {
  id?: string,
  label: menuV2ItemLabel,
  subLabel?: string,
  variant?: menuV2ItemVariant,
  actionType?: menuV2ItemActionType,
  disabled?: bool,
  selected?: bool,
  onClick?: unit => unit,
  subMenu?: array<menuV2ItemType>,
  enableSubMenuSearch?: bool,
  subMenuSearchPlaceholder?: string,
  subMenuSearchSortFn?: (array<menuV2ItemType>, string) => array<menuV2ItemType>,
  onSubMenuSearchEnter?: (string, array<menuV2ItemType>) => unit,
  tooltip?: React.element,
  tooltipProps?: menuV2ItemTooltipProps,
}
type menuV2GroupType = {
  id?: string,
  label?: string,
  items: array<menuV2ItemType>,
  showSeparator?: bool,
  selectionStyle?: menuSelectionStyle,
  selectionMode?: menuSelectionMode,
}
type menuV2Dimensions = {
  minWidth?: string,
  maxWidth?: string,
  minHeight?: string,
  maxHeight?: string,
}
type menuV2VirtualScrollingConfig = {
  itemHeight?: float,
  overscan?: float,
  threshold?: float,
}
module MenuV2MenuV2PropsCollisionBoundaryRef = {
  type t
  external fromHTMLElement: Dom.element => t = "%identity"
  external asHTMLElement: t => (Dom.element) = "%identity"
  external fromHTMLElements: array<Dom.element> => t = "%identity"
  external asHTMLElements: t => (array<Dom.element>) = "%identity"
}
type menuV2Props = {
  trigger: React.element,
  items?: array<menuV2GroupType>,
  dimensions?: menuV2Dimensions,
  enableSearch?: bool,
  searchPlaceholder?: string,
  searchSortFn?: (array<menuV2ItemType>, string) => array<menuV2ItemType>,
  onEnter?: (string, array<menuV2GroupType>) => unit,
  enableVirtualScrolling?: bool,
  virtualScrolling?: menuV2VirtualScrollingConfig,
  @as("open") open_?: bool,
  onOpenChange?: bool => unit,
  asModal?: bool,
  selectionStyle?: menuSelectionStyle,
  selectionMode?: menuSelectionMode,
  closeOnSelect?: bool,
  alignment?: menuV2Alignment,
  side?: menuV2Side,
  sideOffset?: float,
  alignOffset?: float,
  collisionBoundaryRef?: MenuV2MenuV2PropsCollisionBoundaryRef.t,
  triggerProps?: ReactTypes.reactSidebarPropsPrimaryActionButtonPropsConfig,
}
type menuV2ContentProps = {
  filteredItems: array<menuV2GroupType>,
  menuTokens: menuV2TokensType,
  enableSearch: bool,
  searchPlaceholder: string,
  searchText: string,
  onSearchTextChange: string => unit,
  onEnter?: unit => unit,
  maxHeight?: string,
  minHeight?: string,
  minWidth?: string,
  maxWidth?: string,
  enableVirtualScrolling?: bool,
  virtualScrolling?: menuV2VirtualScrollingConfig,
  alignment?: DateRangePickerTypes.dateRangePickerDateRangePickerPopoverConfigAlign,
  side?: DateRangePickerTypes.dateRangePickerDateRangePickerPopoverConfigSide,
  sideOffset?: float,
  alignOffset?: float,
  collisionBoundaryRef?: MenuV2MenuV2PropsCollisionBoundaryRef.t,
  onInteractOutside?: JSON.t => unit,
  onPointerDownOutside?: JSON.t => unit,
  onFocusCapture?: ReactEvent.Focus.t => unit,
  onKeyDown?: ReactEvent.Keyboard.t => unit,
}
type menuV2ItemProps = {
  item: menuV2ItemType,
  index: int,
  itemTokens: menuV2MenuV2TokensTypeGroupItemConfig,
  selectionStyle?: menuSelectionStyle,
  selectionMode?: menuSelectionMode,
}
// #167: discriminated union — each branch keeps its OWN required fields.
//       Build with LabelFlatRow({…}); `type` is auto-filled by @tag.
@tag("type")
type menuV2FlatRow =
  | @as("label") LabelFlatRow({id: string, label: string, groupId?: float})
  | @as("separator") SeparatorFlatRow({id: string, groupId?: float})
  | @as("item") ItemFlatRow({id: string, item: menuV2ItemType, groupId: float, itemIndex: float, selectionStyle?: menuSelectionStyle, selectionMode?: menuSelectionMode})
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
type multiSelectV2SkeletonComponentProps = {
  multiSelectTokens: multiSelectV2TokensType,
  skeleton: SelectV2Types.selectV2SkeletonProps,
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
type menuListSharedProps = {
  selected: string,
  onSelect: string => unit,
  singleSelectTokens: singleSelectV2TokensType,
  size: SelectV2Types.selectV2Size,
  variant: SelectV2Types.selectV2Variant,
  focusIdentityEnabled?: bool,
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
type singleSelectV2SkeletonComponentProps = {
  singleSelectTokens: singleSelectV2TokensType,
  skeleton: SelectV2Types.selectV2SkeletonProps,
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
@set_index external ariaAttributesSet: (ariaAttributes, string, JSON.t) => unit = ""
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
  label: float,
  separator: float,
  item: float,
  itemWithSubLabel: float,
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
  external asTextInputV2Dropdown: t => (textInputV2Dropdown) = "%identity"
  external fromTextInputV2Dropdowns: array<textInputV2Dropdown> => t = "%identity"
  external asTextInputV2Dropdowns: t => (array<textInputV2Dropdown>) = "%identity"
}
