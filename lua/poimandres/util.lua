local ts = require("poimandres.treesitter")

local util = {}

---@param c  string
local function hexToRgb(c)
	c = string.lower(c)
	return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
  end

---@param fg string foreground color
---@param bg string background color
---@param alpha number number between 0 (background) and 1 (foreground)
util.blend = function(fg, bg, alpha)
	alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
	local fg_rgb = hexToRgb(fg)
	local bg_rgb = hexToRgb(bg)

	local function blend_channel(i)
		local ret = (alpha * fg_rgb[i] + ((1 - alpha) * bg_rgb[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format('#%02X%02X%02X', blend_channel(1), blend_channel(2), blend_channel(3))
end

---@param group string
util.highlight = function(group, hl)
	group = ts.get(group)
	if not group then
	  return
	end
	if hl.style then
	  if type(hl.style) == "table" then
		hl = vim.tbl_extend("force", hl, hl.style)
	  elseif hl.style:lower() ~= "none" then
		-- handle old string style definitions
		for s in string.gmatch(hl.style, "([^,]+)") do
		  hl[s] = true
		end
	  end
	  hl.style = nil
	end
	vim.api.nvim_set_hl(0, group, hl)
end

return util

