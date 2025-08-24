local scene = {}
local sceneManager = require('core.scene_manager')

function scene.enter()
  -- could init UI here
end

function scene.update(dt)
end

function scene.draw()
  local w, h = love.graphics.getDimensions()
  love.graphics.printf('Brackeys Jam 14\nPress Enter to Start', 0, h/2 - 20, w, 'center')
end

function scene.keypressed(key)
  if key == 'return' or key == 'kpenter' then
    sceneManager.set(require('scenes.game'))
  end
end

return scene
