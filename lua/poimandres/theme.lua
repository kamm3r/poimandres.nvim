local M = {}

---@param options Options
function M._load(options)
	local h = require('rose-pine.util').highlight
	local p = require('rose-pine.palette')

	local groups = options.groups or {}
	local maybe = {
		base = (options.disable_background and p.none) or groups.background,
		surface = (options.disable_float_background and p.none) or groups.panel,
		italic = not options.disable_italics,
	}
	maybe.bold_vert_split = (options.bold_vert_split and groups.border)
		or p.none
	maybe.dim_nc_background = (
		options.dim_nc_background and groups.background_nc
		) or maybe.base

	-- Comment = { fg = c.comment, style = options.styles.comments }, -- any comment
	h('ColorColumn', { bg = p.gray }) -- used for the columns set with 'colorcolumn'
	h('Conceal', { bg = p.none })     -- placeholder characters substituted for concealed text (see 'conceallevel')
	h('Cursor', { fg = p.gray })      -- character under the cursor
	h('CursorColumn', { bg = p.focus }) -- Screen-column at the cursor, when 'cursorcolumn' is set.
	-- lCursor = { fg = c.bg, bg = c.fg }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
	-- CursorIM', {}, -- like Cursor, but used when in IME mode |CursorIM|
	h('CursorLine', { bg = p.focus }) -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
	h('CursorLineNr', { fg = p.text })
	h('DarkenedPanel', { bg = groups.panel })
	h('DarkenedStatusline', { bg = groups.panel })
	h('DiffAdd', { bg = groups.git_add, blend = 50 })    -- diff mode: Added line |diff.txt|
	h('DiffChange', { bg = p.gray })                     -- diff mode: Changed line |diff.txt|
	h('DiffDelete', { bg = groups.git_delete, blend = 50 }) -- diff mode: Deleted line |diff.txt|
	h('DiffText', { bg = groups.git_text, blend = 50 })  -- diff mode: Changed text within a changed line |diff.txt|
	h('Directory', { fg = p.desaturatedBlue, bg = p.none }) -- directory names (and other special names in listings)
	-- h('EndOfBuffer', {})
	h('ErrorMsg', { fg = p.hotRed, bold = true })        -- error messages on the command line
	h('FloatBorder', { fg = groups.border })
	h('FloatTitle', { fg = p.darkerGray })
	h('FoldColumn', { fg = p.darkerGray })              -- 'foldcolumn'
	h('Folded', { fg = p.text, bg = groups.panel })     -- line used for closed folds
	h('IncSearch', { fg = p.selection, bg = p.lightBlue }) -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
	h('CurSearch', { link = 'IncSearch' })
	h('LineNr', { fg = p.bluishGray })                  -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
	h('MatchParen', { bg = p.bluishGray, fg = p.selection })
	h('ModeMsg', { fg = p.desaturatedBlue })
	h('MoreMsg', { fg = p.desaturatedBlue })
	h('NonText', { fg = p.bluishGrayBrighter })
	h('Normal', { fg = p.text, bg = maybe.base })
	h('NormalNC', { fg = p.text, bg = maybe.dim_nc_background })
	h('NormalSB', { fg = p.text, bg = maybe.dim_nc_background }) -- normal text in sidebar
	h('NormalFloat', { fg = p.text, bg = maybe.surface })
	h('NvimInternalError', { fg = '#ffffff', bg = p.hotRed })
	h('Pmenu', { fg = p.gray, bg = maybe.surface }) -- Popup menu: normal item.
	h('PmenuSbar', { bg = p.darkerGray })
	h('PmenuSel', { fg = p.text, bg = p.focus })
	h('PmenuThumb', { bg = p.bluishGray })
	h('Question', { fg = p.brightYellow })
	-- h('QuickFixLine', {})
	-- h('RedrawDebugNormal', {})
	h('RedrawDebugClear', { fg = '#ffffff', bg = p.brightYellow })
	h('RedrawDebugComposed', { fg = '#ffffff', bg = p.lowerMint })
	h('RedrawDebugRecompose', { fg = '#ffffff', bg = p.hotRed })
	h('Search', { bg = p.bluishGray })
	h('SpecialKey', { fg = p.brightMint })
	h('SpellBad', { sp = p.hotRed, undercurl = true })
	h('SpellCap', { sp = p.lowerBlue, undercurl = true })
	h('SpellLocal', { sp = p.brightYellow, undercurl = true })
	h('SpellRare', { sp = p.lowerBlue, undercurl = true })
	h('SignColumn', { fg = p.text, bg = p.none })
	h('SignColumnSB', { fg = p.text, bg = p.none })              -- column where |signs| are displayed
	h('StatusLine', { fg = p.desaturatedBlue, bg = maybe.surface }) -- status line of current window
	h('StatusLineNC', { fg = p.desaturatedBlue, bg = maybe.base }) -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
	h('TabLine', { fg = p.desaturatedBlue, bg = maybe.surface }) -- tab pages line, not active tab page label
	h('StatusLineTerm', { link = 'StatusLine' })
	h('StatusLineTermNC', { link = 'StatusLineNC' })
	h('TabLineFill', { bg = maybe.surface })
	h('TabLineSel', { fg = p.text, bg = p.focus })
	h('Title', { fg = p.text })
	h('VertSplit', { fg = groups.border, bg = maybe.bold_vert_split })
	h('Visual', { bg = p.bluishGray })
	-- h('VisualNOS', {})
	h('WarningMsg', { fg = p.brightYellow })
	-- h('Whitespace', { fg = p.bluishGray })
	h('WildMenu', { link = 'IncSearch' })
	-- These groups are not listed as default vim groups,
	-- but they are defacto standard group names for syntax highlighting.
	-- commented out groups should chain up to their "preferred" group by
	-- default,
	-- Uncomment and edit if you want more specific syntax highlighting.

	h('Bold', { bold = true })
	h('Boolean', { fg = p.brightMint }) --  a boolean constant: TRUE, false
	h('Character', { fg = p.hotRed }) --  a character constant: 'c', '\n'
	h('Comment', { fg = p.gray })    -- (preferred) any special symbol
	h('Conditional', { fg = p.gray }) --  if, then, else, endif, switch, etc.
	h('Constant', { fg = p.text })   -- (preferred) any constant
	-- h('Debug', { }) --    debugging statements
	-- h('Define',        = { }) --   preprocessor #define
	h('Delimiter', { fg = p.gray })         --  character that needs attention
	h('Error', { fg = p.hotRed })           -- (preferred) any erroneous construct
	h('Exception', { fg = p.desaturatedBlue }) --  try, catch, throw
	h('Float', { fg = p.brightMint })       --    a floating point constant: 2.3e10
	h('Function', { fg = p.lightBlue })     -- function name (also: methods for classes)
	h('Identifier', { fg = p.gray })        -- (preferred) any variable name
	-- h('Ignore', { }) -- (preferred) left blank, hidden  |hl-Ignore|
	h('Include', { fg = p.gray })           --  preprocessor #include
	h('Keyword', { fg = p.desaturatedBlue }) --  any other keyword
	h('Label', { fg = p.text })             --    case, default, etc.
	h('Italic', { italic = true })
	-- h('Macro',         = { }) --    same as Define
	h('Number', { fg = p.brightMint })                --   a number constant: 234, 0xff
	h('Operator', { fg = p.lightBlue })               -- "sizeof", "+", "*", etc.
	-- h('PreCondit',     = { }) --  preprocessor #if, #else, #endif, etc.
	h('PreProc', { fg = p.text })                     -- (preferred) generic Preprocessor
	h('Repeat', { fg = p.desaturatedBlue })           --   for, do, while, etc.
	h('Special', { fg = p.darkerGray })               -- (preferred) any special symbol
	-- h('SpecialChar', { }) --  special character in a constant
	h('SpecialComment', { fg = p.gray })              -- special things inside a comment
	h('Statement', { fg = p.text })                   -- (preferred) any statement
	-- h('StorageClass', { }) -- static, register, volatile, etc.
	h('String', { fg = p.brightMint })                --   a string constant: "this is a string"
	h('Structure', { fg = p.gray })                   --  struct, union, enum, etc. ]]
	h('Tag', { fg = p.text })                         --    you can use CTRL-] on this
	h('Todo', { bg = p.brightYellow, fg = p.selection }) -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
	h('Type', { fg = p.gray })                        -- (preferred) int, long, char, etc.
	h('Typedef', { link = 'Type' })                   --  A typedef
	h('Underlined', { underline = true })             -- (preferred) text that stands out, HTML links
	h('htmlH1', { fg = groups.headings.h1, bold = true })
	h('htmlH2', { fg = groups.headings.h2, bold = true })
	h('htmlH3', { fg = groups.headings.h3, bold = true })
	h('htmlH4', { fg = groups.headings.h4, bold = true })
	h('htmlH5', { fg = groups.headings.h5, bold = true })
	-- h('mkdHeading', { fg = c.orange, style = "bold" })
	-- h('mkdCode', { bg = c.terminal_black, fg = c.fg })
	h('mkdCodeDelimiter', { bg = p.selection, fg = p.text })
	h('mkdCodeStart', { fg = p.lowerMint, bold = true })
	h('mkdCodeEnd', { fg = p.lowerMint, bold = true })
	h('mkdLink', { fg = p.lowerBlue, underline = true })
	h('markdownHeadingDelimiter', { fg = p.bluishGrayBrighter, bold = true })
	h('markdownCode', { fg = p.gray })
	h('markdownCodeBlock', { fg = p.lowerMint })
	h('markdownH1', { fg = p.lightBlue, bold = true })
	h('markdownH2', { fg = p.lightBlue, bold = true })
	h('markdownH3', { fg = p.lightBlue, bold = true })
	h('markdownH4', { fg = p.lightBlue, bold = true })
	h('markdownLinkText', { fg = p.lowerBlue, underline = true })
	-- These groups are for the native LSP client. Some other LSP clients may
	-- use these groups, or use their own. Consult your LSP client's
	-- documentation.
	h('LspReferenceText', { bg = p.lightBlue }) -- used for highlighting "text" references
	h('LspReferenceRead', { bg = p.lightBlue }) -- used for highlighting "read" references
	h('LspReferenceWrite', { bg = p.lightBlue }) -- used for highlighting "write" references
	h('DiagnosticError', { fg = groups.error }) -- Used as the base highlight group. Other Diagnostic highlights link to this by default
	h('DiagnosticHint', { fg = groups.hint })  -- Used as the base highlight group. Other Diagnostic highlights link to this by default
	h('DiagnosticInfo', { fg = groups.info })  -- Used as the base highlight group. Other Diagnostic highlights link to this by default
	h('DiagnosticWarn', { fg = groups.warn })  -- Used as the base highlight group. Other Diagnostic highlights link to this by default
	-- DiagnosticUnnecessary = { fg = c.black }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

	h('DiagnosticUnderlineError', { sp = groups.error, undercurl = true }) -- Used to underline "Error" diagnostics
	h('DiagnosticUnderlineHint', { sp = groups.hint, undercurl = true }) -- Used to underline "Hint" diagnostics
	h('DiagnosticUnderlineInfo', { sp = groups.info, undercurl = true }) -- Used to underline "Information" diagnostics
	h('DiagnosticUnderlineWarn', { sp = groups.warn, undercurl = true }) -- Used to underline "Warning" diagnostics
	h('DiagnosticVirtualTextError', { fg = groups.error })               -- Used for "Error" diagnostic virtual text
	h('DiagnosticVirtualTextHint', { fg = groups.hint })                 -- Used for "Hint" diagnostic virtual text
	h('DiagnosticVirtualTextInfo', { fg = groups.info })                 -- Used for "Information" diagnostic virtual text
	h('DiagnosticVirtualTextWarn', { fg = groups.warn })                 -- Used for "Warning" diagnostic virtual text
	h('LspSignatureActiveParameter', { bg = p.gray })
	-- lsp-highlight-codelens
	h('LspCodeLens', { fg = p.gray })             -- virtual text of code lens
	h('LspCodeLensSeparator', { fg = p.bluishGray }) -- separator between two or more code lens

	-- Treesitter
	h('@boolean', { link = 'Boolean' })
	h('@character', { link = 'Character' })
	h('@character.special', { link = '@character' })
	h('@class', { fg = p.lightBlue })
	h('@comment', { link = 'Comment' })
	h('@conditional', { link = 'Conditional' })
	h('@constant', { link = 'Constant' })
	h('@constant.builtin', { fg = p.lightBlue })
	h('@constant.macro', { link = '@constant' })
	h('@constant.falsy', { fg = p.hotRed })
	h('@constructor', { fg = p.brightMint })
	h('@field', { fg = p.text })
	h('@function', { link = 'Function' })
	h('@function.builtin', { fg = p.lightBlue })
	h('@function.macro', { link = '@function' })
	h('@function.call', { fg = p.gray })
	h('@include', { link = 'Include' })
	h('@interface', { fg = p.lightBlue })
	h('@keyword', { link = 'Keyword' })
	h('@keyword.function', { fg = p.lowerMint })
	h('@keyword.operator', { fg = p.brightMint })
	h('@keyword.return', { fg = p.lowerMint })
	h('@label', { link = 'Label' })
	h('@macro', { link = 'Macro' })
	h('@method', { fg = p.brightMint })
	h('@number', { link = 'Number' })
	h('@operator', { link = 'Operator' })
	h('@parameter', { fg = p.text, italic = true })
	h('@preproc', { link = 'PreProc' })
	h('@property', { fg = p.lightBlue, italic = true })
	h('@punctuation', { fg = groups.punctuation })
	h('@punctuation.bracket', { fg = p.text })
	h('@punctuation.delimiter', { link = '@punctuation' })
	h('@punctuation.special', { link = '@punctuation' })
	h('@regexp', { link = 'String' })
	h('@repeat', { link = 'Repeat' })
	h('@storageclass', { link = 'StorageClass' })
	h('@string', { link = 'String' })
	h('@string.escape', { fg = p.hotRed })
	h('@string.special', { link = '@string' })
	h('@symbol', { link = 'Identifier' })
	h('@tag', { link = 'Tag' })
	h('@tag.attribute', { fg = p.desaturatedBlue, italic = true })
	h('@tag.delimiter', { fg = p.text })
	h('@text', { fg = p.text })
	h('@text.strong', { bold = true })
	h('@text.emphasis', { italic = true })
	h('@text.underline', { underline = true })
	h('@text.strike', { strikethrough = true })
	h('@text.math', { link = 'Special' })
	h('@text.environment', { link = 'Macro' })
	h('@text.environment.name', { link = 'Type' })
	h('@text.title', { link = 'Title' })
	h('@text.uri', { fg = groups.link })
	h('@text.note', { link = 'SpecialComment' })
	h('@text.warning', { fg = groups.warn })
	h('@text.danger', { fg = groups.error })
	h('@todo', { link = 'Todo' })
	h('@type', { link = 'Type' })
	h('@variable', { fg = p.text })
	h('@variable.builtin', { fg = p.lightBlue })
	h('@namespace', { link = '@include' })
	-- tsx
	h('@tag.tsx', { fg = p.offWhite })
	h('@constructor.tsx', { fg = p.brightMint })
	h('@tag.delimiter.tsx', { fg = p.gray })
	-- LSP Semantic Token Groups
	h('@lsc.type.boolean', { link = "@boolean" })
	h('@lsc.type.builtinType', { link = "@type.builtin" })
	h('@lsc.type.comment', { link = "@comment" })
	h('@lsc.type.enum', { link = "@type" })
	h('@lsc.type.enumMember', { link = "@constant" })
	h('@lsc.type.escapeSequence', { link = "@string.escape" })
	h('@lsc.type.formatSpecifier', { link = "@punctuation.special" })
	h('@lsc.type.interface', { fg = p.darkerGray })
	h('@lsc.type.keyword', { link = "@keyword" })
	h('@lsc.type.namespace', { link = "@namespace" })
	h('@lsc.type.number', { link = "@number" })
	h('@lsc.type.operator', { link = "@operator" })
	h('@lsc.type.parameter', { link = "@parameter" })
	h('@lsc.type.property', { link = "@property" })
	h('@lsc.type.selfKeyword', { link = "@variable.builtin" })
	h('@lsc.type.string.rust', { link = "@string" })
	h('@lsc.type.typeAlias', { link = "@type.definition" })
	h('@lsc.type.unresolvedReference', { undercurl = true, sp = groups.error })
	h('@lsc.type.variable', {}) -- use treesitter styles for regular variables
	h('@lsc.typemod.class.defaultLibrary', { link = "@type.builtin" })
	h('@lsc.typemod.enum.defaultLibrary', { link = "@type.builtin" })
	h('@lsc.typemod.enumMember.defaultLibrary', { link = "@constant.builtin" })
	h('@lsc.typemod.function.defaultLibrary', { link = "@function.builtin" })
	h('@lsc.typemod.keyword.async', { link = "@keyword.coroutine" })
	h('@lsc.typemod.macro.defaultLibrary', { link = "@function.builtin" })
	h('@lsc.typemod.method.defaultLibrary', { link = "@function.builtin" })
	h('@lsc.typemod.operator.injected', { link = "@operator" })
	h('@lsc.typemod.string.injected', { link = "@string" })
	h('@lsc.typemod.type.defaultLibrary', { fg = p.darkerGray })
	h('@lsc.typemod.variable.defaultLibrary', { link = "@variable.builtin" })
	h('@lsc.typemod.variable.injected', { link = "@variable" })
	-- NOTE: maybe add these with distinct highlights?
	-- ["@lsc.typemod.variable.globalScope"] (global variables)

	-- ts-rainbow
	h('rainbowcol1', { fg = p.lowerBlue })
	h('rainbowcol2', { fg = p.brightMint })
	h('rainbowcol3', { fg = p.brightYellow })
	h('rainbowcol4', { fg = p.lightBlue })
	h('rainbowcol5', { fg = p.lowerMint })
	h('rainbowcol6', { fg = p.hotRed })
	h('rainbowcol7', { fg = p.desaturatedBlue })
	-- ts-rainbow2 (maintained fork)
	h('TSRainbowRed', { fg = p.lowerBlue })
	h('TSRainbowbrightMint', { fg = p.brightMint })
	h('TSRainbowYellow', { fg = p.brightYellow })
	h('TSRainbowGreen', { fg = p.lightBlue })
	h('TSRainbowBlue', { fg = p.lowerMint })
	h('TSRainbowViolet', { fg = p.hotRed })
	h('TSRainbowdesaturatedBlue', { fg = p.desaturatedBlue })
	-- LspTrouble
	h('TroubleText', { fg = p.offWhite })
	h('TroubleCount', { fg = p.hotRed, bg = p.focus })
	h('TroubleNormal', { fg = p.darkerGray, bg = p.darkerGray })
	-- Illuminate
	h('illuminatedWord', { bg = p.focus })
	h('illuminatedCurWord', { bg = p.focus })
	h('IlluminatedWordText', { bg = p.focus })
	h('IlluminatedWordRead', { bg = p.focus })
	h('IlluminatedWordWrite', { bg = p.focus })
	-- diff
	h('diffAdded', { fg = groups.git_add })
	h('diffRemoved', { fg = groups.git_delete })
	h('diffChanged', { fg = groups.git_change })
	h('diffOldFile', { fg = p.brightYellow })
	h('diffNewFile', { fg = p.brightMint })
	h('diffFile', { fg = p.lowerMint })
	h('diffLine', { fg = p.comment })
	h('diffIndexLine', { fg = p.hotRed })
	-- Neogit
	h('NeogitBranch', { fg = p.pink })
	h('NeogitRemote', { fg = p.gray })
	h('NeogitHunkHeader', { bg = p.focus })
	h('NeogitHunkHeaderHighlight', { bg = p.focus })
	h('NeogitDiffContextHighlight', { bg = p.focus })
	h('NeogitDiffDeleteHighlight', { fg = p.hotRed, bg = p.focus })
	h('NeogitDiffAddHighlight', { fg = p.brightMint, bg = p.focus })
	-- Neotest
	h('NeotestPassed', { fg = p.lowerMint })
	h('NeotestRunning', { fg = p.brightYellow })
	h('NeotestFailed', { fg = p.hotRed })
	h('NeotestSkipped', { fg = p.bluishGray })
	h('NeotestTest', { fg = p.fg_sidebar })
	h('NeotestNamespace', { fg = p.desaturatedBlue })
	h('NeotestFocused', { fg = p.brightYellow })
	h('NeotestFile', { fg = p.lightBlue })
	h('NeotestDir', { fg = p.lowerMint })
	h('NeotestBorder', { fg = p.lowerMint })
	h('NeotestIndent', { fg = p.fg_sidebar })
	h('NeotestExpandMarker', { fg = p.fg_sidebar })
	h('NeotestAdapterName', { fg = p.desaturatedBlue, bold = true })
	h('NeotestWinSelect', { fg = p.lowerMint })
	h('NeotestMarked', { fg = p.lowerMint })
	h('NeotestTarget', { fg = p.lowerMint })
	--[[ NeotestUnknown = {}, ]]
	-- GitGutter
	h('GitGutterAdd', { fg = groups.git_add })     -- diff mode: Added line |diff.txt|
	h('GitGutterChange', { fg = groups.git_change }) -- diff mode: Changed line |diff.txt|
	h('GitGutterDelete', { fg = groups.git_delete }) -- diff mode: Deleted line |diff.txt|
	h('GitGutterAddLineNr', { fg = groups.git_add })
	h('GitGutterChangeLineNr', { fg = groups.git_change })
	h('GitGutterDeleteLineNr', { fg = groups.git_delete })
	-- GitSigns
	h('GitSignsAdd', { fg = groups.git_add, bg = p.bg })
	h('GitSignsChange', { fg = groups.git_change, bg = p.bg })
	h('GitSignsDelete', { fg = groups.git_delete, bg = p.bg })
	-- Telescope
	h('TelescopeBorder', { fg = p.border })
	h('TelescopeMatching', { fg = p.brightMint })
	h('TelescopeNormal', { fg = p.offWhite })
	h('TelescopePromptNormal', { fg = p.offWhite })
	h('TelescopePromptPrefix', { fg = p.gray })
	h('TelescopeSelection', { fg = p.offWhite, bg = p.gray })
	h('TelescopeSelectionCaret', { fg = p.pink, bg = p.gray })
	h('TelescopeTitle', { fg = p.darkerGray })
	-- NvimTree
	h('NvimTreeNormal', { fg = p.darkerGray, bg = p.darkerGray })
	h('NvimTreeWinSeparator', { fg = p.darkerGray, bg = p.darkerGray })
	h('NvimTreeNormalNC', { fg = p.darkerGray, bg = p.darkerGray })
	h('NvimTreeRootFolder', { fg = p.brightMint })
	h('NvimTreeGitDirty', { fg = p.BluishGrayBrighter })
	h('NvimTreeGitNew', { fg = groups.git_add })
	h('NvimTreeGitDeleted', { fg = groups.git_delete })
	h('NvimTreeOpenedFile', { fg = p.offWhite, bg = p.focus })
	h('NvimTreeSpecialFile', { fg = p.gray, underline = true })
	h('NvimTreeIndentMarker', { fg = p.border })
	h('NvimTreeImageFile', { fg = p.offWhite })
	h('NvimTreeSymlink', { fg = p.lowerBlue })
	h('NvimTreeFolderIcon', { fg = p.desaturatedBlue })
	-- NvimTreeOpenedFolderName = { link = 'NvimTreeFolderName' },

	h('NeoTreeNormal', { fg = p.darkerGray, bg = p.darkerGray })
	h('NeoTreeNormalNC', { fg = p.darkerGray, bg = p.darkerGray })
	h('NeoTreeDimText', { fg = p.border })
	-- Fern
	h('FernBranchText', { fg = p.lowerMint })
	-- glyph palette
	h('GlyphPalette1', { fg = p.pink })
	h('GlyphPalette2', { fg = p.brightMint })
	h('GlyphPalette3', { fg = p.brightYellow })
	h('GlyphPalette4', { fg = p.lightBlue })
	h('GlyphPalette6', { fg = p.lowerBlue })
	h('GlyphPalette7', { fg = p.darkerGray })
	h('GlyphPalette9', { fg = p.hotRed })
	-- Dashboard
	h('DashboardShortCut', { fg = p.desaturatedBlue })
	h('DashboardHeader', { fg = p.lightBlue })
	h('DashboardCenter', { fg = p.hotRed })
	h('DashboardFooter', { fg = p.brightYellow, italic = true })
	-- Alpha
	h('AlphaShortcut', { fg = p.brightMint })
	h('AlphaHeader', { fg = p.lowerBlue })
	h('AlphaHeaderLabel', { fg = p.brightMint })
	h('AlphaFooter', { fg = p.lightBlue })
	h('AlphaButtons', { fg = p.desaturatedBlue })
	-- WhichKey
	h('WhichKey', { fg = p.offWhite })
	h('WhichKeyGroup', { fg = p.offWhite })
	h('WhichKeyDesc', { fg = p.offWhite })
	h('WhichKeySeparator', { fg = p.offWhite })
	h('WhichKeyFloat', { bg = p.bg_sidebar })
	h('WhichKeyValue', { fg = p.offWhite })
	-- LspSaga
	h('DiagnosticWarning', { link = "DiagnosticWarn" })
	h('DiagnosticInformation', { link = "DiagnosticInfo" })
	h('LspFloatWinBorder', { fg = p.border })
	h('LspFloatWinNormal', { bg = p.darkerGray })
	h('LspSagaBorderTitle', { fg = p.darkerGray })
	h('LspSagaHoverBorder', { fg = p.border })
	h('LspSagaRenameBorder', { fg = p.brightYellow })
	h('LspSagaDefPreviewBorder', { fg = p.border })
	h('LspSagaCodeActionBorder', { fg = p.border })
	h('LspSagaFinderSelection', { fg = p.brightYellow })
	h('LspSagaCodeActionTitle', { fg = p.brightYellow, bold = true })
	h('LspSagaCodeActionContent', { fg = p.lightBlue })
	h('LspSagaSignatureHelpBorder', { fg = p.brightYellow })
	h('DefinitionCount', { fg = p.lowerBlue })
	h('DefinitionIcon', { fg = p.lowerBlue })
	h('ReferencesCount', { fg = p.lowerBlue })
	h('ReferencesIcon', { fg = p.lowerBlue })
	h('TargetWord', { fg = p.offWhite })
	-- healthcheck
	h('healthError', { fg = groups.error })
	h('healthSuccess', { fg = groups.info })
	h('healthWarning', { fg = groups.warn })
	-- BufferLine
	h('BufferLineIndicatorSelected', { fg = groups.git_change })
	-- Barbar
	h('BufferCurrent', { fg = p.offWhite, bg = p.bg })
	h('BufferCurrentIndex', { fg = p.offWhite, bg = p.bg })
	h('BufferCurrentMod', { fg = p.brightMint, bg = p.bg })
	h('BufferCurrentSign', { fg = p.gray, bg = p.bg })
	h('BufferCurrentTarget', { fg = p.brightYellow, bg = p.bg })
	h('BufferInactive', { fg = p.gray })
	h('BufferInactiveIndex', { fg = p.gray })
	h('BufferInactiveMod', { fg = p.brightMint })
	h('BufferInactiveSign', { fg = p.darkerGray })
	h('BufferInactiveTarget', { fg = p.brightYellow })
	h('BufferTabpageFill', { fg = p.bg, bg = p.bg })
	h('BufferVisible', { fg = p.gray })
	h('BufferVisibleIndex', { fg = p.gray })
	h('BufferVisibleMod', { fg = p.brightMint })
	h('BufferVisibleSign', { fg = p.darkerGray })
	h('BufferVisibleTarget', { fg = p.brightYellow })
	h('Sneak', { fg = p.border, bg = p.hotRed })
	h('SneakScope', { bg = p.bg_visual })
	-- Hop
	h('HopNextKey', { fg = p.lowerBlue })
	h('HopNextKey1', { fg = p.brightMint })
	h('HopNextKey2', { fg = p.lowerMint })
	h('HopUnmatched', { fg = p.bluishGray })
	h('HopCursor', { fg = p.desaturatedBlue })
	-- Cmp
	h('CmpItemAbbr', { fg = p.darkerGray })
	h('CmpItemAbbrDeprecated', { fg = p.hotRed, strikethrough = true })
	h('CmpItemAbbrMatch', { fg = p.offWhite, bold = true })
	h('CmpItemAbbrMatchFuzzy', { fg = p.brightMint, bold = true })
	h('CmpItemKind', { fg = p.desaturatedBlue })
	h('CmpItemKindClass', { fg = p.brightYellow })
	h('CmpItemKindFunction', { fg = p.lowerBlue })
	h('CmpItemKindInterface', { fg = p.lightBlue })
	h('CmpItemKindMethod', { fg = p.hotRed })
	h('CmpItemKindSnippet', { fg = p.gray })
	h('CmpItemKindVariable', { fg = p.brightMint })
	-- navic
	h('NavicIconsFile', { fg = p.darkerGray, bg = p.none })
	h('NavicIconsModule', { fg = p.brightYellow, bg = p.none })
	h('NavicIconsNamespace', { fg = p.darkerGray, bg = p.none })
	h('NavicIconsPackage', { fg = p.darkerGray, bg = p.none })
	h('NavicIconsClass', { fg = p.brightMint, bg = p.none })
	h('NavicIconsMethod', { fg = p.lowerBlue, bg = p.none })
	h('NavicIconsProperty', { fg = p.offWhite, bg = p.none })
	h('NavicIconsField', { fg = p.offWhite, bg = p.none })
	h('NavicIconsConstructor', { fg = p.brightMint, bg = p.none })
	h('NavicIconsEnum', { fg = p.brightMint, bg = p.none })
	h('NavicIconsInterface', { fg = p.brightMint, bg = p.none })
	h('NavicIconsFunction', { fg = p.lowerBlue, bg = p.none })
	h('NavicIconsVariable', { fg = p.hotRed, bg = p.none })
	h('NavicIconsConstant', { fg = p.hotRed, bg = p.none })
	h('NavicIconsString', { fg = p.lowerMint, bg = p.none })
	h('NavicIconsNumber', { fg = p.brightMint, bg = p.none })
	h('NavicIconsBoolean', { fg = p.brightMint, bg = p.none })
	h('NavicIconsArray', { fg = p.brightMint, bg = p.none })
	h('NavicIconsObject', { fg = p.brightMint, bg = p.none })
	h('NavicIconsKey', { fg = p.desaturatedBlue, bg = p.none })
	h('NavicIconsKeyword', { fg = p.desaturatedBlue, bg = p.none })
	h('NavicIconsNull', { fg = p.brightMint, bg = p.none })
	h('NavicIconsEnumMember', { fg = p.offWhite, bg = p.none })
	h('NavicIconsStruct', { fg = p.brightMint, bg = p.none })
	h('NavicIconsEvent', { fg = p.brightMint, bg = p.none })
	h('NavicIconsOperator', { fg = p.darkerGray, bg = p.none })
	h('NavicIconsTypeParameter', { fg = p.brightMint, bg = p.none })
	h('NavicText', { fg = p.darkerGray, bg = p.none })
	h('NavicSeparator', { fg = p.darkerGray, bg = p.none })
	h('IndentBlanklineChar', { fg = p.focus, nocombine = true })
	h('IndentBlanklineContextChar', { fg = p.desaturatedBlue, nocombine = true })
	-- Scrollbar
	h('ScrollbarHandle', { fg = p.none, bg = p.border })
	h('ScrollbarSearchHandle', { fg = p.brightMint, bg = p.border })
	h('ScrollbarSearch', { fg = p.brightMint, bg = p.none })
	h('ScrollbarErrorHandle', { fg = p.error, bg = p.border })
	h('ScrollbarError', { fg = p.error, bg = p.none })
	h('ScrollbarWarnHandle', { fg = p.warning, bg = p.border })
	h('ScrollbarWarn', { fg = p.warning, bg = p.none })
	h('ScrollbarInfoHandle', { fg = p.info, bg = p.border })
	h('ScrollbarInfo', { fg = p.info, bg = p.none })
	h('ScrollbarHintHandle', { fg = p.hint, bg = p.border })
	h('ScrollbarHint', { fg = p.hint, bg = p.none })
	h('ScrollbarMiscHandle', { fg = p.desaturatedBlue, bg = p.border })
	h('ScrollbarMisc', { fg = p.desaturatedBlue, bg = p.none })
	-- Yanky
	h('YankyPut', { link = "IncSearch" })
	h('YankyYanked', { link = "IncSearch" })
	-- Lazy
	h('LazyProgressDone', { bold = true, fg = p.lowerBlue })
	h('LazyProgressTodo', { bold = true, fg = p.focus })
	-- Notify
	--- Border
	h('NotifyERRORBorder', { fg = p.hotRed })
	h('NotifyWARNBorder', { fg = p.brightYellow })
	h('NotifyINFOBorder', { fg = p.brightMint })
	h('NotifyDEBUGBorder', { fg = p.lowerBlue })
	h('NotifyTRACEBorder', { fg = p.lowerBlue })
	--- Icons
	h('NotifyERRORIcon', { link = 'NotifyERRORBorder' })
	h('NotifyWARNIcon', { link = 'NotifyWARNBorder' })
	h('NotifyINFOIcon', { link = 'NotifyINFOBorder' })
	h('NotifyDEBUGIcon', { link = 'NotifyDEBUGBorder' })
	h('NotifyTRACEIcon', { link = 'NotifyTRACEBorder' })
	--- Title
	h('NotifyERRORTitle', { link = 'NotifyERRORBorder' })
	h('NotifyWARNTitle', { link = 'NotifyWARNBorder' })
	h('NotifyINFOTitle', { link = 'NotifyINFOBorder' })
	h('NotifyDEBUGTitle', { link = 'NotifyDEBUGBorder' })
	h('NotifyTRACETitle', { link = 'NotifyTRACEBorder' })
	-- Mini
	h('MiniCompletionActiveParameter', { underline = true })
	h('MiniCursorword', { bg = p.focus })
	h('MiniCursorwordCurrent', { bg = p.focus })
	h('MiniIndentscopeSymbol', { fg = p.lightBlue, nocombine = true })
	h('MiniIndentscopePrefix', { nocombine = true }) -- Make it invisible
	h('MiniJump', { bg = p.lowerBlue, fg = "#ffffff" })
	h('MiniJump2dSpot', { fg = p.lowerBlue, bold = true, nocombine = true })
	h('MiniStarterCurrent', { nocombine = true })
	h('MiniStarterFooter', { fg = p.brightYellow, italic = true })
	h('MiniStarterHeader', { fg = p.lowerBlue })
	h('MiniStarterInactive', { fg = groups.comment, style = groups.comments })
	h('MiniStarterItem', { fg = p.darkerGray, bg = p.bg })
	h('MiniStarterItemBullet', { fg = p.border })
	h('MiniStarterItemPrefix', { fg = groups.warning })
	h('MiniStarterSection', { fg = p.lightBlue })
	h('MiniStarterQuery', { fg = groups.info })
	h('MiniStatuslineDevinfo', { fg = p.darkerGray, bg = groups.border })
	h('MiniStatuslineFileinfo', { fg = p.darkerGray, bg = groups.border })
	h('MiniStatuslineFilename', { fg = p.darkerGray, bg = p.focus })
	h('MiniStatuslineInactive', { fg = p.lowerBlue, bg = p.bg })
	h('MiniStatuslineModeCommand', { fg = p.black, bg = p.brightYellow, bold = true })
	h('MiniStatuslineModeInsert', { fg = p.black, bg = p.lowerMint, bold = true })
	h('MiniStatuslineModeNormal', { fg = p.black, bg = p.lowerBlue, bold = true })
	h('MiniStatuslineModeOther', { fg = p.black, bg = p.brightMint, bold = true })
	h('MiniStatuslineModeReplace', { fg = p.black, bg = p.hotRed, bold = true })
	h('MiniStatuslineModeVisual', { fg = p.black, bg = p.hotRed, bold = true })
	h('MiniSurround', { bg = p.brightMint, fg = p.black })
	h('MiniTablineCurrent', { fg = p.darkerGray, bg = p.focus })
	h('MiniTablineFill', { bg = p.black })
	h('MiniTablineHidden', { fg = p.bluishGray, bg = p.bg_statusline })
	h('MiniTablineModifiedCurrent', { fg = groups.warning, bg = p.focus })
	h('MiniTablineModifiedHidden', { bg = p.bg, fg = groups.warning })
	h('MiniTablineModifiedVisible', { fg = groups.warning, bg = p.bg })
	h('MiniTablineTabpagesection', { bg = p.bg, fg = p.none })
	h('MiniTablineVisible', { fg = p.darkerGray, bg = p.bg })
	h('MiniTestEmphasis', { bold = true })
	h('MiniTestFail', { fg = p.hotRed, bold = true })
	h('MiniTestPass', { fg = p.lowerMint, bold = true })
	h('MiniTrailspace', { bg = p.hotRed })
	-- Noice
	h('NoiceCompletionItemKindDefault', { fg = p.darkerGray, bg = p.none })
	h('NoiceCompletionItemKindKeyword', { fg = p.desaturatedBlue, bg = p.none })
	h('NoiceCompletionItemKindVariable', { fg = p.hotRed, bg = p.none })
	h('NoiceCompletionItemKindConstant', { fg = p.hotRed, bg = p.none })
	h('NoiceCompletionItemKindReference', { fg = p.hotRed, bg = p.none })
	h('NoiceCompletionItemKindValue', { fg = p.hotRed, bg = p.none })
	h('NoiceCompletionItemKindFunction', { fg = p.lowerBlue, bg = p.none })
	h('NoiceCompletionItemKindMethod', { fg = p.lowerBlue, bg = p.none })
	h('NoiceCompletionItemKindConstructor', { fg = p.lowerBlue, bg = p.none })
	h('NoiceCompletionItemKindClass', { fg = p.brightMint, bg = p.none })
	h('NoiceCompletionItemKindInterface', { fg = p.brightMint, bg = p.none })
	h('NoiceCompletionItemKindStruct', { fg = p.brightMint, bg = p.none })
	h('NoiceCompletionItemKindEvent', { fg = p.brightMint, bg = p.none })
	h('NoiceCompletionItemKindEnum', { fg = p.brightMint, bg = p.none })
	h('NoiceCompletionItemKindUnit', { fg = p.brightMint, bg = p.none })
	h('NoiceCompletionItemKindModule', { fg = p.brightYellow, bg = p.none })
	h('NoiceCompletionItemKindProperty', { fg = p.offWhite, bg = p.none })
	h('NoiceCompletionItemKindField', { fg = p.offWhite, bg = p.none })
	h('NoiceCompletionItemKindTypeParameter', { fg = p.offWhite, bg = p.none })
	h('NoiceCompletionItemKindEnumMember', { fg = p.offWhite, bg = p.none })
	h('NoiceCompletionItemKindOperator', { fg = p.offWhite, bg = p.none })
	h('NoiceCompletionItemKindSnippet', { fg = p.bluishGray, bg = p.none })
	h('TreesitterContext', { bg = p.focus })
	h('Hlargs', { fg = p.brightYellow })
	-- TreesitterContext = { bg = util.darken(c.bg_visual, 0.4) },

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

	-- Set user highlights
	for group, color in pairs(options.highlight_groups) do
		h(group, color)
	end
end

return M

