-- Map ALT f to the function digraph
-- Lua
vim.keymap.set("i", "<C-f>", function()
  local keys = vim.api.nvim_replace_termcodes("<C-k>m3", true, false, true)
  vim.api.nvim_feedkeys(keys, "i", true)
end, { desc = "insert digraph m3" })


