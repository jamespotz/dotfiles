 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#000000',
    base01 = '#111417',
    base02 = '#1a1d22',
    base03 = '#8c9199',
    base04 = '#c2c7cf',
    base05 = '#e0e2e8',
    base06 = '#e0e2e8',
    base07 = '#e0e2e8',
    base08 = '#ffb4ab',
    base09 = '#d4bee6',
    base0A = '#b9c8da',
    base0B = '#9dcbfb',
    base0C = '#d4bee6',
    base0D = '#9dcbfb',
    base0E = '#b9c8da',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e0e2e8',          bg = '#000000' })
  hi('TelescopeBorder',         { fg = '#8c9199',             bg = '#000000' })
  hi('TelescopePromptNormal',   { fg = '#e0e2e8',          bg = '#000000' })
  hi('TelescopePromptBorder',   { fg = '#8c9199',             bg = '#000000' })
  hi('TelescopePromptPrefix',   { fg = '#9dcbfb',             bg = '#000000' })
  hi('TelescopePromptCounter',  { fg = '#c2c7cf',  bg = '#000000' })
  hi('TelescopePromptTitle',    { fg = '#000000',             bg = '#9dcbfb' })
  hi('TelescopePreviewTitle',   { fg = '#000000',             bg = '#b9c8da' })
  hi('TelescopeResultsTitle',   { fg = '#000000',             bg = '#d4bee6' })
  hi('TelescopeSelection',      { fg = '#e0e2e8',          bg = '#1a1d22' })
  hi('TelescopeSelectionCaret', { fg = '#9dcbfb',             bg = '#1a1d22' })
  hi('TelescopeMatching',       { fg = '#9dcbfb',             bold = true })
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
