local M = {
  down = {},
  pressed = {},
  released = {}
}

local function reset()
  for k in pairs(M.pressed) do M.pressed[k] = nil end
  for k in pairs(M.released) do M.released[k] = nil end
end

function M.update()
  reset()
end

function M.keypressed(key)
  if not M.down[key] then M.pressed[key] = true end
  M.down[key] = true
end

function M.keyreleased(key)
  if M.down[key] then M.released[key] = true end
  M.down[key] = nil
end

function M.isDown(key)
  return M.down[key] == true
end

function M.wasPressed(key)
  return M.pressed[key] == true
end

function M.wasReleased(key)
  return M.released[key] == true
end

return M
