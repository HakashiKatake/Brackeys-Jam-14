local scene = {}
local Player = require('entities.player')

local player

function scene.enter()
  player = Player.new(120, 120)
end

function scene.update(dt)
  player:update(dt)
end

function scene.draw()
  love.graphics.clear(0.08, 0.08, 0.1)
  player:draw()

  love.graphics.setColor(1, 1, 1)
  love.graphics.print('WASD/Arrows to move, Esc to menu', 8, 8)
end

function scene.keypressed(key)
  if key == 'escape' then
    local sceneManager = require('core.scene_manager')
    sceneManager.set(require('scenes.menu'))
  end
end

return scene
