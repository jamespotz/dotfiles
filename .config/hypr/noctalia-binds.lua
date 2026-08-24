local mainMod = "SUPER"     -- Sets "Windows" key as main modifier
hl.bind(mainMod .. " + ALT + N", hl.dsp.exec_cmd("pkill noctalia && sleep 1 && nohup noctalia &"),
  { description = "Restart Noctalia" })
local ipc = "noctalia msg"
hl.bind(mainMod .. "+Space", hl.dsp.exec_cmd(ipc .. " panel-toggle launcher"), { description = "Toggle launcher" })
hl.bind(mainMod .. "+S", hl.dsp.exec_cmd(ipc .. " panel-toggle control-center"),
  { description = "Toggle control center" })
hl.bind(mainMod .. "+comma", hl.dsp.exec_cmd(ipc .. " settings-toggle"), { description = "Toggle settings" })
hl.bind(mainMod .. "+V", hl.dsp.exec_cmd(ipc .. " panel-toggle clipboard"), { description = "Toggle clipboard" })
hl.bind(mainMod .. "+X", hl.dsp.exec_cmd(ipc .. " panel-toggle session"), { description = "Toggle session panel" })
hl.bind(mainMod .. "+k", hl.dsp.exec_cmd(ipc .. " panel-toggle kenn/keybind-cheatsheet:cheatsheet"),
  { description = "Toggle keybind cheatsheet" })
