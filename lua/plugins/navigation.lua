return {
	{
		"nvim-telescope/telescope.nvim",
		name = "telescope",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup {
				defaults = {
					file_ignore_patterns = {
						"node%_modules/.*",
						"target/.*",
					}
				}
			}
		end,
	},

}
