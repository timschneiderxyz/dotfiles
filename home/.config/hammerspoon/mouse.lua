-- Map mouse back/forward buttons to Finder navigation shortcuts.
finderMouseNavTap = hs.eventtap.new({ hs.eventtap.event.types.otherMouseDown }, function(e)
  local app = hs.application.frontmostApplication()
  if not app or app:bundleID() ~= "com.apple.finder" then return end
  local btn = e:getProperty(hs.eventtap.event.properties.mouseEventButtonNumber)
  if btn == 3 then
    hs.eventtap.keyStroke({ "cmd" }, "ö", 0)
    return true
  elseif btn == 4 then
    hs.eventtap.keyStroke({ "cmd" }, "ä", 0)
    return true
  end
end):start()
