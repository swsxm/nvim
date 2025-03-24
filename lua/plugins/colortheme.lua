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
					sidebars = "normal",
					floats = "normal",
				},
			})

			-- Apply the colorscheme first
			vim.cmd.colorscheme("tokyonight")

			-- Clear background of common floating windows and popups
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "PmenuSel", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "WhichKeyBorder", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { bg = "NONE" })
		end,
	},
}
