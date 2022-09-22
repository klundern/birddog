--[[
	BirdDog: A game about a dog hunting birds

	Written as a love letter to my dog, Kenzie.

	Author: Nolan Klunder

	Inspriation taken from Harvard's GD50: Introduction to Game Development
]]

-- set default filter
love.graphics.setDefaultFilter('nearest', 'nearest')

-- load dependencies; contains references to all files used in this program
require 'src/Dependencies'

function love.load()
	love.window.setTitle('BirdDog')
	
	math.randomseed(os.time())

	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		vsync = true,
		resizable = true
	})

	gStateMachine = StateMachine {
		['title'] = function() return TitleScreenState() end,
		['play'] = function() return PlayState() end,
		['rules'] = function() return RulesState() end,
		['highscore'] = function() return HighScoreState() end
	}

	gSounds['music']:setLooping(true)
	gSounds['music']:play()

	gStateMachine:change('title')
	
	love.keyboard.keysPressed = {}
end

function love.resize(w, h)
	push:resize(w, h)
end

function love.keypressed(key)
	love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
	return love.keyboard.keysPressed[key]
end

function love.update(dt)
	Timer.update(dt)

	-- scroll our background, looping back to 0 after a certain amount
    backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT
    fenceScroll = (fenceScroll + FENCE_SCROLL_SPEED * dt) % VIRTUAL_WIDTH

	gStateMachine:update(dt)

	love.keyboard.keysPressed = {}
end

function love.draw()
	push:start()

	-- Background Image, which is persistent accross all states
	love.graphics.draw(gTextures['fence'], -fenceScroll, 0)
	love.graphics.draw(gTextures['background'], -backgroundScroll, 0)

	-- render current GameState ontop of background
	gStateMachine:render(dt)

	push:finish()
end