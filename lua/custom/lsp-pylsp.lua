-- TODO: need to install python-lsp-ruff, python-lsp-black, pyls-isort and pyls-mypy manually for now. So make it automated
return {
  settings = {
    pylsp = {
      plugins = {
        ruff = {
          -- formatter + Linter + isort
          enabled = true,
          formatEnabled = false,
          format = {}, -- TODO: auto format imports with isort

          extendSelect = { 'I', 'C90', 'A', 'B' }, -- TODO: test Pylint linter and add it?

          line_length = 88,
          ignore = {
            'E501', -- line too long
          },
        },
        -- formatter options
        black = { enabled = true, line_length = 88 },
        -- auto-completion options
        jedi_completion = { fuzzy = true },
        -- type checker
        pylsp_mypy = { enabled = false }, -- mypy is too slow, disable it for now

        ------- DiSABLED -------
        -- formatter options
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        -- linter options
        pylint = { enabled = false, executable = 'pylint' },
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        -- import sorting
        pyls_isort = { enabled = false },
      },
    },
  },
}
