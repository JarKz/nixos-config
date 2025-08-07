return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      custom_highlights = function(colors)
        return {
          red = { fg = colors.red },
          blue = { fg = colors.blue },
          yellow = { fg = colors.yellow },
          purple = { fg = colors.flamingo },
          grey = { fg = "#716f71" },
          green = { fg = colors.green },
        }
      end
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd("colorscheme catppuccin-latte")
    end
  },
  { import = "plugins.cmp" },
  { import = "plugins.lsp" },
  { import = "plugins.dap" },
  { import = "plugins.extensions" },
  { import = "plugins.highlights" },
  { import = "plugins.win_ext" },
}
