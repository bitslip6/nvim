-- lua/config/gopls.lua

-- optional logging while debugging
-- vim.lsp.set_log_level("warn") -- or "debug"

-- start gopls when a Go file opens
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = { "*.go", "go.mod", "go.work" },
  callback = function(args)
    -- find project root: go.work, go.mod, or .git
    local fname = vim.api.nvim_buf_get_name(args.buf)
    local marker = vim.fs.find({ "go.work", "go.mod", ".git" }, { path = fname, upward = true })[1]
    local root_dir = marker and vim.fs.dirname(marker) or vim.fn.getcwd()

    -- avoid starting duplicates for the same root
    for _, c in ipairs(vim.lsp.get_clients({ name = "gopls" })) do
      if c.config and c.config.root_dir == root_dir then
        return
      end
    end

    vim.lsp.start({
      name = "gopls",
      cmd = { "/home/cory/go/bin/gopls" }, -- ensure this exists
      root_dir = root_dir,
      filetypes = { "go", "gomod", "gotmpl" },
      single_file_support = true,
      settings = {
        gopls = {
          gofumpt = true,
          staticcheck = true,
          -- you can add your other settings back here later
        },
      },
    })
  end,
})

-- minimal LSP keymaps for testing
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "K",  vim.lsp.buf.hover, opts)
  end,
})

-- calmer diagnostics
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})


-- enable inline code hints...
vim.lsp.inlay_hint.enable(true)

