-- disable line wrap
vim.opt.wrap = false

-- enable 24 bit colors
vim.opt.termguicolors = true

-- enable relative numbers
vim.opt.relativenumber = true
vim.opt.statuscolumn = " %{%v:virtnum<1?(v:relnum?'%='.v:relnum:'%#Bold#'.v:lnum.'%='):''%} "
vim.opt.numberwidth = 5

-- set <leader> key to SPACE
vim.g.mapleader = " "

-- setup lazy
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)
require "lazy".setup("plugins", require "lazyconfig")

-- load key map
vim.schedule(function()
	require "keymap"
end)
