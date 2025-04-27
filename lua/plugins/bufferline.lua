return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		-- set Tokyonight as your colorscheme
		vim.cmd.colorscheme("tokyonight")
	end,
}
