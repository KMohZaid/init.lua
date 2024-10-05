return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = {
    on_attach = function(buf)
      local map = function(mode, keys, func, desc, desc_prefix)
        desc_prefix = desc_prefix or 'GitSigns: '
        desc = desc_prefix .. desc
        vim.keymap.set(mode, keys, func, { buffer = buf, desc = desc })
      end

      local gitsigns = require 'gitsigns'

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, 'Jump to next git hunk [C]hange')

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, 'Jump to previous git hunk [C]hange')

      -- Actions
      -- visual mode
      map('v', '<leader>ghs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, '[G]it [H]unk [S]tage')
      map('v', '<leader>ghr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, '[G]it [H]unk [R]eset')

      -- normal mode
      map('n', '<leader>ghp', gitsigns.preview_hunk, '[G]it [H]unk [P]review')
      map('n', '<leader>ghs', gitsigns.stage_hunk, '[G]it [H]unk [S]tage')
      map('n', '<leader>ghr', gitsigns.reset_hunk, '[G]it [H]unk [R]eset')
      map('n', '<leader>gu', gitsigns.undo_stage_hunk, '[G]it [U]ndo stage')
      map('n', '<leader>gS', gitsigns.stage_buffer, '[G]it [S]tage buffer')
      map('n', '<leader>gR', gitsigns.reset_buffer, '[G]it [R]eset buffer')
      map('n', '<leader>gb', gitsigns.blame_line, '[G]it [B]lame line')
      map('n', '<leader>gd', gitsigns.diffthis, '[G]it [D]iff against index')
      map('n', '<leader>gD', function()
        gitsigns.diffthis '@'
      end, '[G]it [D]iff against last commit')

      -- Toggles
      map('n', '<leader>gtb', gitsigns.toggle_current_line_blame, '[G]it [T]oggle show [B]lame line')
      map('n', '<leader>gtD', gitsigns.toggle_deleted, '[G]it [T]oggle show [D]eleted')
    end,
  },
}
