-- load the lazy plugin manager
require("config.lazy")
-- keymappings and vim config
require("config.digraph")
require("config.clipboard")
require("config.options")

-- color schemes and icons and other UI config
require("plugins.mini_icons")
require("plugins.themes")
require("config.themes")

-- git 
require("plugins.neogit")
-- git blame support
require("plugins.blame")
-- support displaying images in neovim (though kitty, ueberzugpp, opt tmux) 
require("plugins.image")
-- fast fuzzy find
require("plugins.telescope")
-- language syntax support
require("plugins.treesitter")
-- mini map
require("plugins.minimap")
-- snippets with vscode friendly snippets
require("plugins.snippets")
require("luasnip.loaders.from_vscode").lazy_load()
-- dbee
require("plugins.dbee")
-- blink auto complete
require("plugins.blink")
-- lualine status line
require("plugins.lualine")
-- fidget status line / notification messages
require("plugins.fidget")
-- enable csv view
require("plugins.csvview")

vim.keymap.set('n', '<leader>tq', ':lua require("dbee").execute(query)<CR>', { desc = 'Execute DBEE query' })
vim.keymap.set('n', '<leader>td', ':lua require("dbee").toggle()<CR>', { desc = 'Toggle DBEE window' })

vim.keymap.set("n", "<leader>qe", function()
    -- get the current line under cursor
    local query = vim.api.nvim_get_current_line()

    -- call dbee.execute with the current line contents
    require("dbee").execute(query)
end, { noremap = true, silent = true, desc = "Execute current line as DB query" })


-- LSP setup :)
require("lsp.clangd")
require("config.clangd")
require("config.gopls")

require("config.keymap")


-- one place to tweak the look
local border_style = "rounded"  -- "single", "double", "shadow", "rounded"

-- Hover, shown by `K` in normal mode
vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(vim.lsp.handlers.hover, {
    border = border_style,
    focusable = false,
    max_width = 80,
    max_height = 30,
  })

-- Signature help popup, optional but nice to match hover styling
vim.lsp.handlers["textDocument/signatureHelp"] =
  vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = border_style,
    focusable = false,
    max_width = 80,
    close_events = { "CursorMoved", "BufHidden", "InsertCharPre" },
  })

-- Diagnostics floating windows, for consistency
vim.diagnostic.config({
  float = {
    border = border_style,
    focusable = false,
    max_width = 80,
  },
})

-- Make borders pick up your theme’s colors cleanly
-- Link to groups your theme already styles.
-- Adjust these links to taste per colorscheme if you like.
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
vim.api.nvim_set_hl(0, "FloatBorder", { link = "WinSeparator" })
-- alternatives:
-- vim.api.nvim_set_hl(0, "FloatBorder", { link = "Comment" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { link = "Title" })

-- Keep your normal K mapping, just ensure it calls LSP hover
vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true, desc = "LSP hover" })
-- Optional: easy signature help
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { silent = true, desc = "LSP signature help" })


