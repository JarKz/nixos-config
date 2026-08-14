return {
  "barreiroleo/ltex_extra.nvim",
  branch = "dev",
  ft = { "markdown", "tex" },
  opts = {
    ---@type string[]
    -- See https://valentjn.github.io/ltex/supported-languages.html#natural-languages
    load_langs = { 'en-US', 'ru-RU' },
    ---@type "none" | "fatal" | "error" | "warn" | "info" | "debug" | "trace"
    log_level = "none",
    ---@type string File's path to load.
    -- The setup will normalice it running vim.fs.normalize(path).
    -- e.g. subfolder in project root or cwd: ".ltex"
    -- e.g. cross project settings:  vim.fn.expand("~") .. "/.local/share/ltex"
    path = ".ltex",
    ---@deprecated
    init_check = true,
    ---@deprecated
    server_start = false,
    ---@deprecated
    server_opts = nil
  },
}
