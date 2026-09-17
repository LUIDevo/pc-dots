-- catppuccin (mocha) but with the alacritty #0f0f0f background
require("catppuccin").load("mocha")

-- Make blue the primary accent instead of mauve.
-- Derive the exact hexes from the loaded theme (Keyword -> mauve, Function -> blue),
-- then re-point every mauve highlight to blue.
local mauve = vim.api.nvim_get_hl(0, { name = "Keyword", link = false }).fg
local blue  = vim.api.nvim_get_hl(0, { name = "Function", link = false }).fg

-- The H1 markdown header uses a mauve-tinted background; swap it for the
-- blue-tinted one H2 already uses so the (now-blue) H1 header matches.
local h1_bg = vim.api.nvim_get_hl(0, { name = "RenderMarkdownH1Bg", link = false }).bg
local h2_bg = vim.api.nvim_get_hl(0, { name = "RenderMarkdownH2Bg", link = false }).bg

if mauve and blue then
  for name, def in pairs(vim.api.nvim_get_hl(0, {})) do
    if not def.link then
      local changed = false
      if def.fg == mauve then def.fg = blue; changed = true end
      if def.bg == mauve then def.bg = blue; changed = true end
      if h1_bg and h2_bg and def.bg == h1_bg then def.bg = h2_bg; changed = true end
      if changed then vim.api.nvim_set_hl(0, name, def) end
    end
  end
end

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

vim.g.colors_name = "catppuccin_alacritty"
