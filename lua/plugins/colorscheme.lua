return {
  -- "catppuccin/nvim",
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
}
