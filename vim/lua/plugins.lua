require("paq")({
	-- Dependencies
	"savq/paq-nvim",
	"nvim-lua/plenary.nvim",
	"neovim/nvim-lspconfig",
	"nvim-treesitter/nvim-treesitter",
	"vim-ctrlspace/vim-ctrlspace",
	-- Git
	"TimUntersberger/neogit",
	-- Autocomplete
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	-- Debugger
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"leoluz/nvim-dap-go",
})

-- Load autocomplete
require("lua.autocomplete")

-- Load LSP configs
require("go.ide")
require("lua.ide")

-- Plugin - ctrl space
vim.cmd([[let g:CtrlSpaceDefaultMappingKey = "<C-space> "]])

-- neogit
local neogit = require("neogit")
neogit.setup({})
