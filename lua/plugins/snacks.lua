return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      enabled = true,
      sources = {
        files = {
          hidden = true, -- show hidden files
        },
      },
    },
  },
  keys = {
    -- TODO: review and fix keymaps
    --
    -- {
    --   "<leader>ss",
    --   function()
    --     Snacks.picker.pick()
    --   end,
    --   desc = "[S]earch [S]elect Picker",
    -- },

    -- XXX: i should probably learn actual keymap
    -- Remap lazyvim file search into search prefix
    -- {
    --   "<leader>sf",
    --   "<leader>ff",
    --   remap = true,
    --   desc = "Find Files (Root Dir)",
    -- },
    -- {
    --   "<leader>sF",
    --   "<leader>fF",
    --   remap = true,
    --   desc = "Find Files (cwd)",
    -- },

    --
    -- {
    --   "<leader><leader>",
    --   function()
    --     Snacks.picker.buffers()
    --   end,
    --   desc = "[ ] Find existing buffers",
    -- },
    -- {
    --   "<leader>s.",
    --   function()
    --     Snacks.picker.recent()
    --   end,
    --   desc = '[S]earch Recent Files ("." for repeat)',
    -- },

    -- -- Resume last picker
    -- {
    --   "<leader>sr",
    --   function()
    --     Snacks.picker.resume()
    --   end,
    --   desc = "[S]earch [R]esume",
    -- },
  },
}
