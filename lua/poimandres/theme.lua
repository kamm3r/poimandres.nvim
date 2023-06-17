local util = require("poimandres.util")
local colors = require("poimandres.colors")

local M = {}
--
---@class Highlight
---@field fg string|nil
---@field bg string|nil
---@field sp string|nil
---@field style string|nil|Highlight

---@alias Highlights table<string,Highlight>

---@return Theme
function M.setup()
	local config = require("poimandres.config")
	local options = config.options

	---@class Theme
	---@field highlights Highlights
	local theme = {
		config = options,
		colors = colors.setup(),
	}

	local c = theme.colors
	theme.highlights = {
		-- Comment = { fg = c.comment, style = options.styles.comments }, -- any comment
		ColorColumn = { bg = c.gray }, -- used for the columns set with 'colorcolumn'
		Conceal = { bg = c.none },     -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { fg = c.gray },      -- character under the cursor
		CursorColumn = { bg = c.focus }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		-- lCursor = { fg = c.bg, bg = c.fg }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM', {}, -- like Cursor, but used when in IME mode |CursorIM|
		CursorLine = { bg = c.focus }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		CursorLineNr = { fg = c.offWhite },
		DarkenedPanel = { bg = c.bg_sidebar },
		DarkenedStatusline = { bg = c.bg_sidebar },
		DiffAdd = { bg = c.diff.add },                     -- diff mode: Added line |diff.txt|
		DiffChange = { bg = c.diff.change },               -- diff mode: Changed line |diff.txt|
		DiffDelete = { bg = c.diff.delete },               -- diff mode: Deleted line |diff.txt|
		DiffText = { bg = c.lowerMint },                   -- diff mode: Changed text within a changed line |diff.txt|
		Directory = { fg = c.desaturatedBlue, bg = c.none }, -- directory names (and other special names in listings)
		-- EndOfBuffer', {},
		ErrorMsg = { fg = c.hotRed, bold = true },         -- error messages on the command line
		FloatBorder = { fg = c.border },
		FloatTitle = { fg = c.darkerGray },
		FoldColumn = { fg = c.darkerGray },               -- 'foldcolumn'
		Folded = { fg = c.offWhite, bg = c.bg_sidebar },  -- line used for closed folds
		IncSearch = { fg = c.selection, bg = c.lightBlue }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		CurSearch = { link = 'IncSearch' },
		LineNr = { fg = c.bluishGray },                   -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		MatchParen = { bg = c.bluishGray, fg = c.selection },
		ModeMsg = { fg = c.desaturatedBlue },
		MoreMsg = { fg = c.desaturatedBlue },
		NonText = { fg = c.BluishGrayBrighter },
		Normal = { fg = c.offWhite, bg = options.transparent and c.none or c.bg },
		NormalNC = { fg = c.offWhite, bg = options.transparent and c.none or c.bg },
		NormalSB = { fg = c.fg_sidebar, bg = c.bg_sidebar }, -- normal text in sidebar
		NormalFloat = { c.fg_float, bg = c.bg_float },
		NvimInternalError = { fg = '#ffffff', bg = c.hotRed },
		Pmenu = { fg = c.gray, bg = c.bg_popup }, -- Popup menu: normal item.
		PmenuSbar = { bg = c.darkerGray },
		PmenuSel = { fg = c.offWhite, bg = c.focus },
		PmenuThumb = { bg = c.bluishGray },
		Question = { fg = c.brightYellow },
		-- QuickFixLine', {},
		-- RedrawDebugNormal', {},
		RedrawDebugClear = { fg = '#ffffff', bg = c.brightYellow },
		RedrawDebugComposed = { fg = '#ffffff', bg = c.lowerMint },
		RedrawDebugRecompose = { fg = '#ffffff', bg = c.hotRed },
		Search = { bg = c.bluishGray },
		SpecialKey = { fg = c.brightMint },
		SpellBad = { sp = c.hotRed, undercurl = true },
		SpellCap = { sp = c.lowerBlue, undercurl = true },
		SpellLocal = { sp = c.brightYellow, undercurl = true },
		SpellRare = { sp = c.lowerBlue, undercurl = true },
		SignColumn = { fg = c.offWhite, bg = c.none },
		StatusLine = { fg = c.desaturatedBlue, bg = c.bg_statusline }, -- status line of current window
		StatusLineNC = { fg = c.desaturatedBlue, bg = c.bg_statusline }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine = { fg = c.desaturatedBlue, bg = c.bluishGray },       -- tab pages line, not active tab page label
		StatusLineTerm = { link = 'StatusLine' },
		StatusLineTermNC = { link = 'StatusLineNC' },
		TabLineFill = { bg = options.transparent and c.none or c.darkerGray },
		TabLineSel = { fg = c.offWhite, bg = c.focus },
		Title = { fg = c.offWhite },
		VertSplit = { fg = c.border },
		Visual = { bg = c.bluishGray },
		-- VisualNOS', {},
		WarningMsg = { fg = c.brightYellow },
		-- Whitespace', { fg = c.bluishGray },
		WildMenu = { link = 'IncSearch' },
		-- These groups are not listed as default vim groups,
		-- but they are defacto standard group names for syntax highlighting.
		-- commented out groups should chain up to their "preferred" group by
		-- default,
		-- Uncomment and edit if you want more specific syntax highlighting.

		Bold = { bold = true },
		Boolean = { fg = c.brightMint }, --  a boolean constant: TRUE, false
		Character = { fg = c.hotRed }, --  a character constant: 'c', '\n'
		Comment = { fg = c.gray },     -- (preferred, any special symbol
		Conditional = { fg = c.gray }, --  if, then, else, endif, switch, etc.
		Constant = { fg = c.offWhite }, -- (preferred, any constant
		-- Debug', { }, --    debugging statements
		-- Define',        = { }, --   preprocessor #define
		Delimiter = { fg = c.gray },          --  character that needs attention
		Error = { fg = c.hotRed },            -- (preferred, any erroneous construct
		Exception = { fg = c.desaturatedBlue }, --  try, catch, throw
		Float = { fg = c.brightMint },        --    a floating point constant: 2.3e10
		Function = { fg = c.lightBlue },      -- function name (also: methods for classes,
		Identifier = { fg = c.gray },         -- (preferred, any variable name
		-- Ignore', { }, -- (preferred, left blank, hidden  |hl-Ignore|
		Include = { fg = c.gray },            --  preprocessor #include
		Keyword = { fg = c.desaturatedBlue }, --  any other keyword
		Label = { fg = c.offWhite },          --    case, default, etc.
		Italic = { italic = true },
		-- Macro',         = { }, --    same as Define
		Number = { fg = c.brightMint },                 --   a number constant: 234, 0xff
		Operator = { fg = c.lightBlue },                -- "sizeof", "+", "*", etc.
		-- PreCondit',     = { }, --  preprocessor #if, #else, #endif, etc.
		PreProc = { fg = c.offWhite },                  -- (preferred, generic Preprocessor
		Repeat = { fg = c.desaturatedBlue },            --   for, do, while, etc.
		Special = { fg = c.darkerGray },                -- (preferred, any special symbol
		-- SpecialChar', { }, --  special character in a constant
		SpecialComment = { fg = c.gray },               -- special things inside a comment
		Statement = { fg = c.offWhite },                -- (preferred, any statement
		-- StorageClass', { }, -- static, register, volatile, etc.
		String = { fg = c.brightMint },                 --   a string constant: "this is a string"
		Structure = { fg = c.gray },                    --  struct, union, enum, etc. ]]
		Tag = { fg = c.offWhite },                      --    you can use CTRL-] on this
		Todo = { bg = c.brightYellow, fg = c.selection }, -- (preferred, anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		Type = { fg = c.gray },                         -- (preferred, int, long, char, etc.
		Typedef = { link = 'Type' },                    --  A typedef
		Underlined = { underline = true },              -- (preferred, text that stands out, HTML links
		htmlH1 = { fg = c.lowerMint, bold = true },
		htmlH2 = { fg = c.brightYellow, bold = true },
		-- mkdHeading', { fg = c.brightMint, style = "bold" },
		-- mkdCode', { bg = c.terminal_black, fg = c.fg },
		mkdCodeDelimiter = { bg = c.selection, fg = c.offWhite },
		mkdCodeStart = { fg = c.lowerMint, bold = true },
		mkdCodeEnd = { fg = c.lowerMint, bold = true },
		mkdLink = { fg = c.lowerBlue, underline = true },
		markdownHeadingDelimiter = { fg = c.BluishGrayBrighter, bold = true },
		markdownCode = { fg = c.gray },
		markdownCodeBlock = { fg = c.lowerMint },
		markdownH1 = { fg = c.lightBlue, bold = true },
		markdownH2 = { fg = c.lightBlue, bold = true },
		markdownLinkText = { fg = c.lowerBlue, underline = true },
		-- These groups are for the native LSP client. Some other LSP clients may
		-- use these groups, or use their own. Consult your LSP client's
		-- documentation.
		LspReferenceText = { bg = c.lightBlue }, -- used for highlighting "text" references
		LspReferenceRead = { bg = c.lightBlue }, -- used for highlighting "read" references
		LspReferenceWrite = { bg = c.lightBlue }, -- used for highlighting "write" references
		DiagnosticError = { fg = c.error },     -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticHint = { fg = c.hint },       -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticInfo = { fg = c.info },       -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticWarn = { fg = c.warning },    -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		-- DiagnosticUnnecessary = { fg = c.black }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

		DiagnosticUnderlineError = { sp = c.error, undercurl = true }, -- Used to underline "Error" diagnostics
		DiagnosticUnderlineHint = { sp = c.hint, undercurl = true },  -- Used to underline "Hint" diagnostics
		DiagnosticUnderlineInfo = { sp = c.info, undercurl = true },  -- Used to underline "Information" diagnostics
		DiagnosticUnderlineWarn = { sp = c.warning, undercurl = true }, -- Used to underline "Warning" diagnostics
		DiagnosticVirtualTextError = { fg = c.error },                -- Used for "Error" diagnostic virtual text
		DiagnosticVirtualTextHint = { fg = c.hint },                  -- Used for "Hint" diagnostic virtual text
		DiagnosticVirtualTextInfo = { fg = c.info },                  -- Used for "Information" diagnostic virtual text
		DiagnosticVirtualTextWarn = { fg = c.warning },               -- Used for "Warning" diagnostic virtual text
		LspSignatureActiveParameter = { bg = c.gray },
		-- lsp-highlight-codelens
		LspCodeLens = { fg = c.gray },              -- virtual text of code lens
		LspCodeLensSeparator = { fg = c.bluishGray }, -- separator between two or more code lens
		-- Treesitter
		["@boolean"] = { link = 'Boolean' },
		["@character"] = { link = 'Character' },
		["@characterspecial"] = { link = '@character' },
		["@class"] = { fg = c.lightBlue },
		["@comment"] = { link = 'Comment' },
		["@conditional"] = { link = 'Conditional' },
		["@constant"] = { link = 'Constant' },
		["@constantbuiltin"] = { fg = c.lightBlue },
		["@constantmacro"] = { link = '@constant' },
		["@constantfalsy"] = { fg = c.hotRed },
		["@constructor"] = { fg = c.brightMint },
		["@field"] = { fg = c.offWhite },
		["@function"] = { link = 'Function' },
		["@functionbuiltin"] = { fg = c.lightBlue },
		["@functionmacro"] = { link = '@function' },
		["@functioncall"] = { fg = c.gray },
		["@include"] = { link = 'Include' },
		["@interface"] = { fg = c.lightBlue },
		["@keyword"] = { link = 'Keyword' },
		["@keywordfunction"] = { fg = c.lowerMint },
		["@keywordoperator"] = { fg = c.brightMint },
		["@keywordreturn"] = { fg = c.lowerMint },
		["@label"] = { link = 'Label' },
		["@macro"] = { link = 'Macro' },
		["@method"] = { fg = c.brightMint },
		["@number"] = { link = 'Number' },
		["@operator"] = { link = 'Operator' },
		["@parameter"] = { fg = c.offWhite, italic = true },
		["@preproc"] = { link = 'PreProc' },
		["@property"] = { fg = c.lightBlue, italic = true },
		["@punctuation"] = { fg = c.desaturatedBlue },
		["@punctuationbracket"] = { fg = c.offWhite },
		["@punctuationdelimiter"] = { link = '@punctuation' },
		["@punctuationspecial"] = { link = '@punctuation' },
		["@regexp"] = { link = 'String' },
		["@repeat"] = { link = 'Repeat' },
		["@storageclass"] = { link = 'StorageClass' },
		["@string"] = { link = 'String' },
		["@stringescape"] = { fg = c.hotRed },
		["@stringspecial"] = { link = '@string' },
		["@symbol"] = { link = 'Identifier' },
		["@tag"] = { link = 'Tag' },
		["@tagattribute"] = { fg = c.desaturatedBlue, italic = true },
		["@tagdelimiter"] = { fg = c.offWhite },
		["@text"] = { fg = c.offWhite },
		["@text.strong"] = { bold = true },
		["@text.emphasis"] = { italic = true },
		["@text.underline"] = { underline = true },
		["@text.strike"] = { strikethrough = true },
		["@text.math"] = { link = 'Special' },
		["@text.environment"] = { link = 'Macro' },
		["@text.environment.name"] = { link = 'Type' },
		["@text.title"] = { link = 'Title' },
		["@text.uri"] = { fg = c.desaturatedBlue },
		["@text.note"] = { link = 'SpecialComment' },
		["@text.warning"] = { fg = c.warning },
		["@text.danger"] = { fg = c.error },
		["@todo"] = { link = 'Todo' },
		["@type"] = { link = 'Type' },
		["@variable"] = { fg = c.offWhite },
		["@variablebuiltin"] = { fg = c.lightBlue },
		["@namespace"] = { link = '@include' },
		-- tsx
		["@tag.tsx"] = { fg = c.offWhite },
		["@constructor.tsx"] = { fg = c.brightMint },
		["@tag.delimiter.tsx"] = { fg = util.darken(c.gray, 0.7) },
		-- LSP Semantic Token Groups
		["@lsc.type.boolean"] = { link = "@boolean" },
		["@lsc.type.builtinType"] = { link = "@type.builtin" },
		["@lsc.type.comment"] = { link = "@comment" },
		["@lsc.type.enum"] = { link = "@type" },
		["@lsc.type.enumMember"] = { link = "@constant" },
		["@lsc.type.escapeSequence"] = { link = "@string.escape" },
		["@lsc.type.formatSpecifier"] = { link = "@punctuation.special" },
		["@lsc.type.interface"] = { fg = util.lighten(c.darkerGray, 0.7) },
		["@lsc.type.keyword"] = { link = "@keyword" },
		["@lsc.type.namespace"] = { link = "@namespace" },
		["@lsc.type.number"] = { link = "@number" },
		["@lsc.type.operator"] = { link = "@operator" },
		["@lsc.type.parameter"] = { link = "@parameter" },
		["@lsc.type.property"] = { link = "@property" },
		["@lsc.type.selfKeyword"] = { link = "@variable.builtin" },
		["@lsc.type.string.rust"] = { link = "@string" },
		["@lsc.type.typeAlias"] = { link = "@type.definition" },
		["@lsc.type.unresolvedReference"] = { undercurl = true, sp = c.error },
		["@lsc.type.variable"] = {}, -- use treesitter styles for regular variables
		["@lsc.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
		["@lsc.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
		["@lsc.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
		["@lsc.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
		["@lsc.typemod.keyword.async"] = { link = "@keyword.coroutine" },
		["@lsc.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
		["@lsc.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
		["@lsc.typemod.operator.injected"] = { link = "@operator" },
		["@lsc.typemod.string.injected"] = { link = "@string" },
		["@lsc.typemod.type.defaultLibrary"] = { fg = util.darken(c.darkerGray, 0.8) },
		["@lsc.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
		["@lsc.typemod.variable.injected"] = { link = "@variable" },
		-- NOTE: maybe add these with distinct highlights?
		-- ["@lsc.typemod.variable.globalScope"] (global variables)

		-- ts-rainbow
		rainbowcol1 = { fg = c.lowerBlue },
		rainbowcol2 = { fg = c.brightMint },
		rainbowcol3 = { fg = c.brightYellow },
		rainbowcol4 = { fg = c.lightBlue },
		rainbowcol5 = { fg = c.lowerMint },
		rainbowcol6 = { fg = c.hotRed },
		rainbowcol7 = { fg = c.desaturatedBlue },
		-- ts-rainbow2 (maintained fork)
		TSRainbowRed = { fg = c.lowerBlue },
		TSRainbowbrightMint = { fg = c.brightMint },
		TSRainbowYellow = { fg = c.brightYellow },
		TSRainbowGreen = { fg = c.lightBlue },
		TSRainbowBlue = { fg = c.lowerMint },
		TSRainbowViolet = { fg = c.hotRed },
		TSRainbowdesaturatedBlue = { fg = c.desaturatedBlue },
		-- LspTrouble
		TroubleText = { fg = c.offWhite },
		TroubleCount = { fg = c.hotRed, bg = c.focus },
		TroubleNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },
		-- Illuminate
		illuminatedWord = { bg = c.focus },
		illuminatedCurWord = { bg = c.focus },
		IlluminatedWordText = { bg = c.focus },
		IlluminatedWordRead = { bg = c.focus },
		IlluminatedWordWrite = { bg = c.focus },
		-- diff
		diffAdded = { fg = c.git.add },
		diffRemoved = { fg = c.git.delete },
		diffChanged = { fg = c.git.change },
		diffOldFile = { fg = c.brightYellow },
		diffNewFile = { fg = c.brightMint },
		diffFile = { fg = c.lowerMint },
		diffLine = { fg = c.comment },
		diffIndexLine = { fg = c.hotRed },
		-- Neogit
		NeogitBranch = { fg = c.pink },
		NeogitRemote = { fg = c.gray },
		NeogitHunkHeader = { bg = c.focus },
		NeogitHunkHeaderHighlight = { bg = c.focus },
		NeogitDiffContextHighlight = { bg = c.focus },
		NeogitDiffDeleteHighlight = { fg = c.hotRed, bg = c.focus },
		NeogitDiffAddHighlight = { fg = c.brightMint, bg = c.focus },
		-- Neotest
		NeotestPassed = { fg = c.lowerMint },
		NeotestRunning = { fg = c.brightYellow },
		NeotestFailed = { fg = c.hotRed },
		NeotestSkipped = { fg = c.bluishGray },
		NeotestTest = { fg = c.fg_sidebar },
		NeotestNamespace = { fg = c.desaturatedBlue },
		NeotestFocused = { fg = c.brightYellow },
		NeotestFile = { fg = c.lightBlue },
		NeotestDir = { fg = c.lowerMint },
		NeotestBorder = { fg = c.lowerMint },
		NeotestIndent = { fg = c.fg_sidebar },
		NeotestExpandMarker = { fg = c.fg_sidebar },
		NeotestAdapterName = { fg = c.desaturatedBlue, bold = true },
		NeotestWinSelect = { fg = c.lowerMint },
		NeotestMarked = { fg = c.lowerMint },
		NeotestTarget = { fg = c.lowerMint },
		--[[ NeotestUnknown = {}, ]]

		-- GitGutter
		GitGutterAdd = { fg = c.gitSigns.add },     -- diff mode: Added line |diff.txt|
		GitGutterChange = { fg = c.gitSigns.change }, -- diff mode: Changed line |diff.txt|
		GitGutterDelete = { fg = c.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|
		GitGutterAddLineNr = { fg = c.gitSigns.add },
		GitGutterChangeLineNr = { fg = c.gitSigns.change },
		GitGutterDeleteLineNr = { fg = c.gitSigns.delete },
		-- GitSigns
		GitSignsAdd = { fg = c.gitSigns.add, bg = c.bg },
		GitSignsChange = { fg = c.gitSigns.change, bg = c.bg },
		GitSignsDelete = { fg = c.gitSigns.delete, bg = c.bg },
		-- Telescope
		TelescopeBorder = { fg = c.border },
		TelescopeMatching = { fg = c.brightMint },
		TelescopeNormal = { fg = c.offWhite },
		TelescopePromptNormal = { fg = c.offWhite },
		TelescopePromptPrefix = { fg = c.gray },
		TelescopeSelection = { fg = c.offWhite, bg = c.gray },
		TelescopeSelectionCaret = { fg = c.pink, bg = c.gray },
		TelescopeTitle = { fg = c.darkerGray },
		-- NvimTree
		NvimTreeNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },
		NvimTreeWinSeparator = {
			fg = options.styles.sidebars == "transparent" and c.border or c.darkerGray,
			bg = c.bg_sidebar
		},
		NvimTreeNormalNC = { fg = c.fg_sidebar, bg = c.bg_sidebar },
		NvimTreeRootFolder = { fg = c.brightMint },
		NvimTreeGitDirty = { fg = c.BluishGrayBrighter },
		NvimTreeGitNew = { fg = c.git.add },
		NvimTreeGitDeleted = { fg = c.git.delete },
		NvimTreeOpenedFile = { fg = c.offWhite, bg = c.focus },
		NvimTreeSpecialFile = { fg = c.gray, underline = true },
		NvimTreeIndentMarker = { fg = c.border },
		NvimTreeImageFile = { fg = c.offWhite },
		NvimTreeSymlink = { fg = c.lowerBlue },
		NvimTreeFolderIcon = { fg = c.desaturatedBlue },
		-- NvimTreeOpenedFolderName = { link = 'NvimTreeFolderName' },

		NeoTreeNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },
		NeoTreeNormalNC = { fg = c.fg_sidebar, bg = c.bg_sidebar },
		NeoTreeDimText = { fg = c.border },
		-- Fern
		FernBranchText = { fg = c.lowerMint },
		-- glyph palette
		GlyphPalette1 = { fg = c.pink },
		GlyphPalette2 = { fg = c.brightMint },
		GlyphPalette3 = { fg = c.brightYellow },
		GlyphPalette4 = { fg = c.lightBlue },
		GlyphPalette6 = { fg = c.lowerBlue },
		GlyphPalette7 = { fg = c.darkerGray },
		GlyphPalette9 = { fg = c.hotRed },
		-- Dashboard
		DashboardShortCut = { fg = c.desaturatedBlue },
		DashboardHeader = { fg = c.lightBlue },
		DashboardCenter = { fg = c.hotRed },
		DashboardFooter = { fg = c.brightYellow, italic = true },
		-- Alpha
		AlphaShortcut = { fg = c.brightMint },
		AlphaHeader = { fg = c.lowerBlue },
		AlphaHeaderLabel = { fg = c.brightMint },
		AlphaFooter = { fg = c.lightBlue },
		AlphaButtons = { fg = c.desaturatedBlue },
		-- WhichKey
		WhichKey = { fg = c.offWhite },
		WhichKeyGroup = { fg = c.offWhite },
		WhichKeyDesc = { fg = c.offWhite },
		WhichKeySeparator = { fg = c.offWhite },
		WhichKeyFloat = { bg = c.bg_sidebar },
		WhichKeyValue = { fg = c.offWhite },
		-- LspSaga
		DiagnosticWarning = { link = "DiagnosticWarn" },
		DiagnosticInformation = { link = "DiagnosticInfo" },
		LspFloatWinBorder = { fg = c.border },
		LspFloatWinNormal = { bg = options.transparent and c.none or c.darkerGray },
		LspSagaBorderTitle = { fg = c.darkerGray },
		LspSagaHoverBorder = { fg = c.border },
		LspSagaRenameBorder = { fg = c.brightYellow },
		LspSagaDefPreviewBorder = { fg = c.border },
		LspSagaCodeActionBorder = { fg = c.border },
		LspSagaFinderSelection = { fg = c.brightYellow },
		LspSagaCodeActionTitle = { fg = c.brightYellow, bold = true },
		LspSagaCodeActionContent = { fg = c.lightBlue },
		LspSagaSignatureHelpBorder = { fg = c.brightYellow },
		DefinitionCount = { fg = c.lowerBlue },
		DefinitionIcon = { fg = c.lowerBlue },
		ReferencesCount = { fg = c.lowerBlue },
		ReferencesIcon = { fg = c.lowerBlue },
		TargetWord = { fg = c.offWhite },
		-- healthcheck
		healthError = { fg = c.error },
		healthSuccess = { fg = c.info },
		healthWarning = { fg = c.warning },
		-- BufferLine
		BufferLineIndicatorSelected = { fg = c.git.change },
		-- Barbar
		BufferCurrent = { fg = c.offWhite, bg = c.bg },
		BufferCurrentIndex = { fg = c.offWhite, bg = c.bg },
		BufferCurrentMod = { fg = c.brightMint, bg = c.bg },
		BufferCurrentSign = { fg = c.gray, bg = c.bg },
		BufferCurrentTarget = { fg = c.brightYellow, bg = c.bg },
		BufferInactive = { fg = c.gray },
		BufferInactiveIndex = { fg = c.gray },
		BufferInactiveMod = { fg = c.brightMint },
		BufferInactiveSign = { fg = c.darkerGray },
		BufferInactiveTarget = { fg = c.brightYellow },
		BufferTabpageFill = { fg = c.bg, bg = c.bg },
		BufferVisible = { fg = c.gray },
		BufferVisibleIndex = { fg = c.gray },
		BufferVisibleMod = { fg = c.brightMint },
		BufferVisibleSign = { fg = c.darkerGray },
		BufferVisibleTarget = { fg = c.brightYellow },
		-- Sneak
		Sneak = { fg = c.border, bg = c.hotRed },
		SneakScope = { bg = c.bg_visual },
		-- Hop
		HopNextKey = { fg = c.lowerBlue },
		HopNextKey1 = { fg = c.brightMint },
		HopNextKey2 = { fg = c.lowerMint },
		HopUnmatched = { fg = c.bluishGray },
		HopCursor = { fg = c.desaturatedBlue },
		-- Cmp
		CmpItemAbbr = { fg = c.darkerGray },
		CmpItemAbbrDeprecated = { fg = c.hotRed, strikethrough = true },
		CmpItemAbbrMatch = { fg = c.offWhite, bold = true },
		CmpItemAbbrMatchFuzzy = { fg = c.brightMint, bold = true },
		CmpItemKind = { fg = c.desaturatedBlue },
		CmpItemKindClass = { fg = c.brightYellow },
		CmpItemKindFunction = { fg = c.lowerBlue },
		CmpItemKindInterface = { fg = c.lightBlue },
		CmpItemKindMethod = { fg = c.hotRed },
		CmpItemKindSnippet = { fg = c.gray },
		CmpItemKindVariable = { fg = c.brightMint },
		-- navic
		NavicIconsFile = { fg = c.darkerGray, bg = c.none },
		NavicIconsModule = { fg = c.brightYellow, bg = c.none },
		NavicIconsNamespace = { fg = c.darkerGray, bg = c.none },
		NavicIconsPackage = { fg = c.darkerGray, bg = c.none },
		NavicIconsClass = { fg = c.brightMint, bg = c.none },
		NavicIconsMethod = { fg = c.lowerBlue, bg = c.none },
		NavicIconsProperty = { fg = c.offWhite, bg = c.none },
		NavicIconsField = { fg = c.offWhite, bg = c.none },
		NavicIconsConstructor = { fg = c.brightMint, bg = c.none },
		NavicIconsEnum = { fg = c.brightMint, bg = c.none },
		NavicIconsInterface = { fg = c.brightMint, bg = c.none },
		NavicIconsFunction = { fg = c.lowerBlue, bg = c.none },
		NavicIconsVariable = { fg = c.hotRed, bg = c.none },
		NavicIconsConstant = { fg = c.hotRed, bg = c.none },
		NavicIconsString = { fg = c.lowerMint, bg = c.none },
		NavicIconsNumber = { fg = c.brightMint, bg = c.none },
		NavicIconsBoolean = { fg = c.brightMint, bg = c.none },
		NavicIconsArray = { fg = c.brightMint, bg = c.none },
		NavicIconsObject = { fg = c.brightMint, bg = c.none },
		NavicIconsKey = { fg = c.desaturatedBlue, bg = c.none },
		NavicIconsKeyword = { fg = c.desaturatedBlue, bg = c.none },
		NavicIconsNull = { fg = c.brightMint, bg = c.none },
		NavicIconsEnumMember = { fg = c.offWhite, bg = c.none },
		NavicIconsStruct = { fg = c.brightMint, bg = c.none },
		NavicIconsEvent = { fg = c.brightMint, bg = c.none },
		NavicIconsOperator = { fg = c.darkerGray, bg = c.none },
		NavicIconsTypeParameter = { fg = c.brightMint, bg = c.none },
		NavicText = { fg = c.darkerGray, bg = c.none },
		NavicSeparator = { fg = c.darkerGray, bg = c.none },
		IndentBlanklineChar = { fg = c.focus, nocombine = true },
		IndentBlanklineContextChar = { fg = c.desaturatedBlue, nocombine = true },
		-- Scrollbar
		ScrollbarHandle = { fg = c.none, bg = c.border },
		ScrollbarSearchHandle = { fg = c.brightMint, bg = c.border },
		ScrollbarSearch = { fg = c.brightMint, bg = c.none },
		ScrollbarErrorHandle = { fg = c.error, bg = c.border },
		ScrollbarError = { fg = c.error, bg = c.none },
		ScrollbarWarnHandle = { fg = c.warning, bg = c.border },
		ScrollbarWarn = { fg = c.warning, bg = c.none },
		ScrollbarInfoHandle = { fg = c.info, bg = c.border },
		ScrollbarInfo = { fg = c.info, bg = c.none },
		ScrollbarHintHandle = { fg = c.hint, bg = c.border },
		ScrollbarHint = { fg = c.hint, bg = c.none },
		ScrollbarMiscHandle = { fg = c.desaturatedBlue, bg = c.border },
		ScrollbarMisc = { fg = c.desaturatedBlue, bg = c.none },
		-- Yanky
		YankyPut = { link = "IncSearch" },
		YankyYanked = { link = "IncSearch" },
		-- Lazy
		LazyProgressDone = { bold = true, fg = c.lowerBlue },
		LazyProgressTodo = { bold = true, fg = c.focus },
		-- Notify
		--- Border
		NotifyERRORBorder = { fg = c.hotRed },
		NotifyWARNBorder = { fg = c.brightYellow },
		NotifyINFOBorder = { fg = c.brightMint },
		NotifyDEBUGBorder = { fg = c.lowerBlue },
		NotifyTRACEBorder = { fg = c.lowerBlue },
		--- Icons
		NotifyERRORIcon = { link = 'NotifyERRORBorder' },
		NotifyWARNIcon = { link = 'NotifyWARNBorder' },
		NotifyINFOIcon = { link = 'NotifyINFOBorder' },
		NotifyDEBUGIcon = { link = 'NotifyDEBUGBorder' },
		NotifyTRACEIcon = { link = 'NotifyTRACEBorder' },
		--- Title
		NotifyERRORTitle = { link = 'NotifyERRORBorder' },
		NotifyWARNTitle = { link = 'NotifyWARNBorder' },
		NotifyINFOTitle = { link = 'NotifyINFOBorder' },
		NotifyDEBUGTitle = { link = 'NotifyDEBUGBorder' },
		NotifyTRACETitle = { link = 'NotifyTRACEBorder' },
		-- Mini
		MiniCompletionActiveParameter = { underline = true },
		MiniCursorword = { bg = c.focus },
		MiniCursorwordCurrent = { bg = c.focus },
		MiniIndentscopeSymbol = { fg = c.lightBlue, nocombine = true },
		MiniIndentscopePrefix = { nocombine = true }, -- Make it invisible
		MiniJump = { bg = c.lowerBlue, fg = "#ffffff" },
		MiniJump2dSpot = { fg = c.lowerBlue, bold = true, nocombine = true },
		MiniStarterCurrent = { nocombine = true },
		MiniStarterFooter = { fg = c.brightYellow, italic = true },
		MiniStarterHeader = { fg = c.lowerBlue },
		MiniStarterInactive = { fg = c.comment, style = options.styles.comments },
		MiniStarterItem = { fg = c.darkerGray, bg = options.transparent and c.none or c.bg },
		MiniStarterItemBullet = { fg = c.border_highlight },
		MiniStarterItemPrefix = { fg = c.warning },
		MiniStarterSection = { fg = c.lightBlue },
		MiniStarterQuery = { fg = c.info },
		MiniStatuslineDevinfo = { fg = c.darkerGray, bg = c.border },
		MiniStatuslineFileinfo = { fg = c.darkerGray, bg = c.border },
		MiniStatuslineFilename = { fg = c.darkerGray, bg = c.focus },
		MiniStatuslineInactive = { fg = c.lowerBlue, bg = c.bg_statusline },
		MiniStatuslineModeCommand = { fg = c.black, bg = c.brightYellow, bold = true },
		MiniStatuslineModeInsert = { fg = c.black, bg = c.lowerMint, bold = true },
		MiniStatuslineModeNormal = { fg = c.black, bg = c.lowerBlue, bold = true },
		MiniStatuslineModeOther = { fg = c.black, bg = c.brightMint, bold = true },
		MiniStatuslineModeReplace = { fg = c.black, bg = c.hotRed, bold = true },
		MiniStatuslineModeVisual = { fg = c.black, bg = c.hotRed, bold = true },
		MiniSurround = { bg = c.brightMint, fg = c.black },
		MiniTablineCurrent = { fg = c.darkerGray, bg = c.focus },
		MiniTablineFill = { bg = c.black },
		MiniTablineHidden = { fg = c.bluishGray, bg = c.bg_statusline },
		MiniTablineModifiedCurrent = { fg = c.warning, bg = c.focus },
		MiniTablineModifiedHidden = { bg = c.bg_statusline, fg = util.darken(c.warning, 0.7) },
		MiniTablineModifiedVisible = { fg = c.warning, bg = c.bg_statusline },
		MiniTablineTabpagesection = { bg = c.bg_statusline, fg = c.none },
		MiniTablineVisible = { fg = c.darkerGray, bg = c.bg_statusline },
		MiniTestEmphasis = { bold = true },
		MiniTestFail = { fg = c.hotRed, bold = true },
		MiniTestPass = { fg = c.lowerMint, bold = true },
		MiniTrailspace = { bg = c.hotRed },
		-- Noice

		NoiceCompletionItemKindDefault = { fg = c.darkerGray, bg = c.none },
		NoiceCompletionItemKindKeyword = { fg = c.desaturatedBlue, bg = c.none },
		NoiceCompletionItemKindVariable = { fg = c.hotRed, bg = c.none },
		NoiceCompletionItemKindConstant = { fg = c.hotRed, bg = c.none },
		NoiceCompletionItemKindReference = { fg = c.hotRed, bg = c.none },
		NoiceCompletionItemKindValue = { fg = c.hotRed, bg = c.none },
		NoiceCompletionItemKindFunction = { fg = c.lowerBlue, bg = c.none },
		NoiceCompletionItemKindMethod = { fg = c.lowerBlue, bg = c.none },
		NoiceCompletionItemKindConstructor = { fg = c.lowerBlue, bg = c.none },
		NoiceCompletionItemKindClass = { fg = c.brightMint, bg = c.none },
		NoiceCompletionItemKindInterface = { fg = c.brightMint, bg = c.none },
		NoiceCompletionItemKindStruct = { fg = c.brightMint, bg = c.none },
		NoiceCompletionItemKindEvent = { fg = c.brightMint, bg = c.none },
		NoiceCompletionItemKindEnum = { fg = c.brightMint, bg = c.none },
		NoiceCompletionItemKindUnit = { fg = c.brightMint, bg = c.none },
		NoiceCompletionItemKindModule = { fg = c.brightYellow, bg = c.none },
		NoiceCompletionItemKindProperty = { fg = c.offWhite, bg = c.none },
		NoiceCompletionItemKindField = { fg = c.offWhite, bg = c.none },
		NoiceCompletionItemKindTypeParameter = { fg = c.offWhite, bg = c.none },
		NoiceCompletionItemKindEnumMember = { fg = c.offWhite, bg = c.none },
		NoiceCompletionItemKindOperator = { fg = c.offWhite, bg = c.none },
		NoiceCompletionItemKindSnippet = { fg = c.bluishGray, bg = c.none },
		TreesitterContext = { bg = util.darken(c.focus, 0.8) },
		Hlargs = { fg = c.brightYellow },
		-- TreesitterContext = { bg = util.darken(c.bg_visual, 0.4) },

	}

	if not vim.diagnostic then
		local severity_map = {
			Error = "Error",
			Warn = "Warning",
			Info = "Information",
			Hint = "Hint",
		}
		local types = { "Default", "VirtualText", "Underline" }
		for _, type in ipairs(types) do
			for snew, sold in pairs(severity_map) do
				theme.highlights["LspDiagnostics" .. type .. sold] = {
					link = "Diagnostic" .. (type == "Default" and "" or type) .. snew,
				}
			end
		end
	end

	---@type table<string, table>
	theme.defer = {}

	if options.hide_inactive_statusline then
		local inactive = { underline = true, bg = c.none, fg = c.bg, sp = c.border }

		-- StatusLineNC
		theme.highlights.StatusLineNC = inactive

		-- LuaLine
		for _, section in ipairs({ "a", "b", "c" }) do
			theme.defer["lualine_" .. section .. "_inactive"] = inactive
		end

		-- mini.statusline
		theme.highlights.MiniStatuslineInactive = inactive
	end

	options.on_highlights(theme.highlights, theme.colors)

	if config.is_day() then
		util.invert_colors(theme.colors)
		util.invert_highlights(theme.highlights)
	end

	return theme
end

return M
