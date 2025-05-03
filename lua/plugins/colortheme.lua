return {
	"RRethy/base16-nvim",
	lazy = false,
	priority = 1000,
	config = function()
		-- Basic setup using a built-in theme (replace later)

		-- Configuration for plugin integrations (enable as needed)
		require("base16-colorscheme").with_config({
			telescope = true,
			indentblankline = true,
			notify = true,
			ts_rainbow = true,
			cmp = true,
			illuminate = true,
			dapui = true,
		})

		vim.cmd("colorscheme base16-black-metal-immortal")
	end,
}
