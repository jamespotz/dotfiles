local M = {}

function M.setup()
  vim.o.background = 'dark'
  require('base16-colorscheme').setup({
    base00 = '#000008',
    base01 = '#151529',
    base02 = '#212147',
    base03 = '#4d80ff',
    base04 = '#cce0ff',
    base05 = '#e6f0ff',
    base06 = '#e6f0ff',
    base07 = '#e6f0ff',
    base08 = '#ff3366',
    base09 = '#ffcc00',
    base0A = '#ffcc00',
    base0B = '#0080ff',
    base0C = '#ff6600',
    base0D = '#ff6600',
    base0E = '#ff6600',
    base0F = '#ff3366',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal', { fg = '#e6f0ff', bg = '#000008' })
  hi('TelescopeBorder', { fg = '#4d80ff', bg = '#000008' })
  hi('TelescopePromptNormal', { fg = '#e6f0ff', bg = '#000008' })
  hi('TelescopePromptBorder', { fg = '#4d80ff', bg = '#000008' })
  hi('TelescopePromptPrefix', { fg = '#ff6600', bg = '#000008' })
  hi('TelescopePromptCounter', { fg = '#cce0ff', bg = '#000008' })
  hi('TelescopePromptTitle', { fg = '#000000', bg = '#ff6600' })
  hi('TelescopePreviewTitle', { fg = '#000000', bg = '#ff6600' })
  hi('TelescopeResultsTitle', { fg = '#000000', bg = '#ff6600' })
  hi('TelescopeSelection', { fg = '#e6f0ff', bg = '#212147' })
  hi('TelescopeSelectionCaret', { fg = '#ff6600', bg = '#212147' })
  hi('TelescopeMatching', { fg = '#ff6600', bold = true })
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
