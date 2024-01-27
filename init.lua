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
	"bluz71/vim-moonfly-colors",
	name = "moonfly",
	lazy = false,
	priority = 1000
},
})

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
