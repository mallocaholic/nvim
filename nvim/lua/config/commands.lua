local autocmd = vim.api.nvim_create_autocmd

-- Autoclose nvim tree when its the only window
if package.loaded['nvim-tree.lua'] then
  autocmd({ 'BufEnter' }, {
    pattern = { 'NvimTree' },
    callback = function()
      if vim.api.nvim_list_wins():len() == 1 then
        vim.cmd('NvimTreeClose')
      end
    end,
  })
end
