---@alias Variant "main" | "storm" | "white"
---@alias Color { fg: string, bg: string, sp: string, bold: boolean, italic: boolean, undercurl: boolean, underline: boolean, underdouble: boolean, underdotted: boolean, underdashed: boolean, strikethrough: boolean }

local M = {}

---@class Options
M.options = {
	---Set the desired variant: "auto" will follow the vim background,
	---defaulting to "main" for dark and "dawn" for light. To change the dark
	---variant, use `options.dark_variant = "storm"`.
	---@type "auto" | Variant
	variant = 'auto',
	---Set the desired dark variant: applies when `options.variant` is set to
	---"auto" to match `vim.o.background`.
	---@type Variant
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,
	groups = {
		background = 'bg',
		panel = 'darkerGray',
		border = 'darkerGray',
		comment = 'bluishGray',
		link = 'desaturatedBlue',
		punctuation = 'desaturatedBlue',
		error = 'hotRed',
		hint = 'lowerBlue',
		info = 'desaturatedBlue',
		warn = 'brightYellow',
		git_add = 'brightMint',
		git_change = 'lightBlue',
		git_delete = 'hotRed',
		git_dirty = 'BluishGrayBrighter',
		git_ignore = 'gray',
		git_merge = 'lightBlue',
		git_rename = 'bluishGreen',
		git_stage = 'lowerBlue',
		git_text = 'lowerMint',
		headings = {
			h1 = 'lowerMint',
			h2 = 'brightYellow',
			h3 = 'hotRed',
			h4 = 'pink',
			h5 = 'lowerBlue',
			h6 = 'lightBlue',
		},
	},
	---@type table<string, Color>
	highlight_groups = {},
}

---@param options Options|nil
function M.extend(options)
	M.options = vim.tbl_deep_extend('force', M.options, options or {})
end

return M
