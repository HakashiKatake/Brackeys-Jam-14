local input = require('core.input')

local Player = {}
Player.__index = Player

function Player.new(x, y)
  local self = setmetatable({}, Player)
  self.x = x or 100
  self.y = y or 100
  self.speed = 180
  self.size = 16
  return self
end

function Player:update(dt)
  local dx, dy = 0, 0
  if input.isDown('left') or input.isDown('a') then dx = dx - 1 end
  if input.isDown('right') or input.isDown('d') then dx = dx + 1 end
  if input.isDown('up') or input.isDown('w') then dy = dy - 1 end
  if input.isDown('down') or input.isDown('s') then dy = dy + 1 end

  if dx ~= 0 or dy ~= 0 then
    local len = math.sqrt(dx*dx + dy*dy)
    dx, dy = dx/len, dy/len
  end

  self.x = self.x + dx * self.speed * dt
  self.y = self.y + dy * self.speed * dt
end

function Player:draw()
  love.graphics.setColor(0.2, 0.8, 1.0)
  love.graphics.rectangle('fill', math.floor(self.x), math.floor(self.y), self.size, self.size)
  love.graphics.setColor(1, 1, 1)
end

return Player
