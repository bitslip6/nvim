-- windows
-- Easier movement between splits (no Ctrl-w)
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to upper window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })
vim.keymap.set('i', '<A-f>', '<C-w>l', { desc = 'Move to right window' })

-- Create splits
vim.keymap.set('n', '<leader>ws', '<Cmd>split<CR>', { desc = 'Horizontal split' })
vim.keymap.set('n', '<leader>wv', '<Cmd>vsplit<CR>', { desc = 'Vertical split' })

-- Close / equalize
vim.keymap.set('n', '<leader>wc', '<Cmd>close<CR>', { desc = 'Close window' })
vim.keymap.set('n', '<leader>w=', '<Cmd>wincmd =<CR>', { desc = 'Equalize split sizes' })

-- Resize splits (Alt + arrows)
vim.keymap.set('n', '<A-Left>',  '<Cmd>vertical resize -2<CR>', { desc = 'Shrink width' })
vim.keymap.set('n', '<A-Right>', '<Cmd>vertical resize +2<CR>', { desc = 'Expand width' })
vim.keymap.set('n', '<A-Up>',    '<Cmd>resize +2<CR>', { desc = 'Increase height' })
vim.keymap.set('n', '<A-Down>',  '<Cmd>resize -2<CR>', { desc = 'Decrease height' })


-- reload this neovim config file
vim.keymap.set('n', '<leader>rr', ":luafile ~/.config/nvim/init.lua<CR>", { desc = "Reload init.lua" })


-- git keys
vim.keymap.set('n', '<leader>gs', ":Neogit kind=floating<CR>", { desc = "status" })
vim.keymap.set('n', '<leader>gc', ":Neogit commit kind=floating<CR>", { desc = "commit" })
vim.keymap.set('n', '<leader>gp', ":Neogit pull kind=floating<CR>", { desc = "pull" })
vim.keymap.set('n', '<leader>gb', ":Neogit branch kind=vsplit<CR>", { desc = "branch" })
vim.keymap.set('n', '<leader>gB', ":Neogit rebase kind=vsplit<CR>", { desc = "rebase" })

vim.keymap.set("n", "<leader>gf", ":DiffviewOpen<CR>", { desc = "Open Diffview" })
vim.keymap.set("n", "<leader>gh", ":DiffviewFileHistory %<CR>", { desc = "File history" })

vim.keymap.set("n", "<leader>sc", ":set spell!<CR>", { desc = "Spell Check Toggle" })
-- general progrmaming keybindings
--
-- local opts = { noremap=true, silent=true }

-- LSP navigation
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, opts)
vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)

-- Refactor / edit
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)

-- Diagnostics
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>xx', vim.diagnostic.setloclist, opts)

-- Workspace management
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)

-- Optional
vim.keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts)
vim.keymap.set('n', '<leader>li', ':LspInfo<CR>', opts)



local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- toggle spelling
vim.keymap.set('n', '<leader>sc', ':set invspell', { desc = 'Spell check toggle' })

-- neo tree
vim.keymap.set('n', '<leader>n', ':Neotree toggle<CR>', { desc = 'NeoTree toggle open' })

-- aerial symbol navigation
require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")


-- snippets keybindings
local ls = require("luasnip")

vim.keymap.set({"i"}, "<Tab>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-l>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-j>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-e>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})


-- csv view keybindings
vim.keymap.set('n', '<leader>tc', ':CsvViewToggle<CR>', { desc = 'CSVView toggle open' })
