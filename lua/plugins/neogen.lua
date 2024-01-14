return {
	"danymat/neogen",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("neogen").setup({
			enabled = true,
			input_after_comment = true,
			snippet_engine = "luasnip",
			languages = {
				python = { template = { annotation_convention = "google_docstrings" } },
			},
		})

		local opts = { noremap = true, silent = true }

		-- Keybindings for creating Docstrings for Functions and Classes
		vim.keymap.set({ "n", "v" }, "<leader>nc", ":lua require('neogen').generate({type = 'class'})<cr>", opts)
		vim.keymap.set({ "n", "v" }, "<leader>nf", ":lua require('neogen').generate({type = 'func'})<cr>", opts)

		-- Keybindings for cycling through comments. This is working through Tab at the moment.
		-- vim.keymap.set("i", "<C-l>", require('neogen').jump_next, opts)
		-- vim.keymap.set("i", "<C-h>", require('neogen').jump_prev, opts)
	end,
}
