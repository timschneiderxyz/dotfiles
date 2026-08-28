local mashKey = { "ctrl", "alt" }

-- Maximize focused window.
hs.hotkey.bind(mashKey, "return", function()
  local win = hs.window.focusedWindow()
  win:setFrame(win:screen():frame())
end)

-- Resize focused window.
local function setFrame(ratioX, ratioW)
  local win = hs.window.focusedWindow()
  local screen = win:screen():frame()
  win:setFrame({
    x = screen.x + screen.w * ratioX,
    y = screen.y,
    w = screen.w * ratioW,
    h = screen.h
  })
end

-- 2-column layout.
hs.hotkey.bind(mashKey, "left", function() setFrame(0, 1 / 2) end)
hs.hotkey.bind(mashKey, "right", function() setFrame(1 / 2, 1 / 2) end)

-- 3-column layout.
hs.hotkey.bind(mashKey, "e", function() setFrame(0, 2 / 3) end)
hs.hotkey.bind(mashKey, "r", function() setFrame(1 / 6, 2 / 3) end)
hs.hotkey.bind(mashKey, "t", function() setFrame(1 / 3, 2 / 3) end)
hs.hotkey.bind(mashKey, "d", function() setFrame(0, 1 / 3) end)
hs.hotkey.bind(mashKey, "f", function() setFrame(1 / 3, 1 / 3) end)
hs.hotkey.bind(mashKey, "g", function() setFrame(2 / 3, 1 / 3) end)
