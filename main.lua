
package.path = package.path .. ';src/?.lua;src/?/init.lua;src/?/?.lua'

local scene = require('core.scene_manager')
local input = require('core.input')

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  love.window.setVSync(1)
  scene.init()
  scene.set(require('scenes.menu'))
end

function love.update(dt)
  input.update()
  scene.update(dt)
end

function love.draw()
  scene.draw()
end

function love.keypressed(key, scancode, isrepeat)
  input.keypressed(key)
  scene.keypressed(key, scancode, isrepeat)
end

function love.keyreleased(key)
  input.keyreleased(key)
  scene.keyreleased(key)
end

function love.textinput(t)
  scene.textinput(t)
end

function love.resize(w, h)
  scene.resize(w, h)
end

function love.mousepressed(x, y, button, istouch, presses)
  scene.mousepressed(x, y, button, istouch, presses)
end

function love.mousereleased(x, y, button, istouch, presses)
  scene.mousereleased(x, y, button, istouch, presses)
end
