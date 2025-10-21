return {

-- lsp
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "cssls", "emmet_ls", "eslint", "graphql", "hls",
          "html", "lua_ls", "pyright", "tailwindcss", "vtsls",
        },
        automatic_installation = true,
      })
    end,
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
  },
  config = function()
    require("nvim-tree").setup({})
  end,
  },

  { 'nvim-tree/nvim-web-devicons' },

  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { { 'filename', path = 1 } },
      }
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter.configs")
      treesitter.setup({
        ensure_installed = {
          "c", "css", "gitignore", "graphql", "haskell",
          "html", "javascript", "json", "lua", "markdown",
          "php", "python", "sql", "tsx", "typescript", "vim"
        },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
      })
    end,
  },

  { 'wadackel/vim-dogrun',
    config = function()
      -- theme
      vim.opt.background = "dark"
      vim.cmd("colorscheme dogrun")
    end,
  },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope.nvim' },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
    }
  },


  -- completion

  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = {
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        },
        sources = {
          { name = "nvim_lua" },
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer", keyword_length = 4 },
        },
      })
    end,
  },

  {
    'sphamba/smear-cursor.nvim',
    config = function()
      require("smear_cursor").setup({})
    end
  },

  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require("dashboard").setup({
        theme = 'doom',
        config = {
          header = {
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              [[                                        ]],
              [[      ⢠⣤⣶⣶⣖⣠⠦⢤⣦⣄⣠⣠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
              [[⠀⠀⠀⠀⠀⢸⠿⣿⣿⣿⣿⠀⢼⣿⣿⣿⣿⣿⡤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
              [[⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⠁⢻⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
              [[⠀⠀⠀⠀⠀⠀⠀⠀⢺⡿⣱⣦⡀⢹⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
              [[⠀⠀⠀⠀⠀⠀⠀⠀⢋⠁⠻⠿⠅⠜⢡⣾⣿⣿⣿⣷⣾⣶⣦⣄⣀⣤⡀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
              [[⠀⠀⠀⠀⠀⠀⠀⠀⢈⡆⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⣄⠀⠀⠀⠀⠀⠀]],
              [[⠀⠀⠀⠀⠀⠀⠀⢀⢼⡇⠀⠀⠀⠈⠋⣩⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀]],
              [[⠀⠀⠀⠀⠀⠀⡀⠈⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⠟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀]],
              [[⠀⠀⠀⠀⠠⠁⢔⢠⣶⠢⣄⣄⠀⠀⠻⣿⣿⣿⣿⣿⡿⠃⠀⠘⢉⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄ ]],
              [[⠀⠀⠀⠠⠐⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⠛⠋⠁⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇]],
              [[⠠⢈⡀⠀⠀⢀⠑⠆⠒⠀⠤⠀⣀⡀⠀⣀⣸⡿⠀⠴⢲⣖⣒⡒⠞⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁]],
              [[⠀⠁⠀⠘⢸⣬⡖⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⠛⠁⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿⡟⡟⠋⠀⠀]],
              [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠐⠂⠀⠀⠠⢤⡿⠉⠉⠛⣿⠋⠉⠀⠀⠀⠀⠀]],
              [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⣀⣪⢀⢠⡴⠊⠉⠀⠀⠀⠀⠀⠀⠀]],
              [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠊⣴⣿⡿⠟⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
              [[                                        ]],             "",
              [[                                        ]],
              [[                                        ]],
              [[                                        ]],
              [[                                        ]],
          },
          center = {
            {
              icon = '  ',
              desc = 'Find File                               ',
              action = 'Telescope find_files',
              shortcut = 'SPC f f',
              key = "f"
            },
            {
              icon = '  ',
              desc = 'Recently Opened                         ',
              action = 'Telescope oldfiles',
              shortcut = 'SPC f r',
              key = "r"
            },
            {
              icon = 'פּ  ',
              desc = 'File Browser                            ',
              action = 'NvimTreeToggle',
              shortcut = 'SPC f o',
              key = "o"
            },
          },
          footer = {
            "",
            "",
            "Welcome back",
            ""
          },
        },
      })
    end,
  },
}
