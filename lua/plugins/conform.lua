return { -- Autoformat
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "[F]ormat buffer (range if in visual mode)",
    },
  },
  opts = {
    notify_on_error = true,

    -- XXX: LazyVim does it
    --
    -- format_on_save = function(bufnr)
    --   -- Disable "format_on_save lsp_fallback" for languages that don't
    --   -- have a well standardized coding style. You can add additional
    --   -- languages here or re-enable it for the disabled ones.
    --   local disable_filetypes = { c = true, cpp = true }
    --   local lsp_format_opt
    --   if disable_filetypes[vim.bo[bufnr].filetype] then
    --     lsp_format_opt = "never"
    --   else
    --     lsp_format_opt = "fallback"
    --   end
    --   return {
    --     timeout_ms = 500,
    --     lsp_format = lsp_format_opt,
    --   }
    -- end,
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform can also run multiple formatters sequentially
      -- python = { 'isort', 'black' },
      python = {
        "ruff_fix",
        "ruff_organize_imports",
        "ruff_format",
        stop_after_first = false, --
      },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      javascript = { "prettierd", "biome-check", stop_after_first = true },
      javascriptreact = { "prettierd", "biome-check", stop_after_first = true },
      html = { "prettierd", "biome-check", stop_after_first = true },
      css = { "prettierd", "biome-check", stop_after_first = true },
      scss = { "prettierd", "biome-check", stop_after_first = true },
      json = { "prettierd", "biome-check", stop_after_first = true },
      typescript = { "prettierd", "biome-check", stop_after_first = true },
      typescriptreact = { "prettierd", "biome-check", stop_after_first = true },
    },
    formatters = {
      custom_isort_only_float_to_top = { -- not using for now, i think its good to not float on top and manually move iff have to
        command = "isort",
        stdin = true,
        args = {
          "--float-to-top",
          "--stdout",
          "--filename",
          "$FILENAME",
          "-",
        },
      },
    },
  },

  -- Add user command to format entire project
  init = function()
    -- INFO: LazyVim formatter breaks if not add this
    -- Install the conform formatter on VeryLazy
    LazyVim.on_very_lazy(function()
      LazyVim.format.register({
        name = "conform.nvim",
        priority = 100,
        primary = true,
        format = function(buf)
          require("conform").format({ bufnr = buf })
        end,
        sources = function(buf)
          local ret = require("conform").list_formatters(buf)
          ---@param v conform.FormatterInfo
          return vim.tbl_map(function(v)
            return v.name
          end, ret)
        end,
      })
    end)

    -- Create :CustomFolderFormat command
    vim.api.nvim_create_user_command("CustomFolderFormat", function(opts)
      local uv = vim.loop

      if not opts.args or opts.args == "" then
        vim.notify("Please specify one or more folders", vim.log.levels.ERROR)
        return
      end

      local folders = vim.split(opts.args, "%s+", { plain = false, trimempty = true })

      -- Recursive scan of directory, skipping .git
      local function scan_dir(dir)
        local handle = uv.fs_scandir(dir)
        if not handle then
          return {}
        end
        local files = {}
        while true do
          local name, t = uv.fs_scandir_next(handle)
          if not name then
            break
          end
          local full_path = dir .. "/" .. name
          if t == "file" then
            table.insert(files, full_path)
          elseif t == "directory" and name ~= ".git" then
            vim.list_extend(files, scan_dir(full_path))
          end
        end
        return files
      end

      -- Collect all files from the specified folders
      local all_files = {}
      for _, folder in ipairs(folders) do
        local expanded = vim.fn.expand(folder)
        vim.list_extend(all_files, scan_dir(expanded))
      end

      -- Open and write each file; Conform will auto-format on save
      for _, file in ipairs(all_files) do
        -- Skip files ignored by git
        local git_ignored = vim.fn.systemlist({ "git", "check-ignore", file })
        if vim.tbl_isempty(git_ignored) then
          local ok, _ = pcall(vim.cmd, "edit " .. file)
          if ok then
            vim.cmd("write") -- triggers Conform's format-on-save
          end
        end
      end

      vim.notify("Folder formatting complete!", vim.log.levels.INFO)
    end, {
      nargs = "+",
      complete = "dir",
      desc = "Write all files in one or more folders (Conform formats on save), respecting .gitignore",
    })
  end,
}
