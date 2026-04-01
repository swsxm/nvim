return {
  'saghen/blink.cmp',
  commit = '4511688', -- v1.10.1 Stable
  build = 'cargo build --release',
  
  opts = {
    -- Default keymaps (C-y to accept, C-n/C-p to navigate)
    keymap = { preset = 'default' },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },

    snippets = { preset = 'default' },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'codecompanion' },
      
      providers = {
        codecompanion = {
          name = "CodeCompanion",
          module = "codecompanion.providers.completion.blink",
          enabled = true,
        },
      },
    },
  },
}
