local nvim_set_hl = vim.api.nvim_set_hl

local _M = {}

---
-- Set highlight.
--
-- @param group string
-- @param fg table
-- @param bg table
-- @param opts table
function _M.set_highlight(group, fg, bg, opts)
  local hl_opts = {
    fg = fg.gui,
    bg = bg.gui,
    ctermfg = fg.cterm,
    ctermbg = bg.cterm,
  }

  -- TODO: Check if the key is in nvim_set_hl.parameters.val
  if type(opts) == "table" then
    if opts.bold then
      hl_opts.bold = true
    end

    if opts.italic then
      hl_opts.italic = true
    end

    if opts.standout then
      hl_opts.standout = true
    end

    if opts.underline then
      hl_opts.underline = true
    end
  end

  -- :help nvim_set_hl
  nvim_set_hl(0, group, hl_opts)
end

return _M
