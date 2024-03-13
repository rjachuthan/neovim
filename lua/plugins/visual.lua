return {
	{ "catppuccin/nvim" },
	{ "kdheepak/monochrome.nvim" },
	{ "bluz71/vim-moonfly-colors" },
	{ "olivercederborg/poimandres.nvim" },
	{ "rose-pine/neovim" },
	{
		"lukas-reineke/virt-column.nvim",
		config = function()
			require("virt-column").setup({
				virtcolumn = "80,120",
				char = "┊",
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		enabled = false,
		config = function()
			require("ibl").setup({
				-- indent = {
				--   char = "┊"
				-- }
			})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})
			require("noice").setup({
				lsp = {
					-- Override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				-- You can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		init = function()
			-- Disable until lualine loads
			vim.o.laststatus = 0
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "iceberg_dark",
					icons_enabled = true,
					-- section_separators = { left = "", right = "" },
					-- component_separators = { left = "", right = "" },
					component_separators = "|",
					section_separators = "",
					globalstatus = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename", "buffer" },
					lualine_x = { "filetype" },
					lualine_y = { "" },
					lualine_z = { "location" },
				},
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({})
		end,
	},
}
