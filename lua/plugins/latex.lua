return {
	{
		"lervag/vimtex",
		ft = "tex",
		config = function()
			vim.g.vimtex_view_method = "zathura" -- or 'skim', 'sioyek', 'okular', etc.
			vim.g.vimtex_compiler_method = "latexmk"
			vim.g.vimtex_compiler_latexmk = {
				build_dir = "",
				callback = 1,
				continuous = 1,
				executable = "latexmk",
				options = {
					"-pdf",
					"-interaction=nonstopmode",
					"-synctex=1",
				},
			}
		end,
	},
}
