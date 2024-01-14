return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		event = "VeryLazy",
		version = false,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				enabled = vim.fn.executable("make") == 1,
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
		},
		keys = {
			{ "<leader>sf", ":Telescope git_files<cr>", desc = "Find Files (root dir)" },
			{ "<C-p>", ":Telescope find_files<cr>", desc = "Find Files (root dir)" },
			{ "<leader><space>", ":Telescope buffers<cr>", desc = "Find Buffers" },
			{ "<leader>sg", ":Telescope live_grep<cr>", desc = "Search Project" },
			{ "<leader>ss", ":Telescope lsp_document_symbols<cr>", desc = "Search Document Symbols" },
			{ "<leader>sw", ":Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Search Workspace Symbols" },
		},
		opts = {
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		},
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end,
	},
}
