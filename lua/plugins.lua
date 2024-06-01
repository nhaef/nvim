return {
	{
		"https://codeberg.org/esensar/nvim-dev-container",
		init = function()
			require("devcontainer").setup {}
		end
	},
}
