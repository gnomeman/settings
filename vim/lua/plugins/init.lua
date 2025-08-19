-- Check if Paq is installed. If not, then install.
local paq_path = vim.fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"
local paq_is_installed = vim.fn.empty(vim.fn.glob(paq_path)) == 0
if not paq_is_installed then
  vim.fn.system(
    {
      "git",
      "clone",
      "--depth=1",
      "https://github.com/savq/paq-nvim.git",
      paq_path,
    }
  )

  -- Exit after PaqInstall.
  vim.cmd("autocmd User PaqDoneInstall quit")

  -- Load plugins and install.
  vim.cmd.packadd("paq-nvim")
  local paq = require("paq")
  paq(_loadout.plugins)
  vim.ui.input(
    {
      prompt = "Installing plugins. Afterwards, the system will exit automatically. Press ENTER to proceed.",
    }, function(_)
    end
  )
  paq.install()

  -- Set the state of plugins.
  _loadout.state.plugins_just_installed = true
  return
end

-- Load global list of plugins.
require("paq")(_loadout.plugins)

-- Load specific plugins logic.
require("plugins.cmp")
require("plugins.dadbodui")
require("plugins.harpoon")
require("plugins.kulala")
require("plugins.sunglasses")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.vsnip")
