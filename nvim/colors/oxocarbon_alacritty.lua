-- oxocarbon (dark) but with the alacritty #0f0f0f background
vim.opt.background = "dark"
package.loaded.oxocarbon = nil
require("oxocarbon")

local bg     = "#0f0f0f"
local bg_dim = "#080808"

-- Override background-bearing groups, preserving their fg/style
local groups = {
  "Normal", "NormalNC", "SignColumn", "LineNr", "CursorLineNr",
  "FoldColumn", "EndOfBuffer", "MsgArea",
}

for _, name in ipairs(groups) do
  local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
  hl.bg = bg
  vim.api.nvim_set_hl(0, name, hl)
end

local float_hl = vim.api.nvim_get_hl(0, { name = "NormalFloat", link = false })
float_hl.bg = bg_dim
vim.api.nvim_set_hl(0, "NormalFloat", float_hl)

vim.g.colors_name = "oxocarbon_alacritty"
