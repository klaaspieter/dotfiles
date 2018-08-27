-- Disable window animations
hs.window.animationDuration = 0

-- I use vim, thus I prefer modal keybindings.
-- This also corresponds to my old Divvy keybinding.
-- This configures alt+space to enter normal mode.
local normal = hs.hotkey.modal.new({'alt'}, 'space')

normal.entered = function()
  --hs.alert.show('Normal mode')
end

normal.exited = function()
  --hs.alert.show('Insert mode')
end

function exitModal(action)
  return function()
    action()
    normal:exit()
  end
end

-- Reload config
normal:bind({}, "r", exitModal(function()
  hs.reload()
end))

-- Center the focused window
local centerWindow = exitModal(function()
  local window = hs.window.focusedWindow()
  local screenFrame = window:screen():frame()

  local newFrame = screenFrame:scale(0.7)

  window:setFrame(newFrame)
end)
normal:bind({}, 'c', centerWindow)

-- Maximize the focused window
local fullScreenWindow = exitModal(function()
  hs.window.focusedWindow():maximize()
end)
normal:bind({}, 'f', fullScreenWindow)


-- Emit the contents of the pasteboard as key events
hs.hotkey.bind(
  {"cmd", "alt"},
  "V",
  function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end
)

hs.alert.show("Config reloaded")
