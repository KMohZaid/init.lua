return {
  "jmbuhr/otter.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },

  opts = {},

  config = function(_, opts)
    require("otter").setup(opts)

    -- Auto-start Otter in HTML files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "html",
      callback = function()
        -- small delay helps ensure treesitter is ready
        vim.defer_fn(function()
          require("otter").activate()
        end, 50)
      end,
    })
  end,
}
