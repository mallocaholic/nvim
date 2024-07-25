return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'VidocqH/lsp-lens.nvim',
    'folke/neodev.nvim',
  },
  config = function()
    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    vim.diagnostic.config({
      float = { border = 'single' },
      virtual_text = { severity = vim.diagnostic.severity.ERROR },
    })

    require('lsp-lens').setup()
    require('neodev').setup()
    require('mason').setup({
      ensure_installed = {
        -- Markdown
        'marksman',
        -- Lua
        'lua_ls',
        -- Docker
        'dockerls',
        -- Json
        'jsonls',
        -- Rust
        'rust_analyzer',
        -- Python
        'basedpyright',
        'ruff',
        'blue',
        'pyright',
      },
    })

    local lspconfig = require('lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

    local on_attach = function(client, bufnr)
      local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
      end

      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
      local opts = { noremap = true, silent = true }

      -- local function buf_set_keymap(...)
      --   vim.api.nvim_buf_set_keymap(bufnr, ...)
      -- end

      -- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)                                        -- gD go to declaration
      -- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)                                         -- gd go to definition
      -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)                                     -- gi go to implementation
      -- buf_set_keymap('n', 'gl', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)                                              -- gl go to hover
      -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)                                         -- gr go to references
      -- buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)                                    -- gt go to type definition
      -- buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) -- rename symbol
      -- buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)                                -- code action
      -- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)                       -- add workspace folder
      -- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove workspace_folder()<CR>', opts)                    -- remove workspace folder
      -- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts) -- list workspace folders
      -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts) -- go to previous diagnostic]')
      -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts) -- go to next diagnostic
      vim.api.nvim_create_user_command('LspAddWorkspace', function(args)
        vim.lsp.buf.add_workspace_folder(args.args)
      end, {
        nargs = 1,
        complete = 'dir',
        desc = 'add a workspace folder',
      })
    end

    lspconfig['pyright'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = 'workspace',
          },
        },
      },
    })

    -- lspconfig['basedpyright'].setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    --   settings = {
    --     basedpyright = {
    --       typeCheckingMode = 'standard',
    --       analysis = {
    --         autoSearchPaths = true,
    --         useLibraryCodeForTypes = true,
    --         diagnosticMode = 'workspace',
    --       },
    --     },
    --   },
    -- })

    local servers = {
      'lua_ls',
      'jsonls',
      'bashls',
      'marksman',
      'ltex',
      'html',
      'vimls',
    }

    for _, server in ipairs(servers) do
      lspconfig[server].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end
  end,
}
