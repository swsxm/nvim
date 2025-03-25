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

			-- Set universal float background to NONE (transparent) or your theme color
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })

			-- WhichKey
			vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = "NONE", fg = "#50fa7b" }) -- main background
			vim.api.nvim_set_hl(0, "WhichKeyBorder", { bg = "NONE", fg = "#50fa7b" }) -- border
			vim.api.nvim_set_hl(0, "WhichKeyTitle", { bg = "NONE", fg = "#50fa7b" }) -- title bar
			vim.api.nvim_set_hl(0, "WhichKeySeparator", { bg = "NONE", fg = "#50fa7b" }) -- separator

			vim.api.nvim_set_hl(0, "WhichKey", { fg = "#50fa7b", bg = "NONE" }) -- keys
			vim.api.nvim_set_hl(0, "WhichKeyDesc", { fg = "#50fa7b", bg = "NONE" }) -- descriptions
			vim.api.nvim_set_hl(0, "WhichKeyGroup", { fg = "#50fa7b", bg = "NONE" }) -- group titles
			-- Telescope
			vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "NONE" })

			vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "NONE" })

			vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "NONE" })

			-- Completion Menu
			vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "PmenuSel", { bg = "NONE" })

			-- Neo-tree
			vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { bg = "NONE" })
		end,
	},
}
