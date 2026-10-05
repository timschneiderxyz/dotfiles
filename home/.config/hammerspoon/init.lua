--  _
-- | |__   __ _ _ __ ___  _ __ ___   ___ _ __ ___ _ __   ___   ___  _ __
-- | '_ \ / _` | '_ ` _ \| '_ ` _ \ / _ \ '__/ __| '_ \ / _ \ / _ \| '_ \
-- | | | | (_| | | | | | | | | | | |  __/ |  \__ \ |_) | (_) | (_) | | | |
-- |_| |_|\__,_|_| |_| |_|_| |_| |_|\___|_|  |___/ .__/ \___/ \___/|_| |_|
--                                               |_|


-- Enable the hs command line tool.
require("hs.ipc")

-- Reload when a config file changes.
configWatcher = hs.pathwatcher.new(hs.configdir, function(paths)
  for _, path in ipairs(paths) do
    if path:sub(-4) == ".lua" then return hs.reload() end
  end
end):start()

-- Load modules.
require("windows")
require("mouse")
require("apps")
