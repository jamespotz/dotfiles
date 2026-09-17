local M = {}

function M.setup()
  vim.o.background = 'dark'
  require('base16-colorscheme').setup({
    base00 = '#080706',
    base01 = '#161310',
    base02 = '#292119',
    base03 = '#328CFF',
    base04 = '#C9BDAA',
    base05 = '#FFF8EA',
    base06 = '#FFF8EA',
    base07 = '#FFF8EA',
    base08 = '#FF3D57',
    base09 = '#FFD23F',
    base0A = '#FFD23F',
    base0B = '#3FFFB0',
    base0C = '#FF8A1F',
    base0D = '#FF8A1F',
    base0E = '#FF8A1F',
    base0F = '#FF3D57',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal', { fg = '#FFF8EA', bg = '#080706' })
  hi('TelescopeBorder', { fg = '#328CFF', bg = '#080706' })
  hi('TelescopePromptNormal', { fg = '#FFF8EA', bg = '#080706' })
  hi('TelescopePromptBorder', { fg = '#328CFF', bg = '#080706' })
  hi('TelescopePromptPrefix', { fg = '#FF8A1F', bg = '#080706' })
  hi('TelescopePromptCounter', { fg = '#C9BDAA', bg = '#080706' })
  hi('TelescopePromptTitle', { fg = '#120700', bg = '#FF8A1F' })
  hi('TelescopePreviewTitle', { fg = '#120700', bg = '#FF8A1F' })
  hi('TelescopeResultsTitle', { fg = '#120700', bg = '#FF8A1F' })
  hi('TelescopeSelection', { fg = '#FFF8EA', bg = '#292119' })
  hi('TelescopeSelectionCaret', { fg = '#FF8A1F', bg = '#292119' })
  hi('TelescopeMatching', { fg = '#FF8A1F', bold = true })
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
