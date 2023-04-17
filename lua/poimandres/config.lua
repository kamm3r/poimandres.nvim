local M = {}

---@class Highlight
---@field fg string
---@field bg string
---@field sp string
---@field bold boolean
---@field italic boolean
---@field undercurl boolean
---@field underline boolean
---@field underdouble boolean
---@field underdotted boolean
---@field underdashed boolean
---@field strikethrough boolean

---@alias Variant 'main' | 'storm'

---@class Config
local defaults = {
    ---@type 'auto' | Variant
    variant = 'auto',
    bold_vert_split = false,
    dark_variant = 'main',
    disable_background = false,
    disable_float_background = false,
    disable_italics = false,
    dim_nc_background = false,
    groups = {
        background = 'background2',
        panel = 'background3',
        border = 'background3',
        comment = 'blueGray3',
        link = 'blue3',
        punctuation = 'blue3',
        error = 'pink3',
        hint = 'blue1',
        info = 'blue3',
        warn = 'yellow',
        git_add = 'teal1',
        git_change = 'blue2',
        git_delete = 'pink3',
        git_dirty = 'blue4',
        git_ignore = 'blueGray1',
        git_merge = 'blue2',
        git_rename = 'teal3',
        git_stage = 'blue1',
        git_text = 'teal2',
        headings = {
            h1 = 'teal2',
            h2 = 'yellow',
            h3 = 'pink3',
            h4 = 'pink2',
            h5 = 'blue1',
            h6 = 'blue2',
        },
    },
    ---@type table<string, Highlight>
    highlight_groups = {},
}

---@type Config
M.options = {}

---@param options Config|nil
function M.setup(options)
    M.options = vim.tbl_deep_extend('force', {}, defaults, options or {})
end

---@param options Config|nil
function M.extend(options)
    M.options =
    vim.tbl_deep_extend('force', {}, M.options or defaults, options or {})
end

M.setup()

return M
