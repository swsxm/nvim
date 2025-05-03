return {
	"RRethy/base16-nvim",
	lazy = false,
	priority = 1000,
	config = function()
		-- Define your custom Base16 color palette
		require("base16-colorscheme").setup({
			base00 = "#000000",
			base01 = "#121212",
			base02 = "#222222",
			base03 = "#333333",
			base04 = "#999999",
			base05 = "#ffffff",
			base06 = "#999999",
			base07 = "#c1c1c1",
			base08 = "#5f8787",
			base09 = "#aaaaaa",
			base0A = "#e78a53",
			base0B = "#fbcb97",
			base0C = "#aaaaaa",
			base0D = "#888888",
			base0E = "#999999",
			base0F = "#444444",
		})

		-- Enable plugin integrations
		require("base16-colorscheme").with_config({
			telescope = true,
			indentblankline = true,
			notify = true,
			ts_rainbow = true,
			cmp = true,
			illuminate = true,
			dapui = true,
		})

		-- Optionally set the colorscheme name (for statusline integration etc.)
		vim.g.colors_name = "base16-da-one-black-custom"
	end,
}
