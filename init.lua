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
{
	"ms-jpq/coq_nvim",
	branch = "coq",
	lazy = false,
},
{
	"lvimuser/lsp-inlayhints.nvim",
},
{
	"github/copilot.vim",
}
})

-- set colorscheme
vim.cmd.colorscheme "catppuccin-mocha"

-- configure treesitter
require("nvim-treesitter.configs").setup {
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "kdl" },
	sync_install = false,
	auto_install = false,
	highlight = {
 		enable = true,
	},
}

-- configure telescope
require("telescope").setup {
	defaults = {
		file_ignore_patterns = {
			"node%_modules/.*",
			"target/.*",
		}
	}
}

-- configure lsp-inlayhints
require("lsp-inlayhints").setup()

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
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- on attach lsp-inlayhints
vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
