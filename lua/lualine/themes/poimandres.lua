local palette = require('poimandres.palette')

return {
    normal = {
        a = { bg = palette.brightMint, fg = palette.bg, gui = 'bold' },
        b = { bg = palette.focus, fg = palette.text },
        c = { bg = palette.none, fg = palette.gray },
    },
    insert = {
        a = { bg = palette.lowerBlue, fg = palette.bg, gui = 'bold' },
        b = { bg = palette.focus, fg = palette.text },
    },
    visual = {
        a = { bg = palette.brightYellow, fg = palette.bg, gui = 'bold' },
        b = { bg = palette.focus, fg = palette.text },
    },
    replace = {
        a = { bg = palette.hotRed, fg = palette.bg, gui = 'bold' },
        b = { bg = palette.focus, fg = palette.text },
    },
    command = {
        a = { bg = palette.brightYellow, fg = palette.bg, gui = 'bold' },
        b = { bg = palette.focus, fg = palette.text },
    },
    inactive = {
        a = { bg = palette.focus, fg = palette.bluishGray, gui = 'bold' },
        b = { bg = palette.focus, fg = palette.bluishGray },
        c = { bg = palette.none, fg = palette.bluishGray },
    },
}
