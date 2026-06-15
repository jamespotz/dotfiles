 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#191114',
    base01 = '#261d20',
    base02 = '#30282b',
    base03 = '#9d8c91',
    base04 = '#d5c2c7',
    base05 = '#eedfe2',
    base06 = '#eedfe2',
    base07 = '#eedfe2',
    base08 = '#ffb4ab',
    base09 = '#f1bb97',
    base0A = '#e1bdc9',
    base0B = '#ffb0cf',
    base0C = '#f1bb97',
    base0D = '#ffb0cf',
    base0E = '#e1bdc9',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#eedfe2',          bg = '#191114' })
  hi('TelescopeBorder',         { fg = '#9d8c91',             bg = '#191114' })
  hi('TelescopePromptNormal',   { fg = '#eedfe2',          bg = '#191114' })
  hi('TelescopePromptBorder',   { fg = '#9d8c91',             bg = '#191114' })
  hi('TelescopePromptPrefix',   { fg = '#ffb0cf',             bg = '#191114' })
  hi('TelescopePromptCounter',  { fg = '#d5c2c7',  bg = '#191114' })
  hi('TelescopePromptTitle',    { fg = '#191114',             bg = '#ffb0cf' })
  hi('TelescopePreviewTitle',   { fg = '#191114',             bg = '#e1bdc9' })
  hi('TelescopeResultsTitle',   { fg = '#191114',             bg = '#f1bb97' })
  hi('TelescopeSelection',      { fg = '#eedfe2',          bg = '#30282b' })
  hi('TelescopeSelectionCaret', { fg = '#ffb0cf',             bg = '#30282b' })
  hi('TelescopeMatching',       { fg = '#ffb0cf',             bold = true })
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
