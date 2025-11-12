-- put this in your init.lua (after lazy) or in lua/config/colors.lua
local colorschemes = {
  "tokyonight",
  "gruvbox",
  "catppuccin",
  "kanagawa",
  "cyberdream",
  "nightfox",
}

local state_file = vim.fn.stdpath("state") .. "/last_colorscheme.txt"

local function write_last_scheme(name)
  local ok, fh = pcall(vim.loop.fs_open, state_file, "w", 420) -- 0644
  if ok and fh then
    vim.loop.fs_write(fh, name, -1)
    vim.loop.fs_close(fh)
  end
end

local function read_last_scheme()
  local fd = vim.loop.fs_open(state_file, "r", 384) -- 0600 ok too
  if not fd then return nil end
  local stat = vim.loop.fs_fstat(fd)
  local data = ""
  if stat and stat.size > 0 then
    data = vim.loop.fs_read(fd, stat.size, 0) or ""
  end
  vim.loop.fs_close(fd)
  data = data:gsub("%s+$","")
  return (#data > 0) and data or nil
end

local function apply_colorscheme(name)
  if not name then return end
  local ok = pcall(vim.cmd.colorscheme, name)
  if ok then
    write_last_scheme(name)
    vim.notify("colorscheme: " .. name, vim.log.levels.INFO, { title = "Theme" })
  else
    vim.notify("failed to set colorscheme: " .. name, vim.log.levels.WARN, { title = "Theme" })
  end
end

local function index_of(tbl, val)
  for i, v in ipairs(tbl) do
    if v == val then return i end
  end
  return nil
end

local function rotate_next()
  local current = vim.g.colors_name
  local idx = index_of(colorschemes, current) or 0
  local next_idx = (idx % #colorschemes) + 1
  apply_colorscheme(colorschemes[next_idx])
end

local function rotate_prev()
  local current = vim.g.colors_name
  local idx = index_of(colorschemes, current) or 1
  local prev_idx = (idx - 2) % #colorschemes + 1
  apply_colorscheme(colorschemes[prev_idx])
end

local function choose_scheme()
  vim.ui.select(colorschemes, { prompt = "Select colorscheme" }, function(choice)
    if choice then apply_colorscheme(choice) end
  end)
end

-- load last scheme on startup, or fall back to the first in the list
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local last = read_last_scheme()
    if last and index_of(colorschemes, last) then
      apply_colorscheme(last)
    else
      apply_colorscheme(colorschemes[1])
    end
  end,
})

-- keymaps, change <leader> as you like
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>c",  rotate_next, opts)   -- rotate forward
vim.keymap.set("n", "<leader>C",  rotate_prev, opts)   -- rotate backward
vim.keymap.set("n", "<leader>cs", choose_scheme, opts) -- pick from list

