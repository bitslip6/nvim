-- load the lazy plugin manager
require("config.lazy")
-- keymappings and vim config
require("config.digraph")
require("config.clipboard")
require("config.keymap")
require("config.options")

-- color schemes and icons and other UI config
require("plugins.mini_icons")
require("plugins.themes")
require("config.themes")

-- git 
require("plugins.neogit")
-- support displaying images in neovim (though kitty, ueberzugpp, opt tmux) 
require("plugins.image")
-- fast fuzzy find
require("plugins.telescope")

-- LSP setup :)
require("lsp.clangd")
require("config.clangd")
require("lsp.gopls")
require("config.gopls")
--[[
]]
