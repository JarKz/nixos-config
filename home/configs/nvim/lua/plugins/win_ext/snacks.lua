return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    input = { enabled = true },
    picker = { enabled = true },
    styles = {
      input = {
        relative = "cursor",
        row = -3,
        col = 0,
      }
    }
  },
}
