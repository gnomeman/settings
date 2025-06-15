local keymap = vim.keymap.set
local opt = vim.opt

local opts_silent = require("internal.keymap").opts_silent

-- Enable folding
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldenable = false

-- Debugger keymapping
keymap(
  "n", "<Leader>dT", function()
    -- Terminate debugger.
    require("dap").terminate()
    require("dapui").close()
  end,
	opts_silent("Debugger: Terminate")
)
keymap(
  "n", "<Leader>dS", function()
    -- Start debugger and UI.
    require("dap").continue()
    require("dapui").open()
  end,
	opts_silent("Debugger: Start debugger and UI.")
)
keymap(
  "n", "<Leader>c", function()
    -- Start debugger or continue until next break.
    require("dap").continue()
  end,
	opts_silent("Debugger: Start debugger or continue until next break.")
)
keymap(
  "n", "<Leader>n", function()
    -- Step over or go to next line.
    require("dap").step_over()
  end,
	opts_silent("Debugger: Step over or go to next line.")
)
keymap(
  "n", "<Leader>s", function()
    -- Step into the function.
    require("dap").step_into()
  end,
	opts_silent("Debugger: Step into the function.")
)
keymap(
  "n", "<Leader>E", function()
    -- Go to the end of the function.
    require("dap").step_out()
  end,
	opts_silent("Debugger: Go to the end of the function.")
)
keymap(
  "n", "<Leader>b", function()
    -- Toggle breakpoint at cursor.
    require("dap").toggle_breakpoint()
  end,
	opts_silent("Debugger: Toggle breakpoint at cursor.")
)
keymap(
  "n", "<Leader>B", function()
    -- Set breakpoint at cursor.
    require("dap").set_breakpoint()
  end,
	opts_silent("Debugger: Set breakpoint at cursor.")
)
keymap(
  "n", "<Leader>lp", function()
    require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
  end,
	opts_silent("Debugger: Log point")
)
keymap(
  "n", "<Leader>dr", function()
    require("dap").repl.open()
  end,
	opts_silent("Debugger: Open REPL")
)
keymap(
  "n", "<Leader>dl", function()
    require("dap").run_last()
  end,
	opts_silent("Debugger: Last run")
)
keymap(
  {
    "n",
    "v",
  }, "<Leader>dh", function()
    require("dap.ui.widgets").hover()
  end,
	opts_silent("Debugger: Hover")
)
keymap(
  {
    "n",
    "v",
  }, "<Leader>dp", function()
    require("dap.ui.widgets").preview()
  end,
	opts_silent("Debugger: Preview")
)
keymap(
  "n", "<Leader>df", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.frames)
  end,
	opts_silent("Debugger: Frames")
)
keymap(
  "n", "<Leader>ds", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
  end,
	opts_silent("Debugger: Scopes")
)
keymap(
  "n", "<Leader>do", function()
    local dapui = require("dapui")
    dapui.open()
  end,
	opts_silent("Debugger: Open")
)
keymap(
  "n", "<Leader>dc", function()
    local dapui = require("dapui")
    dapui.close()
  end,
	opts_silent("Debugger: Close")
)

--
require("ide.go")
require("ide.lua")

