-- Locals
local cmd = vim.cmd
local set_keymap = vim.keymap.set

-- Load autocomplete
require("lua.autocomplete")

-- Load LSP configs
require("go.ide")
require("lua.ide")

-- Plugin - ctrl space
cmd([[let g:CtrlSpaceDefaultMappingKey = "<C-space> "]])

-- neogit
local neogit = require("neogit")
neogit.setup({})

-- Debugger keymapping
set_keymap("n", "<Leader>dT", function()
	-- Terminate debugger.
	require("dap").terminate()
	require("dapui").close()
end)
set_keymap("n", "<Leader>dS", function()
	-- Start debugger and UI.
	require("dap").continue()
	require("dapui").open()
end)
set_keymap("n", "<Leader>c", function()
	-- Start debugger or continue until next break.
	require("dap").continue()
end)
set_keymap("n", "<Leader>n", function()
	-- Step over or go to next line.
	require("dap").step_over()
end)
set_keymap("n", "<Leader>s", function()
	-- Step into the function.
	require("dap").step_into()
end)
set_keymap("n", "<Leader>E", function()
	-- Go to the end of the function.
	require("dap").step_out()
end)
set_keymap("n", "<Leader>b", function()
	-- Toggle breakpoint at cursor.
	require("dap").toggle_breakpoint()
end)
set_keymap("n", "<Leader>B", function()
	-- Set breakpoint at cursor.
	require("dap").set_breakpoint()
end)
set_keymap("n", "<Leader>lp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
set_keymap("n", "<Leader>dr", function()
	require("dap").repl.open()
end)
set_keymap("n", "<Leader>dl", function()
	require("dap").run_last()
end)
set_keymap({ "n", "v" }, "<Leader>dh", function()
	require("dap.ui.widgets").hover()
end)
set_keymap({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end)
set_keymap("n", "<Leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)
set_keymap("n", "<Leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)
set_keymap("n", "<Leader>do", function()
	local dapui = require("dapui")
	dapui.open()
end)
set_keymap("n", "<Leader>dc", function()
	local dapui = require("dapui")
	dapui.close()
end)
