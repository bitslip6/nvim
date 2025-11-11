return {
  "FabijanZulj/blame.nvim",
  config = function()
    require("blame").setup({
      date_format = "%Y-%m-%d",
      virtual_text_column = 90,  -- adjust inline position
      use_default_mappings = false,
    })
    -- toggle with <leader>gb
    vim.keymap.set("n", "<leader>bb", ":BlameToggle<CR>", { desc = "Toggle show inline git blame" })
  end
}

