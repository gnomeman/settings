-- Callback after LSP is loaded.
local on_attach = function(client, bufnr)
  -- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local keymap = vim.keymap.set
  keymap(
    "n", "gd", vim.lsp.buf.definition, {
      desc = "Jumps to the definition of the symbol under the cursor.",
      buffer = bufnr,
    }
  )
  keymap(
    "n", "gr", vim.lsp.buf.references, {
      desc = "Lists all the references to the symbol under the cursor in the quickfix window.",
      buffer = bufnr,
    }
  )
  keymap(
    "n", "<leader>R", vim.lsp.buf.rename, {
      desc = "Renames all references to the symbol under the cursor.",
      buffer = bufnr,
    }
  )
  keymap(
    "n", "<leader>K", vim.lsp.buf.hover, {
      desc = "Displays hover information about the symbol under the cursor in a floating window.",
    }
  )
  keymap(
    "n", "<leader>k", vim.lsp.buf.signature_help, {
      desc = "Displays signature information about the symbol under the cursor in a floating window.",
      buffer = bufnr,
    }
  )
  keymap(
    "n", "<leader>q", vim.diagnostic.setloclist, {
      desc = "Add buffer diagnostics to the location list.",
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
      desc = "Display diagnostic message.",
      buffer = bufnr,
    }
  )

  -- Set some keybinds conditional on server capabilities
  if client.server_capabilities.document_formatting then
    keymap(
      "n", "ff", function()
        vim.lsp.buf.format(
          {
            async = true,
          }
        )
      end, {
        desc = "Formats a buffer using the attached (and optionally filtered) language server clients.",
        buffer = bufnr,
      }
    )
  elseif client.server_capabilities.document_range_formatting then
    keymap(
      "n", "ff", vim.lsp.formatexpr, {
        desc = "Formats a buffer using the attached (and optionally filtered) language server clients.",
        buffer = bufnr,
      }
    )
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

-- Set up gopls
require("lspconfig").gopls.setup(
  {
    cmd = {
      "gopls",
    },
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
    on_attach = on_attach,
  }
)

-- Auto format on save
vim.api.nvim_create_autocmd(
  {
    "BufWritePre",
  }, {
    pattern = {
      "*.go",
    },
    callback = function()
      local params = vim.lsp.util.make_range_params()
      params.context = {
        only = {
          "source.organizeImports",
        },
      }
      -- buf_request_sync defaults to a 1000ms timeout. Depending on your
      -- machine and codebase, you may want longer. Add an additional
      -- argument after params if you find that you have to write the file
      -- twice for changes to be saved.
      -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
      local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
      for cid, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
          if r.edit then
            local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
            vim.lsp.util.apply_workspace_edit(r.edit, enc)
          end
        end
      end
      vim.lsp.buf.format(
        {
          async = false,
        }
      )
    end,
  }
)

-- LSP autocomplete
vim.opt.completeopt = {
  "menu",
  "menuone",
  "noselect",
}

-- Setup for debuger
require("dap-go").setup()
require("dapui").setup()
