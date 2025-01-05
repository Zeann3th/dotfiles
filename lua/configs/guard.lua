local ft = require "guard.filetype"

ft("lua"):fmt("lsp"):append "stylua"

ft("c,cpp,h,hpp"):fmt "lsp"

ft("go"):fmt("lsp"):append "gofumpt"

ft("typescript,javascript,typescriptreact,javascriptreact"):fmt("lsp"):append "prettier"

ft("java"):fmt "lsp"

ft("php, blade"):fmt("lsp"):append(function()
  return {
    cmd = "phpcbf",
    args = {
      "--standard=PSR12",
    },
    fname = true,
  }
end)

return ft
