--[[
	BirdDog: A game about a dog hunting birds
	Written as a love letter to my dog, Kenzie.

	Author: Nolan Klunder

	Inspriation taken from Harvard's GD50: Introduction to Game Development
]]

-- set default filter; must do this before we load our textures in 'dependencies'
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
		['gameover'] = function() return GameOverState() end,
		['highscore'] = function() return HighScoreState() end
	}

	gSounds['music']:setLooping(true)
	gSounds['music']:play()

	gStateMachine:change('title')
	
	love.keyboard.keysPressed = {}
end

-- allows us to resize our window; only thing we need to worry about is
-- "pushing" it to our push library
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

	-- display our FPS so we can check the performance of our game
	displayFPS()

	push:finish()
end

function displayFPS()
	love.graphics.setFont(gFonts['small'])
	love.graphics.setColor(0, 1, 0, 1)
	love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 5, 5)
end

--[[
	Loads our High Scores from a .lst file saved in LÖVED2's default save directory
	in a subfolder called 'BirdDog'
]]
function loadHighScores()
	love.filesystem.setIdentity('BirdDog')

	-- if the file doesn't exist, initialize it with 'placeholder' data
	if not love.filesystem.getInfo('BirdDog.lst') then
		local scores = ''
		for i = 5, 1, -1 do
			scores = scores .. 'NTK\n'
			scores = scores .. tostring(i * 10) .. '\n'
		end

		love.filesystem.write('BirdDog.lst', scores)
	end

	-- set up variables for proper loading of data in file
	local name = true
	local currentName = nil
	local counter = 1 

	local scores = {}

	-- initialize a table to load data to
	for i = 1, 5 do
		scores[i] = {
			name = nil,
			score = nil
		}
	end

	-- load data line by line from our file into our score table
	for line in love.filesystem.lines('BirdDog.lst') do
		if name then
			scores[counter].name = string.sub(line, 1, 3)
		else
			scores[counter].score = tonumber(line)
			counter = counter + 1
		end

		-- flip flag so next line is read as score, etc.
		name = not name 
	end

	-- returns score table
	return scores 
end