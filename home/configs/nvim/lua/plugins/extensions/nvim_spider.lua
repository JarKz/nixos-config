return {
  "chrisgrieser/nvim-spider",
  dependencies = {
    "folke/which-key.nvim",
  },
  config = function(_, opts)
    local spider = require("spider")
    spider.setup(opts)

    require("which-key").add {
      remap = false,
      nowait = false,
      mode = { "n", "o", "x" },
      { "w",  function() spider.motion("w") end,  desc = "Spider motion w" },
      { "e",  function() spider.motion("e") end,  desc = "Spider motion e" },
      { "b",  function() spider.motion("b") end,  desc = "Spider motion b" },
      { "ge", function() spider.motion("ge") end, desc = "Spider motion ge" },
    }
  end,
}
