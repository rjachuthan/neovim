return {
	"numToStr/Comment.nvim",
	lazy = false,
	config = function()
		require("Comment").setup({
			-- Add a space b/w comment and the line
			padding = true,
			sticky = true, -- Whether the cursor should stay at its position
			ignore = nil,
			toggler = {
				line = "gcc", -- Line-comment toggle keymap
				block = "gbc", -- Block-comment toggle keymap
			},
			opleader = {
				line = "gc", -- Line-comment keymap
				block = "gb", -- Block-comment keymap
			},
			extra = {
				above = "gcO", -- Add comment on the line above
				below = "gco", -- Add comment on the line below
				eol = "gcA", -- Add comment at the end of line
			},
			mappings = {
				basic = true, -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
				extra = true, -- Extra mapping; `gco`, `gcO`, `gcA`
			},
			pre_hook = nil,
			post_hook = nil,
		})
	end,
}
