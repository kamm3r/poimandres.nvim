local p = require('poimandres.palette')

return {
    normal = {
        a = { bg = p.brightMint, fg = p.bg, gui = 'bold' },
    b = { bg = p.focus, fg = p.offWhite },
    c = { bg = p.none, fg = p.gray },
},
insert = {
    a = { bg = p.lowerBlue, fg = p.bg, gui = 'bold' },
    b = { bg = p.focus, fg = p.offWhite },
    c = { bg = p.none, fg = p.gray },
},
visual = {
    a = { bg = p.brightYellow, fg = p.bg, gui = 'bold' },
    b = { bg = p.focus, fg = p.offWhite },
    c = { bg = p.none, fg = p.gray },
},
replace = {
    a = { bg = p.hotRed, fg = p.bg, gui = 'bold' },
    b = { bg = p.focus, fg = p.offWhite },
    c = { bg = p.none, fg = p.gray },
},
command = {
    a = { bg = p.brightYellow, fg = p.bg, gui = 'bold' },
    b = { bg = p.focus, fg = p.offWhite },
    c = { bg = p.none, fg = p.gray },
},
terminal = {
    a = { bg = p.bluishGreen, fg = p.selection },
    b = { bg = p.focus, fg = p.bluishGreen },
    c = { bg = p.none, fg = p.gray },
},
inactive = {
    a = { bg = p.focus, fg = p.bluishGray, gui = 'bold' },
    b = { bg = p.focus, fg = p.bluishGray },
    c = { bg = p.none, fg = p.bluishGray },
}
}