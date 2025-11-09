return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = function()
        vim.keymap.set("n", "<leader>dv", function()
            vim.ui.input({ prompt = "Diffview ref (empty = HEAD): " }, function(input)
        local ref = input ~= nil and input ~= "" and input or ""
        vim.cmd("DiffviewOpen " .. ref)
        end)
    end, { desc = "Diffview with optional ref" })
end
}


