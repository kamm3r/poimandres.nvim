--[[ require 'poimandres.highlights' ]]
local utils = require('poimandres.util')

local M = {}

local config = {
    bold_vert_split = false,
    dark_variant = 'main',
    disable_background = false,
    disable_float_background = false,
    disable_italics = false,
    dim_nc_background = false,

    groups = {
        background = 'bg',
        panel = 'bg',
        border = 'black',
        comment = 'darkerGray',
        link = 'lightBlue',
        punctuation = 'bluishGray',

        error = 'pink',
        hint = 'bluishGrayBrighter',
        info = 'lightBlue',
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
    highlight_groups = {},
}

function M.setup(opts)
    opts = opts or {}
    -- vim.g.poimandres_variant = opts.dark_variant or 'main'

    if opts.groups and type(opts.groups.headings) == 'string' then
        opts.groups.headings = {
            h1 = opts.groups.headings,
            h2 = opts.groups.headings,
            h3 = opts.groups.headings,
            h4 = opts.groups.headings,
            h5 = opts.groups.headings,
            h6 = opts.groups.headings,
        }
    end

    config.user_variant = opts.dark_variant or nil
    config = vim.tbl_deep_extend('force', config, opts)
end

function M.colorscheme()
    if vim.g.colors_name then
        vim.cmd 'hi clear'
    end

    vim.opt.termguicolors = true
    vim.g.colors_name = 'poimandres'

    local theme = require('poimandres.theme').get(config)

    -- Set theme highlights
    for group, color in pairs(theme) do
        -- Skip highlight group if user overrides
        if config.highlight_groups[group] == nil then
            utils.highlight(group, color)
        end
    end

    -- Set user highlights
    for group, color in pairs(config.highlight_groups) do
        utils.highlight(group, color)
    end
end

return M

