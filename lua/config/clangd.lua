-- Minimal native LSP setup for clangd, Neovim 0.11+

-- 0) optional, helpful while debugging
-- vim.lsp.set_log_level("warn")  -- or "debug"

-- 2) minimal server config
vim.lsp.config("clangd", {
  cmd = { "/usr/bin/clangd", "--background-index", "--header-insertion=never" },
  filetypes = { "c", "cpp" },
  root_markers = { '.clangd', 'compile_commands.json', '.git' },

  single_file_support = true,
  capabilities = { offsetEncoding = { "utf-16" } },  -- clangd expects UTF-16
--[[
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
vim.lsp.enable("clangd")

-- 4) ensure it starts on C-like buffers too
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = { "*.c", "*.cc", "*.cpp", "*.h", "*.hpp" },
  callback = function(args)
    vim.lsp.enable("clangd", { bufnr = args.buf })
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


local function switch_source_header()
  local params = { uri = vim.uri_from_bufnr(0) }
  vim.lsp.buf_request(0, "textDocument/switchSourceHeader", params, function(err, result)
    if err then
      vim.notify("Switch source/header failed: " .. err.message, vim.log.levels.ERROR)
      return
    end
    if not result then
      vim.notify("No corresponding file found", vim.log.levels.WARN)
      return
    end
    vim.cmd("edit " .. vim.uri_to_fname(result))
  end)
end

-- clangd specific key mappings
vim.keymap.set("n", "<leader>hs", switch_source_header, { desc = "Switch between header/source" })



