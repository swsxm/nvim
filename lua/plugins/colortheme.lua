return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
    local is_transparent = true

    local function apply_theme()
      require("rose-pine").setup({
        variant = "auto",
        dark_variant = "main",
        dim_inactive_windows = false,
        extend_background_behind_borders = true,
        styles = {
          bold = true,
          italic = false,
          transparency = is_transparent,
        },
      })
      vim.cmd("colorscheme rose-pine")
    end

    apply_theme()

    vim.keymap.set("n", "<leader>bg", function()
      is_transparent = not is_transparent
      apply_theme()
      
      local status = is_transparent and "ON" or "OFF"
      vim.notify("Transparency: " .. status, vim.log.levels.INFO)
    end, { 
      noremap = true, 
      silent = true, 
      desc = "Toggle background transparency" 
    })
  end,
}
