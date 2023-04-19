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
    ---@type Variant
    dark_variant = 'main',
    bold_vert_split = false,
    disable_background = false,
    disable_float_background = false,
    disable_italics = false,
    dim_nc_background = false,
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
