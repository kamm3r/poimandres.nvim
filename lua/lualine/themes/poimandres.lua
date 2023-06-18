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
},
visual = {
    a = { bg = p.brightYellow, fg = p.bg, gui = 'bold' },
    b = { bg = p.focus, fg = p.offWhite },
},
replace = {
    a = { bg = p.hotRed, fg = p.bg, gui = 'bold' },
    b = { bg = p.focus, fg = p.offWhite },
},
command = {
    a = { bg = p.brightYellow, fg = p.bg, gui = 'bold' },
    b = { bg = p.focus, fg = p.offWhite },
},
terminal = {
    a = { bg = p.bluishGreen, fg = p.selection },
    b = { bg = p.focus, fg = p.bluishGreen },
},
inactive = {
    a = { bg = p.focus, fg = p.bluishGray, gui = 'bold' },
    b = { bg = p.focus, fg = p.bluishGray },
    c = { bg = p.none, fg = p.bluishGray },
}
}