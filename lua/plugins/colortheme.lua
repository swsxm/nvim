return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.tokyonight_style = "night" -- Choose 'night', 'day', or 'storm' theme variants
		vim.g.tokyonight_italic_comments = false -- Disable italics for comments
		vim.cmd("colorscheme tokyonight") -- Apply the colorscheme
	end,
}
