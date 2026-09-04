local M = {}

function M.setup()
  vim.o.background = 'dark'
  require('base16-colorscheme').setup({
    base00 = '#1a1110',
    base01 = '#271d1c',
    base02 = '#322826',
    base03 = '#a08c89',
    base04 = '#d8c2be',
    base05 = '#f1dedc',
    base06 = '#f1dedc',
    base07 = '#f1dedc',
    base08 = '#ffb4ab',
    base09 = '#ffdf7f',
    base0A = '#ffdf7f',
    base0B = '#7fffaa',
    base0C = '#ffb4a9',
    base0D = '#ffb4a9',
    base0E = '#ffb4a9',
    base0F = '#ffb4ab',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal', { fg = '#f1dedc', bg = '#1a1110' })
  hi('TelescopeBorder', { fg = '#a08c89', bg = '#1a1110' })
  hi('TelescopePromptNormal', { fg = '#f1dedc', bg = '#1a1110' })
  hi('TelescopePromptBorder', { fg = '#a08c89', bg = '#1a1110' })
  hi('TelescopePromptPrefix', { fg = '#ffb4a9', bg = '#1a1110' })
  hi('TelescopePromptCounter', { fg = '#d8c2be', bg = '#1a1110' })
  hi('TelescopePromptTitle', { fg = '#561e17', bg = '#ffb4a9' })
  hi('TelescopePreviewTitle', { fg = '#561e17', bg = '#ffb4a9' })
  hi('TelescopeResultsTitle', { fg = '#561e17', bg = '#ffb4a9' })
  hi('TelescopeSelection', { fg = '#f1dedc', bg = '#322826' })
  hi('TelescopeSelectionCaret', { fg = '#ffb4a9', bg = '#322826' })
  hi('TelescopeMatching', { fg = '#ffb4a9', bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
