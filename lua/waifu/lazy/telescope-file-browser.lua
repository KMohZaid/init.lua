return {
  'nvim-telescope/telescope-file-browser.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup {
      defaults = {
        file_ignore_patterns = {
          'node_modules/', -- nodejs modules folder
          'pycache/', -- python cache folder
          'venv/', -- python virtual environment folder
          '.git/', -- git folder
        },
      },
      extensions = {
        file_browser = {
          hidden = true,
        },
      },
    }
    vim.keymap.set('n', '<space>e', function()
      require('telescope').extensions.file_browser.file_browser { cwd = vim.fn.expand '%:p:h' } -- relative to the current file, not cwd (% -> filename/file path relative to cwd, :p -> full path, :h -> parent dir)
    end, { desc = 'File [E]xplorer' })
  end,
}
