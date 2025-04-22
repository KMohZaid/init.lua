return {
  'vyfor/cord.nvim',
  build = ':Cord update',
  config = function()
    -- Configuration for cord.nvim
    require('cord').setup {
      -- bypass required field error
      get = require('cord').get,
      set = require('cord').set,

      display = {
        theme = 'atom',
      },
      idle = {
        unidle_on_focus = false,
      },
      variables = {
        -- Git Status: Get the current Git branch
        git_status = function()
          local git_branch = vim.fn.system('git branch --show-current 2> /dev/null || echo ""'):gsub('\n', '')

          if git_branch == '' then
            return 'Not a Git Repo :('
          end
          return string.format('On Branch "%s"', git_branch)
        end,

        -- Workspace-related variables
        workspace = '_______ workspace',
        cursor_line_char = function(opts)
          return string.format('%d:%d', opts.cursor_line, opts.cursor_char)
        end,
        problems = function()
          return string.format('%d', #vim.diagnostic.count(0))
        end,
      },

      plugins = {
        diagnostics = {
          scope = 'workspace', -- 'buffer' (default) or 'workspace': Scope of diagnostics to display
          severity = { min = vim.diagnostic.severity.WARN }, -- Diagnostic severity filter
          override = true, -- Whether to override default text configurations (recommended: true)
        },
      },

      -- Text section where we show the information
      text = {
        workspace = 'Line ${cursor_line_char} | Problems ${problems}',
        editing = 'Editing ${filename} | ${git_status}',
        viewing = 'Viewing ${filename} | ${git_status}',
      },

      -- Button configuration
      buttons = {
        {
          label = function(opts) -- opts.repo_url is url of git repo
            -- return opts.repo_url and 'View Repository 🚀' or 'Be cool, use Neovim 😎'
            return 'Be cool, use Neovim 😎'
          end,
          url = function(opts)
            -- return opts.repo_url or 'https://neovim.io'
            return 'https://neovim.io'
          end,
        },
        {
          label = 'Thanks thePrimeagen',
          url = 'https://youtu.be/Qo3dX87gTrk',
        },
      },

      -- Hooks to update git branch on workspace change
      hooks = {
        workspace_change = function(opts)
          -- Update git_branch on workspace change
          git_branch = vim.fn.system('git branch --show-current'):gsub('\n', '')
        end,
      },
    }
  end,
}
