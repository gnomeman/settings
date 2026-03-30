-- Check if plugin is installed.
if _loadout.state.plugins_just_installed then
  return
end

local cleanup_old_files_async = require("internal.filepaths").cleanup_old_files_async

-- Persistence
if vim.fn.has("persistent_undo") then
	local undodir = vim.fn.expand('~/.undodir')

	-- Create the directory and any parent directories if the location does not exist.
	if not vim.fn.isdirectory(undodir) then
		vim.fn.mkdir(undodir, "p", 0700)
	end

	-- Set undotree flags.
	vim.opt.undodir = undodir
	vim.opt.undofile = true

	-- Flush old and/or unused persistence files.
	cleanup_old_files_async(undodir, 30)
end

-- Keymaps
vim.keymap.set(
  "n", "<leader>ut", vim.cmd.UndotreeToggle, {
    desc = "Toggle undo tree.",
  }
)
