return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "zbirenbaum/copilot.lua",
      opts = {
        -- auth_provider_url = "https://github.your-company.com", 
      }, 
    },
  },
  keys = {
    -- Toggle Chat Window (Normal and Visual mode)
    { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Copilot Chat" },
    
    -- Action Palette for pre-built prompts like 'Explain' or 'Refactor'
    { "<leader>cp", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Copilot Palette/Actions" },
    
    -- Inline Prompt (Type a prompt directly into the buffer)
    { "<leader>ci", "<cmd>CodeCompanion<cr>", mode = "n", desc = "Copilot Inline Prompt" },

    -- Add your highlighted code to an open chat window
    { "<leader>ca", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add to Copilot Chat" },
    { "<leader>cn", "<cmd>CodeCompanionChat<cr>", mode = { "n", "v" }, desc = "New Copilot Chat" },
  },
  opts = {
    -- adapters = {
    --   copilot = function()
    --     return require("codecompanion.adapters").extend("copilot", {
    --       url = "https://api.your-company-github-enterprise.com/chat/completions", 
    --     })
    --   end,
    -- },
    strategies = {
      chat = { adapter = "copilot" },
      inline = { adapter = "copilot" },
      agent = { adapter = "copilot" }, 
    },
  },
}
