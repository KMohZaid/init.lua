vim.g.cord_defer_startup = true

return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  config = function()
    -- Configuration for cord.nvim
    require("cord").setup({
      display = {
        theme = "minecraft",
        flavor = "accent",
        view = "full",
      },
      timestamp = {
        enabled = true,
        shared = true,
      },
      idle = {
        enabled = true,
        ignore_focus = true,
        unidle_on_focus = false,
        smart_idle = true,
      },

      -- Text section where we show the information
      text = {
        workspace = "",
        -- workspace = '"${workspace}"', -- ${git_status}', -- ${problems_workspace}',
        --        workspace = "Line ${cursor_line_char} | Problems ${problems}",
        editing = "💻 Editing", -- ${filename_with_pos}", -- ${problems}",
        viewing = "💻 Viewing", -- ${filename_with_pos}", -- ${problems}",
      },

      -- Button configuration
      buttons = {
        {
          label = "Be cool, use Neovim 😎",
          url = "https://neovim.io",
        },
        {
          label = "Thanks thePrimeagen",
          url = "https://youtu.be/Qo3dX87gTrk",
        },
      },

      variables = {
        -- Git Status: Get the current Git branch
        git_status = function()
          local git_branch = vim.fn.system('git branch --show-current 2> /dev/null || echo ""'):gsub("\n", "")

          if git_branch == "" then
            return "[Not a Git Repo :(]"
          end
          return string.format('On Branch "%s"', git_branch)
        end,

        filename_with_pos = function(opts)
          return string.format("%s:%s", opts.filename, opts.cursor_line_char(opts))
        end,
        cursor_line_char = function(opts)
          return string.format("%d:%d", opts.cursor_line, opts.cursor_char)
        end,

        problems_helper = function(for_workspace)
          local bufnr
          if for_workspace then
            bufnr = nil
          else
            bufnr = 0
          end

          local count_opts = {
            severity = {
              min = vim.diagnostic.severity.WARN, -- only show warn and error
            },
          }

          local total = 0
          for _, count in pairs(vim.diagnostic.count(bufnr, count_opts)) do
            total = total + count
          end

          return total > 0 and (" ⚠️ " .. total) or ""
        end,
        problems_workspace = function(opts)
          return opts.problems_helper(true)
        end,
        problems = function(opts)
          return opts.problems_helper(false)
        end,
      },

      extensions = {
        resolver = { -- Purpose: Provides specialized metadata resolvers for accurate filetype and workspace detection in edge cases where standard detection falls short.
          sources = { true, oil = false },
        },
        persistent_timer = { -- Persistent elapsed timer
          -- https://github.com/vyfor/cord.nvim/blob/master/.github/wiki/Extensions.md#-persistent-timer
          mode = "active",
          file = "/tmp/neovim_cord_rpc_persistent_timer.json",
          save_on = { "exit" },
        },
      },
    })
  end,
}
