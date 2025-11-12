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
