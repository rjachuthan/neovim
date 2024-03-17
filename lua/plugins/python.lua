return {
  {
    "linux-cultist/venv-selector.nvim",
    ft = { "python", "qmd", "ipynb" },
    opts = {
      keys = {
        {
          "<leader>cv",
          "<cmd>:VenvSelect<cr>",
          desc = "Select VirtualEnv",
        },
        {
          "<leader>cc",
          "<cmd>:VenvSelectCached<cr>",
          desc = "Select Cached VirtualEnv",
        },
      },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
    config = function()
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    build = ":UpdateRemotePlugins",
    ft = { "python" },
    init = function()
      vim.g.python3_host_prog = vim.fn.expand("~/.config/nvim/neovim/bin/python3")
    end,
    config = function()
      vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
      vim.keymap.set(
        "n",
        "<localleader>e",
        ":MoltenEvaluateOperator<CR>",
        { silent = true, desc = "run operator selection" }
      )
      vim.keymap.set("n", "<localleader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
      vim.keymap.set(
        "n",
        "<localleader>rr",
        ":MoltenReevaluateCell<CR>",
        { silent = true, desc = "re-evaluate cell" }
      )
      vim.keymap.set(
        "v",
        "<localleader>r",
        ":<C-u>MoltenEvaluateVisual<CR>gv",
        { silent = true, desc = "evaluate visual selection" }
      )
    end,
  },
}
