local keymap = vim.keymap.set

local _M = {}

---
-- Generate silent opts table.
--
-- @param desc string
-- @return table
function _M.opts_silent(desc)
  return {
    noremap = true,
    silent = true,
    desc = desc,
  }
end

---
-- Base set of IDE keymaps.
--
-- @param cbuf Current buffer.
-- @return table
function _M.base_ide_keymaps(cbuf)
  local float_w_border = {
    border = "rounded",
  }

  keymap(
    "n", "gi", vim.lsp.buf.implementation, {
      desc = "Jumps to the implementation of the symbol under the cursor.",
      buffer = cbuf,
    }
  )
  keymap(
    "n", "gd", vim.lsp.buf.definition, {
      desc = "Jumps to the definition of the symbol under the cursor.",
      buffer = cbuf,
    }
  )
  keymap(
    "n", "gr", vim.lsp.buf.references, {
      desc = "Lists all the references to the symbol under the cursor in the quickfix window.",
      buffer = cbuf,
    }
  )
  keymap(
    "n", "<leader>R", vim.lsp.buf.rename, {
      desc = "Renames all references to the symbol under the cursor.",
      buffer = cbuf,
    }
  )
  keymap(
    "n", "<leader>K", function(_)
      vim.lsp.buf.hover(float_w_border)
    end, {
      desc = "Displays hover information about the symbol under the cursor in a floating window.",
    }
  )
  keymap(
    "n", "<leader>k", function(_)
      vim.lsp.buf.signature_help(float_w_border)
    end, {
      desc = "Displays signature information about the symbol under the cursor in a floating window.",
      buffer = cbuf,
    }
  )
  keymap(
    "n", "<leader>q", vim.diagnostic.setloclist, {
      desc = "Add buffer diagnostics to the location list.",
      buffer = cbuf,
    }
  )
  keymap(
    "n", "<leader>e", function(_)
      vim.diagnostic.open_float(
        0, vim.tbl_extend(
          "force", float_w_border, {
            scope = "line",
          }
        )
      )
    end, {
      desc = "Display diagnostic message.",
      buffer = cbuf,
    }
  )
end

return _M
