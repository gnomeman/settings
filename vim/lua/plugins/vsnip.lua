local call = vim.fn.call
local keymap = vim.keymap.set

-- https://www.reddit.com/r/neovim/comments/o66q3d/comment/h2qv417/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
-- https://www.reddit.com/r/neovim/comments/sl9e3j/converting_viml_expr_mapping_with_plug_key_to/

keymap({ "i", "s" }, "<tab>", function()
  if vim.fn["vsnip#jumpable"](1) == 1 then
    return '<plug>(vsnip-jump-next)'
  else
    return "<tab>"
  end
end, { expr = true, remap = true })
