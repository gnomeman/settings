local keymap = vim.keymap.set

local bufnr = vim.api.nvim_get_current_buf()

-- TODO: All LSPs basically do the same thing and should be abstracted into a generic keymap.
-- Mappings.
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
