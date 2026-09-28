local M = {}

function M.setup()
  vim.o.background = 'dark'
  require('base16-colorscheme').setup({
    base00 = '#070A12',
    base01 = '#101624',
    base02 = '#1A2338',
    base03 = '#536DFE',
    base04 = '#A9B7D0',
    base05 = '#F2F6FF',
    base06 = '#F2F6FF',
    base07 = '#F2F6FF',
    base08 = '#FF4D6D',
    base09 = '#FFB627',
    base0A = '#FFB627',
    base0B = '#65F59A',
    base0C = '#20E3D2',
    base0D = '#20E3D2',
    base0E = '#20E3D2',
    base0F = '#FF4D6D',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal', { fg = '#F2F6FF', bg = '#070A12' })
  hi('TelescopeBorder', { fg = '#536DFE', bg = '#070A12' })
  hi('TelescopePromptNormal', { fg = '#F2F6FF', bg = '#070A12' })
  hi('TelescopePromptBorder', { fg = '#536DFE', bg = '#070A12' })
  hi('TelescopePromptPrefix', { fg = '#20E3D2', bg = '#070A12' })
  hi('TelescopePromptCounter', { fg = '#A9B7D0', bg = '#070A12' })
  hi('TelescopePromptTitle', { fg = '#04100F', bg = '#20E3D2' })
  hi('TelescopePreviewTitle', { fg = '#04100F', bg = '#20E3D2' })
  hi('TelescopeResultsTitle', { fg = '#04100F', bg = '#20E3D2' })
  hi('TelescopeSelection', { fg = '#F2F6FF', bg = '#1A2338' })
  hi('TelescopeSelectionCaret', { fg = '#20E3D2', bg = '#1A2338' })
  hi('TelescopeMatching', { fg = '#20E3D2', bold = true })
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
