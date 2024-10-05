-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = true, keywords = {
    ERROR = { icon = '', color = 'error' },
  } },
}

-- PERF:
-- TODO:
-- HACK:
-- NOTE:
-- FIX:
-- WARN:
-- ERROR:
