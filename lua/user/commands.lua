-- Select all (todo: keep current file position; currently moves to last line)
vim.api.nvim_create_user_command('SelectAll', ':keepjumps normal! ggVG<cr>', {})
