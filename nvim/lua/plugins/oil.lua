return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('oil').setup({
      default_file_explorer = false,
      columns = {
        "icon",
      },
      keymaps = {
        ["<CR>"] = "actions.select",
        ["?"] = "actions.show_help",
        ["q"] = "actions.close",
        ["<"] = "actions.parent",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["h"] = "actions.toggle_hidden",
        ["H"] = "actions.toggle_trash",
      },
      use_default_keymaps = false,
    })
  end
}
