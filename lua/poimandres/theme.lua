local blend = require('poimandres.util').blend

local M = {}

function M.get(config)
  local p = require 'poimandres.palette'

  local theme = {}
  local groups = config.groups or {}
  local styles = {
    italic = (config.disable_italics and p.none) or 'italic',
    vert_split = (config.bold_vert_split and groups.border) or p.none,
    background = (config.disable_background and p.none) or groups.background,
    float_background = (config.disable_float_background and p.none) or groups.panel,
  }
  styles.nc_background = (config.dim_nc_background and not config.disable_background and groups.panel)
    or styles.background

  theme = {
	-- Comment = { fg = c.comment, style = options.styles.comments }, -- any comment
	ColorColumn= { bg = p.gray }, -- used for the columns set with 'colorcolumn'
    Conceal= { bg = p.none },     -- placeholder characters substituted for concealed text (see 'conceallevel')
	Cursor= { fg = p.gray },      -- character under the cursor
	CursorColumn= { bg = p.focus }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
	-- lCursor = { fg = c.bg, bg = c.fg }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
	-- CursorIM= {}, -- like Cursor, but used when in IME mode |CursorIM|
	CursorLine= { bg = p.focus }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
	CursorLineNr= { fg = p.text },
	DarkenedPanel= { bg = groups.panel },
	DarkenedStatusline= { bg = groups.panel },
	DiffAdd= { bg = groups.git_add, blend = 50 },    -- diff mode: Added line |diff.txt|
	DiffChange= { bg = p.gray },                    -- diff mode: Changed line |diff.txt|
	DiffDelete= { bg = groups.git_delete, blend = 50 }, -- diff mode: Deleted line |diff.txt|
	DiffText= { bg = groups.git_text, blend = 50 },  -- diff mode: Changed text within a changed line |diff.txt|
	Directory= { fg = p.desaturatedBlue, bg = p.none }, -- directory names (and other special names in listings)
	-- EndOfBuffer= {},
	ErrorMsg= { fg = p.hotRed, bold = true },        -- error messages on the command line
	FloatBorder= { fg = groups.border },
	FloatTitle= { fg = p.darkerGray },
	FoldColumn= { fg = p.darkerGray },              -- 'foldcolumn'
	Folded= { fg = p.text, bg = groups.panel },     -- line used for closed folds
	IncSearch= { fg = p.selection, bg = p.lightBlue }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
	CurSearch= { link = 'IncSearch' },
	LineNr= { fg = p.bluishGray },                  -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
	MatchParen= { bg = p.bluishGray, fg = p.selection },
	ModeMsg= { fg = p.desaturatedBlue },
	MoreMsg= { fg = p.desaturatedBlue },
	NonText= { fg = p.bluishGrayBrighter },
	Normal= { fg = p.text, bg = styles.background },
	NormalNC= { fg = p.text, bg = styles.nc_background },
	NormalSB= { fg = p.text, bg = styles.nc_background }, -- normal text in sidebar
	NormalFloat= { fg = p.text, bg = styles.float_background },
	NvimInternalError= { fg = '#ffffff', bg = p.hotRed },
	Pmenu= { fg = p.gray, bg = styles.float_background }, -- Popup menu: normal item.
	PmenuSbar= { bg = p.darkerGray },
	PmenuSel= { fg = p.text, bg = p.focus },
	PmenuThumb= { bg = p.bluishGray },
	Question= { fg = p.brightYellow },
	-- QuickFixLine= {},
	-- RedrawDebugNormal= {},
	RedrawDebugClear= { fg = '#ffffff', bg = p.brightYellow },
	RedrawDebugComposed= { fg = '#ffffff', bg = p.lowerMint },
	RedrawDebugRecompose= { fg = '#ffffff', bg = p.hotRed },
	Search= { bg = p.bluishGray },
	SpecialKey= { fg = p.brightMint },
	SpellBad= { sp = p.hotRed, undercurl = true },
	SpellCap= { sp = p.lowerBlue, undercurl = true },
	SpellLocal= { sp = p.brightYellow, undercurl = true },
	SpellRare= { sp = p.lowerBlue, undercurl = true },
	SignColumn= { fg = p.text, bg = p.none },
	SignColumnSB= { fg = p.text, bg = p.none },              -- column where |signs| are displayed
	StatusLine= { fg = p.desaturatedBlue, bg = styles.float_background }, -- status line of current window
	StatusLineNC= { fg = p.desaturatedBlue, bg = styles.background }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
	TabLine= { fg = p.desaturatedBlue, bg = styles.float_background }, -- tab pages line, not active tab page label
	StatusLineTerm= { link = 'StatusLine' },
	StatusLineTermNC= { link = 'StatusLineNC' },
	TabLineFill= { bg = styles.float_background },
	TabLineSel= { fg = p.text, bg = p.focus },
	Title= { fg = p.text },
	VertSplit= { fg = groups.border, bg = styles.vert_split },
	Visual= { bg = p.bluishGray },
	-- VisualNOS= {},
	WarningMsg= { fg = p.brightYellow },
	-- Whitespace= { fg = p.bluishGray },
	WildMenu= { link = 'IncSearch' },
	-- These groups are not listed as default vim groups,
	-- but they are defacto standard group names for syntax highlighting.
	-- commented out groups should chain up to their "preferred" group by
	-- default,
	-- Uncomment and edit if you want more specific syntax highlighting.

	Bold= { bold = true },
	Boolean= { fg = p.brightMint }, --  a boolean constant: TRUE, false
	Character= { fg = p.hotRed }, --  a character constant: 'c, '\n'
	Comment= { fg = p.gray },    -- (preferred) any special symbol
	Conditional= { fg = p.gray }, --  if, then, else, endif, switch, etc.
	Constant= { fg = p.text },   -- (preferred) any constant
	-- Debug= { }, --    debugging statements
	-- Define,        = { }, --   preprocessor #define
	Delimiter= { fg = p.gray },         --  character that needs attention
	Error= { fg = p.hotRed },           -- (preferred) any erroneous construct
	Exception= { fg = p.desaturatedBlue }, --  try, catch, throw
	Float= { fg = p.brightMint },       --    a floating point constant: 2.3e10
	Function= { fg = p.lightBlue },     -- function name (also: methods for classes)
	Identifier= { fg = p.gray },        -- (preferred) any variable name
	-- Ignore= { }, -- (preferred) left blank, hidden  |hl-Ignore|
	Include= { fg = p.gray },           --  preprocessor #include
	Keyword= { fg = p.desaturatedBlue }, --  any other keyword
	Label= { fg = p.text },             --    case, default, etc.
	Italic= { italic = true },
	-- Macro,         = { }, --    same as Define
	Number= { fg = p.brightMint },                --   a number constant: 234, 0xff
	Operator= { fg = p.lightBlue },               -- "sizeof", "+", "*", etc.
	-- PreCondit,     = { }, --  preprocessor #if, #else, #endif, etc.
	PreProc= { fg = p.text },                     -- (preferred) generic Preprocessor
	Repeat= { fg = p.desaturatedBlue },           --   for, do, while, etc.
	Special= { fg = p.darkerGray },               -- (preferred) any special symbol
	-- SpecialChar= { }, --  special character in a constant
	SpecialComment= { fg = p.gray },              -- special things inside a comment
	Statement= { fg = p.text },                   -- (preferred) any statement
	-- StorageClass= { }, -- static, register, volatile, etc.
	String= { fg = p.brightMint },                --   a string constant: "this is a string"
	Structure= { fg = p.gray },                   --  struct, union, enum, etc. ]]
	Tag= { fg = p.text },                         --    you can use CTRL-] on this
	Todo= { bg = p.brightYellow, fg = p.selection }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
	Type= { fg = p.gray },                        -- (preferred) int, long, char, etc.
	Typedef= { link = 'Type' },                   --  A typedef
	Underlined= { underline = true },             -- (preferred) text that stands out, HTML links
	htmlH1= { fg = groups.headings.h1, bold = true },
	htmlH2= { fg = groups.headings.h2, bold = true },
	htmlH3= { fg = groups.headings.h3, bold = true },
	htmlH4= { fg = groups.headings.h4, bold = true },
	htmlH5= { fg = groups.headings.h5, bold = true },
	-- mkdHeading= { fg = c.orange, style = "bold" },
	-- mkdCode= { bg = c.terminal_black, fg = c.fg },
	mkdCodeDelimiter= { bg = p.selection, fg = p.text },
	mkdCodeStart= { fg = p.lowerMint, bold = true },
	mkdCodeEnd= { fg = p.lowerMint, bold = true },
	mkdLink= { fg = p.lowerBlue, underline = true },
	markdownHeadingDelimiter= { fg = p.bluishGrayBrighter, bold = true },
	markdownCode= { fg = p.gray },
	markdownCodeBlock= { fg = p.lowerMint },
	markdownH1= { fg = p.lightBlue, bold = true },
	markdownH2= { fg = p.lightBlue, bold = true },
	markdownH3= { fg = p.lightBlue, bold = true },
	markdownH4= { fg = p.lightBlue, bold = true },
	markdownLinkText= { fg = p.lowerBlue, underline = true },
	-- These groups are for the native LSP client. Some other LSP clients may
	-- use these groups, or use their own. Consult your LSP client's
	-- documentation.
	LspReferenceText= { bg = p.lightBlue }, -- used for highlighting "text" references
	LspReferenceRead= { bg = p.lightBlue }, -- used for highlighting "read" references
	LspReferenceWrite= { bg = p.lightBlue }, -- used for highlighting "write" references
	DiagnosticError= { fg = groups.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
	DiagnosticHint= { fg = groups.hint },  -- Used as the base highlight group. Other Diagnostic highlights link to this by default
	DiagnosticInfo= { fg = groups.info },  -- Used as the base highlight group. Other Diagnostic highlights link to this by default
	DiagnosticWarn= { fg = groups.warn },  -- Used as the base highlight group. Other Diagnostic highlights link to this by default
	-- DiagnosticUnnecessary = { fg = c.black }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

	DiagnosticUnderlineError= { sp = groups.error, undercurl = true }, -- Used to underline "Error" diagnostics
	DiagnosticUnderlineHint= { sp = groups.hint, undercurl = true }, -- Used to underline "Hint" diagnostics
	DiagnosticUnderlineInfo= { sp = groups.info, undercurl = true }, -- Used to underline "Information" diagnostics
	DiagnosticUnderlineWarn= { sp = groups.warn, undercurl = true }, -- Used to underline "Warning" diagnostics
	DiagnosticVirtualTextError= { fg = groups.error },               -- Used for "Error" diagnostic virtual text
	DiagnosticVirtualTextHint= { fg = groups.hint },                 -- Used for "Hint" diagnostic virtual text
	DiagnosticVirtualTextInfo= { fg = groups.info },                 -- Used for "Information" diagnostic virtual text
	DiagnosticVirtualTextWarn= { fg = groups.warn },                 -- Used for "Warning" diagnostic virtual text
	LspSignatureActiveParameter= { bg = p.gray },
	-- lsp-highlight-codelens
	LspCodeLens= { fg = p.gray },             -- virtual text of code lens
	LspCodeLensSeparator= { fg = p.bluishGray }, -- separator between two or more code lens

	-- Treesitter
	['@boolean']= { link = 'Boolean' },
	['@character']= { link = 'Character' },
	['@character.special']= { link = '@character' },
	['@class']= { fg = p.lightBlue },
	['@comment']= { link = 'Comment' },
	['@conditional']= { link = 'Conditional' },
	['@constant']= { link = 'Constant' },
	['@constant.builtin']= { fg = p.lightBlue },
	['@constant.macro']= { link = '@constant' },
	['@constant.falsy']= { fg = p.hotRed },
	['@constructor']= { fg = p.brightMint },
	['@field']= { fg = p.text },
	['@function']= { link = 'Function' },
	['@function.builtin']= { fg = p.lightBlue },
	['@function.macro']= { link = '@function' },
	['@function.call']= { fg = p.gray },
	['@include']= { link = 'Include' },
	['@interface']= { fg = p.lightBlue },
	['@keyword']= { link = 'Keyword' },
	['@keyword.function']= { fg = p.lowerMint },
	['@keyword.operator']= { fg = p.brightMint },
	['@keyword.return']= { fg = p.lowerMint },
	['@label']= { link = 'Label' },
	['@macro']= { link = 'Macro' },
	['@method']= { fg = p.brightMint },
	['@number']= { link = 'Number' },
	['@operator']= { link = 'Operator' },
	['@parameter']= { fg = p.text, italic = true },
	['@preproc']= { link = 'PreProc' },
	['@property']= { fg = p.lightBlue, italic = true },
	['@punctuation']= { fg = groups.punctuation },
	['@punctuation.bracket']= { fg = p.text },
	['@punctuation.delimiter']= { link = '['@punctuation' },
	['@punctuation.special']= { link = '['@punctuation' },
	['@regexp']= { link = 'String' },
	['@repeat']= { link = 'Repeat' },
	['@storageclass']= { link = 'StorageClass' },
	['@string']= { link = 'String' },
	['@string.escape']= { fg = p.hotRed },
	['@string.special']= { link = '@string' },
	['@symbol']= { link = 'Identifier' },
	['@tag']= { link = 'Tag' },
	['@tag.attribute']= { fg = p.desaturatedBlue, italic = true },
	['@tag.delimiter']= { fg = p.text },
	['@text']= { fg = p.text },
	['@text.strong']= { bold = true },
	['@text.emphasis']= { italic = true },
	['@text.underline']= { underline = true },
	['@text.strike']= { strikethrough = true },
	['@text.math']= { link = 'Special' },
	['@text.environment']= { link = 'Macro' },
	['@text.environment.name']= { link = 'Type' },
	['@text.title']= { link = 'Title' },
	['@text.uri']= { fg = groups.link },
	['@text.note']= { link = 'SpecialComment' },
	['@text.warning']= { fg = groups.warn },
	['@text.danger']= { fg = groups.error },
	['@todo']= { link = 'Todo' },
	['@type']= { link = 'Type' },
	['@variable']= { fg = p.text },
	['@variable.builtin']= { fg = p.lightBlue },
	['@namespace']= { link = '@include' },
	-- tsx
	['@tag.tsx']= { fg = p.offWhite },
	['@constructor.tsx']= { fg = p.brightMint },
	['@tag.delimiter.tsx']= { fg = p.gray },
	-- LSP Semantic Token Groups
	['@lsc.type.boolean']= { link = "@boolean" },
	['@lsc.type.builtinType']= { link = "@type.builtin" },
	['@lsc.type.comment']= { link = "@comment" },
	['@lsc.type.enum']= { link = "@type" },
	['@lsc.type.enumMember']= { link = "@constant" },
	['@lsc.type.escapeSequence']= { link = "@string.escape" },
	['@lsc.type.formatSpecifier']= { link = "@punctuation.special" },
	['@lsc.type.interface']= { fg = p.darkerGray },
	['@lsc.type.keyword']= { link = "@keyword" },
	['@lsc.type.namespace']= { link = "@namespace" },
	['@lsc.type.number']= { link = "@number" },
	['@lsc.type.operator']= { link = "@operator" },
	['@lsc.type.parameter']= { link = "@parameter" },
	['@lsc.type.property']= { link = "@property" },
	['@lsc.type.selfKeyword']= { link = "@variable.builtin" },
	['@lsc.type.string.rust']= { link = "@string" },
	['@lsc.type.typeAlias']= { link = "@type.definition" },
	['@lsc.type.unresolvedReference']= { undercurl = true, sp = groups.error },
	['@lsc.type.variable']= {}, -- use treesitter styles for regular variables
	['@lsc.typemod.class.defaultLibrary']= { link = "@type.builtin" },
	['@lsc.typemod.enum.defaultLibrary']= { link = "@type.builtin" },
	['@lsc.typemod.enumMember.defaultLibrary']= { link = "@constant.builtin" },
	['@lsc.typemod.function.defaultLibrary']= { link = "@function.builtin" },
	['@lsc.typemod.keyword.async']= { link = "@keyword.coroutine" },
	['@lsc.typemod.macro.defaultLibrary']= { link = "@function.builtin" },
	['@lsc.typemod.method.defaultLibrary']= { link = "@function.builtin" },
	['@lsc.typemod.operator.injected']= { link = "@operator" },
	['@lsc.typemod.string.injected']= { link = "@string" },
	['@lsc.typemod.type.defaultLibrary']= { fg = p.darkerGray },
	['@lsc.typemod.variable.defaultLibrary']= { link = "@variable.builtin" },
	['@lsc.typemod.variable.injected']= { link = "@variable" },
	-- NOTE: maybe add these with distinct highlights?
	-- ["['@lsc.typemod.variable.globalScope"] (global variables)

	-- ts-rainbow
	rainbowcol1= { fg = p.lowerBlue },
	rainbowcol2= { fg = p.brightMint },
	rainbowcol3= { fg = p.brightYellow },
	trainbowcol4= { fg = p.lightBlue },
	rainbowcol5= { fg = p.lowerMint },
	rainbowcol6= { fg = p.hotRed },
	rainbowcol7= { fg = p.desaturatedBlue },
	-- ts-rainbow2 (maintained fork)
	TSRainbowRed= { fg = p.lowerBlue },
	TSRainbowbrightMint= { fg = p.brightMint },
	TSRainbowYellow= { fg = p.brightYellow },
	TSRainbowGreen= { fg = p.lightBlue },
	TSRainbowBlue= { fg = p.lowerMint },
	TSRainbowViolet= { fg = p.hotRed },
	TSRainbowdesaturatedBlue= { fg = p.desaturatedBlue },
	-- LspTrouble
	TroubleText= { fg = p.offWhite },
	TroubleCount= { fg = p.hotRed, bg = p.focus },
	TroubleNormal= { fg = p.darkerGray, bg = p.darkerGray },
	-- Illuminate
	illuminatedWord= { bg = p.focus },
	illuminatedCurWord= { bg = p.focus },
	IlluminatedWordText= { bg = p.focus },
	IlluminatedWordRead= { bg = p.focus },
	IlluminatedWordWrite= { bg = p.focus },
	-- diff
	diffAdded= { fg = groups.git_add },
	diffRemoved= { fg = groups.git_delete },
	diffChanged= { fg = groups.git_change },
	diffOldFile= { fg = p.brightYellow },
	diffNewFile= { fg = p.brightMint },
	diffFile= { fg = p.lowerMint },
	diffLine= { fg = p.comment },
	diffIndexLine= { fg = p.hotRed },
	-- Neogit
	NeogitBranch= { fg = p.pink },
	NeogitRemote= { fg = p.gray },
	NeogitHunkHeader= { bg = p.focus },
	NeogitHunkHeaderHighlight= { bg = p.focus },
	NeogitDiffContextHighlight= { bg = p.focus },
	NeogitDiffDeleteHighlight= { fg = p.hotRed, bg = p.focus },
	NeogitDiffAddHighlight= { fg = p.brightMint, bg = p.focus },
	-- Neotest
	NeotestPassed= { fg = p.lowerMint },
	NeotestRunning= { fg = p.brightYellow },
	NeotestFailed= { fg = p.hotRed },
	NeotestSkipped= { fg = p.bluishGray },
	NeotestTest= { fg = p.fg_sidebar },
	NeotestNamespace= { fg = p.desaturatedBlue },
	NeotestFocused= { fg = p.brightYellow },
	NeotestFile= { fg = p.lightBlue },
	NeotestDir= { fg = p.lowerMint },
	NeotestBorder= { fg = p.lowerMint },
	NeotestIndent= { fg = p.fg_sidebar },
	NeotestExpandMarker= { fg = p.fg_sidebar },
	NeotestAdapterName= { fg = p.desaturatedBlue, bold = true },
	NeotestWinSelect= { fg = p.lowerMint },
	NeotestMarked= { fg = p.lowerMint },
	NeotestTarget= { fg = p.lowerMint },
	--[[ NeotestUnknown = {}, ]]
	-- GitGutter
	GitGutterAdd= { fg = groups.git_add },     -- diff mode: Added line |diff.txt|
	GitGutterChange= { fg = groups.git_change }, -- diff mode: Changed line |diff.txt|
	GitGutterDelete= { fg = groups.git_delete }, -- diff mode: Deleted line |diff.txt|
	GitGutterAddLineNr= { fg = groups.git_add },
	GitGutterChangeLineNr= { fg = groups.git_change },
	GitGutterDeleteLineNr= { fg = groups.git_delete },
	-- GitSigns
	GitSignsAdd= { fg = groups.git_add, bg = p.bg },
	GitSignsChange= { fg = groups.git_change, bg = p.bg },
	GitSignsDelete= { fg = groups.git_delete, bg = p.bg },
	-- Telescope
	TelescopeBorder= { fg = p.border },
	TelescopeMatching= { fg = p.brightMint },
	TelescopeNormal= { fg = p.offWhite },
	TelescopePromptNormal= { fg = p.offWhite },
	TelescopePromptPrefix= { fg = p.gray },
	TelescopeSelection= { fg = p.offWhite, bg = p.gray },
	TelescopeSelectionCaret= { fg = p.pink, bg = p.gray },
	TelescopeTitle= { fg = p.darkerGray },
	-- NvimTree
	NvimTreeNormal= { fg = p.darkerGray, bg = p.darkerGray },
	NvimTreeWinSeparator= { fg = p.darkerGray, bg = p.darkerGray },
	NvimTreeNormalNC= { fg = p.darkerGray, bg = p.darkerGray },
	NvimTreeRootFolder= { fg = p.brightMint },
	NvimTreeGitDirty= { fg = p.BluishGrayBrighter },
	NvimTreeGitNew= { fg = groups.git_add },
	NvimTreeGitDeleted= { fg = groups.git_delete },
	NvimTreeOpenedFile= { fg = p.offWhite, bg = p.focus },
	NvimTreeSpecialFile= { fg = p.gray, underline = true },
	NvimTreeIndentMarker= { fg = p.border },
	NvimTreeImageFile= { fg = p.offWhite },
	NvimTreeSymlink= { fg = p.lowerBlue },
	NvimTreeFolderIcon= { fg = p.desaturatedBlue },
	-- NvimTreeOpenedFolderName = { link = 'NvimTreeFolderName' },

	NeoTreeNormal= { fg = p.darkerGray, bg = p.darkerGray },
	NeoTreeNormalNC= { fg = p.darkerGray, bg = p.darkerGray },
	NeoTreeDimText= { fg = p.border },
	-- Fern
	FernBranchText= { fg = p.lowerMint },
	-- glyph palette
	GlyphPalette1= { fg = p.pink },
	GlyphPalette2= { fg = p.brightMint },
	GlyphPalette3= { fg = p.brightYellow },
	GlyphPalette4= { fg = p.lightBlue },
	GlyphPalette6= { fg = p.lowerBlue },
	GlyphPalette7= { fg = p.darkerGray },
	GlyphPalette9= { fg = p.hotRed },
	-- Dashboard
	DashboardShortCut= { fg = p.desaturatedBlue },
	DashboardHeader= { fg = p.lightBlue },
	DashboardCenter= { fg = p.hotRed },
	DashboardFooter= { fg = p.brightYellow, italic = true },
	-- Alpha
	AlphaShortcut= { fg = p.brightMint },
	AlphaHeader= { fg = p.lowerBlue },
	AlphaHeaderLabel= { fg = p.brightMint },
	AlphaFooter= { fg = p.lightBlue },
	AlphaButtons= { fg = p.desaturatedBlue },
	-- WhichKey
	WhichKey= { fg = p.offWhite },
	WhichKeyGroup= { fg = p.offWhite },
	WhichKeyDesc= { fg = p.offWhite },
	WhichKeySeparator= { fg = p.offWhite },
	WhichKeyFloat= { bg = p.bg_sidebar },
	WhichKeyValue= { fg = p.offWhite },
	-- LspSaga
	DiagnosticWarning= { link = "DiagnosticWarn" },
	DiagnosticInformation= { link = "DiagnosticInfo" },
	LspFloatWinBorder= { fg = p.border },
	LspFloatWinNormal= { bg = p.darkerGray },
	LspSagaBorderTitle= { fg = p.darkerGray },
	LspSagaHoverBorder= { fg = p.border },
	LspSagaRenameBorder= { fg = p.brightYellow },
	LspSagaDefPreviewBorder= { fg = p.border },
	LspSagaCodeActionBorder= { fg = p.border },
	LspSagaFinderSelection= { fg = p.brightYellow },
	LspSagaCodeActionTitle= { fg = p.brightYellow, bold = true },
	LspSagaCodeActionContent= { fg = p.lightBlue },
	LspSagaSignatureHelpBorder= { fg = p.brightYellow },
	DefinitionCount= { fg = p.lowerBlue },
	DefinitionIcon= { fg = p.lowerBlue },
	ReferencesCount= { fg = p.lowerBlue },
	ReferencesIcon= { fg = p.lowerBlue },
	TargetWord= { fg = p.offWhite },
	-- healthcheck
	healthError= { fg = groups.error },
	healthSuccess= { fg = groups.info },
	healthWarning= { fg = groups.warn },
	-- BufferLine
	BufferLineIndicatorSelected= { fg = groups.git_change },
	-- Barbar
	BufferCurrent= { fg = p.offWhite, bg = p.bg },
	BufferCurrentIndex= { fg = p.offWhite, bg = p.bg },
	BufferCurrentMod= { fg = p.brightMint, bg = p.bg },
	BufferCurrentSign= { fg = p.gray, bg = p.bg },
	BufferCurrentTarget= { fg = p.brightYellow, bg = p.bg },
	BufferInactive= { fg = p.gray },
	BufferInactiveIndex= { fg = p.gray },
	BufferInactiveMod= { fg = p.brightMint },
	BufferInactiveSign= { fg = p.darkerGray },
	BufferInactiveTarget= { fg = p.brightYellow },
	BufferTabpageFill= { fg = p.bg, bg = p.bg },
	BufferVisible= { fg = p.gray },
	BufferVisibleIndex= { fg = p.gray },
	BufferVisibleMod= { fg = p.brightMint },
	BufferVisibleSign= { fg = p.darkerGray },
	BufferVisibleTarget= { fg = p.brightYellow },
	Sneak= { fg = p.border, bg = p.hotRed },
	SneakScope= { bg = p.bg_visual },
	-- Hop
	HopNextKey= { fg = p.lowerBlue },
	HopNextKey1= { fg = p.brightMint },
	HopNextKey2= { fg = p.lowerMint },
	HopUnmatched= { fg = p.bluishGray },
	HopCursor= { fg = p.desaturatedBlue },
	-- Cmp
	CmpItemAbbr= { fg = p.darkerGray },
	CmpItemAbbrDeprecated= { fg = p.hotRed, strikethrough = true },
	CmpItemAbbrMatch= { fg = p.offWhite, bold = true },
	CmpItemAbbrMatchFuzzy= { fg = p.brightMint, bold = true },
	CmpItemKind= { fg = p.desaturatedBlue },
	CmpItemKindClass= { fg = p.brightYellow },
	CmpItemKindFunction= { fg = p.lowerBlue },
	CmpItemKindInterface= { fg = p.lightBlue },
	CmpItemKindMethod= { fg = p.hotRed },
	CmpItemKindSnippet= { fg = p.gray },
	CmpItemKindVariable= { fg = p.brightMint },
	-- navic
	NavicIconsFile= { fg = p.darkerGray, bg = p.none },
	NavicIconsModule= { fg = p.brightYellow, bg = p.none },
	NavicIconsNamespace= { fg = p.darkerGray, bg = p.none },
	NavicIconsPackage= { fg = p.darkerGray, bg = p.none },
	NavicIconsClass= { fg = p.brightMint, bg = p.none },
	NavicIconsMethod= { fg = p.lowerBlue, bg = p.none },
	NavicIconsProperty= { fg = p.offWhite, bg = p.none },
	NavicIconsField= { fg = p.offWhite, bg = p.none },
	NavicIconsConstructor= { fg = p.brightMint, bg = p.none },
	NavicIconsEnum= { fg = p.brightMint, bg = p.none },
	NavicIconsInterface= { fg = p.brightMint, bg = p.none },
	NavicIconsFunction= { fg = p.lowerBlue, bg = p.none },
	NavicIconsVariable= { fg = p.hotRed, bg = p.none },
	NavicIconsConstant= { fg = p.hotRed, bg = p.none },
	NavicIconsString= { fg = p.lowerMint, bg = p.none },
	NavicIconsNumber= { fg = p.brightMint, bg = p.none },
	NavicIconsBoolean= { fg = p.brightMint, bg = p.none },
	NavicIconsArray= { fg = p.brightMint, bg = p.none },
	NavicIconsObject= { fg = p.brightMint, bg = p.none },
	NavicIconsKey= { fg = p.desaturatedBlue, bg = p.none },
	NavicIconsKeyword= { fg = p.desaturatedBlue, bg = p.none },
	NavicIconsNull= { fg = p.brightMint, bg = p.none },
	NavicIconsEnumMember= { fg = p.offWhite, bg = p.none },
	NavicIconsStruct= { fg = p.brightMint, bg = p.none },
	NavicIconsEvent= { fg = p.brightMint, bg = p.none },
	NavicIconsOperator= { fg = p.darkerGray, bg = p.none },
	NavicIconsTypeParameter= { fg = p.brightMint, bg = p.none },
	NavicText= { fg = p.darkerGray, bg = p.none },
	NavicSeparator= { fg = p.darkerGray, bg = p.none },
	IndentBlanklineChar= { fg = p.focus, nocombine = true },
	IndentBlanklineContextChar= { fg = p.desaturatedBlue, nocombine = true },
	-- Scrollbar
	ScrollbarHandle= { fg = p.none, bg = p.border },
	ScrollbarSearchHandle= { fg = p.brightMint, bg = p.border },
	ScrollbarSearch= { fg = p.brightMint, bg = p.none },
	ScrollbarErrorHandle= { fg = p.error, bg = p.border },
	ScrollbarError= { fg = p.error, bg = p.none },
	ScrollbarWarnHandle= { fg = p.warning, bg = p.border },
	ScrollbarWarn= { fg = p.warning, bg = p.none },
	ScrollbarInfoHandle= { fg = p.info, bg = p.border },
	ScrollbarInfo= { fg = p.info, bg = p.none },
	ScrollbarHintHandle= { fg = p.hint, bg = p.border },
	ScrollbarHint= { fg = p.hint, bg = p.none },
	ScrollbarMiscHandle= { fg = p.desaturatedBlue, bg = p.border },
	ScrollbarMisc= { fg = p.desaturatedBlue, bg = p.none },
	-- Yanky
	YankyPut= { link = "IncSearch" },
	YankyYanked= { link = "IncSearch" },
	-- Lazy
	LazyProgressDone= { bold = true, fg = p.lowerBlue },
	LazyProgressTodo= { bold = true, fg = p.focus },
	-- Notify
	--- Border
	NotifyERRORBorder= { fg = p.hotRed },
	NotifyWARNBorder= { fg = p.brightYellow },
	NotifyINFOBorder= { fg = p.brightMint },
	NotifyDEBUGBorder= { fg = p.lowerBlue },
	NotifyTRACEBorder= { fg = p.lowerBlue },
	--- Icons
	NotifyERRORIcon= { link = 'NotifyERRORBorder' },
	NotifyWARNIcon= { link = 'NotifyWARNBorder' },
	NotifyINFOIcon= { link = 'NotifyINFOBorder' },
	NotifyDEBUGIcon= { link = 'NotifyDEBUGBorder' },
	NotifyTRACEIcon= { link = 'NotifyTRACEBorder' },
	--- Title
	NotifyERRORTitle= { link = 'NotifyERRORBorder' },
	NotifyWARNTitle= { link = 'NotifyWARNBorder' },
	NotifyINFOTitle= { link = 'NotifyINFOBorder' },
	NotifyDEBUGTitle= { link = 'NotifyDEBUGBorder' },
	NotifyTRACETitle= { link = 'NotifyTRACEBorder' },
	-- Mini
	MiniCompletionActiveParameter= { underline = true },
	MiniCursorword= { bg = p.focus },
	MiniCursorwordCurrent= { bg = p.focus },
	MiniIndentscopeSymbol= { fg = p.lightBlue, nocombine = true },
	MiniIndentscopePrefix= { nocombine = true }, -- Make it invisible
	MiniJump= { bg = p.lowerBlue, fg = "#ffffff" },
	MiniJump2dSpot= { fg = p.lowerBlue, bold = true, nocombine = true },
	MiniStarterCurrent= { nocombine = true },
	MiniStarterFooter= { fg = p.brightYellow, italic = true },
	MiniStarterHeader= { fg = p.lowerBlue },
	MiniStarterInactive= { fg = groups.comment, style = groups.comments },
	MiniStarterItem= { fg = p.darkerGray, bg = p.bg },
	MiniStarterItemBullet= { fg = p.border },
	MiniStarterItemPrefix= { fg = groups.warning },
	MiniStarterSection= { fg = p.lightBlue },
	MiniStarterQuery= { fg = groups.info },
	MiniStatuslineDevinfo= { fg = p.darkerGray, bg = groups.border },
	MiniStatuslineFileinfo= { fg = p.darkerGray, bg = groups.border },
	MiniStatuslineFilename= { fg = p.darkerGray, bg = p.focus },
	MiniStatuslineInactive= { fg = p.lowerBlue, bg = p.bg },
	MiniStatuslineModeCommand= { fg = p.black, bg = p.brightYellow, bold = true },
	MiniStatuslineModeInsert= { fg = p.black, bg = p.lowerMint, bold = true },
	MiniStatuslineModeNormal= { fg = p.black, bg = p.lowerBlue, bold = true },
	MiniStatuslineModeOther= { fg = p.black, bg = p.brightMint, bold = true },
	MiniStatuslineModeReplace= { fg = p.black, bg = p.hotRed, bold = true },
	MiniStatuslineModeVisual= { fg = p.black, bg = p.hotRed, bold = true },
	MiniSurround= { bg = p.brightMint, fg = p.black },
	MiniTablineCurrent= { fg = p.darkerGray, bg = p.focus },
	MiniTablineFill= { bg = p.black },
	MiniTablineHidden= { fg = p.bluishGray, bg = p.bg_statusline },
	MiniTablineModifiedCurrent= { fg = groups.warning, bg = p.focus },
	MiniTablineModifiedHidden= { bg = p.bg, fg = groups.warning },
	MiniTablineModifiedVisible= { fg = groups.warning, bg = p.bg },
	MiniTablineTabpagesection= { bg = p.bg, fg = p.none },
	MiniTablineVisible= { fg = p.darkerGray, bg = p.bg },
	MiniTestEmphasis= { bold = true },
	MiniTestFail= { fg = p.hotRed, bold = true },
	MiniTestPass= { fg = p.lowerMint, bold = true },
	MiniTrailspace= { bg = p.hotRed },
	-- Noice
	NoiceCompletionItemKindDefault= { fg = p.darkerGray, bg = p.none },
	NoiceCompletionItemKindKeyword= { fg = p.desaturatedBlue, bg = p.none },
	NoiceCompletionItemKindVariable= { fg = p.hotRed, bg = p.none },
	NoiceCompletionItemKindConstant= { fg = p.hotRed, bg = p.none },
	NoiceCompletionItemKindReference= { fg = p.hotRed, bg = p.none },
	NoiceCompletionItemKindValue= { fg = p.hotRed, bg = p.none },
	NoiceCompletionItemKindFunction= { fg = p.lowerBlue, bg = p.none },
	NoiceCompletionItemKindMethod= { fg = p.lowerBlue, bg = p.none },
	NoiceCompletionItemKindConstructor= { fg = p.lowerBlue, bg = p.none },
	NoiceCompletionItemKindClass= { fg = p.brightMint, bg = p.none },
	NoiceCompletionItemKindInterface= { fg = p.brightMint, bg = p.none },
	NoiceCompletionItemKindStruct= { fg = p.brightMint, bg = p.none },
	NoiceCompletionItemKindEvent= { fg = p.brightMint, bg = p.none },
	NoiceCompletionItemKindEnum= { fg = p.brightMint, bg = p.none },
	NoiceCompletionItemKindUnit= { fg = p.brightMint, bg = p.none },
	NoiceCompletionItemKindModule= { fg = p.brightYellow, bg = p.none },
	NoiceCompletionItemKindProperty= { fg = p.offWhite, bg = p.none },
	NoiceCompletionItemKindField= { fg = p.offWhite, bg = p.none },
	NoiceCompletionItemKindTypeParameter= { fg = p.offWhite, bg = p.none },
	NoiceCompletionItemKindEnumMember= { fg = p.offWhite, bg = p.none },
	NoiceCompletionItemKindOperator= { fg = p.offWhite, bg = p.none },
	NoiceCompletionItemKindSnippet= { fg = p.bluishGray, bg = p.none },
	TreesitterContext= { bg = p.focus },
	Hlargs= { fg = p.brightYellow },
	-- TreesitterContext = { bg = util.darken(c.bg_visual, 0.4) },
}
	vim.g.terminal_color_0 = p.selection   -- black
	vim.g.terminal_color_8 = p.selection   -- bright black
	vim.g.terminal_color_1 = p.hotRed      -- red
	vim.g.terminal_color_9 = p.hotRed      -- bright red
	vim.g.terminal_color_2 = p.brightMint  -- green
	vim.g.terminal_color_10 = p.brightMint -- bright green
	vim.g.terminal_color_3 = p.brightYellow -- yellow
	vim.g.terminal_color_11 = p.brightYellow -- bright yellow
	vim.g.terminal_color_4 = p.lowerBlue   -- blue
	vim.g.terminal_color_12 = p.lightBlue  -- bright blue
	vim.g.terminal_color_5 = p.pink        -- magenta
	vim.g.terminal_color_13 = p.pink       -- bright magenta
	vim.g.terminal_color_6 = p.lowerBlue   -- cyan
	vim.g.terminal_color_14 = p.lightBlue  -- bright cyan
	vim.g.terminal_color_7 = p.white       -- white
	vim.g.terminal_color_15 = p.white      -- bright white

  return theme
end


return M
