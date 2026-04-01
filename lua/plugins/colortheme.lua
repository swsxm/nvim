return {
  "rose-pine/neovim",
  name = "rose-pine",
  -- v3.0.2 
  commit = "f01eac6",
  lazy = false,
  priority = 1000, -- Ensure theme loads before other UI plugins
  config = function()
    local is_transparent = true

    -- Function to apply theme settings and handle state changes
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

    -- Apply theme on initial startup
    apply_theme()

    -- Keymap: Toggle background transparency dynamically
    vim.keymap.set("n", "<leader>bg", function()
      is_transparent = not is_transparent
      apply_theme()
      
      -- Informational feedback in the status area
      local status = is_transparent and "ON" or "OFF"
      vim.notify("Transparency: " .. status, vim.log.levels.INFO)
    end, { 
      noremap = true, 
      silent = true, 
      desc = "Toggle background transparency" 
    })
  end,
}
