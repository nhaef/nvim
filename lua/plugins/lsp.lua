return {
	{
		"neovim/nvim-lspconfig",
		name = "nvim-lspconfig",
		init = function()
			require "lspconfig".lua_ls.setup {
				settings = { Lua = {
					format = {
						defaultConfig = {
							indent_style = "tab",
							quote_style = "double",
							call_arg_parentheses = "remove",
							trailing_table_separator = "smart",
							line_space_after_if_statement = "fixed(1)",
							line_space_after_local_or_assign_statement = "min(1)",
							line_space_after_expression_statement = "min(1)",
							break_all_list_when_line_exceed = true,
							end_statement_with_semicolon = "replace_with_newline"
						},
					},
					diagnostics = {
						globals = {
							"vim",
						},
					},
				},
				} }
			require("lspconfig").basedpyright.setup {}
			require("lspconfig").tsserver.setup {}
			require("lspconfig").clangd.setup {}
			require("lspconfig").hls.setup {
				filetypes = { 'haskell', 'lhaskell', 'cabal' },
			}
		end,
	},
}
