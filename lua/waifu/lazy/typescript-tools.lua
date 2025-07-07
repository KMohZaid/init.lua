return {
  'pmizio/typescript-tools.nvim',
  enabled = false, -- XXX: right now i am ok with ts_ls
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  config = function()
    require('typescript-tools').setup {
      settings = {
        code_lens = 'all',
      },
    }
  end,
}
