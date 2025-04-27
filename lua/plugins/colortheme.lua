return { -- Start of the tokyonight plugin specification
	"folke/tokyonight.nvim",
	lazy = false, -- Ensure it loads early
	priority = 1000, -- Make sure to load this before other plugins
	opts = {
		-- Your configuration options go here
		style = "night", -- The theme comes in three styles: "storm" (default), "night", "day"
		light_style = "day", -- Style used when background is set to light
		transparent = false, -- Enable this to disable setting the background color (requires terminal supports transparency)
		terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
		styles = {
			-- Style to be applied to different syntax groups
			-- Value is any valid attr-list value for `:help nvim_set_hl`
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
			-- Background styles ("dark", "transparent", "normal")
			sidebars = "dark", -- Style for sidebars like NvimTree
			floats = "dark", -- Style for floating windows like LSP completion/diagnostics
		},
		sidebars = { "qf", "help", "NvimTree", "lazy", "mason" }, -- Set a darker background on sidebar-like windows. Use "all" for all sidebars
		day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colours
		hide_inactive_statusline = false, -- Enabling this option will hide inactive statuslines and replace them with a thin border instead. Should work with the default **StatusLine** and **LuaLine**.
		dim_inactive = false, -- dims inactive windows
		lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

		--- You can override specific color groups to use other groups or a hex color
		--- function will be called with a ColorScheme table
		---@param colors ColorScheme
		on_colors = function(colors) end,

		--- You can override specific highlight groups.
		--- function will be called with a Highlights and ColorScheme table
		---@param highlights Highlights
		---@param colors ColorScheme
		on_highlights = function(highlights, colors) end,
	},
	config = function(_, opts)
		-- Load the colorscheme here with options from `opts` table
		require("tokyonight").setup(opts)
		vim.cmd.colorscheme("tokyonight")
	end,
} -- End of the tokyonight plugin specification
