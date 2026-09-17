return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  config = function()
    require("marks").setup({
      default_mappings = true,
      builtin_marks = {},

      -- visuals
      sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
    })
  end
}
