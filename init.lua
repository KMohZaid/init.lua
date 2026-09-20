-- bootstrap lazy.nvim, LazyVim and your plugins

if not vim.g.vscode then
  require("config.lazy")
else
  -- TODO: move to config.vscode and make sure it doesnt conlict. and also make it so same keymaps are shared vetween lazy and vscode instead of redundant entry like i have done below
  local vscode = require("vscode")

  -- set vscode notify if we are in vscode
  vim.notify = function(msg, log_level, opts)
    vscode.notify("Neovim : " .. msg, log_level, opts)
  end

  -- vscode diagnostic keymaps
  if vim.g.vscode then
    -- Go to NEXT diagnostic (Error/Warning)
    vim.keymap.set("n", "]d", function()
      vim.fn.VSCodeNotify("editor.action.marker.next")
    end, { silent = true })

    -- Go to PREVIOUS diagnostic (Error/Warning)
    vim.keymap.set("n", "[d", function()
      vim.fn.VSCodeNotify("editor.action.marker.prev")
    end, { silent = true })

    ---- select all shortcut
    vim.keymap.set({ "n", "v" }, "<C-a>", function()
      vim.cmd("normal! ggVG")
    end, { desc = "Select all" })

    ---- Esc with Ctrl+c
    vim.keymap.set("n", "<C-c>", "<Esc>", { desc = "Escape" })

    -- NOTE: Below are some cool remaps...

    -- Move lines up/down
    -- :m
    vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move current line down", silent = true })
    vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move current line up", silent = true })

    -- Join below line without changing cursor position (mark position and then move to it)
    vim.keymap.set("n", "J", "mzJ`z")

    -- Move half screen down/up and center cursor vertically
    vim.keymap.set("n", "<C-d>", "<C-d>zz")
    vim.keymap.set("n", "<C-u>", "<C-u>zz")

    -- on search result move to next/prev and ensure that screen is centered vertically + unfold if anything is folded
    vim.keymap.set("n", "n", "nzzzv")
    vim.keymap.set("n", "N", "Nzzzv")
  end
end
