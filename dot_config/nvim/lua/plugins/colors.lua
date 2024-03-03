return {
	{
		"catppuccin/nvim",
		dependencies = {
			{
				"rose-pine/neovim",
				name = "rose-pine",
				priority = 1001,
				opts = {
					styles = {
						transparency = true,
					}
				}
			},
		},
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
			})
			vim.cmd("colorscheme rose-pine")
		end,
	},
}
