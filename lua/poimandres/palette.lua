local options = require('poimandres.config').options

local variants = {
    main = {
           -- main palette
        yellow = '#FFFAC2',
        teal1 = '#5DE4C7',
        teal2 = '#5FB3A1',
        teal3 = '#42675A',
        blue1 = '#89DDFF',
        blue2 = '#ADD7FF',
        blue3 = '#91B4D5',
        blue4 = '#7390AA',
        pink1 = '#FAE4FC',
        pink2 = '#FCC5E9',
        pink3 = '#D0679D',
        blueGray1 = '#A6ACCD',
        blueGray2 = '#767C9D',
        blueGray3 = '#506477',
        background1 = '#303340',
        background2 = '#1B1E28',
        background3 = '#171922',
        text = '#E4F0FB',
        white = '#FFFFFF',
        none = 'NONE',
    },
    storm = {
            -- storm palette
        yellow = '#FFFAC2',
        teal1 = '#5DE4C7',
        teal2 = '#5FB3A1',
        teal3 = '#42675A',
        blue1 = '#89DDFF',
        blue2 = '#ADD7FF',
        blue3 = '#91B4D5',
        blue4 = '#7390AA',
        pink1 = '#FAE4FC',
        pink2 = '#FCC5E9',
        pink3 = '#D0679D',
        blueGray1 = '#A6ACCD',
        blueGray2 = '#767C9D',
        blueGray3 = '#506477',
        background1 = '#404350',
        background2 = '#252B37',
        background3 = '#1B11E28',
        text = '#E4F0FB',
        white = '#FFFFFF',
        none = 'NONE',
    }
}


if options.variant == 'main' then
	return variants.main
end
if options.variant == 'storm' then
	return variants.storm
end

return vim.o.background == 'light' and variants.dawn
	or variants[options.dark_variant or 'main']