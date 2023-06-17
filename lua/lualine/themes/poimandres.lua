local colors = require('poimandres.colors').setup({transform = true})
local config = require('poimandres.config').options

local poimandres = {}


    poimandres.normal = {
        a = { bg = colors.brightMint, fg = colors.bg, gui = 'bold' },
        b = { bg = colors.focus, fg = colors.offWhite },
        c = { bg = colors.none, fg = colors.gray },
    }
    poimandres.insert = {
        a = { bg = colors.lowerBlue, fg = colors.bg, gui = 'bold' },
        b = { bg = colors.focus, fg = colors.offWhite },
    }
    poimandres.visual = {
        a = { bg = colors.brightYellow, fg = colors.bg, gui = 'bold' },
        b = { bg = colors.focus, fg = colors.offWhite },
    }
    poimandres.replace = {
        a = { bg = colors.hotRed, fg = colors.bg, gui = 'bold' },
        b = { bg = colors.focus, fg = colors.offWhite },
    }
    poimandres.command = {
        a = { bg = colors.brightYellow, fg = colors.bg, gui = 'bold' },
        b = { bg = colors.focus, fg = colors.offWhite },
    }
    poimandres.inactive = {
        a = { bg = colors.focus, fg = colors.bluishGray, gui = 'bold' },
        b = { bg = colors.focus, fg = colors.bluishGray },
        c = { bg = colors.none, fg = colors.bluishGray },
    }

    if config.lualine_bold then
        for _, mode in pairs(poimandres) do
          mode.a.gui = "bold"
        end
      end

return poimandres