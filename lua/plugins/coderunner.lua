return {
  {
    "CRAG666/code_runner.nvim",
    config = function()
      require("code_runner").setup({
        filetype = {
          python = "python -u",
        },
      })

      local opts = { noremap = true, silent = false }

      vim.keymap.set("n", "<leader>r", ":RunCode<CR>", opts)
      vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", opts)
      vim.keymap.set("n", "<leader>rft", ":RunFile tab<CR>", opts)
      vim.keymap.set("n", "<leader>rp", ":RunProject<CR>", opts)
      vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", opts)
    end,
  },
  {
    "Vigemus/iron.nvim",
    config = function()
      local iron = require("iron.core")

      iron.setup({
        config = {
          scratch_repl = true,
          repl_definition = { sh = { command = { "zsh" } } },
          -- How the repl window will be displayed
          -- See below for more information
          repl_open_cmd = require("iron.view").split("40%")
        },
        -- Iron doesn't set keymaps by default anymore.
        -- You can set them here or manually add keymaps to the functions in iron.core
        keymaps = {
          send_motion = "<S-cr>",
          visual_send = "<S-cr>",
          send_file = "<leader>sf",
          send_line = "<leader>sl",
          send_until_cursor = "<leader>su",
          send_mark = "<leader>sm",
          mark_motion = "<leader>mc",
          mark_visual = "<leader>mc",
          remove_mark = "<leader>md",
          cr = "<leader>s<cr>",
          interrupt = "<leader>s<space>",
          exit = "<leader>sq",
          clear = "<leader>cl",
        },
        -- If the highlight is on, you can change how it looks
        -- For the available options, check nvim_set_hl
        highlight = {
          italic = true,
        },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      })

      -- iron also has a list of commands, see :h iron-commands for all available commands
      vim.keymap.set("n", "<leader>rs", "<cmd>IronRepl<cr>")
      vim.keymap.set("n", "<leader>rr", "<cmd>IronRestart<cr>")
      vim.keymap.set("n", "<leader>rf", "<cmd>IronFocus<cr>")
      vim.keymap.set("n", "<leader>rh", "<cmd>IronHide<cr>")
    end,
  },
}
