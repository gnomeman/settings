local fn_expand = vim.fn.expand
local nvim_buf_set_keymap = vim.api.nvim_buf_set_keymap
local vim_split = vim.split

local PATH_LUA_LSP_MAIN = "~/Github/lua-language-server/main.lua"

local opts = {
  noremap = true,
  silent = true,
}

local settings = {
  Lua = {
    runtime = {
      version = "Lua 5.1",
      --version = "Lua 5.3.3",
      path = {
        "?.lua",
        "?/init.lua",
        vim_split(package.path, ";"),
		-- v5.1 or Luajit
		"/usr/lib/luarocks/rocks-5.1/",
		-- v5.3
        --"/usr/local/lib/luarocks/rocks-5.3/?/init.lua",
        --"/usr/local/lib/lua/5.3/?/init.lua",
      },
    },
    workspace = {
      library = {
		-- Project path
        os.getenv("PWD"),
		-- v5.1 or Luajib
		"/usr/lib/luarocks/rocks-5.1/",
		-- v5.3
        --"/usr/local/lib/luarocks/rocks-5.3",
        --"/usr/local/lib/lua/5.3",
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
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "ga", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
end

require("lspconfig").sumneko_lua.setup(
  {
    cmd = {
      "lua-language-server",
      "-E",
      fn_expand(PATH_LUA_LSP_MAIN),
    },
    settings = settings,
    on_attach = on_attach,
  }
)
