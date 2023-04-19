--local options = require('poimandres.config').options

local variants = {
    main = {
           -- main palette
        brightYellow = '#FFFAC2',
        brightMint = '#5DE4C7',
        lowerMint = '#5FB3A1',
        bluishGreen = '#42675A',
        lowerBlue = '#89DDFF',
        lightBlue = '#ADD7FF',
        desaturatedBlue = '#91B4D5',
        BluishGrayBrighter = '#7390AA',
        hotRed = '#D0679D',
        pink = '#F087BD',
        gray = '#A6ACCD',
        darkerGray = '#767C9D',
        bluishGray = '#506477',
        focus = '#303340',
        bg = '#1B1E28',
        offWhite = '#E4F0FB',
        selection = '#717cb425',
        white = '#FFFFFF',
        black = '#000000',
        none = 'NONE',
    },
    storm = {
            -- storm palette
        brightYellow = '#FFFAC2',
        brightMint = '#5DE4C7',
        lowerMint = '#5FB3A1',
        bluishGreen = '#42675A',
        lowerBlue = '#89DDFF',
        lightBlue = '#ADD7FF',
        desaturatedBlue = '#91B4D5',
        BluishGrayBrighter = '#7390AA',
        hotRed = '#D0679D',
        pink = '#F087BD',
        gray = '#A6ACCD',
        darkerGray = '#868CAD',
        bluishGray = '#607487',
        focus = '#404350',
        bg = '#252B37',
        offWhite = '#e4f0fb',
        selection = '#818CC425',
        white = '#FFFFFF',
        black = '#101010',
        none = 'NONE',
    }
}

return variants.main
