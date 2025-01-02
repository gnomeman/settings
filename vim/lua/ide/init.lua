local cmd = vim.cmd
local opt = vim.opt
local keymap = vim.keymap.set

-- Enable folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

-- Debugger keymapping
keymap(
  "n", "<Leader>dT", function()
    -- Terminate debugger.
    require("dap").terminate()
    require("dapui").close()
  end
)
keymap(
  "n", "<Leader>dS", function()
    -- Start debugger and UI.
    require("dap").continue()
    require("dapui").open()
  end
)
keymap(
  "n", "<Leader>c", function()
    -- Start debugger or continue until next break.
    require("dap").continue()
  end
)
keymap(
  "n", "<Leader>n", function()
    -- Step over or go to next line.
    require("dap").step_over()
  end
)
keymap(
  "n", "<Leader>s", function()
    -- Step into the function.
    require("dap").step_into()
  end
)
keymap(
  "n", "<Leader>E", function()
    -- Go to the end of the function.
    require("dap").step_out()
  end
)
keymap(
  "n", "<Leader>b", function()
    -- Toggle breakpoint at cursor.
    require("dap").toggle_breakpoint()
  end
)
keymap(
  "n", "<Leader>B", function()
    -- Set breakpoint at cursor.
    require("dap").set_breakpoint()
  end
)
keymap(
  "n", "<Leader>lp", function()
    require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
  end
)
keymap(
  "n", "<Leader>dr", function()
    require("dap").repl.open()
  end
)
keymap(
  "n", "<Leader>dl", function()
    require("dap").run_last()
  end
)
keymap(
  {
    "n",
    "v",
  }, "<Leader>dh", function()
    require("dap.ui.widgets").hover()
  end
)
keymap(
  {
    "n",
    "v",
  }, "<Leader>dp", function()
    require("dap.ui.widgets").preview()
  end
)
keymap(
  "n", "<Leader>df", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.frames)
  end
)
keymap(
  "n", "<Leader>ds", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
  end
)
keymap(
  "n", "<Leader>do", function()
    local dapui = require("dapui")
    dapui.open()
  end
)
keymap(
  "n", "<Leader>dc", function()
    local dapui = require("dapui")
    dapui.close()
  end
)

--
require("ide.go")
require("ide.lua")
