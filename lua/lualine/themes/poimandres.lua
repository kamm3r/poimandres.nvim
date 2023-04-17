local palette = require('poimandres.palette')

return {
    normal = {
        a = { bg = palette.teal1, fg = palette.background2, gui = 'bold' },
        b = { bg = palette.background1, fg = palette.text },
        c = { bg = palette.none, fg = palette.blueGray1 },
    },
    insert = {
        a = { bg = palette.blue1, fg = palette.background2, gui = 'bold' },
        b = { bg = palette.background1, fg = palette.text },
    },
    visual = {
        a = { bg = palette.yellow, fg = palette.background2, gui = 'bold' },
        b = { bg = palette.background1, fg = palette.text },
    },
    replace = {
        a = { bg = palette.pink3, fg = palette.background2, gui = 'bold' },
        b = { bg = palette.background1, fg = palette.text },
    },
    command = {
        a = { bg = palette.yellow, fg = palette.background2, gui = 'bold' },
        b = { bg = palette.background1, fg = palette.text },
    },
    inactive = {
        a = { bg = palette.background1, fg = palette.blueGray3, gui = 'bold' },
        b = { bg = palette.background1, fg = palette.blueGray3 },
        c = { bg = palette.none, fg = palette.blueGray3 },
    },
}
