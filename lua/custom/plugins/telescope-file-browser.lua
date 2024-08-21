return {
  'nvim-telescope/telescope-file-browser.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  config = function()
    vim.keymap.set('n', '<space>e', function()
      require('telescope').extensions.file_browser.file_browser { cwd = vim.fn.expand '%:p:h' }
    end, { desc = 'File [E]xplorer' })
  end,
}
