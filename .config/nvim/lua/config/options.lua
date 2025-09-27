-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false

-- Use Intelephense for PHP LSP (better Laravel support)
vim.g.lazyvim_php_lsp = "intelephense"

-- Filter out "No information available" notifications from snacks.nvim
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  callback = function(event)
    if event.data == "snacks.nvim" then
      local snacks = require("snacks")
      if snacks.notifier then
        local original_notify = snacks.notifier.notify
        snacks.notifier.notify = function(msg, level, opts)
          if type(msg) == "string" and msg:match("No information available") then
            return
          end
          return original_notify(msg, level, opts)
        end
      end
    end
  end,
})

