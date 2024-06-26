local fn_expand = vim.fn.expand
local nvim_buf_set_keymap = vim.api.nvim_buf_set_keymap
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
  local function buf_set_keymap(...)
    nvim_buf_set_keymap(bufnr, ...)
  end

  -- Key bindings
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<leader>R", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<leader>K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  buf_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()(0, {scope='line'})<CR>", opts)

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
