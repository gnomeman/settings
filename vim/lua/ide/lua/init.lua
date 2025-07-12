local fn_expand = vim.fn.expand
local vim_split = vim.split

local base_ide_keymaps = require("internal.keymap").base_ide_keymaps

local PATH_LUA_LSP_MAIN = "/home/luthor/Projects/Github/lua-language-server/main.lua"

local opts = {
  noremap = true,
  silent = true,
}

local settings = {
  Lua = {
    runtime = {
      version = "Lua 5.1",
      -- version = "Lua 5.3.3",
      path = {
        "?.lua",
        "?/init.lua",
        vim_split(package.path, ";"),
        -- v5.1 or Luajit
        "/usr/lib/luarocks/rocks-5.1/",
        -- v5.3
        -- "/usr/local/lib/luarocks/rocks-5.3/?/init.lua",
        -- "/usr/local/lib/lua/5.3/?/init.lua",
      },
    },
    workspace = {
      library = {
        -- Project path
        os.getenv("PWD"),
        -- v5.1 or Luajib
        "/usr/lib/luarocks/rocks-5.1/",
        -- v5.3
        -- "/usr/local/lib/luarocks/rocks-5.3",
        -- "/usr/local/lib/lua/5.3",
      },
    },
    diagnostics = {
      globals = {
        "vim",
      },
    },
  },
}

local function on_attach(client, bufnr)
	base_ide_keymaps(bufnr)
end

require("lspconfig").lua_ls.setup(
  {
    cmd = {
      "lua-language-server",
      "-E",
      fn_expand(PATH_LUA_LSP_MAIN),
    },
    settings = settings,
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  }
)
