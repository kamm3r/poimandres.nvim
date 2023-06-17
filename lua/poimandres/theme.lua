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
  local config = require("tokyonight.config")
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
	ColorColumn ={ bg = c.gray }, -- used for the columns set with 'colorcolumn'
	Conceal = { bg = c.none }, -- placeholder characters substituted for concealed text (see 'conceallevel')
	Cursor = { fg = c.gray},  -- character under the cursor
	CursorColumn = { bg = c.focus }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
	-- lCursor = { fg = c.bg, bg = c.fg }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
	-- CursorIM', {}, -- like Cursor, but used when in IME mode |CursorIM|
	CursorLine = { bg = c.focus }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
	CursorLineNr = { fg = c.offWhite },
	DarkenedPanel = { bg = c.bg_sidebar },
	DarkenedStatusline = { bg = c.bg_sidebar },
	
	DiffAdd = { bg = c.diff.add }, -- diff mode: Added line |diff.txt|
	DiffChange = { bg = c.diff.change }, -- diff mode: Changed line |diff.txt|
	DiffDelete = { bg = c.diff.delete}, -- diff mode: Deleted line |diff.txt|
	DiffText = { bg = c.lowerMint }, -- diff mode: Changed text within a changed line |diff.txt|
	Directory = { fg = c.desaturatedBlue, bg = c.none },  -- directory names (and other special names in listings)
	-- EndOfBuffer', {},
	ErrorMsg = { fg = c.hotRed, bold = true }, -- error messages on the command line
	FloatBorder = { fg = c.border },
	FloatTitle = { fg = c.darkerGray },
	FoldColumn = { fg = c.darkerGray }, -- 'foldcolumn'
	Folded = { fg = c.offWhite, bg = c.bg_sidebar }, -- line used for closed folds
	IncSearch = { fg = c.selection, bg = c.lightBlue }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
	CurSearch = { link = 'IncSearch' },
	LineNr = { fg = c.bluishGray }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
	MatchParen = { bg = c.bluishGray, fg = c.selection },
	ModeMsg = { fg = c.desaturatedBlue },
	MoreMsg = { fg = c.desaturatedBlue },
	NonText = { fg = c.BluishGrayBrighter },
	Normal = { fg = c.offWhite, bg = options.transparent and c.none or c.bg},
	NormalNC = { fg = c.offWhite, bg = options.transparent and c.none or options.dim_inactive and c.bg },
	NormalSB = { fg = c.fg_sidebar, bg = c.bg_sidebar }, -- normal text in sidebar
	NormalFloat = {c.fg_float, bg = c.bg_float },
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
	TabLine = { fg = c.desaturatedBlue, bg = c.bluishGray }, -- tab pages line, not active tab page label
	StatusLineTerm = { link = 'StatusLine' },
	StatusLineTermNC = { link = 'StatusLineNC' },
	TabLineFill = { bg = options.transparent and c.none or c.darkerGray },
	TabLineSel = { fg = c.offWhite, bg = c.focus },
	Title = { fg = c.offWhite },
	VertSplit = { fg = c.border},
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

	Bold = { bold = true},
	Boolean = { fg = c.brightMint },         --  a boolean constant: TRUE, false
	Character = { fg = c.hotRed },       --  a character constant: 'c', '\n'
	Comment = { fg = c.gray },     -- (preferred, any special symbol
	Conditional = { fg = c.gray }, --  if, then, else, endif, switch, etc.
	Constant = { fg = c.offWhite },         -- (preferred, any constant
	-- Debug', { }, --    debugging statements
	-- Define',        = { }, --   preprocessor #define
	Delimiter = { fg = c.gray }, --  character that needs attention
	Error = { fg = c.hotRed },         -- (preferred, any erroneous construct
	Exception = { fg = c.desaturatedBlue },     --  try, catch, throw
	Float = { fg = c.brightMint },         --    a floating point constant: 2.3e10
	Function = { fg = c.lightBlue },      -- function name (also: methods for classes,
	Identifier = { fg = c.gray }, -- (preferred, any variable name
	-- Ignore', { }, -- (preferred, left blank, hidden  |hl-Ignore|
	Include = { fg = c.gray },   --  preprocessor #include
	Keyword = { fg = c.desaturatedBlue },       --  any other keyword
	Label = { fg = c.offWhite },          --    case, default, etc.
	Italic = { italic = true },
	-- Macro',         = { }, --    same as Define
	Number = { fg = c.brightMint },                    --   a number constant: 234, 0xff
	Operator = { fg = c.lightBlue },                  -- "sizeof", "+", "*", etc.
	-- PreCondit',     = { }, --  preprocessor #if, #else, #endif, etc.
	PreProc = { fg = c.offWhite },                    -- (preferred, generic Preprocessor
	Repeat = { fg = c.desaturatedBlue },                    --   for, do, while, etc.
	Special = { fg = c.darkerGray },               -- (preferred, any special symbol
	-- SpecialChar', { }, --  special character in a constant
	SpecialComment = { fg = c.gray },        -- special things inside a comment
	Statement = { fg = c.offWhite },                  -- (preferred, any statement
	-- StorageClass', { }, -- static, register, volatile, etc.
	String = { fg = c.brightMint },                    --   a string constant: "this is a string"
	Structure = { fg = c.gray }, --  struct, union, enum, etc. ]]
	Tag = { fg = c.offWhite },                        --    you can use CTRL-] on this
	Todo = { bg = c.brightYellow, fg = c.selection }, -- (preferred, anything that needs extra attention; mostly the keywords TODO FIXME and XXX
	Type = { fg = c.gray },                  -- (preferred, int, long, char, etc.
	Typedef = { link = 'Type' },                  --  A typedef
	Underlined = { underline = true },            -- (preferred, text that stands out, HTML links

	htmlH1 = { fg =  c.lowerMint, bold = true },
	htmlH2 = { fg = c.brightYellow, bold = true },

	-- mkdHeading', { fg = c.orange, style = "bold" },
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
	LspReferenceText = { bg = c.lightBlue },  -- used for highlighting "text" references
	LspReferenceRead = { bg = c.lightBlue }, -- used for highlighting "read" references
	LspReferenceWrite = { bg = c.lightBlue },  -- used for highlighting "write" references

	DiagnosticError = { fg = c.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
	DiagnosticHint = { fg = c.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
	DiagnosticInfo = { fg = c.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
	DiagnosticWarn = { fg = c.warning },  -- Used as the base highlight group. Other Diagnostic highlights link to this by default
	-- DiagnosticUnnecessary = { fg = c.black }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

	DiagnosticUnderlineError = { sp = c.error, undercurl = true }, -- Used to underline "Error" diagnostics
	DiagnosticUnderlineHint = { sp = c.hint, undercurl = true }, -- Used to underline "Hint" diagnostics
	DiagnosticUnderlineInfo = { sp = c.info, undercurl = true }, -- Used to underline "Information" diagnostics
	DiagnosticUnderlineWarn = { sp = c.warning, undercurl = true }, -- Used to underline "Warning" diagnostics

	DiagnosticVirtualTextError = { fg = c.error }, -- Used for "Error" diagnostic virtual text
	DiagnosticVirtualTextHint = { fg = c.hint }, -- Used for "Hint" diagnostic virtual text
	DiagnosticVirtualTextInfo = { fg = c.info }, -- Used for "Information" diagnostic virtual text
	DiagnosticVirtualTextWarn = { fg = c.warning }, -- Used for "Warning" diagnostic virtual text

	LspSignatureActiveParameter = { bg = c.gray },
	-- lsp-highlight-codelens
	LspCodeLens = { fg = c.gray },          -- virtual text of code lens
	LspCodeLensSeparator = { fg = c.bluishGray }, -- separator between two or more code lens

	-- Treesitter
	["@boolean"]= { link = 'Boolean' },
	["@character"]= { link = 'Character' },
	["@characterspecial"]= { link = '@character' },
	["@class"]= { fg = c.lightBlue  },
	["@comment"]= { link = 'Comment' },
	["@conditional"]= { link = 'Conditional' },
	["@constant"]= { link = 'Constant' },
	["@constantbuiltin"]= { fg = c.lightBlue },
	["@constantmacro"]= { link = '@constant' },
	["@constantfalsy"]= { fg = c.hotRed },
	["@constructor"]= { fg = c.brightMint },
	["@field"]= { fg = c.offWhite },
	["@function"]= { link = 'Function' },
	["@functionbuiltin"]= { fg = c.lightBlue },
	["@functionmacro"]= { link = '@function' },
	["@functioncall"]= { fg = c.gray },
	["@include"]= { link = 'Include' },
	["@interface"]= { fg = c.lightBlue },
	["@keyword"]= { link = 'Keyword' },
	["@keywordfunction"]= { fg = c.lowerMint },
	["@keywordoperator"]= { fg = c.brightMint },
	["@keywordreturn"]= { fg = c.lowerMint },
	["@label"]= { link = 'Label' },
	["@macro"]= { link = 'Macro' },
	["@method"]= { fg = c.brightMint },
	["@number"]= { link = 'Number' },
	["@operator"]= { link = 'Operator' },
	["@parameter"]= { fg = c.offWhite, italic = true },
	["@preproc"]= { link = 'PreProc' },
	["@property"]= { fg = c.lightBlue, italic = true},
	["@punctuation"]= { fg = c.desaturatedBlue },
	["@punctuationbracket"]= { fg = c.offWhite },
	["@punctuationdelimiter"]={ link = '@punctuation' },
	["@punctuationspecial"]={ link = '@punctuation' },
	["@regexp"]= { link = 'String' },
	["@repeat"]= { link = 'Repeat' },
	["@storageclass"]= { link = 'StorageClass' },
	["@string"]= { link = 'String' },
	["@stringescape"]= { fg = c.hotRed },
	["@stringspecial"]= { link = '@string' },
	["@symbol"]= { link = 'Identifier' },
	["@tag"]= { link = 'Tag' },
	["@tagattribute"]= { fg = c.desaturatedBlue, italic = true },
	["@tagdelimiter"]= { fg = c.offWhite },
	["@text"]= { fg = c.offWhite },
	["@text.strong"] = { bold = true },
	["@text.emphasis"] = { italic = true },
	["@text.underline"] = { underline = true },
	["@text.strike"] = { strikethrough = true },
	["@text.math"] = { link = 'Special' },
	["@text.environment"] = { link = 'Macro' },
	["@text.environment.name"] = { link = 'Type' },
	["@text.title"] ={ link = 'Title' },
	["@text.uri"] = { fg = c.desaturatedBlue },
	["@text.note"] = { link = 'SpecialComment' },
	["@text.warning"] = { fg = c.warning },
	["@text.danger"] = { fg = c.error },
	["@todo"]= { link = 'Todo' },
	["@type"]= { link = 'Type' },
	["@variable"]= { fg = c.offWhite },
	["@variablebuiltin"]= { fg = c.lightBlue },
	["@namespace"]= { link = '@include' },

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

	-- romgrk/barbar.nvim
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

	-- mvllow/modes.nvim
	ModesCopy = { bg = c.brightYellow },
	ModesDelete = { bg = c.hotRed },
	ModesInsert = { bg = c.brightMint },
	ModesVisual = { bg = c.brightYellow },

	-- NvimTree
	NvimTreeNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },
	-- NvimTreeWinSeparator = { 
	-- 	fg = options.styles.sidebars == "transparent" and c.border or c.bg_sidebar, 
	-- 	bg = c.bg_sidebar
	-- },
	NvimTreeNormalNC = { fg = c.fg_sidebar, bg = c.bg_sidebar },
	NvimTreeRootFolder = { fg = c.brightMint },
	NvimTreeGitDirty = { fg = c.BluishGrayBrighter },
	NvimTreeGitNew = { fg = c.git.add },
	NvimTreeGitDeleted = { fg = c.git.delete },
	NvimTreeOpenedFile = { fg = c.offWhite, bg = c.focus },
	NvimTreeSpecialFile = { fg = c.gray , underline = true },
	NvimTreeIndentMarker = { fg = c.border },
	NvimTreeImageFile = { fg = c.offWhite },
	NvimTreeSymlink = { fg = c.lowerBlue },
	NvimTreeFolderIcon = { fg = c.desaturatedBlue },
	-- NvimTreeOpenedFolderName = { link = 'NvimTreeFolderName' },

	-- nvim-neo-tree/neo-tree.nvim
	NeoTreeNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },
	NeoTreeNormalNC = { fg = c.fg_sidebar, bg = c.bg_sidebar },
	NeoTreeDimText = { fg = c.border },

	-- WhichKey
	WhichKey = { fg = c.offWhite },
	WhichKeyGroup = { fg = c.offWhite },
	WhichKeyDesc = { fg = c.offWhite },
	WhichKeySeparator = { fg = c.offWhite },
	WhichKeyFloat = { bg = c.bg_sidebar },
	WhichKeyValue = { fg = c.offWhite },

	-- luka-reineke/indent-blankline.nvim
	IndentBlanklineChar = { fg = c.focus },
	IndentBlanklineContextChar = { fg = c.brightYellow, nocombine = true },
	IndentBlanklineSpaceChar = { link = 'Whitespace' },

	-- hrsh7th/nvim-cmp
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
	 TSRainbowOrange = { fg = c.brightMint },
	 TSRainbowYellow = { fg = c.brightYellow },
	 TSRainbowGreen = { fg = c.lightBlue },
	 TSRainbowBlue = { fg = c.lowerMint },
	 TSRainbowViolet = { fg = c.hotRed },
	 TSRainbowCyan = { fg = c.desaturatedBlue },

	-- Neogit
	NeogitBranch = { fg =c.pink },
	NeogitRemote = { fg = c.gray },
	NeogitHunkHeader = { bg = c.focus },
	NeogitHunkHeaderHighlight = { bg = c.focus },
	NeogitDiffContextHighlight = { bg = c.focus },
	NeogitDiffDeleteHighlight = { fg = c.hotRed, bg = c.focus },
	NeogitDiffAddHighlight = { fg = c.brightMint, bg = c.focus },

  	-- GitSigns
	GitSignsAdd = { fg = c.gitSigns.add, bg = c.bg },
	GitSignsChange = { fg = c.gitSigns.change, bg = c.bg },
	GitSignsDelete = { fg = c.gitSigns.delete, bg = c.bg },

	-- vimwiki/vimwiki
	VimwikiHR = { fg = c.darkerGray },
	VimwikiHeader1 = { fg = c.lowerMint, bold = true },
	VimwikiHeader2 = { fg = c.brightYellow, bold = true },
	VimwikiHeaderChar = { fg = c.brightYellow },
	VimwikiLink = { fg = c.offWhite, underline = true },
	VimwikiList = { fg = c.offWhite },
	VimwikiNoExistsLink = { fg = c.hotRed },

	-- nvim-neorg/neorg
	NeorgHeading1Prefix = { fg = c.lowerMint, bold = true },
	NeorgHeading1Title = { link = 'NeorgHeading1Prefix' },
	NeorgHeading2Prefix = { fg = c.brightYellow, bold = true },
	NeorgHeading2Title = { link = 'NeorgHeading2Prefix' },
	NeorgMarkerTitle = { fg = c.offWhite, bold = true },

	-- rlane/pounce.nvim
	PounceAccept = { fg = c.hotRed, bg = c.offWhite },
	PounceAcceptBest = { fg = c.offWhite, bg = c.offWhite },
	PounceGap = { link = 'Search' },
	PounceMatch = { link = 'Search' },

	-- ggandor/leac.nvim
	LeapMatch = { link = 'MatchParen' },
	LeapLabelPrimary = { link = 'IncSearch' },
	LeapLabelSecondary = { fg = c.selection, bg = c.brightYellow },

	-- Telescope
	TelescopeBorder = { fg = c.border },
	TelescopeMatching = { fg = c.brightMint },
	TelescopeNormal = { fg = c.offWhite },
	TelescopePromptNormal = { fg = c.offWhite },
	TelescopePromptPrefix = { fg = c.gray },
	TelescopeSelection = { fg = c.offWhite, bg = c.gray },
    TelescopeSelectionCaret = { fg = c.pink, bg = c.gray },
	TelescopeTitle = { fg = c.darkerGray },

	-- phaazon/hoc.nvim
	HopNextKey = { fg = c.lowerBlue },
	HopNextKey1 = { fg = c.brightMint },
	HopNextKey2 = { fg = c.lowerMint },
	HopUnmatched = { fg = c.bluishGray },
	HopCursor = { fg = c.desaturatedBlue },

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


	
	    -- LspSaga
    DiagnosticWarning = { link = "DiagnosticWarn" },
    DiagnosticInformation = { link = "DiagnosticInfo" },

	LspFloatWinBorder = { fg = c.border },
	LspFloatWinNormal = { bg = options.transparent and c.none or c.darkerGray},
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
