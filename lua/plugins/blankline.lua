return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			indent = {
				-- these names will be populated by the HIGHLIGHT_SETUP hook:
				highlight = {
					"RainbowWhite",
				},
			},
			scope = {
				enabled = false,
			},
		},
		config = function(_, opts)
			-- 1) Register custom rainbow highlight groups so they get reset
			--    whenever the colorscheme changes
			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowWhite", { fg = "#B8C1EB" })
			end)

			-- 2) Finally, apply the indent-blankline setup using your opts
			require("ibl").setup(opts)
		end,
	},
}
