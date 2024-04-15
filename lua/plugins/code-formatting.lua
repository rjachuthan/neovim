return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
          -- Use a sub-list to run only the first available formatter
          javascript = { { "prettierd", "prettier" } },
        },
        format_on_save = {
          lsp_fallback = true,
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>fd", function()
        require("conform").format({
          lsp_fallback = true,
        })
      end, { desc = "Format file for range (in visual mode)" })
    end,
  },
}
