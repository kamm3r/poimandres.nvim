local M = {}

---@param options Config
function M._load(options)
	local h = require('poimandres.utils').highlight
	local p = require('poimandres.palette')

	local groups = options.groups or {}
	local styles = {
		background = (options.disable_background and p.none) or groups.background,
		float_background = (options.disable_float_background and p.none) or groups.panel,
		italic = (options.disable_italics and p.none) or 'italic',
	}
	styles.bold_vert_split = (options.bold_vert_split and groups.border) or p.none
	styles.dim_nc_background = (
		options.dim_nc_background and not options.disable_background and groups.panel
		) or styles.background


	h('ColorColumn', { bg = p.blueGray1 })
	h('Conceal', { bg = p.none })
	h('CurSearch', { link = 'IncSearch' })
	-- h('Cursor', {})
	h('CursorColumn', { bg = p.background1 })
	-- h('CursorIM', {})
	h('CursorLine', { bg = p.background1 })
	h('CursorLineNr', { fg = p.text })
	h('DarkenedPanel', { bg = groups.panel })
	h('DarkenedStatusline', { bg = groups.panel })

	h('DiffAdd', { bg = groups.git_add, blend = 50 })
	h('DiffChange', { bg = p.blueGray1 })
	h('DiffDelete', { bg = groups.git_delete, blend = 50 })
	h('DiffText', { bg = groups.git_text, blend = 50 })
	h('diffAdded', { link = 'DiffAdd' })
	h('diffChanged', { link = 'DiffChange' })
	h('diffRemoved', { link = 'DiffDelete' })
	h('Directory', { fg = p.blue3, bg = p.none })
	-- h('EndOfBuffer', {})
	h('ErrorMsg', { fg = p.pink3, bold = true })
	h('FloatBorder', { fg = groups.border })
	h('FloatTitle', { fg = p.blueGray2 })
	h('FoldColumn', { fg = p.blueGray2 })
	h('Folded', { fg = p.text, bg = groups.panel })
	h('IncSearch', { fg = p.background3, bg = p.blue2 })
	h('LineNr', { fg = p.blueGray3 })
	h('MatchParen', { bg = p.blueGray3, fg = p.background3 })
	h('ModeMsg', { fg = p.blue3 })
	h('MoreMsg', { fg = p.blue3 })
	h('NonText', { fg = p.blue4 })
	h('Normal', { fg = p.text, bg = styles.background })
	h('NormalFloat', { fg = p.text, bg = styles.float_background })
	h('NormalNC', { fg = p.text, bg = styles.dim_nc_background })
	h('NvimInternalError', { fg = '#ffffff', bg = p.pink3 })
	h('Pmenu', { fg = p.blueGray1, bg = styles.float_background })
	h('PmenuSbar', { bg = p.blueGray2 })
	h('PmenuSel', { fg = p.text, bg = p.background1 })
	h('PmenuThumb', { bg = p.blueGray3 })
	h('Question', { fg = p.yellow })
	-- h('QuickFixLine', {})
	-- h('RedrawDebugNormal', {})
	h('RedrawDebugClear', { fg = '#ffffff', bg = p.yellow })
	h('RedrawDebugComposed', { fg = '#ffffff', bg = p.teal2 })
	h('RedrawDebugRecompose', { fg = '#ffffff', bg = p.pink3 })
	h('Search', { bg = p.blueGray3 })
	h('SpecialKey', { fg = p.teal1 })
	h('SpellBad', { sp = p.pink3, undercurl = true })
	h('SpellCap', { sp = p.blue1, undercurl = true })
	h('SpellLocal', { sp = p.yellow, undercurl = true })
	h('SpellRare', { sp = p.blue1, undercurl = true })
	h('SignColumn', { fg = p.text, bg = p.none })
	h('StatusLine', { fg = p.blue3, bg = styles.float_background })
	h('StatusLineNC', { fg = p.blue3, bg = styles.background })
	h('StatusLineTerm', { link = 'StatusLine' })
	h('StatusLineTermNC', { link = 'StatusLineNC' })
	h('TabLine', { fg = p.blue3, bg = styles.float_background })
	h('TabLineFill', { bg = styles.float_background })
	h('TabLineSel', { fg = p.text, bg = p.background1 })
	h('Title', { fg = p.text })
	h('VertSplit', { fg = groups.border, bg = styles.bold_vert_split })
	h('Visual', { bg = p.blueGray3 })
	-- h('VisualNOS', {})
	h('WarningMsg', { fg = p.yellow })
	-- h('Whitespace', { fg = p.blueGray3 })
	h('WildMenu', { link = 'IncSearch' })

	-- These groups are not listed as default vim groups,
	-- but they are defacto standard group names for syntax highlighting.
	-- commented out groups should chain up to their "preferred" group by
	-- default,
	-- Uncomment and edit if you want more specific syntax highlighting.

	--h('Bold', { bold = true})
	h('Boolean', { fg = p.teal1 })         --  a boolean constant: TRUE, false
	h('Character', { fg = p.pink3 })       --  a character constant: 'c', '\n'
	h('Comment', { fg = p.blueGray1 })     -- (preferred) any special symbol
	h('Conditional', { fg = p.blueGray1 }) --  if, then, else, endif, switch, etc.
	h('Constant', { fg = p.text })         -- (preferred) any constant
	-- h('Debug', { }) --    debugging statements
	-- h('Define',        = { }) --   preprocessor #define
	h('Delimiter', { fg = p.blueGray1 }) --  character that needs attention
	h('Error', { fg = p.pink3 })         -- (preferred) any erroneous construct
	h('Exception', { fg = p.blue3 })     --  try, catch, throw
	h('Float', { fg = p.teal1 })         --    a floating point constant: 2.3e10
	h('Function', { fg = p.blue2 })      -- function name (also: methods for classes)
	h('Identifier', { fg = p.blueGray1 }) -- (preferred) any variable name
	-- h('Ignore', { }) -- (preferred) left blank, hidden  |hl-Ignore|
	h('Include', { fg = p.blueGray1 })   --  preprocessor #include
	h('Keyword', { fg = p.blue3 })       --  any other keyword
	h('Label', { fg = p.text })          --    case, default, etc.
	-- h('Italic', { italic = true })
	-- h('Macro',         = { }) --    same as Define
	h('Number', { fg = p.teal1 })                    --   a number constant: 234, 0xff
	h('Operator', { fg = p.blue2 })                  -- "sizeof", "+", "*", etc.
	-- h('PreCondit',     = { }) --  preprocessor #if, #else, #endif, etc.
	h('PreProc', { fg = p.text })                    -- (preferred) generic Preprocessor
	h('Repeat', { fg = p.blue3 })                    --   for, do, while, etc.
	h('Special', { fg = p.blueGray2 })               -- (preferred) any special symbol
	-- h('SpecialChar', { }) --  special character in a constant
	h('SpecialComment', { fg = p.blueGray1 })        -- special things inside a comment
	h('Statement', { fg = p.text })                  -- (preferred) any statement
	-- h('StorageClass', { }) -- static, register, volatile, etc.
	h('String', { fg = p.teal1 })                    --   a string constant: "this is a string"
	--h('Structure', { fg = p.blueGray1 }) --  struct, union, enum, etc. ]]
	h('Tag', { fg = p.text })                        --    you can use CTRL-] on this
	h('Todo', { bg = p.yellow, fg = p.background3 }) -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
	h('Type', { fg = p.blueGray1 })                  -- (preferred) int, long, char, etc.
	h('Typedef', { link = 'Type' })                  --  A typedef
	h('Underlined', { underline = true })            -- (preferred) text that stands out, HTML links

	h('htmlH1', { fg = groups.headings.h1, bold = true })
	h('htmlH2', { fg = groups.headings.h2, bold = true })
	h('htmlH3', { fg = groups.headings.h3, bold = true })
	h('htmlH4', { fg = groups.headings.h4, bold = true })
	h('htmlH5', { fg = groups.headings.h5, bold = true })

	h('markdownHeadingDelimiter', { fg = p.blue4, bold = true })
	h('markdownCode', { fg = p.blueGray1 })
	h('markdownCodeBlock', { fg = p.teal2 })
	h('markdownH1', { fg = p.blue2, bold = true })
	h('markdownH2', { fg = p.blue2, bold = true })
	h('markdownH3', { fg = p.blue2, bold = true })
	h('markdownH4', { fg = p.blue2, bold = true })
	h('markdownLinkText', { fg = p.blue1, underline = true })

	-- h('mkdHeading', { fg = c.orange, style = "bold" })
	-- h('mkdCode', { bg = c.terminal_black, fg = c.fg })
	h('mkdCodeDelimiter', { bg = p.background3, fg = p.text })
	h('mkdCodeStart', { fg = p.teal2, bold = true })
	h('mkdCodeEnd', { fg = p.teal2, bold = true })
	h('mkdLink', { fg = p.blue1, underline = true })

	h('DiagnosticError', { fg = groups.error })
	h('DiagnosticHint', { fg = groups.hint })
	h('DiagnosticInfo', { fg = groups.info })
	h('DiagnosticWarn', { fg = groups.warn })
	h('DiagnosticDefaultError', { fg = groups.error })
	h('DiagnosticDefaultHint', { fg = groups.hint })
	h('DiagnosticDefaultInfo', { fg = groups.info })
	h('DiagnosticDefaultWarn', { fg = groups.warn })
	h('DiagnosticFloatingError', { fg = groups.error })
	h('DiagnosticFloatingHint', { fg = groups.hint })
	h('DiagnosticFloatingInfo', { fg = groups.info })
	h('DiagnosticFloatingWarn', { fg = groups.warn })
	h('DiagnosticSignError', { fg = groups.error })
	h('DiagnosticSignHint', { fg = groups.hint })
	h('DiagnosticSignInfo', { fg = groups.info })
	h('DiagnosticSignWarn', { fg = groups.warn })
	h('DiagnosticStatusLineError', { fg = groups.error, bg = groups.panel })
	h('DiagnosticStatusLineHint', { fg = groups.hint, bg = groups.panel })
	h('DiagnosticStatusLineInfo', { fg = groups.info, bg = groups.panel })
	h('DiagnosticStatusLineWarn', { fg = groups.warn, bg = groups.panel })
	h('DiagnosticUnderlineError', { sp = groups.error, undercurl = true })
	h('DiagnosticUnderlineHint', { sp = groups.hint, undercurl = true })
	h('DiagnosticUnderlineInfo', { sp = groups.info, undercurl = true })
	h('DiagnosticUnderlineWarn', { sp = groups.warn, undercurl = true })
	h('DiagnosticVirtualTextError', { fg = groups.error })
	h('DiagnosticVirtualTextHint', { fg = groups.hint })
	h('DiagnosticVirtualTextInfo', { fg = groups.info })
	h('DiagnosticVirtualTextWarn', { fg = groups.warn })

	-- healthcheck
	h('healthError', { fg = groups.error })
	h('healthSuccess', { fg = groups.info })
	h('healthWarning', { fg = groups.warn })

	-- Treesitter
	h('@boolean', { link = 'Boolean' })
	h('@character', { link = 'Character' })
	h('@character.special', { link = '@character' })
	-- h('@class', { fg = p.foam })
	h('@comment', { link = 'Comment' })
	h('@conditional', { link = 'Conditional' })
	h('@constant', { link = 'Constant' })
	h('@constant.builtin', { fg = p.blue2 })
	h('@constant.macro', { link = '@constant' })
	h('@constant.falsy', { fg = p.pink3 })
	h('@constructor', { fg = p.teal1 })
	h('@field', { fg = p.text })
	h('@function', { link = 'Function' })
	h('@function.builtin', { fg = p.blue2 })
	h('@function.macro', { link = '@function' })
	h('@function.call', { fg = p.blueGray1 })
	h('@include', { link = 'Include' })
	h('@interface', { fg = p.foam })
	h('@keyword', { link = 'Keyword' })
	h('@keyword.function', { fg = p.teal2 })
	h('@keyword.operator', { fg = p.teal1 })
	h('@keyword.return', { fg = p.teal2 })
	h('@label', { link = 'Label' })
	h('@macro', { link = 'Macro' })
	h('@method', { fg = p.teal1 })
	h('@number', { link = 'Number' })
	h('@operator', { link = 'Operator' })
	h('@parameter', { fg = p.text, italic = styles.italic })
	h('@preproc', { link = 'PreProc' })
	h('@property', { fg = p.blue2, italic = styles.italic })
	h('@punctuation', { fg = groups.punctuation })
	h('@punctuation.bracket', { fg = p.text })
	h('@punctuation.delimiter', { link = '@punctuation' })
	h('@punctuation.special', { link = '@punctuation' })
	h('@regexp', { link = 'String' })
	h('@repeat', { link = 'Repeat' })
	h('@storageclass', { link = 'StorageClass' })
	h('@string', { link = 'String' })
	h('@string.escape', { fg = p.pink3 })
	h('@string.special', { link = '@string' })
	h('@symbol', { link = 'Identifier' })
	h('@tag', { link = 'Tag' })
	h('@tag.attribute', { fg = p.blue3, styles.italic })
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
	h('@variable.builtin', { fg = p.blue2 })
	h('@namespace', { link = '@include' })

	-- LSP Semantic Token Groups
	h('@lsp.type.enum', { link = '@type' })
	h('@lsp.type.keyword', { link = '@keyword' })
	h('@lsp.type.interface', { link = '@interface' })
	h('@lsp.type.namespace', { link = '@namespace' })
	h('@lsp.type.parameter', { link = '@parameter' })
	h('@lsp.type.property', { link = '@property' })
	h('@lsp.type.variable', {}) -- use treesitter styles for regular variables
	h('@lsp.typemod.function.defaultLibrary', { link = 'Special' })
	h('@lsp.typemod.variable.defaultLibrary', { link = '@variable.builtin' })

	-- LSP Injected Groups
	h('@lsp.typemod.operator.injected', { link = '@operator' })
	h('@lsp.typemod.string.injected', { link = '@string' })
	h('@lsp.typemod.variable.injected', { link = '@variable' })


	-- vim.lsp.buf.document_highlight()
	h('LspReferenceText', { bg = p.blue2 })
	h('LspReferenceRead', { bg = p.blue2 })
	h('LspReferenceWrite', { bg = p.blue2 })

	-- lsp-highlight-codelens
	h('LspCodeLens', { fg = p.blueGray1 })          -- virtual text of code lens
	h('LspCodeLensSeparator', { fg = p.blueGray3 }) -- separator between two or more code lens

	-- romgrk/barbar.nvim
	h('BufferCurrent', { fg = p.text, bg = p.background2 })
	h('BufferCurrentIndex', { fg = p.text, bg = p.background2 })
	h('BufferCurrentMod', { fg = p.teal1, bg = p.background2 })
	h('BufferCurrentSign', { fg = p.blueGray1, bg = p.background2 })
	h('BufferCurrentTarget', { fg = p.yellow, bg = p.background2 })
	h('BufferInactive', { fg = p.blueGray1 })
	h('BufferInactiveIndex', { fg = p.blueGray1 })
	h('BufferInactiveMod', { fg = p.teal1 })
	h('BufferInactiveSign', { fg = p.blueGray2 })
	h('BufferInactiveTarget', { fg = p.yellow })
	h('BufferTabpageFill', { fg = groups.background, bg = groups.background })
	h('BufferVisible', { fg = p.blueGray1 })
	h('BufferVisibleIndex', { fg = p.blueGray1 })
	h('BufferVisibleMod', { fg = p.teal1 })
	h('BufferVisibleSign', { fg = p.blueGray2 })
	h('BufferVisibleTarget', { fg = p.yellow })

	-- lewis6991/gitsigns.nvim
	h('GitSignsAdd', { fg = groups.git_add, bg = groups.background })
	h('GitSignsChange', { fg = groups.git_change, bg = groups.background })
	h('GitSignsDelete', { fg = groups.git_delete, bg = groups.background })
	h('SignAdd', { link = 'GitSignsAdd' })
	h('SignChange', { link = 'GitSignsChange' })
	h('SignDelete', { link = 'GitSignsDelete' })

	-- mvllow/modes.nvim
	h('ModesCopy', { bg = p.yellow })
	h('ModesDelete', { bg = p.pink3 })
	h('ModesInsert', { bg = p.teal1 })
	h('ModesVisual', { bg = p.yellow })

	-- kyazdani42/nvim-tree.lua
	h('NvimTreeEmptyFolderName', { fg = p.blueGray3 })
	h('NvimTreeFileDeleted', { fg = p.pink3 })
	h('NvimTreeFileDirty', { fg = p.blue4 })
	h('NvimTreeFileMerge', { fg = p.blue2 })
	h('NvimTreeFileNew', { fg = p.teal1 })
	h('NvimTreeFileRenamed', { fg = p.blueGray3 })
	h('NvimTreeFileStaged', { fg = p.blue1 })
	h('NvimTreeFolderIcon', { fg = p.blue3 })
	h('NvimTreeFolderName', { fg = p.blue3 })
	h('NvimTreeGitDeleted', { fg = groups.git_delete })
	h('NvimTreeGitDirty', { fg = groups.git_dirty })
	h('NvimTreeGitIgnored', { fg = groups.git_ignore })
	h('NvimTreeGitMerge', { fg = groups.git_merge })
	h('NvimTreeGitNew', { fg = groups.git_add })
	h('NvimTreeGitRenamed', { fg = groups.git_rename })
	h('NvimTreeGitStaged', { fg = groups.git_stage })
	h('NvimTreeImageFile', { fg = p.text })
	h('NvimTreeNormal', { fg = p.text })
	h('NvimTreeOpenedFile', { fg = p.text, bg = p.background1 })
	h('NvimTreeOpenedFolderName', { link = 'NvimTreeFolderName' })
	h('NvimTreeRootFolder', { fg = p.teal1 })
	h('NvimTreeSpecialFile', { link = 'NvimTreeNormal' })
	h('NvimTreeWindowPicker', { fg = groups.bg, bg = p.blueGray1 })

	-- nvim-neo-tree/neo-tree.nvim
	h('NeoTreeTitleBar', { fg = p.background3, bg = p.blueGray3 })

	-- folke/which-key.nvim
	h('WhichKey', { fg = p.text })
	h('WhichKeyGroup', { fg = p.text })
	h('WhichKeySeparator', { fg = p.text })
	h('WhichKeyDesc', { fg = p.text })
	h('WhichKeyFloat', { bg = groups.panel })
	h('WhichKeyValue', { fg = p.text })

	-- luka-reineke/indent-blankline.nvim
	h('IndentBlanklineChar', { fg = p.background1 })
	h('IndentBlanklineContextChar', { fg = p.yellow, nocombine = true })
	h('IndentBlanklineSpaceChar', { link = 'Whitespace' })

	-- hrsh7th/nvim-cmp
	h('CmpItemAbbr', { fg = p.blueGray2 })
	h('CmpItemAbbrDeprecated', { fg = p.pink3, strikethrough = true })
	h('CmpItemAbbrMatch', { fg = p.text, bold = true })
	h('CmpItemAbbrMatchFuzzy', { fg = p.teal1, bold = true })
	h('CmpItemKind', { fg = p.blue3 })
	h('CmpItemKindClass', { fg = p.yellow })
	h('CmpItemKindFunction', { fg = p.blue1 })
	h('CmpItemKindInterface', { fg = p.blue2 })
	h('CmpItemKindMethod', { fg = p.pink3 })
	h('CmpItemKindSnippet', { fg = p.blueGray1 })
	h('CmpItemKindVariable', { fg = p.teal1 })

	-- TimUntersberger/neogit
	h('NeogitDiffAddHighlight', { fg = p.teal1, bg = p.background1 })
	h('NeogitDiffContextHighlight', { bg = p.backgroun1 })
	h('NeogitDiffDeleteHighlight', { fg = p.pink3, bg = p.background1 })
	h('NeogitHunkHeader', { bg = p.background1 })
	h('NeogitHunkHeaderHighlight', { bg = p.background1 })

	-- vimwiki/vimwiki
	h('VimwikiHR', { fg = p.blueGray2 })
	h('VimwikiHeader1', { fg = groups.headings.h1, bold = true })
	h('VimwikiHeader2', { fg = groups.headings.h2, bold = true })
	h('VimwikiHeader3', { fg = groups.headings.h3, bold = true })
	h('VimwikiHeader4', { fg = groups.headings.h4, bold = true })
	h('VimwikiHeader5', { fg = groups.headings.h5, bold = true })
	h('VimwikiHeader6', { fg = groups.headings.h6, bold = true })
	h('VimwikiHeaderChar', { fg = p.yellow })
	h('VimwikiLink', { fg = p.text, underline = true })
	h('VimwikiList', { fg = p.text })
	h('VimwikiNoExistsLink', { fg = p.pink3 })

	-- nvim-neorg/neorg
	h('NeorgHeading1Prefix', { fg = groups.headings.h1, bold = true })
	h('NeorgHeading1Title', { link = 'NeorgHeading1Prefix' })
	h('NeorgHeading2Prefix', { fg = groups.headings.h2, bold = true })
	h('NeorgHeading2Title', { link = 'NeorgHeading2Prefix' })
	h('NeorgHeading3Prefix', { fg = groups.headings.h3, bold = true })
	h('NeorgHeading3Title', { link = 'NeorgHeading3Prefix' })
	h('NeorgHeading4Prefix', { fg = groups.headings.h4, bold = true })
	h('NeorgHeading4Title', { link = 'NeorgHeading4Prefix' })
	h('NeorgHeading5Prefix', { fg = groups.headings.h5, bold = true })
	h('NeorgHeading5Title', { link = 'NeorgHeading5Prefix' })
	h('NeorgHeading6Prefix', { fg = groups.headings.h6, bold = true })
	h('NeorgHeading6Title', { link = 'NeorgHeading6Prefix' })
	h('NeorgMarkerTitle', { fg = p.text, bold = true })

	-- tami5/lspsaga.nvim (fork of glepnir/lspsaga.nvim)
	h('DefinitionCount', { fg = p.blue1 })
	h('DefinitionIcon', { fg = p.blue1 })
	h('DefintionPreviewTitle', { fg = p.blue1, bold = true })
	h('LspFloatWinBorder', { fg = groups.border })
	h('LspFloatWinNormal', { bg = styles.float_background })
	h('LspSagaAutoPreview', { fg = p.blueGray2 })
	h('LspSagaCodeActionBorder', { fg = groups.border })
	h('LspSagaCodeActionContent', { fg = p.blue2 })
	h('LspSagaCodeActionTitle', { fg = p.yellow, bold = true })
	h('LspSagaCodeActionTruncateLine', { link = 'LspSagaCodeActionBorder' })
	h('LspSagaDefPreviewBorder', { fg = groups.border })
	h('LspSagaDiagnosticBorder', { fg = groups.border })
	h('LspSagaDiagnosticHeader', { fg = p.yellow, bold = true })
	h('LspSagaDiagnosticTruncateLine', { link = 'LspSagaDiagnosticBorder' })
	h('LspSagaDocTruncateLine', { link = 'LspSagaHoverBorder' })
	h('LspSagaFinderSelection', { fg = p.yellow })
	h('LspSagaHoverBorder', { fg = groups.border })
	h('LspSagaLspFinderBorder', { fg = groups.border })
	h('LspSagaRenameBorder', { fg = p.yellow })
	h('LspSagaRenamePromptPrefix', { fg = p.pink3 })
	h('LspSagaShTruncateLine', { link = 'LspSagaSignatureHelpBorder' })
	h('LspSagaSignatureHelpBorder', { fg = p.yellow })
	h('ReferencesCount', { fg = p.blue1 })
	h('ReferencesIcon', { fg = p.blue1 })
	h('SagaShadow', { bg = p.background2 })
	h('TargetWord', { fg = p.text })

	-- ray-x/lsp_signature.nvim
	h('LspSignatureActiveParameter', { bg = p.blueGray1 })

	-- rlane/pounce.nvim
	h('PounceAccept', { fg = p.pink3, bg = p.text })
	h('PounceAcceptBest', { fg = p.text, bg = p.text })
	h('PounceGap', { link = 'Search' })
	h('PounceMatch', { link = 'Search' })

	-- ggandor/leap.nvim
	h('LeapMatch', { link = 'MatchParen' })
	h('LeapLabelPrimary', { link = 'IncSearch' })
	h('LeapLabelSecondary', { fg = p.background3, bg = p.yellow })

	-- nvim-telescope/telescope.nvim
	h('TelescopeBorder', { fg = groups.border })
	h('TelescopeMatching', { fg = p.teal1 })
	h('TelescopeNormal', { fg = p.text })
	h('TelescopePromptNormal', { fg = p.text })
	h('TelescopePromptPrefix', { fg = p.blueGray1 })
	h('TelescopeSelection', { fg = p.text, bg = p.blueGray1 })
	h('TelescopeSelectionCaret', { fg = p.pink2, bg = p.blueGray1 })
	h('TelescopeTitle', { fg = p.blueGray2 })

	-- phaazon/hop.nvim
	h('HopNextKey', { fg = p.blue1 })
	h('HopNextKey1', { fg = p.teal1 })
	h('HopNextKey2', { fg = p.teal2 })
	h('HopUnmatched', { fg = p.blueGray3 })
	h('HopCursor', { fg = p.blue3 })

	-- rcarriga/nvim-notify
	h('NotifyINFOBorder', { fg = p.teal1 })
	h('NotifyINFOTitle', { link = 'NotifyINFOBorder' })
	h('NotifyINFOIcon', { link = 'NotifyINFOBorder' })
	h('NotifyWARNBorder', { fg = p.yellow })
	h('NotifyWARNTitle', { link = 'NotifyWARNBorder' })
	h('NotifyWARNIcon', { link = 'NotifyWARNBorder' })
	h('NotifyDEBUGBorder', { fg = p.blue1 })
	h('NotifyDEBUGTitle', { link = 'NotifyDEBUGBorder' })
	h('NotifyDEBUGIcon', { link = 'NotifyDEBUGBorder' })
	h('NotifyTRACEBorder', { fg = p.blue1 })
	h('NotifyTRACETitle', { link = 'NotifyTRACEBorder' })
	h('NotifyTRACEIcon', { link = 'NotifyTRACEBorder' })
	h('NotifyERRORBorder', { fg = p.pink3 })
	h('NotifyERRORTitle', { link = 'NotifyERRORBorder' })
	h('NotifyERRORIcon', { link = 'NotifyERRORBorder' })

	-- glepnir/lspsaga.nvim
	h('TitleString', { fg = p.blue2 })
	h('TitleIcon', { fg = p.blue2 })
	h('SagaBorder', { bg = p.background2, fg = p.blueGray2 })
	h('SagaNormal', { bg = p.background2 })
	h('SagaExpand', { fg = p.teal2 })
	h('SagaCollapse', { fg = p.teal2 })
	h('SagaBeacon', { bg = p.yellow })
	-- code action
	h('ActionPreviewNormal', { link = 'SagaNormal' })
	h('ActionPreviewBorder', { link = 'SagaBorder' })
	h('ActionPreviewTitle', { fg = p.blueGray2, bg = p.background2 })
	h('CodeActionNormal', { link = 'SagaNormal' })
	h('CodeActionBorder', { link = 'SagaBorder' })
	h('CodeActionText', { fg = p.yellow })
	h('CodeActionNumber', { fg = p.blue3 })
	-- finder
	h('FinderSelection', { fg = p.blueGray2, bold = true })
	h('FinderFileName', { fg = p.white })
	h('FinderCount', { link = 'Label' })
	h('FinderIcon', { fg = p.yellow })
	h('FinderType', { fg = p.teal1 })
	--finder spinner
	h('FinderSpinnerTitle', { fg = p.pink3, bold = true })
	h('FinderSpinner', { fg = p.pink3, bold = true })
	h('FinderPreviewSearch', { link = 'Search' })
	h('FinderVirtText', { fg = p.blue1 })
	h('FinderNormal', { link = 'SagaNormal' })
	h('FinderBorder', { link = 'SagaBorder' })
	h('FinderPreviewBorder', { link = 'SagaBorder' })
	-- definition
	h('DefinitionBorder', { link = 'SagaBorder' })
	h('DefinitionNormal', { link = 'SagaNormal' })
	h('DefinitionSearch', { link = 'Search' })
	-- hover
	h('HoverNormal', { link = 'SagaNormal' })
	h('HoverBorder', { link = 'SagaBorder' })
	-- rename
	h('RenameBorder', { link = 'SagaBorder' })
	h('RenameNormal', { fg = p.white, p.background2 })
	h('RenameMatch', { link = 'Search' })
	-- diagnostic
	h('DiagnosticBorder', { link = 'SagaBorder' })
	h('DiagnosticSource', { fg = p.blueGray2 })
	h('DiagnosticNormal', { link = 'SagaNormal' })
	h('DiagnosticErrorBorder', { link = 'DiagnosticError' })
	h('DiagnosticWarnBorder', { link = 'DiagnosticWarn' })
	h('DiagnosticHintBorder', { link = 'DiagnosticHint' })
	h('DiagnosticInfoBorder', { link = 'DiagnosticInfo' })
	h('DiagnosticPos', { fg = p.blueGray2 })
	h('DiagnosticWord', { fg = p.white })
	-- Call Hierachry
	h('CallHierarchyNormal', { link = 'SagaNormal' })
	h('CallHierarchyBorder', { link = 'SagaBorder' })
	h('CallHierarchyIcon', { fg = p.pink2 })
	h('CallHierarchyTitle', { fg = p.pink2 })
	-- lightbulb
	h('LspSagaLightBulb', { link = 'DiagnosticSignHint' })
	-- shadow
	h('SagaShadow', { bg = p.background3 })
	-- Outline
	h('OutlineIndent', { fg = p.blue2 })
	h('OutlinePreviewBorder', { link = 'SagaNormal' })
	h('OutlinePreviewNormal', { link = 'SagaBorder' })
	-- Float term
	h('TerminalBorder', { link = 'SagaBorder' })
	h('TerminalNormal', { link = 'SagaNormal' })


	vim.g.terminal_color_0 = p.background3 -- black
	vim.g.terminal_color_8 = p.background3 -- bright black
	vim.g.terminal_color_1 = p.pink3     -- red
	vim.g.terminal_color_9 = p.pink3     -- bright red
	vim.g.terminal_color_2 = p.teal1     -- green
	vim.g.terminal_color_10 = p.teal1    -- bright green
	vim.g.terminal_color_3 = p.yellow    -- yellow
	vim.g.terminal_color_11 = p.yellow   -- bright yellow
	vim.g.terminal_color_4 = p.blue1     -- blue
	vim.g.terminal_color_12 = p.blue2    -- bright blue
	vim.g.terminal_color_5 = p.pink2     -- magenta
	vim.g.terminal_color_13 = p.pink2    -- bright magenta
	vim.g.terminal_color_6 = p.blue1     -- cyan
	vim.g.terminal_color_14 = p.blue2    -- bright cyan
	vim.g.terminal_color_7 = p.white     -- white
	vim.g.terminal_color_15 = p.white    -- bright white

	-- Set user highlights
	for group, color in pairs(options.highlight_groups) do
		h(group, color)
	end
end

return M
