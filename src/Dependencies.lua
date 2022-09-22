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

-- game states
require 'src/states/game/BaseState'
require 'src/states/game/PlayState'
require 'src/states/game/TitleScreenState'
require 'src/states/game/RulesState'

-- entity states
require 'src/states/entity/PlayerRunState'

gTextures = {
	['background'] = love.graphics.newImage('graphics/background.png'),
	['fence'] = love.graphics.newImage('graphics/fence.png'),
	['birddog-running'] = love.graphics.newImage('graphics/birddog.png')
}

gFrames = {
	['birddog-running'] = GenerateQuads(gTextures['birddog-running'], 46, 27)
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