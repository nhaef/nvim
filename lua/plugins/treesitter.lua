return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		init = function()
			require("nvim-treesitter.configs").setup {
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "kdl", "jsonc" },
				sync_install = false,
				auto_install = false,
				highlight = {
					enable = true,
				},
			}
		end
	},
}
