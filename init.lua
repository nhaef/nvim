-- setup lazyy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- configure lazy
require("lazy").setup({
{
	"mrcjkb/rustaceanvim",
	version = "^4",
	ft = { "rust" },
},
{
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
},
{
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
},
{
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim" },
},
})

-- set colorscheme
vim.cmd.colorscheme "catppuccin-mocha"

-- configure treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust" },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
  },
}

-- disable line wrap
vim.opt.wrap=false

-- enable 24 bit colors
vim.opt.termguicolors=true

-- enable relative numbers
vim.opt.relativenumber=true
vim.opt.statuscolumn = "%=%{v:virtnum < 1 ? (v:relnum ? v:relnum : v:lnum < 10 ? v:lnum . '  ' : v:lnum) : ''}%=%s"
vim.opt.numberwidth = 3

-- set <leader> key to SPACE
vim.g.mapleader = " "

-- configure telescope key bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
