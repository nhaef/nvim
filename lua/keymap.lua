-- find file
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, {
	desc = "find file"
})

-- find all
vim.keymap.set("n", "<leader>fa", function()
	require("telescope.builtin").find_files({ hidden = true })
end, {
	desc = "find all"
})

-- fing grep
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, {
	desc = "find grep"
})

-- find buffer
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, {
	desc = "find buffer"
})

-- find help
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, {
	desc = "find help"
})

-- lsp keymap
local group_lsp = vim.api.nvim_create_augroup('UserLspConfig', {})
vim.api.nvim_create_autocmd("LspAttach", {
	group = group_lsp,
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		-- hover
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {
			desc = "hover"
		})

		-- signature help
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {
			desc = "signature help"
		})

		-- rename
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {
			desc = "rename"
		})

		-- code actions
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {
			desc = "code actions"
		})

		-- go declaration
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
			desc = "go declaration"
		})

		-- go definition
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
			desc = "go definition"
		})

		-- go implementation
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
			desc = "go implementation"
		})

		-- go references
		vim.keymap.set("n", "gr", vim.lsp.buf.references, {
			desc = "go references"
		})

		-- type definitions
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, {
			desc = "type definitions"
		})

		-- lsp format
		vim.keymap.set("n", "<space>lf", function()
			vim.lsp.buf.format {
				async = true,
				formatting_options = {
					tabSize = 4,
					trimTrailingWhitespace = true,
					insertFinalNewline = true,
				}
			}
		end, {
			desc = "lsp format"
		})

		-- lsp inlay hint toggle
		vim.keymap.set("n", "<space>li", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, {
			desc = "lsp inlay hint toggle"
		})

		-- lsp format (on save)
		-- vim.api.nvim_create_autocmd("BufWritePre", {
		-- 	group = group_lsp,
		-- 	callback = function()
		-- 		if client.supports_method('textDocument/formatting') then
		-- 			vim.lsp.buf.format()
		-- 		end
		-- 	end
		-- })
	end,
})
