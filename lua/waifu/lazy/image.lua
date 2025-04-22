return {
  '3rd/image.nvim',
  config = function()
    require('image').setup {
      backend = 'kitty',
      kitty_method = 'normal',
      processor = 'magick_cli',
      integrations = {
        html = {
          enabled = false,
        },
        css = {
          enabled = false,
        },
      },
    }
  end,
}
