return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = { 
      ensure_installed = { "cpp", "go", "gomod", "gowork", "gosum", "c", "lua" }
  },
}
