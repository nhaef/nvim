-- disable line wrap
vim.opt.wrap = false

-- enable 24 bit colors
vim.opt.termguicolors = true

-- enable relative numbers
vim.opt.relativenumber = true
vim.opt.statuscolumn = "%s %{%v:virtnum<1?(v:relnum?'%='.v:relnum:'%#Bold#'.v:lnum.'%='):''%} "
vim.opt.numberwidth = 5

-- set tab width to 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- set <leader> key to SPACE
vim.g.mapleader = " "

-- load lazy.nvim
require("config.lazy")

-- load keymap
vim.schedule(function() require("keymap") end)
