-- enable line wrap
vim.opt.wrap = true

-- set tab width to 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- set <leader> key to SPACE
vim.g.mapleader = " "

-- load statuscolumn
require("config.statuscolumn")

-- load lazy.nvim
require("config.lazy")

-- load keymap
vim.schedule(function() require("keymap") end)
