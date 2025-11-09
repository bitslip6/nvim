return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
--[[
    config = function()
        require('telescope').setup {
            pickers = {
                find_files = {
                    theme = "ivy"
                }
            },
            extensions = {
                fzf = {}
            }
        }

        require('telescope').load_extension('fzf')

        vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
    end
]]
}

