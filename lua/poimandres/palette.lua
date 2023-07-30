--- palette variants

local variants = {
  main = { -- main palette
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
	},
	storm = {
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
		darkerGray = '#868cad',
		bluishGray = '#607487',
		focus = '#303340',
		bg = '#252b37',
		offWhite = '#e4f0fb',
		selection = '#818cc4',
		white = '#ffffff',
		black = '#101010',
		none = 'NONE',
	},
	white = {
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
		darkerGray = '#969cbd',
		bluishGray = '#506477',
		focus = '#303340',
		bg = '#fefeff',
		offWhite = '#e4f0fb',
		selection = '#717cb4',
		white = '#ffffff',
		black = '#ffffff',
		none = 'NONE',
	}
}

local palette = {}


palette = variants.main


-- if vim.o.background == "light" then
-- 	palette = variants.main
-- else
-- 	palette = variants[(vim.g.poimandres_variant == "storm" and "storm") or "main"]
-- end

return palette
