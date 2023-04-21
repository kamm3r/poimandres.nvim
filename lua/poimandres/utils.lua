local utils = {}

---@param c string
local function hexToRgb(c)
    c = string.lower(c)
    return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

---@param fg string foreground color
---@param bg string background color
---@param alpha number number between 0 (background) and 1 (foreground)
utils.blend = function(fg, bg, alpha)
    alpha = type(alpha) == 'string' and (tonumber(alpha, 16) / 0xff) or alpha
    local rgb_fg = hexToRgb(fg)
    local rgb_bg = hexToRgb(bg)

    local function blend_channel(i)
        local ret = (alpha * rgb_fg[i] + ((1 - alpha) * rgb_bg[i]))
        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
    end

    return string.format(
        '#%02X%02X%02X',
        blend_channel(1),
        blend_channel(2),
        blend_channel(3)
    )
end

---@param group string
---@param color table<string, any>
utils.highlight = function(group, color)
    local fg = color.fg or 'none'
	local bg = color.bg or 'none'
	local sp = color.sp or ''

    if type(color) == "table" then
        color = vim.tbl_extend("force", color, {fg = fg, bg = bg, sp = sp})
    elseif color:lower() ~= "none" then
        for  s in string.gmatch(color, "[^,]+") do
            color[s] = true
        end
    end
    color = nil
    vim.api.nvim_set_hl(0, group, color)
end

return utils
