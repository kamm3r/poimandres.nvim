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


	h('ColorColumn', { bg = p.gray })
	h('Conceal', { bg = p.none })
	h('CurSearch', { link = 'IncSearch' })
	h('Cursor', { fg = p.gray})
	h('CursorColumn', { bg = p.focus })
	-- h('CursorIM', {})
	h('CursorLine', { bg = p.focus })
	h('CursorLineNr', { fg = p.text })
	h('DarkenedPanel', { bg = groups.panel })
	h('DarkenedStatusline', { bg = groups.panel })

	h('DiffAdd', { bg = groups.git_add, blend = 50 })
	h('DiffChange', { bg = p.gray })
	h('DiffDelete', { bg = groups.git_delete, blend = 50 })
	h('DiffText', { bg = groups.git_text, blend = 50 })
	h('diffAdded', { link = 'DiffAdd' })
	h('diffChanged', { link = 'DiffChange' })
	h('diffRemoved', { link = 'DiffDelete' })
	h('Directory', { fg = p.desaturatedBlue, bg = p.none })
	-- h('EndOfBuffer', {})
	h('ErrorMsg', { fg = p.hotRed, bold = true })
	h('FloatBorder', { fg = groups.border })
	h('FloatTitle', { fg = p.darkerGray })
	h('FoldColumn', { fg = p.darkerGray })
	h('Folded', { fg = p.text, bg = groups.panel })
	h('IncSearch', { fg = p.selection, bg = p.lightBlue })
	h('LineNr', { fg = p.bluishGray })
	h('MatchParen', { bg = p.bluishGray, fg = p.selection })
	h('ModeMsg', { fg = p.desaturatedBlue })
	h('MoreMsg', { fg = p.desaturatedBlue })
	h('NonText', { fg = p.bluishGrayBrighter })
	h('Normal', { fg = p.text, bg = styles.background })
	h('NormalFloat', { fg = p.text, bg = styles.float_background })
	h('NormalNC', { fg = p.text, bg = styles.dim_nc_background })
	h('NvimInternalError', { fg = '#ffffff', bg = p.hotRed })
	h('Pmenu', { fg = p.gray, bg = styles.float_background })
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
	h('StatusLine', { fg = p.desaturatedBlue, bg = styles.float_background })
	h('StatusLineNC', { fg = p.desaturatedBlue, bg = styles.background })
	h('StatusLineTerm', { link = 'StatusLine' })
	h('StatusLineTermNC', { link = 'StatusLineNC' })
	h('TabLine', { fg = p.desaturatedBlue, bg = styles.float_background })
	h('TabLineFill', { bg = styles.float_background })
	h('TabLineSel', { fg = p.text, bg = p.focus })
	h('Title', { fg = p.text })
	h('VertSplit', { fg = groups.border, bg = styles.bold_vert_split })
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

	h('Bold', { bold = true})
	h('Boolean', { fg = p.brightMint })         --  a boolean constant: TRUE, false
	h('Character', { fg = p.hotRed })       --  a character constant: 'c', '\n'
	h('Comment', { fg = p.gray })     -- (preferred) any special symbol
	h('Conditional', { fg = p.gray }) --  if, then, else, endif, switch, etc.
	h('Constant', { fg = p.text })         -- (preferred) any constant
	-- h('Debug', { }) --    debugging statements
	-- h('Define',        = { }) --   preprocessor #define
	h('Delimiter', { fg = p.gray }) --  character that needs attention
	h('Error', { fg = p.hotRed })         -- (preferred) any erroneous construct
	h('Exception', { fg = p.desaturatedBlue })     --  try, catch, throw
	h('Float', { fg = p.brightMint })         --    a floating point constant: 2.3e10
	h('Function', { fg = p.lightBlue })      -- function name (also: methods for classes)
	h('Identifier', { fg = p.gray }) -- (preferred) any variable name
	-- h('Ignore', { }) -- (preferred) left blank, hidden  |hl-Ignore|
	h('Include', { fg = p.gray })   --  preprocessor #include
	h('Keyword', { fg = p.desaturatedBlue })       --  any other keyword
	h('Label', { fg = p.text })          --    case, default, etc.
	h('Italic', { italic = true })
	-- h('Macro',         = { }) --    same as Define
	h('Number', { fg = p.brightMint })                    --   a number constant: 234, 0xff
	h('Operator', { fg = p.lightBlue })                  -- "sizeof", "+", "*", etc.
	-- h('PreCondit',     = { }) --  preprocessor #if, #else, #endif, etc.
	h('PreProc', { fg = p.text })                    -- (preferred) generic Preprocessor
	h('Repeat', { fg = p.desaturatedBlue })                    --   for, do, while, etc.
	h('Special', { fg = p.darkerGray })               -- (preferred) any special symbol
	-- h('SpecialChar', { }) --  special character in a constant
	h('SpecialComment', { fg = p.gray })        -- special things inside a comment
	h('Statement', { fg = p.text })                  -- (preferred) any statement
	-- h('StorageClass', { }) -- static, register, volatile, etc.
	h('String', { fg = p.brightMint })                    --   a string constant: "this is a string"
	h('Structure', { fg = p.gray }) --  struct, union, enum, etc. ]]
	h('Tag', { fg = p.text })                        --    you can use CTRL-] on this
	h('Todo', { bg = p.brightYellow, fg = p.selection }) -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
	h('Type', { fg = p.gray })                  -- (preferred) int, long, char, etc.
	h('Typedef', { link = 'Type' })                  --  A typedef
	h('Underlined', { underline = true })            -- (preferred) text that stands out, HTML links

	h('htmlH1', { fg = groups.headings.h1, bold = true })
	h('htmlH2', { fg = groups.headings.h2, bold = true })
	h('htmlH3', { fg = groups.headings.h3, bold = true })
	h('htmlH4', { fg = groups.headings.h4, bold = true })
	h('htmlH5', { fg = groups.headings.h5, bold = true })

	h('markdownHeadingDelimiter', { fg = p.bluishGrayBrighter, bold = true })
	h('markdownCode', { fg = p.gray })
	h('markdownCodeBlock', { fg = p.lowerMint })
	h('markdownH1', { fg = p.lightBlue, bold = true })
	h('markdownH2', { fg = p.lightBlue, bold = true })
	h('markdownH3', { fg = p.lightBlue, bold = true })
	h('markdownH4', { fg = p.lightBlue, bold = true })
	h('markdownLinkText', { fg = p.lowerBlue, underline = true })

	-- h('mkdHeading', { fg = c.orange, style = "bold" })
	-- h('mkdCode', { bg = c.terminal_black, fg = c.fg })
	h('mkdCodeDelimiter', { bg = p.selection, fg = p.text })
	h('mkdCodeStart', { fg = p.lowerMint, bold = true })
	h('mkdCodeEnd', { fg = p.lowerMint, bold = true })
	h('mkdLink', { fg = p.lowerBlue, underline = true })

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
	h('@class', { fg = p.lightBlue  })
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
	h('@parameter', { fg = p.text, italic = styles.italic })
	h('@preproc', { link = 'PreProc' })
	h('@property', { fg = p.lightBlue, italic = styles.italic })
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
	h('@tag.attribute', { fg = p.desaturatedBlue, styles.italic })
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
	h('LspReferenceText', { bg = p.lightBlue })
	h('LspReferenceRead', { bg = p.lightBlue })
	h('LspReferenceWrite', { bg = p.lightBlue })

	-- lsp-highlight-codelens
	h('LspCodeLens', { fg = p.gray })          -- virtual text of code lens
	h('LspCodeLensSeparator', { fg = p.bluishGray }) -- separator between two or more code lens

	-- romgrk/barbar.nvim
	h('BufferCurrent', { fg = p.text, bg = p.bg })
	h('BufferCurrentIndex', { fg = p.text, bg = p.bg })
	h('BufferCurrentMod', { fg = p.brightMint, bg = p.bg })
	h('BufferCurrentSign', { fg = p.gray, bg = p.bg })
	h('BufferCurrentTarget', { fg = p.brightYellow, bg = p.bg })
	h('BufferInactive', { fg = p.gray })
	h('BufferInactiveIndex', { fg = p.gray })
	h('BufferInactiveMod', { fg = p.brightMint })
	h('BufferInactiveSign', { fg = p.darkerGray })
	h('BufferInactiveTarget', { fg = p.brightYellow })
	h('BufferTabpageFill', { fg = groups.background, bg = groups.background })
	h('BufferVisible', { fg = p.gray })
	h('BufferVisibleIndex', { fg = p.gray })
	h('BufferVisibleMod', { fg = p.brightMint })
	h('BufferVisibleSign', { fg = p.darkerGray })
	h('BufferVisibleTarget', { fg = p.brightYellow })

	-- lewis6991/gitsigns.nvim
	h('GitSignsAdd', { fg = groups.git_add, bg = groups.background })
	h('GitSignsChange', { fg = groups.git_change, bg = groups.background })
	h('GitSignsDelete', { fg = groups.git_delete, bg = groups.background })
	h('SignAdd', { link = 'GitSignsAdd' })
	h('SignChange', { link = 'GitSignsChange' })
	h('SignDelete', { link = 'GitSignsDelete' })

	-- mvllow/modes.nvim
	h('ModesCopy', { bg = p.brightYellow })
	h('ModesDelete', { bg = p.hotRed })
	h('ModesInsert', { bg = p.brightMint })
	h('ModesVisual', { bg = p.brightYellow })

	-- kyazdani42/nvim-tree.lua
	h('NvimTreeEmptyFolderName', { fg = p.bluishGray })
	h('NvimTreeFileDeleted', { fg = p.hotRed })
	h('NvimTreeFileDirty', { fg = p.bluishGrayBrighter })
	h('NvimTreeFileMerge', { fg = p.lightBlue })
	h('NvimTreeFileNew', { fg = p.brightMint })
	h('NvimTreeFileRenamed', { fg = p.bluishGray })
	h('NvimTreeFileStaged', { fg = p.lowerBlue })
	h('NvimTreeFolderIcon', { fg = p.desaturatedBlue })
	h('NvimTreeFolderName', { fg = p.desaturatedBlue })
	h('NvimTreeGitDeleted', { fg = groups.git_delete })
	h('NvimTreeGitDirty', { fg = groups.git_dirty })
	h('NvimTreeGitIgnored', { fg = groups.git_ignore })
	h('NvimTreeGitMerge', { fg = groups.git_merge })
	h('NvimTreeGitNew', { fg = groups.git_add })
	h('NvimTreeGitRenamed', { fg = groups.git_rename })
	h('NvimTreeGitStaged', { fg = groups.git_stage })
	h('NvimTreeImageFile', { fg = p.text })
	h('NvimTreeNormal', { fg = p.text })
	h('NvimTreeOpenedFile', { fg = p.text, bg = p.focus })
	h('NvimTreeOpenedFolderName', { link = 'NvimTreeFolderName' })
	h('NvimTreeRootFolder', { fg = p.brightMint })
	h('NvimTreeSpecialFile', { link = 'NvimTreeNormal' })
	h('NvimTreeWindowPicker', { fg = groups.bg, bg = p.gray })

	-- nvim-neo-tree/neo-tree.nvim
	h('NeoTreeTitleBar', { fg = p.selection, bg = p.bluishGray })

	-- folke/which-key.nvim
	h('WhichKey', { fg = p.text })
	h('WhichKeyGroup', { fg = p.text })
	h('WhichKeySeparator', { fg = p.text })
	h('WhichKeyDesc', { fg = p.text })
	h('WhichKeyFloat', { bg = groups.panel })
	h('WhichKeyValue', { fg = p.text })

	-- luka-reineke/indent-blankline.nvim
	h('IndentBlanklineChar', { fg = p.focus })
	h('IndentBlanklineContextChar', { fg = p.brightYellow, nocombine = true })
	h('IndentBlanklineSpaceChar', { link = 'Whitespace' })

	-- hrsh7th/nvim-cmp
	h('CmpItemAbbr', { fg = p.darkerGray })
	h('CmpItemAbbrDeprecated', { fg = p.hotRed, strikethrough = true })
	h('CmpItemAbbrMatch', { fg = p.text, bold = true })
	h('CmpItemAbbrMatchFuzzy', { fg = p.brightMint, bold = true })
	h('CmpItemKind', { fg = p.desaturatedBlue })
	h('CmpItemKindClass', { fg = p.brightYellow })
	h('CmpItemKindFunction', { fg = p.lowerBlue })
	h('CmpItemKindInterface', { fg = p.lightBlue })
	h('CmpItemKindMethod', { fg = p.hotRed })
	h('CmpItemKindSnippet', { fg = p.gray })
	h('CmpItemKindVariable', { fg = p.brightMint })

	-- TimUntersberger/neogit
	h('NeogitDiffAddHighlight', { fg = p.brightMint, bg = p.focus })
	h('NeogitDiffContextHighlight', { bg = p.focus })
	h('NeogitDiffDeleteHighlight', { fg = p.hotRed, bg = p.focus })
	h('NeogitHunkHeader', { bg = p.focus })
	h('NeogitHunkHeaderHighlight', { bg = p.focus })

	-- vimwiki/vimwiki
	h('VimwikiHR', { fg = p.darkerGray })
	h('VimwikiHeader1', { fg = groups.headings.h1, bold = true })
	h('VimwikiHeader2', { fg = groups.headings.h2, bold = true })
	h('VimwikiHeader3', { fg = groups.headings.h3, bold = true })
	h('VimwikiHeader4', { fg = groups.headings.h4, bold = true })
	h('VimwikiHeader5', { fg = groups.headings.h5, bold = true })
	h('VimwikiHeader6', { fg = groups.headings.h6, bold = true })
	h('VimwikiHeaderChar', { fg = p.brightYellow })
	h('VimwikiLink', { fg = p.text, underline = true })
	h('VimwikiList', { fg = p.text })
	h('VimwikiNoExistsLink', { fg = p.hotRed })

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
	h('DefinitionCount', { fg = p.lowerBlue })
	h('DefinitionIcon', { fg = p.lowerBlue })
	h('DefintionPreviewTitle', { fg = p.lowerBlue, bold = true })
	h('LspFloatWinBorder', { fg = groups.border })
	h('LspFloatWinNormal', { bg = styles.float_background })
	h('LspSagaAutoPreview', { fg = p.darkerGray })
	h('LspSagaCodeActionBorder', { fg = groups.border })
	h('LspSagaCodeActionContent', { fg = p.lightBlue })
	h('LspSagaCodeActionTitle', { fg = p.brightYellow, bold = true })
	h('LspSagaCodeActionTruncateLine', { link = 'LspSagaCodeActionBorder' })
	h('LspSagaDefPreviewBorder', { fg = groups.border })
	h('LspSagaDiagnosticBorder', { fg = groups.border })
	h('LspSagaDiagnosticHeader', { fg = p.brightYellow, bold = true })
	h('LspSagaDiagnosticTruncateLine', { link = 'LspSagaDiagnosticBorder' })
	h('LspSagaDocTruncateLine', { link = 'LspSagaHoverBorder' })
	h('LspSagaFinderSelection', { fg = p.brightYellow })
	h('LspSagaHoverBorder', { fg = groups.border })
	h('LspSagaLspFinderBorder', { fg = groups.border })
	h('LspSagaRenameBorder', { fg = p.brightYellow })
	h('LspSagaRenamePromptPrefix', { fg = p.hotRed })
	h('LspSagaShTruncateLine', { link = 'LspSagaSignatureHelpBorder' })
	h('LspSagaSignatureHelpBorder', { fg = p.brightYellow })
	h('ReferencesCount', { fg = p.lowerBlue })
	h('ReferencesIcon', { fg = p.lowerBlue })
	h('SagaShadow', { bg = p.bg })
	h('TargetWord', { fg = p.text })

	-- ray-x/lsp_signature.nvim
	h('LspSignatureActiveParameter', { bg = p.gray })

	-- rlane/pounce.nvim
	h('PounceAccept', { fg = p.hotRed, bg = p.text })
	h('PounceAcceptBest', { fg = p.text, bg = p.text })
	h('PounceGap', { link = 'Search' })
	h('PounceMatch', { link = 'Search' })

	-- ggandor/leap.nvim
	h('LeapMatch', { link = 'MatchParen' })
	h('LeapLabelPrimary', { link = 'IncSearch' })
	h('LeapLabelSecondary', { fg = p.selection, bg = p.brightYellow })

	-- nvim-telescope/telescope.nvim
	h('TelescopeBorder', { fg = groups.border })
	h('TelescopeMatching', { fg = p.brightMint })
	h('TelescopeNormal', { fg = p.text })
	h('TelescopePromptNormal', { fg = p.text })
	h('TelescopePromptPrefix', { fg = p.gray })
	h('TelescopeSelection', { fg = p.text, bg = p.gray })
    h('TelescopeSelectionCaret', { fg = p.pink, bg = p.gray })
	h('TelescopeTitle', { fg = p.darkerGray })

	-- phaazon/hop.nvim
	h('HopNextKey', { fg = p.lowerBlue })
	h('HopNextKey1', { fg = p.brightMint })
	h('HopNextKey2', { fg = p.lowerMint })
	h('HopUnmatched', { fg = p.bluishGray })
	h('HopCursor', { fg = p.desaturatedBlue })

	-- rcarriga/nvim-notify
	h('NotifyINFOBorder', { fg = p.brightMint })
	h('NotifyINFOTitle', { link = 'NotifyINFOBorder' })
	h('NotifyINFOIcon', { link = 'NotifyINFOBorder' })
	h('NotifyWARNBorder', { fg = p.brightYellow })
	h('NotifyWARNTitle', { link = 'NotifyWARNBorder' })
	h('NotifyWARNIcon', { link = 'NotifyWARNBorder' })
	h('NotifyDEBUGBorder', { fg = p.lowerBlue })
	h('NotifyDEBUGTitle', { link = 'NotifyDEBUGBorder' })
	h('NotifyDEBUGIcon', { link = 'NotifyDEBUGBorder' })
	h('NotifyTRACEBorder', { fg = p.lowerBlue })
	h('NotifyTRACETitle', { link = 'NotifyTRACEBorder' })
	h('NotifyTRACEIcon', { link = 'NotifyTRACEBorder' })
	h('NotifyERRORBorder', { fg = p.hotRed })
	h('NotifyERRORTitle', { link = 'NotifyERRORBorder' })
	h('NotifyERRORIcon', { link = 'NotifyERRORBorder' })

	-- glepnir/lspsaga.nvim
	h('TitleString', { fg = p.lightBlue })
	h('TitleIcon', { fg = p.lightBlue })
	h('SagaBorder', { bg = p.bg, fg = p.darkerGray })
	h('SagaNormal', { bg = p.bg })
	h('SagaExpand', { fg = p.lowerMint })
	h('SagaCollapse', { fg = p.lowerMint })
	h('SagaBeacon', { bg = p.brightYellow })
	-- code action
	h('ActionPreviewNormal', { link = 'SagaNormal' })
	h('ActionPreviewBorder', { link = 'SagaBorder' })
	h('ActionPreviewTitle', { fg = p.darkerGray, bg = p.bg })
	h('CodeActionNormal', { link = 'SagaNormal' })
	h('CodeActionBorder', { link = 'SagaBorder' })
	h('CodeActionText', { fg = p.brightYellow })
	h('CodeActionNumber', { fg = p.desaturatedBlue })
	-- finder
	h('FinderSelection', { fg = p.darkerGray, bold = true })
	h('FinderFileName', { fg = p.white })
	h('FinderCount', { link = 'Label' })
	h('FinderIcon', { fg = p.brightYellow })
	h('FinderType', { fg = p.brightMint })
	--finder spinner
	h('FinderSpinnerTitle', { fg = p.hotRed, bold = true })
	h('FinderSpinner', { fg = p.hotRed, bold = true })
	h('FinderPreviewSearch', { link = 'Search' })
	h('FinderVirtText', { fg = p.lowerBlue })
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
	h('RenameNormal', { fg = p.white, p.bg })
	h('RenameMatch', { link = 'Search' })
	-- diagnostic
	h('DiagnosticBorder', { link = 'SagaBorder' })
	h('DiagnosticSource', { fg = p.darkerGray })
	h('DiagnosticNormal', { link = 'SagaNormal' })
	h('DiagnosticErrorBorder', { link = 'DiagnosticError' })
	h('DiagnosticWarnBorder', { link = 'DiagnosticWarn' })
	h('DiagnosticHintBorder', { link = 'DiagnosticHint' })
	h('DiagnosticInfoBorder', { link = 'DiagnosticInfo' })
	h('DiagnosticPos', { fg = p.darkerGray })
	h('DiagnosticWord', { fg = p.white })
	-- Call Hierachry
	h('CallHierarchyNormal', { link = 'SagaNormal' })
	h('CallHierarchyBorder', { link = 'SagaBorder' })
	h('CallHierarchyIcon', { fg = p.pink })
	h('CallHierarchyTitle', { fg = p.pink })
	-- lightbulb
	h('LspSagaLightBulb', { link = 'DiagnosticSignHint' })
	-- shadow
	h('SagaShadow', { bg = p.darkerGray })
	-- Outline
	h('OutlineIndent', { fg = p.lightBlue })
	h('OutlinePreviewBorder', { link = 'SagaNormal' })
	h('OutlinePreviewNormal', { link = 'SagaBorder' })
	-- Float term
	h('TerminalBorder', { link = 'SagaBorder' })
	h('TerminalNormal', { link = 'SagaNormal' })


	vim.g.terminal_color_0 = p.selection -- black
	vim.g.terminal_color_8 = p.selection -- bright black
	vim.g.terminal_color_1 = p.hotRed     -- red
	vim.g.terminal_color_9 = p.hotRed     -- bright red
	vim.g.terminal_color_2 = p.brightMint     -- green
	vim.g.terminal_color_10 = p.brightMint    -- bright green
	vim.g.terminal_color_3 = p.brightYellow    -- yellow
	vim.g.terminal_color_11 = p.brightYellow   -- bright yellow
	vim.g.terminal_color_4 = p.lowerBlue     -- blue
	vim.g.terminal_color_12 = p.lightBlue    -- bright blue
	vim.g.terminal_color_5 = p.pink     -- magenta
	vim.g.terminal_color_13 = p.pink    -- bright magenta
	vim.g.terminal_color_6 = p.lowerBlue     -- cyan
	vim.g.terminal_color_14 = p.lightBlue    -- bright cyan
	vim.g.terminal_color_7 = p.white     -- white
	vim.g.terminal_color_15 = p.white    -- bright white

	-- Set user highlights
	for group, color in pairs(options.highlight_groups) do
		h(group, color)
	end
end

return M
