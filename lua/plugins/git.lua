return {
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.keymap.set("n", "<sc-g>", ":LazyGit<CR>")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = " " },
					topdelete = { text = " " },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
			})
		end,
	},
}
