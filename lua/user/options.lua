-- adapted from https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/options.lua
local options = {
  autochdir = true,
  backup = false,                          -- creates a backup file
--  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
--  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = false,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  smartcase = true,                        -- smart case
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
--  showtabline = 2,                         -- always show tabs
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}

  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = true,                             -- display lines as one long line
  breakindent = true,                      -- maintain indentation levels in wrapped lines
  linebreak = true,                        -- companion to wrap, don't split words
  scrolloff = 8,                           -- minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 8,                       -- minimal number of screen columns either side of cursor if wrap is `false`
--  guifont = "monospace:h17",               -- the font used in graphical neovim applications
--  whichwrap = "bs<>[]hl",                  -- which "horizontal" keys are allowed to travel to prev/next line
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd[[colorscheme tokyonight-night]]                -- set colorscheme

-- vim.opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.shortmess:append "c"                           -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append "-"                           -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" })        -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")  -- separate vim plugins from neovim in case vim still in use


-- Nvim-R --

local r_options = {
  -- R output is highlighted with current colorscheme
  rout_follow_colorscheme = 1,
  -- R commands in R output are highlighted
  Rout_more_colors = 1,
  -- Set _ expansion behavior
  R_assign = 3,
  -- let R_assign = 2,
  -- set a minimum source editor width
  R_min_editor_width = 80,
  -- 9.10. Highlight chunk header as R code~
  rrst_syn_hl_chunk = 1,
  rmd_syn_hl_chunk = 1,
  -- pdf and html loading
  -- R_openpdf = 1
  -- R_openhtml = 1
}

for k, v in pairs(r_options) do
  vim.g[k] = v
end
