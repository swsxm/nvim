-- lua/plugins/gruvbox_vim.lua
return {
	"morhetz/gruvbox",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.gruvbox_contrast_dark = "hard" -- options: "hard", "medium", default ""
		vim.o.background = "dark"
		vim.cmd("colorscheme gruvbox")
	end,
}
