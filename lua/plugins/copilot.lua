return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom",
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = "node", -- Node.js version must be > 18.x
        server_opts_overrides = {},
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      show_help = "yes",
      debug = false,
      disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
      prompts = {
        Explain = "Explain how it works.",
        Review = "Review the following code and provide concise suggestions.",
        Tests = "Briefly explain how the selected code works, then generate unit tests.",
        Refactor = "Refactor the code to improve clarity and readability.",
        FixCode = "Fix the following code to make it work as intended.",
        BetterNamings = "Provide better names for the following variables and functions.",
        Documentation = "Provide documentation for the following code.",
        DocString = "Provide DocString for the following code in Numpy Style.",
        -- Text related prompts
        Summarize = "Summarize the following text.",
        Spelling = "Correct any grammar and spelling errors in the following text.",
        Wording = "Improve the grammar and wording of the following text.",
        Concise = "Rewrite the following text to make it more concise.",
      },
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>",   desc = "CopilotChat - Generate tests" },
      {
        "<leader>ccv",
        ":CopilotChatVisual",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      {
        "<c-i>",
        ":CopilotChatInPlace<cr>",
        mode = "x",
        desc = "CopilotChat - Run in-place code",
      },
    },
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {
      -- Refer to my configuration here:
      -- https://github.com/jellydn/lazy-nvim-ide/blob/main/lua/plugins/extras/edgy.lua
      right = {
        {
          title = "CopilotChat.nvim", -- Title of the window
          ft = "copilot-chat",   -- This is custom file type from CopilotChat.nvim
          size = { width = 0.4 }, -- Width of the window
        },
      },
    },
  },
}
