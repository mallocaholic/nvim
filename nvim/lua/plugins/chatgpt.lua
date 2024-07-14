return {
  'robitx/gp.nvim',
  dependencies = {
    'folke/which-key.nvim',
  },
  config = function()
    require('gp').setup()
    local wk = require('which-key')
    local wkicon = require('which-key.icons')

    wk.add({
      {
        mode = 'v',
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = true,
        icon = wkicon.get({ pattern = 'ai', icon = ' ', color = 'green' }),
        { '<leader>a', group = 'AI' },

        { '<leader>ag', group = 'Generate' },
        { '<leader>agp', ":<C-u>'<,'>GpPopup<cr>", desc = 'Popup', icon = '󰙕' },
        { '<leader>age', ":<C-u>'<,'>GpEnew<cr>", desc = 'New Buffer', icon = '󰛨' },
        { '<leader>ag-', ":<C-u>'<,'>GpNew<cr>", desc = 'Horizontal split', icon = '-' },
        { '<leader>ag|', ":<C-u>'<,'>GpVnew<cr>", desc = 'Vertical split', icon = '|' },
        -- { '<leader>agt', ":<C-u>'<,'>GpTabnew<cr>", desc = 'Visual GpTabnew' },

        { '<leader>ac', group = 'Chat' },
        { '<leader>acn', ":<C-u>'<,'>GpChatNew<cr>", desc = 'Visual Chat New', icon = '' },
        { '<leader>acp', ":<C-u>'<,'>GpChatPaste<cr>", desc = 'Visual Chat Paste', icon = '' },
        { '<leader>act', ":<C-u>'<,'>GpChatToggle<cr>", desc = 'Visual Toggle Chat', icon = '' },

        -- { '<leader>aw', group = 'Whisper' },
        -- { '<leader>aww', ":<C-u>'<,'>GpWhisper<cr>", desc = 'Whisper' },
        -- { '<leader>awr', ":<C-u>'<,'>GpWhisperRewrite<cr>", desc = 'Whisper Rewrite' },
        -- { '<leader>awa', ":<C-u>'<,'>GpWhisperAppend<cr>", desc = 'Whisper Append (after)' },
        -- { '<leader>awb', ":<C-u>'<,'>GpWhisperPrepend<cr>", desc = 'Whisper Prepend (before)' },
        -- { '<leader>awp', ":<C-u>'<,'>GpWhisperPopup<cr>", desc = 'Whisper Popup' },
        -- { '<leader>awe', ":<C-u>'<,'>GpWhisperEnew<cr>", desc = 'Whisper Enew' },
        -- { '<leader>awn', ":<C-u>'<,'>GpWhisperNew<cr>", desc = 'Whisper New' },
        -- { '<leader>awv', ":<C-u>'<,'>GpWhisperVnew<cr>", desc = 'Whisper Vnew' },
        -- { '<leader>awt', ":<C-u>'<,'>GpWhisperTabnew<cr>", desc = 'Whisper Tabnew' },
        -- { '<leader>ac-', ":<C-u>'<,'>GpChatNew split<cr>", desc='Visual Chat New split' },
        -- { '<leader>ac|', ":<C-u>'<,'>GpChatNew vsplit<cr>", desc='Visual Chat New vsplit' },
        -- { '<leader>act', ":<C-u>'<,'>GpChatNew tabnew<cr>", desc='Visual Chat New tabnew' },

        { '<leader>ar', ":<C-u>'<,'>GpRewrite<cr>", desc = 'Rewrite', icon = '' },
        { '<leader>aa', ":<C-u>'<,'>GpAppend<cr>", desc = 'Append (after)', icon = '' },
        { '<leader>ai', ":<C-u>'<,'>GpPrepend<cr>", desc = 'Prepend (before)', icon = '' },
        { '<leader>as', ":<C-u>'<,'>GpImplement<cr>", desc = 'Implement selection', icon = '' },

        { '<leader>aC', ":<C-u>'<,'>GpContext<cr>", desc = 'Add to Context', icon = '' },
        { '<leader>an', '<cmd>GpNextAgent<cr>', desc = 'Next Agent', icon = '' },
        { '<leader>ax', '<cmd>GpStop<cr>', desc = 'Stop', icon = '' },
      },
      {
        mode = 'n',
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = true,
        icon = wkicon.get({ pattern = 'ai', icon = ' ', color = 'green' }),
        { '<leader>a', group = 'AI', icon = 'ﮧ' },

        { '<leader>ag', group = 'Generate', icon = '' },
        { '<leader>agp', 'GpPopup<cr>', desc = 'Popup', icon = '󰙕' },
        { '<leader>age', 'GpEnew<cr>', desc = 'New buffer', icon = '󰛨' },
        { '<leader>ag-', 'GpNew<cr>', desc = 'Horizontal split', icon = '-' },
        { '<leader>ag|', 'GpVnew<cr>', desc = 'Vertical split', icon = '|' },
        -- { '<leader>agt', 'GpTabnew<cr>', desc = 'GpTabnew', icon = '' },

        { '<leader>ac', group = 'Chat', icon = '' },
        { '<leader>acn', '<cmd>GpChatNew<cr>', desc = 'New Chat', icon = '' },
        { '<leader>act', '<cmd>GpChatToggle<cr>', desc = 'Toggle Chat', icon = '' },
        { '<leader>acf', '<cmd>GpChatFinder<cr>', desc = 'Chat Finder', icon = '' },
        -- { '<leader>ac-', ":<C-u>'<,'>GpChatNew split<cr>", desc='New Chat split', icon = '' },
        -- { '<leader>ac|', ":<C-u>'<,'>GpChatNew vsplit<cr>", desc='New Chat vsplit', icon = '' },

        { '<leader>ar', 'GpRewrite<cr>', desc = 'Inline Rewrite', icon = '' },
        { '<leader>aa', 'GpAppend<cr>', desc = 'Append (after)', icon = '' },
        { '<leader>ai', 'GpPrepend<cr>', desc = 'Prepend (before)', icon = '' },

        -- { '<leader>aw', group = 'Whisper', icon = '' },
        -- { '<leader>aww', 'GpWhisper<cr>', desc = 'Whisper', icon = '' },
        -- { '<leader>awr', 'GpWhisperRewrite<cr>', desc = 'Whisper Inline Rewrite', icon = '﯑' },
        -- { '<leader>awa', 'GpWhisperAppend<cr>', desc = 'Whisper Append (after)', icon = '' },
        -- { '<leader>awb', 'GpWhisperPrepend<cr>', desc = 'Whisper Prepend (before)', icon = '' },
        -- { '<leader>awp', 'GpWhisperPopup<cr>', desc = 'Whisper Popup', icon = '' },
        -- { '<leader>awe', 'GpWhisperEnew<cr>', desc = 'Whisper Enew', icon = '' },
        -- { '<leader>awn', 'GpWhisperNew<cr>', desc = 'Whisper New', icon = '' },
        -- { '<leader>awv', 'GpWhisperVnew<cr>', desc = 'Whisper Vnew', icon = '' },
        -- { '<leader>awt', 'GpWhisperTabnew<cr>', desc = 'Whisper Tabnew', icon = '' },

        { '<leader>aC', 'GpContext<cr>', desc = 'Toggle Context', icon = '' },
        { '<leader>an', 'GpNextAgent<cr>', desc = 'Next Agent', icon = '' },
        { '<leader>ax', 'GpStop<cr>', desc = 'Stop', icon = '' },
      },
    })
  end,
}
