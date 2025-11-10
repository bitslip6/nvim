return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim',
        {
          "nvim-telescope/telescope-fzf-native.nvim",
          build = "make",                       -- builds the native sorter
          cond = function() return vim.fn.executable("make") == 1 end,
        },
    },
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
}

