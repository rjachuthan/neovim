return {
	-- { "catppuccin/nvim" },
	{
		"rose-pine/neovim",
		lazy = false,
		-- name = "catppuccin",
		name = "rose-pine",
		priority = 1000,
		config = function()
			vim.o.termguicolors = true
			vim.o.background = "dark"
			require("rose-pine").setup({
				variant = "auto",
				styles = {
					bold = true,
					italic = true,
					transparency = true,
				},
			})
			vim.cmd("silent! colorscheme rose-pine")

			-- Uncomment these lines for Transparency
			-- vim.cmd("hi Normal guibg=none")
			-- vim.cmd("hi clear SignColumn")
		end,
	},
	{
		"lukas-reineke/virt-column.nvim",
		config = function()
			require("virt-column").setup({
				-- char = "|",
				virtcolumn = "80,120",
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup()
			local highlight = {
				"CursorColumn",
				"Whitespace",
			}
			require("ibl").setup({
				indent = { highlight = highlight, char = "" },
				whitespace = {
					highlight = highlight,
					remove_blankline_trail = false,
				},
				scope = { enabled = false },
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
		"j-hui/fidget.nvim", -- For Cleaner LSP Progress messages.
		config = function()
			require("fidget").setup({})
		end,
	},
}
