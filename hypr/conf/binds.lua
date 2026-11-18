-- General Binds
hl.bind("ALT + F4", hl.dsp.window.close())
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.kill())
hl.bind("SUPER + SPACE", hl.dsp.window.float())
hl.bind("SUPER + SHIFT + TAB", hl.dsp.group.toggle())

hl.bind("SUPER + SHIFT + G", hl.dsp.window.move({ out_of_group = true }))

-- Windows

hl.bind("SUPER + SHIFT + LEFT", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + DOWN", hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + SHIFT + UP", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + RIGHT", hl.dsp.window.move({ direction = "r" }))
-- Directional navigation (native replacement for move.sh)
--
-- Grouped (tabbed) window:  left/right cycle the group's tabs (prev/next),
--                           up/down do nothing.
-- Otherwise:                arrow keys move focus in that direction.

local function move(direction)
  local w = hl.get_active_window()

  if w ~= nil and w.group ~= nil then
    -- Tabbed windows: cycle within the group on horizontal presses only.
    if direction == "left" then
      hl.dispatch(hl.dsp.group.prev())   -- was: changegroupactive b
    elseif direction == "right" then
      hl.dispatch(hl.dsp.group.next())   -- was: changegroupactive f
    end
    -- up/down intentionally ignored while grouped (matches original)
  else
    -- Floating/tiled windows: move focus.
    hl.dispatch(hl.dsp.focus({ direction = direction }))  -- was: movefocus
  end
end

hl.bind("SUPER + left",  function() move("left")  end)
hl.bind("SUPER + right", function() move("right") end)
hl.bind("SUPER + up",    function() move("up")    end)
hl.bind("SUPER + down",  function() move("down")  end)

-- Scroll through groups with SUPER + scroll
hl.bind("SUPER + mouse_down", hl.dsp.group.next())
hl.bind("SUPER + mouse_up",   hl.dsp.group.prev())

-- Move/resize windows with SUPER + LMB/RMB and dragging
hl.bind("SUPER + mouse:272",  hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273",  hl.dsp.window.resize(), { mouse = true })

-- Workspaces
hl.bind("SUPER + CTRL + left",  hl.dsp.workspace.move({ monitor = "l" }))
hl.bind("SUPER + CTRL + right", hl.dsp.workspace.move({ monitor = "r" }))
hl.bind("SUPER + CTRL + up",    hl.dsp.workspace.move({ monitor = "u" }))
hl.bind("SUPER + CTRL + down",  hl.dsp.workspace.move({ monitor = "d" }))

-- Switch/Move workspaces
for i = 1, 10 do
    -- Switch
    hl.bind("SUPER + " .. (i % 10), hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + F" .. i, hl.dsp.focus({ workspace = i + 10 }))
    -- Move
    hl.bind("SUPER + SHIFT + " .. (i % 10), hl.dsp.window.move({ workspace = i }))
    hl.bind("SUPER + SHIFT + F" .. i, hl.dsp.window.move({ workspace = i + 10 }))
end

-- Shortcuts/Applications
hl.bind("SUPER + L", function()
    hl.exec_cmd("uwsm app -- hyprlock")
end)
hl.bind("SUPER + RETURN", function()
    hl.exec_cmd("uwsm app -- kitty")
end)
hl.bind("SUPER + TAB", function()
    hl.exec_cmd("uwsm app -- walker -p desktopapplications")
end)
hl.bind("SUPER + A", function()
    hl.exec_cmd("uwsm app -- pwvucontrol")
end)
hl.bind("SUPER + D", function()
    hl.exec_cmd("uwsm app -- nautilus")
end)
hl.bind("SUPER + C", function()
    hl.exec_cmd("uwsm app -- librewolf")
end)
hl.bind("CTRL + SHIFT + ALT + SUPER + L", function()
    hl.exec_cmd("uwsm app -- xdg-open https://linkedin.com")
end)

-- Screenshot
hl.bind(" + print", function()
    hl.exec_cmd("uwsm app -- grim -g \"$(slurp)\" - | swappy -f -")
end)
hl.bind("SUPER + print", function()
    hl.exec_cmd("uwsm app -- grim - | swappy -f -")
end)

-- Clipboard
hl.bind("SUPER + V", function()
    hl.exec_cmd("uwsm app -- walker -n --modules clipboard")
end)

-- Hack to copy from the X clipboard
hl.bind("CTRL + SUPER + C", function()
    hl.exec_cmd("uwsm app -- xclip -o | wl-copy")
end)