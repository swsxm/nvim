return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 
    { 'nvim-treesitter/nvim-treesitter'},
    { 'echasnovski/mini.icons' } 
  },
  ft = { 'markdown' }, 
  opts = {
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
