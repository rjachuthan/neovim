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
}
