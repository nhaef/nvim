return {
	{
		"https://codeberg.org/esensar/nvim-dev-container",
		init = function()
			require("devcontainer").setup {}
		end
	},
	{
		"mistricky/codesnap.nvim",
		build = "make",
		opts = {
			has_line_number = true,
			bg_padding = 0,
		},
	},
}
