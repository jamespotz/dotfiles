-- .config/hypr/hyprland.lua

if hl.plugin.scrolloverview then
  hl.config({
    plugin = {
      scrolloverview = {
        gesture_distance = 300, -- how far is the "max" for the gesture
        scale = 0.5,            -- preferred overview scale
        workspace_gap = 100,
        layout = "vertical",    -- vertical or horizontal
        wallpaper = 2,          -- 0: global only, 1: per-workspace only, 2: both
        blur = true,            -- blur only the main overview wallpaper

        shadow = {
          enabled = true,
          range = 50,
        },
      },
    },
  })

  -- Toggle ScrollOverview with SUPER+g
  hl.bind("SUPER + g", function()
    hl.plugin.scrolloverview.overview("toggle all")
  end)
end

if hl.plugin.gloview then
  hl.bind("SUPER + TAB", hl.plugin.gloview.toggle, { description = "Toggle Gloview" })
  hl.bind("SUPER + SHIFT + TAB", hl.plugin.gloview.desktop, { description = "Toggle Gloview Desktop" })
  hl.bind("SUPER + CTRL + TAB", hl.plugin.gloview.allworkspaces, { description = "Toogle Gloview All Workspace" })

  hl.bind("SUPER + bracketright", hl.plugin.gloview.next, { description = "Gloview next" })
  hl.bind("SUPER + bracketleft", hl.plugin.gloview.prev, { description = "Gloview previous" })
end
