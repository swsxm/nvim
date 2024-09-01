return {
  'rose-pine/neovim',
  name = 'rose-pine',
  lazy = false,
  priority = 1000,
  config = function()
    -- Track our transparency state
    local is_transparent = true

    -- We wrap the setup in a function so we can call it again to toggle
    local function apply_theme()
      require('rose-pine').setup {
        variant = 'auto', -- auto, main, moon, or dawn
        dark_variant = 'main', -- ThePrimeagen uses 'main'
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        styles = {
          bold = true,
          italic = false, -- Set to true if you like italic comments
          transparency = is_transparent,
        },
      }

      -- Apply the colorscheme
      vim.cmd 'colorscheme rose-pine'
    end

    -- Initial load
    apply_theme()

    -- Toggle background transparency
    local toggle_transparency = function()
      is_transparent = not is_transparent
      apply_theme()

      -- Optional: small message to let you know it worked
      if is_transparent then
        print 'Transparency: ON'
      else
        print 'Transparency: OFF'
      end
    end

    -- Set the keymap
    vim.keymap.set('n', '<leader>bg', toggle_transparency, {
      noremap = true,
      silent = true,
      desc = 'Toggle Rose Pine Transparency',
    })
  end,
}
