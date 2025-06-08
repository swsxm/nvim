return {
	{
		"sjl/badwolf",
		lazy = false,
		priority = 1000,
		config = function()
			vim.opt.background = "dark"
			vim.cmd("colorscheme badwolf")

			-- Override background for core UI areas
			local black = "#000000"
			vim.api.nvim_set_hl(0, "Normal", { bg = black })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = black })
			vim.api.nvim_set_hl(0, "SignColumn", { bg = black })
			vim.api.nvim_set_hl(0, "LineNr", { bg = black })
			vim.api.nvim_set_hl(0, "VertSplit", { bg = black })
			vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = black })
		end,
	},
}

-- solarized8
--
-- return {
-- 	"lifepillar/vim-solarized8",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		-- This theme is Vimscript-based and uses global variables for configuration.
-- 		-- Set them BEFORE setting the colorscheme.
--
-- 		-- Optional: Use the 256-color palette for improved terminal compatibility.
-- 		-- The default is 16. Most modern terminals support 256.
-- 		vim.g.solarized_termcolors = 256
--
-- 		-- Enable true color support in Neovim
-- 		vim.o.termguicolors = true
--
-- 		-- Set the background to 'light'. This is what triggers the light variant.
-- 		vim.o.background = "light"
--
-- 		-- Finally, apply the colorscheme
-- 		vim.cmd.colorscheme("solarized8")
-- 	end,
-- }
