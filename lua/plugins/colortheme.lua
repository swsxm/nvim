return {
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		lazy = false,
		priority = 1000,
		config = function()
			require("nightfly").custom_colors({
				white = "#f8f8f8",
			})
			vim.cmd.colorscheme("nightfly")
		end,
	},
}
