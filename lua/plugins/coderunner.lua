return {
	"CRAG666/code_runner.nvim",
	config = function()
    require("code_runner").setup({
      filetype = {
        python = "python -u"
      }
    })

    local opts = { noremap = true, silent = false }

    vim.keymap.set("n", "<leader>r", ":RunCode<CR>", opts)
    vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", opts)
    vim.keymap.set("n", "<leader>rft", ":RunFile tab<CR>", opts)
    vim.keymap.set("n", "<leader>rp", ":RunProject<CR>", opts)
    vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", opts)
  end
}
