local util = require("poimandres.util")

local M = {}


---@class Palette
M.default = {
    brightYellow = '#fffac2',
    brightMint = '#5DE4c7',
    lowerMint = '#5fb3a1',
    bluishGreen = '#42675a',
    lowerBlue = '#89ddff',
    lightBlue = '#add7ff',
    desaturatedBlue = '#91b4d5',
    BluishGrayBrighter = '#7390aa',
    hotRed = '#d0679d',
    pink = '#f087bd',
    gray = '#a6accd',
    darkerGray = '#767c9d',
    bluishGray = '#506477',
    focus = '#303340',
    bg = '#1b1e28',
    offWhite = '#e4f0fb',
    selection = '#717cb4',
    white = '#ffffff',
    black = '#000000',
    none = 'NONE',
    git = { add = "#fffac2", change = "#add7ff", delete = "#d0679d" },
    gitSigns = {
        add = "#fffac2",
        change = "#add7ff",
        delete = "#d0679d"
    },
}

M.storm = {
    darkerGray = '#868cad',
    bluishGray = '#607487',
    bg = '#252b37',
    offWhite = '#e4f0fb',
    selection = '#818cc4',
    black = '#101010',
}
M.white = M.storm


---@return ColorScheme
function M.setup(opts)
    opts = opts or {}
    local config = require("poimandres.config")


    local style = config.is_day() and config.options.light_style or config.options.style
    local palette = M[style] or {}
    if type(palette) == "function" then
        palette = palette()
    end

    -- Color Palette
    ---@class ColorScheme: Palette
    local colors = vim.tbl_deep_extend("force", vim.deepcopy(M.default), palette)


    util.bg = colors.bg
    util.day_brightness = config.options.day_brightness

    colors.comment = colors.bluishGray

    colors.diff = {
        add = util.darken(colors.brightMint, 0.15),
        delete = util.darken(colors.hotRed, 0.15),
        change = util.darken(colors.lightBlue, 0.15),
        text = colors.lowerMint,
    }

    colors.git.ignore = colors.gray
    colors.black = util.darken(colors.bg, 0.8, "#000000")
    colors.border_highlight = util.darken(colors.lowerBlue, 0.8)
    colors.border = colors.darkerGray

    -- Popups and statusline always get a dark background
    colors.bg_popup = colors.bg
    colors.bg_statusline = colors.bg

    -- Sidebar and Floats are configurable
    colors.bg_sidebar = config.options.styles.sidebars == "transparent" and colors.none
        or config.options.styles.sidebars == "dark" and colors.bg

    colors.bg_float = config.options.styles.floats == "transparent" and colors.none
        or config.options.styles.floats == "dark" and colors.bg

    colors.bg_visual = util.darken(colors.bg, 0.4)
    colors.bg_search = colors.bg
    colors.fg_sidebar = colors.darkerGray
    -- colors.fg_float = config.options.styles.floats == "dark" and colors.fg_dark or colors.fg
    colors.fg_float = colors.darkerGray

    colors.error = colors.hotRed
    colors.warning = colors.brightYellow
    colors.info = colors.desaturatedBlue
    colors.hint = colors.lowerBlue

    colors.delta = {
        add = util.darken(colors.brightMint, 0.45),
        delete = util.darken(colors.hotRed, 0.45),
    }

    config.options.on_colors(colors)
    if opts.transform and config.is_day() then
        util.invert_colors(colors)
    end

    return colors
end

return M
