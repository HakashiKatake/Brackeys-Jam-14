local M = {}

local current = nil

function M.init()
  -- placeholder for future stack/history if needed
end

function M.set(scene)
  if current and current.leave then current.leave() end
  current = scene
  if current and current.enter then current.enter() end
end

function M.update(dt)
  if current and current.update then current.update(dt) end
end

function M.draw()
  if current and current.draw then current.draw() end
end

-- Pass through common callbacks
function M.keypressed(key, scancode, isrepeat)
  if current and current.keypressed then current.keypressed(key, scancode, isrepeat) end
end

function M.keyreleased(key)
  if current and current.keyreleased then current.keyreleased(key) end
end

function M.textinput(t)
  if current and current.textinput then current.textinput(t) end
end

function M.resize(w, h)
  if current and current.resize then current.resize(w, h) end
end

function M.mousepressed(x, y, button, istouch, presses)
  if current and current.mousepressed then current.mousepressed(x, y, button, istouch, presses) end
end

function M.mousereleased(x, y, button, istouch, presses)
  if current and current.mousereleased then current.mousereleased(x, y, button, istouch, presses) end
end

return M
