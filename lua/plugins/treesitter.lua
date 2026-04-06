return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main', 
  build = ':TSUpdate',
  
  config = function()
    -- =====================================================================
    -- TSInstall lua python javascript typescript vimdoc vim regex terraform sql dockerfile toml json gitignore graphql yaml make cmake markdown markdown_inline bash tsx css html c cpp
    -- =====================================================================
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('TreesitterNative', { clear = true }),
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
