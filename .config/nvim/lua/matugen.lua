local M = {}

function M.setup()
  vim.o.background = 'dark'
  require('base16-colorscheme').setup({
    base00 = '#0d0221',
    base01 = '#1a0b33',
    base02 = '#2a1450',
    base03 = '#b04dff',
    base04 = '#c9b3e6',
    base05 = '#f5e9ff',
    base06 = '#f5e9ff',
    base07 = '#f5e9ff',
    base08 = '#ff3864',
    base09 = '#ff7a1a',
    base0A = '#ff7a1a',
    base0B = '#2de2a6',
    base0C = '#ffb000',
    base0D = '#ffb000',
    base0E = '#ffb000',
    base0F = '#ff3864',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal', { fg = '#f5e9ff', bg = '#0d0221' })
  hi('TelescopeBorder', { fg = '#b04dff', bg = '#0d0221' })
  hi('TelescopePromptNormal', { fg = '#f5e9ff', bg = '#0d0221' })
  hi('TelescopePromptBorder', { fg = '#b04dff', bg = '#0d0221' })
  hi('TelescopePromptPrefix', { fg = '#ffb000', bg = '#0d0221' })
  hi('TelescopePromptCounter', { fg = '#c9b3e6', bg = '#0d0221' })
  hi('TelescopePromptTitle', { fg = '#0d0221', bg = '#ffb000' })
  hi('TelescopePreviewTitle', { fg = '#0d0221', bg = '#ffb000' })
  hi('TelescopeResultsTitle', { fg = '#0d0221', bg = '#ffb000' })
  hi('TelescopeSelection', { fg = '#f5e9ff', bg = '#2a1450' })
  hi('TelescopeSelectionCaret', { fg = '#ffb000', bg = '#2a1450' })
  hi('TelescopeMatching', { fg = '#ffb000', bold = true })
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
