-- Minimal native LSP setup for clangd, Neovim 0.11+

-- 0) optional, helpful while debugging
-- vim.lsp.set_log_level("warn")  -- or "debug"

-- 2) minimal server config
vim.lsp.config("gopls", {
  cmd = { "/home/cory/go/bin/gopls"},
  filetypes = { "go" },
  root_markers = { '.git' },

  single_file_support = true,
--[[
  capabilities = { offsetEncoding = { "utf-16" } },  -- clangd expects UTF-16
  on_attach = function(client, bufnr)
    -- minimal keys
    local map = function(lhs, rhs, desc) vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc }) end
    map("gd", vim.lsp.buf.definition, "goto definition")
    map("gi", vim.lsp.buf.implementation, "goto implementation")
    map("gr", vim.lsp.buf.references, "references")
    map("K",  vim.lsp.buf.hover, "hover")
  end,
]]
})

-- 3) enable it
vim.lsp.enable("gopls")

-- 4) ensure it starts on C-like buffers too
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = { "*.go" },
  callback = function(args)
    vim.lsp.enable("gopls", { bufnr = args.buf })
  end,
})

-- 5) optional, calmer diagnostics
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

