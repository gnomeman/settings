-- https://www.getman.io/posts/programming-go-in-neovim/
local nvim_lsp = require("lspconfig")

-- Callback after LSP is loaded.
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = {
    noremap = true,
    silent = true,
  }
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<leader>R", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<leader>K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  buf_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()(0, {scope='line'})<CR>", opts)

  -- Set some keybinds conditional on server capabilities
  if client.server_capabilities.document_formatting then
    buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opts)
  elseif client.server_capabilities.document_range_formatting then
    buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.formatexpr()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      hi LspReferenceRead cterm=bold ctermbg=DarkMagenta guibg=#859900
      hi LspReferenceText cterm=bold ctermbg=DarkMagenta guibg=#859900
      hi LspReferenceWrite cterm=bold ctermbg=DarkMagenta guibg=#859900
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false
    )
  end
end

local function goimports()
  local context = {
    source = {
      organizeImports = true,
    },
  }
  vim.validate(
    {
      context = {
        context,
        "t",
        true,
      },
    }
  )

  local params = vim.lsp.util.make_range_params()
  params.context = context

  -- See the implementation of the textDocument/codeAction callback
  -- (lua/vim/lsp/handler.lua) for how to do this properly.
  local timeout_ms = 3000
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  if not result or next(result) == nil then
    return
  end
  local actions = result[1].result
  if not actions then
    return
  end
  local action = actions[1]

  -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
  -- is a CodeAction, it can have either an edit, a command or both. Edits
  -- should be executed first.
  if action.edit or type(action.command) == "table" then
    if action.edit then
      vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
    end
    if type(action.command) == "table" then
      vim.lsp.buf.execute_command(action.command)
    end
  else
    vim.lsp.buf.execute_command(action)
  end
end

-- Set up gopls
nvim_lsp.gopls.setup(
  {
    cmd = {
      "gopls",
    },
    -- for postfix snippets and analyzers
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
      },
    },
    on_attach = on_attach,
  }
)

-- Auto format on save
vim.api.nvim_create_autocmd(
  "BufWritePre", {
    pattern = "*.go",
    callback = function()
      return vim.lsp.buf.format(
               {
          async = true,
        }
             )
    end,
  }
)

-- Run goimports on save
vim.api.nvim_create_autocmd(
  "BufWritePre", {
    pattern = "*.go",
    callback = goimports,
  }
)

-- Setup for debuger
require("dap-go").setup()
require("dapui").setup()
