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

return _M
