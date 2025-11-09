
local osc52 = require("vim.ui.clipboard.osc52")

local function reg_paste(regname)
  return { vim.fn.getreg(regname) }, vim.fn.getregtype(regname)
end

local using_ssh = (vim.env.SSH_TTY or vim.env.SSH_CONNECTION) and true or false

vim.opt.clipboard = ""
if using_ssh then
  -- make yanks go to system clipboard by default during SSH
  vim.g.clipboard = {
    name = "osc52_copy_only",
    copy = {
      ["+"] = osc52.copy("+"),
      ["*"] = osc52.copy("*"),
    },
    paste = {
      ["+"] = reg_paste,
      ["*"] = reg_paste,
    },
  }
else
  -- local kernel console, keep everything internal to Neovim
  vim.g.clipboard = nil
  vim.opt.clipboard = ""
end

-- keymaps: use <leader>y/p for local clipboard, keep y/p for internal
-- normal and visual, yank to system clipboard
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { silent = true, desc = "yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y',          { silent = true, desc = "yank line to system clipboard" })

-- paste from system clipboard
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p', { silent = true, desc = "paste from system clipboard" })
vim.keymap.set("n", "<leader>P", '"+P',          { silent = true, desc = "paste before from system clipboard" })

-- optional quality-of-life
vim.keymap.set("n", "<leader>yy", '"+yy', { silent = true, desc = "yank current line to system clipboard" })
vim.keymap.set("n", "<leader>ya", 'gg"+yG', { silent = true, desc = "yank entire buffer to system clipboard" })


