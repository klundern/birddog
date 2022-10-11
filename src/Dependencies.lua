--[[
	Common source file for all dependency files, including libraries, etc.
]]

Class = require 'lib/class'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

require 'src/constants'
require 'src/Util'
require 'src/StateMachine'
require 'src/Animation'
require 'src/entity_defs'
require 'src/Entity'
require 'src/Player'
require 'src/Tile'

-- game states
require 'src/states/game/BaseState'
require 'src/states/game/PlayState'
require 'src/states/game/TitleScreenState'
require 'src/states/game/RulesState'

-- entity states
require 'src/states/entity/PlayerRunState'

gTextures = {
	['background'] = love.graphics.newImage('graphics/background.png'),
	['menuUI'] = love.graphics.newImage('graphics/menuUI.png'),
	['fence'] = love.graphics.newImage('graphics/fence.png'),
	['birddog-running'] = love.graphics.newImage('graphics/birddog.png'),
	['robin'] = love.graphics.newImage('graphics/birds/robin.png'),
	['sparrow'] = love.graphics.newImage('graphics/birds/sparrow.png'),
	['cardinal'] = love.graphics.newImage('graphics/birds/cardinal.png'),
	['bluejay'] = love.graphics.newImage('graphics/birds/bluejay.png')
}

gFrames = {
	['menuUI'] = GenerateQuads(gTextures['menuUI'], 16, 16),
	['birddog-running'] = GenerateQuads(gTextures['birddog-running'], 46, 27),
	['robin'] = GenerateQuads(gTextures['robin'], 32, 32),
	['sparrow'] = GenerateQuads(gTextures['sparrow'], 32, 32),
	['cardinal'] = GenerateQuads(gTextures['cardinal'], 32, 32),
	['bluejay'] = GenerateQuads(gTextures['bluejay'], 32, 32)
}

gFonts = {
	['small'] = love.graphics.newFont('fonts/font.ttf', 8),
	['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
	['large'] = love.graphics.newFont('fonts/font.ttf', 32),
	['xlarge'] = love.graphics.newFont('fonts/font.ttf', 64)
}

gSounds = {
	['music'] = love.audio.newSource('sounds/music.mp3', 'static'),
	['blip'] = love.audio.newSource('sounds/blip.wav', 'static')
}