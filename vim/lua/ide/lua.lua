local fn_expand = vim.fn.expand
local vim_split = vim.split

-- Set up the autocomplete logic necessary for listing out LSP options.
require("lua.autocomplete")

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
  local keymap = vim.keymap.set

  -- Key bindings
  keymap(
    "n", "gd", vim.lsp.buf.definition, {
      desc = "Lua: Jumps to the definition of the symbol under the cursor.",
      buffer = bufnr,
    }
  )
  keymap(
    "n", "gr", vim.lsp.buf.references, {
      desc = "Lua: Lists all the references to the symbol under the cursor in the quickfix window.",
    }
  )
  keymap(
    "n", "<leader>R", vim.lsp.buf.rename, {
      desc = "Lua: Renames all references to the symbol under the cursor.",
      buffer = bufnr,
    }
  )
  keymap(
    "n", "<leader>K", vim.lsp.buf.hover, {
      desc = "Lua: Displays hover information about the symbol under the cursor in a floating window.",
      buffer = bufnr,
    }
  )
  keymap(
    "n", "<leader>k", vim.lsp.buf.signature_help, {
      desc = "Lua: Displays signature information about the symbol under the cursor in a floating window.",
      buffer = bufnr,
    }
  )
  keymap(
    "n", "<leader>q", vim.diagnostic.setloclist, {
      desc = "Lua: Add buffer diagnostics to the location list.",
      buffer = bufnr,
    }
  )
  keymap(
    "n", "<leader>e", function()
      vim.diagnostic.open_float(
        0, {
          scope = "line",
        }
      )
    end, {
      desc = "Lua: Display diagnostic message.",
      buffer = bufnr,
    }
  )

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
