local hyperKey = { "cmd", "ctrl", "alt", "shift" }

-- Reload hammerspoon configuration.
hs.hotkey.bind(hyperKey, "h", hs.reload)

-- Cycle through windows of the current application.
hs.hotkey.bind(hyperKey, "c", function()
  local win = hs.window.focusedWindow()
  if not win then return end
  local wins = win:application():allWindows()
  if #wins < 2 then return end
  local idx = hs.fnutils.indexOf(wins, win)
  wins[(idx % #wins) + 1]:focus()
end)

-- Toggle Finder, opening a new window if none exists.
hs.hotkey.bind(hyperKey, "f", function()
  local finder = hs.application.get("Finder")
  local hasWindow = finder and hs.fnutils.find(finder:allWindows(), function(w)
    return w:isStandard()
  end)
  if finder and finder:isFrontmost() then
    if hasWindow then
      finder:hide()
    else
      finder:selectMenuItem({ "File", "New Finder Window" })
    end
  else
    hs.application.launchOrFocus("Finder")
    if not hasWindow then
      hs.timer.doAfter(0.1, function()
        local a = hs.application.get("Finder")
        if a and not hs.fnutils.find(a:allWindows(), function(w) return w:isStandard() end) then
          a:selectMenuItem({ "File", "New Finder Window" })
        end
      end)
    end
  end
end)

-- Launch or focus an app, hide it if frontmost.
local function toggleApp(appName, appProcessName)
  local app = hs.application.get(appProcessName or appName)
  if app and app:isFrontmost() then
    app:hide()
  else
    hs.application.launchOrFocus(appName)
  end
end

-- App launcher shortcuts.
hs.hotkey.bind(hyperKey, "b", function() toggleApp("Google Chrome") end)
hs.hotkey.bind(hyperKey, "n", function() toggleApp("Obsidian") end)
hs.hotkey.bind(hyperKey, "t", function() toggleApp("Ghostty") end)
hs.hotkey.bind(hyperKey, "v", function() toggleApp("Visual Studio Code", "Code") end)
hs.hotkey.bind(hyperKey, "s", function() toggleApp("Spotify") end)
