return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "storm",
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					sidebars = "normal", -- make all windows consistent
					floats = "normal",
				},
			})

			vim.cmd.colorscheme("tokyonight")

			vim.cmd([[
  highlight NeoTreeNormal guibg=NONE
  highlight NeoTreeNormalNC guibg=NONE
  highlight NeoTreeFloatTitle guibg=NONE
  highlight NeoTreeFloatBorder guibg=NONE
  highlight NormalFloat guibg=NONE
  highlight FloatBorder guibg=NONE
  highlight TelescopeNormal guibg=NONE
  highlight TelescopeBorder guibg=NONE
]])
		end,
	},
}
