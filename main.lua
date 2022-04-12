--[[
	BirdDog: A Game About a Dog Catching Birds

	Written as a love letter to my dog Kenzie

	Author: Nolan Klunder
	klundern@gmail.com

	Inspriation taken from Harvard's GD50: Introduction to Game Development
]]

require 'src/Dependencies'

function love.load()
	math.randomseed(os.time())

	love.window.setTitle('BirdDog')
	love.graphics.setDefaultFilter('nearest', 'nearest')

	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = true,
		vsync = true,
		resizable = true
	})

	love.keyboard.keysPressed = {}
end

function love.resize(w, h)
	push:resize(w, h)
end

function love.keyPressed(key)
	love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
	return love.keyboard.keysPressed[key]
end

function love.update(dt)
	Timer.update(dt)

	love.keyboard.keysPressed = {}
end

function love.draw()
	push:start()

	push:finish()
end