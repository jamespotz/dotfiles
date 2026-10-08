local fn = require("utils.functions")
local function apply_resizer_rules(win)
  local float_center = {
    hl.dsp.window.float({ action = "on", window = win }),
    hl.dsp.window.center({ window = win }),
  }
  local pip_actions = fn.move_actions(win) or {}

  fn.resizer(win, "Bitwarden", 20, 54, float_center, true, "class")                                       -- Native app
  fn.resizer(win, "^Extension: %(Bitwarden Password Manager%) %- Bitwarden", 20, 54, float_center, false) -- Firefox
  fn.resizer(win, "nngceckbapebfimnlniiiahkandclblb", 20, 54, float_center, true, "class")                -- Chromium
  fn.resizer(win, "Picture[- ]in[- ][Pp]icture", 0, 0, pip_actions, false)
end

hl.on("window.title", apply_resizer_rules)
hl.on("window.open", apply_resizer_rules)
