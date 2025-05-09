-- Config Copy from : https://github.com/4rtemis-4rrow/dotfiles/blob/main/nvim/lua/Configs/dashboard.lua
-- Define a list of possible headers first
local headers = {
  {
    '           ▄ ▄                   ',
    '       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ',
    '       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ',
    '    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ',
    '  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ',
    '  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄',
    '▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █',
    '█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █',
    '    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
  },
  {
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡖⠁⠀⠀⠀⠀⠀⠀⠈⢲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠀⠀⠀⠀⠀⣼⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣧⠀⠀⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠀⠀⠀⠀⣸⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣇⠀⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⢀⣀⣤⣤⣤⣤⣀⡀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣔⢿⡿⠟⠛⠛⠻⢿⡿⣢⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣷⣤⣀⡀⢀⣀⣤⣾⣿⣿⣿⣷⣶⣤⡀⠀⠀⠀⠀ ',
    '⠀⠀⢠⣾⣿⡿⠿⠿⠿⣿⣿⣿⣿⡿⠏⠻⢿⣿⣿⣿⣿⠿⠿⠿⢿⣿⣷⡀⠀⠀ ',
    '⠀⢠⡿⠋⠁⠀⠀⢸⣿⡇⠉⠻⣿⠇⠀⠀⠸⣿⡿⠋⢰⣿⡇⠀⠀⠈⠙⢿⡄⠀ ',
    '⠀⡿⠁⠀⠀⠀⠀⠘⣿⣷⡀⠀⠰⣿⣶⣶⣿⡎⠀⢀⣾⣿⠇⠀⠀⠀⠀⠈⢿⠀ ',
    '⠀⡇⠀⠀⠀⠀⠀⠀⠹⣿⣷⣄⠀⣿⣿⣿⣿⠀⣠⣾⣿⠏⠀⠀⠀⠀⠀⠀⢸⠀ ',
    '⠀⠁⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⢇⣿⣿⣿⣿⡸⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠈⠀ ',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠐⢤⣀⣀⢀⣀⣀⣤⣴⣿⣿⠿⠋⠙⠿⣿⣿⣦⣄⣀⠀⠀⣀⡠⠂⠀⠀⠀ ',
    '⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠉⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
  },
}

-- Function to select a random header
local function get_random_header()
  math.randomseed(os.time()) -- Seed the random number generator
  return headers[math.random(#headers)] -- Return a random header
end

-- Set up the dashboard with the random header
return {
  'nvimdev/dashboard-nvim',
  enabled = false,
  event = 'VimEnter',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-telescope/telescope-project.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      config = {
        header = get_random_header(), -- Get a random header here
        center = {
          {
            icon = ' ',
            desc = 'Projects',
            key = 'p',
            key_format = ' %s',
            action = function()
              require('telescope').extensions.project.project {}
            end,
          },
          {
            icon = '󰮗 ',
            desc = 'Find File',
            key = 'f',
            key_format = ' %s',
            action = 'Telescope find_files',
          },
          {
            icon = ' ',
            desc = 'Recent Files',
            key = 'r',
            key_format = ' %s',
            action = 'Telescope oldfiles',
          },
          {
            icon = '󱩾 ',
            desc = 'Find Word',
            key = 'w',
            key_format = ' %s',
            action = 'Telescope live_grep',
          },
          {
            icon = '󰗼 ',
            desc = 'Quit',
            key = 'q',
            key_format = ' %s',
            action = 'quit',
          },
        },
        footer = {},
      },
    }
  end,
}
