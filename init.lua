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

-- LSP setup :)
require("lsp.clangd")
require("config.clangd")
require("config.gopls")

require("config.keymap")
