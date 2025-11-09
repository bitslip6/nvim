-- lua/lsp/clangd.lua
return {
  cmd = { 'clangd' },
  root_markers = { '.clangd', 'compile_commands.json' },
  filetypes = { 'c', 'cpp' },
  capabilities = {
    offsetEncoding = { 'utf-16' },
    -- add more capabilities if you use cmp
  },
}


