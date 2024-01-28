vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
--  Check `echo has('clipboard')`
--    -> If it returns 1, then it is enabled.
--    -> If it returns 0, then either install `xclip` or `wl-clipboard` on wayland
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakpoint = true

-- Save undo history
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Case-insensitive search UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep sign column on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menu,menuone,noselect"

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Indentation
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Don't use Swap Files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window

-- Confirm to save change before exiting modified buffer
vim.opt.confirm = true

-- Enable highlighting of Current Line
vim.opt.cursorline = false

-- Configure text formatting options
--   j: Auto-indent lines starting with keywords
--   c: Format comments as you type
--   r: Auto-wrap lines to specified text width
--   o: Automatically insert comment characters in comments
--   q: Format text with 'gq' command intelligently
--   l: Break long lines to fit text width
--   n: Indent numbered lists
--   t: Maintain alignment in tables
vim.opt.formatoptions = "jcroqlnt" --tcqj

-- Configure the format for grep results
--   %f: File name
--   %l: Line number
--   %c: Column number
--   %m: Matched line text
vim.opt.grepformat = "%f:%l:%c:%m"

-- Global Statusline
vim.opt.laststatus = 3

-- Dont show mode since we have a statusline
vim.opt.showmode = false

-- Allow cursor to move where there is no text in visual block mode
vim.opt.virtualedit = "block"

vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = "⸱",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
