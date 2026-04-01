return {
  "olimorris/codecompanion.nvim",
  -- v19.8.0
  commit = "4b3f17b", 
  dependencies = {
    -- v0.1.4
    { "nvim-lua/plenary.nvim", commit = "5001291" },
    -- rolling release
    { "nvim-treesitter/nvim-treesitter", commit = "c82bf96" },
    -- v2.0.1
    {
      "zbirenbaum/copilot.lua",
      commit = "538f15c",
      opts = {
        -- auth_provider_url = "https://github.your-company.com",
      },
    },
  },
  keys = {
    { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "AI Chat" },
    { "<leader>cp", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "AI Action Palette" },
    { "<leader>ci", "<cmd>CodeCompanion<cr>", mode = "n", desc = "AI Inline Prompt" },
    { "<leader>ca", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add to AI Chat" },
    { "<leader>cn", "<cmd>CodeCompanionChat<cr>", mode = { "n", "v" }, desc = "New AI Chat" },
  },
  opts = {
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          -- url = "https://api.your-company-github-enterprise.com/chat/completions",
          env = {
            -- Uses the authenticated token from copilot.lua
            api_key = "CMD",
          },
        })
      end,
    },
    strategies = {
      chat = { adapter = "copilot" },
      inline = { adapter = "copilot" },
      agent = { adapter = "copilot" },
    },
    display = {
      chat = {
        show_token_count = true,
      },
    },
  },
}
