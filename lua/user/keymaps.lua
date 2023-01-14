-- Modified from nvim-basic-ide
-- TODO: Add opts to my custom maps

-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts) -- set in nvim-tmux-navigation
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)
keymap('n', '<space>wh', '<c-w>h', {desc = 'Change window left'})
keymap('n', '<space>wj', '<c-w>j', {desc = 'Change window down'})
keymap('n', '<space>wk', '<c-w>k', {desc = 'Change window up'})
keymap('n', '<space>wl', '<c-w>l', {desc = 'Change window right'})

-- Create and delete windows
keymap('n', '<space>ws', '<c-w>s', {desc = 'Split window horizontally'})
keymap('n', '<space>wv', '<c-w>v', {desc = 'Split window vertically'})
keymap('n', '<space>wn', '<c-w>n', {desc = 'New window'})
keymap('n', '<space>wc', '<c-w>c', {desc = 'Delete/close window'})
keymap('n', '<space>wd', '<c-w>c', {desc = 'Delete/close window'})

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap('n', '<space>bb', '<cmd>Telescope buffers<cr>', {desc = 'Change buffers with Telescope'})

-- Save and delete buffers
keymap('n', '<space>bs', ':w<cr>', {desc = 'Save buffer'})
keymap('n', '<space>bS', ':wa<cr>', {desc = 'Save all buffers'})
keymap('n', '<space>bd', ':bdelete<cr>', {desc = 'Delete buffer'})
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- -- Find files - see also Telescope bindings below
keymap('n', '<space>ff', ':Findr<cr>', {desc = 'Find files'})
keymap('n', '<leader>fr', ':Telescope oldfiles<CR>', {desc = 'Open recently used files with Telescope'})
keymap('n', "<leader>fe", ":Ranger<cr>")
keymap('n', "<leader>fD", ":call delete(expand('%')) | bdelete!", {desc = 'Delete current file'})

-- Better paste TODO: see what this does
-- keymap("v", "p", '"_dP', opts)

-- Move text up and down TODO: see what this does
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode - TODO: understand what this does
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>tf", ":Telescope find_files<CR>", opts)
keymap('n', '<leader>tr', ':Telescope oldfiles<CR>', {desc = 'Open recently used files with Telescope'})
keymap("n", "<leader>tb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>tt", ":Telescope live_grep<CR>", opts) -- 't' for text? or use 'g' for grep?
keymap("n", "<leader>tp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>th", ":Telescope help_tags<CR>", opts)
keymap("n", "<leader>th", ":Telescope help_tags<CR>", opts)
-- for testing purposes
vim.keymap.set('n', '<leader>tq', require('telescope.builtin').find_files, {})

-- Git
-- keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
-- keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
-- keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Lsp
-- keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- Other --
-- Copy/paste to system clipboard
-- vim.keymap.set({'n', 'x'}, '', '"+y')
-- vim.keymap.set({'n', 'x'}, '', '"+p')
-- Set 'x' to delete text without changing the internal register - nice idea, but I'm trained for 'xp' to swap characters
-- vim.keymap.set({'n', 'x'}, 'x', '"_x')
