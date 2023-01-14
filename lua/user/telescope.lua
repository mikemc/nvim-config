local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

-- local actions = require "telescope.actions"

print("telescope setup")

telescope.setup {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "truncate" }, -- Doesn't work for some reason
    dynamic_preview_title = true,
    file_ignore_patterns = { ".git/", "node_modules" },
    mappings = {
      i = {
        ["<Down>"] = "cycle_history_next",
        ["<Up>"] = "cycle_history_prev",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    find_files = {
      path_display = { "truncate" },
    },
  },
}

-- local builtin = require("telescope.builtin")
--
-- builtin.find_files({
--         -- use fd to "find files" and return absolute paths
--   find_command = { "fd", "-t=f", "-a" },
-- 	path_display = { "absolute" },
-- })
