-- Map mouse back/forward buttons to Finder navigation shortcuts.
hs.eventtap.new({ hs.eventtap.event.types.otherMouseDown }, function(e)
  if hs.application.frontmostApplication():name() ~= "Finder" then return end
  local btn = e:getProperty(hs.eventtap.event.properties.mouseEventButtonNumber)
  if btn == 3 then
    hs.eventtap.keyStroke({ "cmd" }, "ö")
    return true
  elseif btn == 4 then
    hs.eventtap.keyStroke({ "cmd" }, "ä")
    return true
  end
end):start()
