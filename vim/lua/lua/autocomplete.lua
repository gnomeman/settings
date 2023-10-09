-- Setup nvim-cmp for autocomplete
local cmp = require("cmp")

cmp.setup(
  {
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4)),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete()),
      ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm(
        {
          select = true,
        }
      ), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<C-n>"] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ["<C-p>"] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end,
    },
    sources = cmp.config.sources(
      {
        {
          name = "nvim_lsp",
        },
        {
          name = "vsnip",
        },
      }, {
        {
          name = "buffer",
        },
      }
    ),
  }
)

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
  "/", {
    sources = {
      {
        name = "buffer",
      },
    },
  }
)

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
  ":", {
    sources = cmp.config.sources(
      {
        {
          name = "path",
        },
      }, {
        {
          name = "cmdline",
        },
      }
    ),
  }
)
