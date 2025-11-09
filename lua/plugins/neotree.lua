-- Example for neo-tree.nvim

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    keys = {
      { "<leader>tt", "<cmd>Neotree toggle<cr>", desc = "NeoTree toggle" },
      { "<leader>tb", "<cmd>Neotree buffers<cr>", desc = "NeoTree buffers" },
      { "<leader>tg", "<cmd>Neotree git_status<cr>", desc = "NeoTree git status" },
      { "<leader>ts", "<cmd>Neotree document_symbols<cr>", desc = "NeoTree symbols" },
    },
    lazy = false, -- neo-tree will lazily load itself
  }
}
