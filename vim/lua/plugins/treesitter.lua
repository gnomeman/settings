local ok, treesitter = pcall(require, "nvim-treesitter")
if not ok then
  return
end

treesitter.setup({
	indent = {
		enaabled = false,
	}
})

local langs = {"go","java","javascript","json","lua","python","yaml"}
treesitter.install(langs)

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"go","java","javascript","json","lua","python","yaml"},
	callback = function()
		-- syntax highlighting, provided by Neovim
		vim.treesitter.start()

		-- folds, provided by Neovim
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo.foldmethod = "expr"

		-- indentation, provided by nvim-treesitter
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
