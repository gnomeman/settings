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
  vim.api.nvim_create_autocmd(
    "User", {
      pattern = "PaqDoneInstall",
      callback = function()
        -- Set state of plugins install.
        _loadout.state.plugins_just_installed = true

        -- Prompt user that editor will exit.
        vim.ui.input(
          {
            prompt = "Plugins installed. Reboot required. Press ENTER to proceed.",
          }, function(_)
          end
        )
        vim.cmd("quit")
      end,
    }
  )

  -- Load plugins and install.
  vim.cmd.packadd("paq-nvim")
  local paq = require("paq")
  paq(_loadout.plugins)
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
require("plugins.undotree")
require("plugins.vsnip")
