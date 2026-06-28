-- Disable perl provider
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

package.path = "$XDG_CONFIG_HOME/nvim/lua/?.lua;" .. package.path

vim.notify_orig = vim.notify

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.updatetime = 2000

vim.wo.number = true

vim.opt.listchars = "eol:\\u23CE"
vim.opt.list = true

vim.o.cmdheight = 0
vim.opt.laststatus = 3

vim.opt.termguicolors = true

-- NeoVim developers won't implement these predicates in future. We're just adding stub to avoid any errors.
vim.treesitter.query.add_predicate("is?", function() return true end, { force = true })
vim.treesitter.query.add_predicate("is-not?", function() return true end, { force = true })

require('config')
