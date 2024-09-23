return {
  -- {
  --   'sho-87/kanagawa-paper.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   init = function()
  --     vim.cmd('colorscheme kanagawa-paper')
  --   end,
  -- },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd("colorscheme rose-pine-dawn")
    end
  },
}
