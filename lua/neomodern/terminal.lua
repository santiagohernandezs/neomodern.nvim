local M = {}
local Util = require("neomodern.util")

---Returns the terminal colors associated with a theme, and optionally the entire
---palette.
---@param with_palette boolean include the theme's palette colors
---@return table
function M.colors(with_palette)
    ---@type neomodern.Config
    local Config = require("neomodern").options()
    local palette = require("neomodern.palette").get(Config.theme, Config.variant)
    palette.dim = Util.blend(palette.bg, 0.9, "#000000")
    if with_palette then
        return vim.tbl_deep_extend("force", palette.colormap, palette)
    end
    return palette.colormap
end

---Sets the vim terminal colors if `term_colors` is set in `neomodern.Config`.
function M.setup()
    ---@type neomodern.Config
    local Config = require("neomodern").options()
    if not Config.term_colors then
        return
    end
    local colors = M.colors(false)
    vim.g.terminal_color_0 = colors.black
    vim.g.terminal_color_1 = colors.red
    vim.g.terminal_color_2 = colors.green
    vim.g.terminal_color_3 = colors.yellow
    vim.g.terminal_color_4 = colors.blue
    vim.g.terminal_color_5 = colors.purple
    vim.g.terminal_color_6 = colors.cyan
    vim.g.terminal_color_7 = colors.white
    vim.g.terminal_color_8 = colors.grey
    vim.g.terminal_color_9 = colors.orange
    vim.g.terminal_color_10 = colors.green
    vim.g.terminal_color_11 = colors.yellow
    vim.g.terminal_color_12 = colors.blue
    vim.g.terminal_color_13 = colors.magenta
    vim.g.terminal_color_14 = colors.cyan
    vim.g.terminal_color_15 = colors.white
end

return M
