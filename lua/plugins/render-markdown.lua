return {
  'MeanderingProgrammer/render-markdown.nvim',
  -- Pinned to stable 2026 release
  commit = 'e3c18dd', 
  dependencies = { 
    { 'nvim-treesitter/nvim-treesitter'},
    { 'echasnovski/mini.icons', commit = '5b9076d' } 
  },
  ft = { 'markdown', 'codecompanion' }, -- Also renders your AI chat buffers!
  opts = {
    -- Clean, professional UI
    heading = {
      sign = false,
      icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
    },
    code = {
      sign = false,
      width = 'block',
      right_pad = 1,
    },
    checkbox = {
      enabled = true,
      unchecked = { icon = '󰄱 ' },
      checked = { icon = '󰱒 ' },
    },
  },
}
