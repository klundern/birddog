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
require 'src/states/game/GameOverState'
require 'src/states/game/HighScoreState'

-- entity states
require 'src/states/entity/PlayerRunState'
require 'src/states/entity/Entity/EntityIdleState'
require 'src/states/entity/Entity/BirdFlyState'
require 'src/states/entity/Entity/CatChaseState'

gTextures = {
	['background'] = love.graphics.newImage('graphics/background.png'),
	['menuUI-1'] = love.graphics.newImage('graphics/menuUI-1.png'),
	['menuUI-2'] = love.graphics.newImage('graphics/menuUI-2.png'),
	['menuUI-3'] = love.graphics.newImage('graphics/menuUI-3.png'),
	['menuUI-4'] = love.graphics.newImage('graphics/menuUI-4.png'),
	['fence'] = love.graphics.newImage('graphics/fence.png'),
	['birddog-running'] = love.graphics.newImage('graphics/birddog.png'),
	['robin'] = love.graphics.newImage('graphics/birds/robin.png'),
	['sparrow'] = love.graphics.newImage('graphics/birds/sparrow.png'),
	['cardinal'] = love.graphics.newImage('graphics/birds/cardinal.png'),
	['bluejay'] = love.graphics.newImage('graphics/birds/bluejay.png'),
	['cat'] = love.graphics.newImage('graphics/cat.png')
}

gFrames = {
	['menuUI-1'] = GenerateQuads(gTextures['menuUI-1'], 16, 16),
	['menuUI-2'] = GenerateQuads(gTextures['menuUI-2'], 16, 16),
	['menuUI-3'] = GenerateQuads(gTextures['menuUI-3'], 16, 16),
	['menuUI-4'] = GenerateQuads(gTextures['menuUI-4'], 16, 16),
	['birddog-running'] = GenerateQuads(gTextures['birddog-running'], 46, 27),
	['robin'] = GenerateQuads(gTextures['robin'], 32, 32),
	['sparrow'] = GenerateQuads(gTextures['sparrow'], 32, 32),
	['cardinal'] = GenerateQuads(gTextures['cardinal'], 32, 32),
	['bluejay'] = GenerateQuads(gTextures['bluejay'], 32, 32),
	['cat'] = GenerateQuads(gTextures['cat'], 32, 32)
}

gFonts = {
	['small'] = love.graphics.newFont('fonts/font.ttf', 8),
	['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
	['large'] = love.graphics.newFont('fonts/font.ttf', 32),
	['xlarge'] = love.graphics.newFont('fonts/font.ttf', 64)
}

gSounds = {
	['music'] = love.audio.newSource('sounds/music.mp3', 'static'),
	['blip'] = love.audio.newSource('sounds/blip.wav', 'static'),
	['crunch-1'] = love.audio.newSource('sounds/crunch-1.mp3', 'static'),
	['crunch-2'] = love.audio.newSource('sounds/crunch-2.mp3', 'static'),
	['crunch-3'] = love.audio.newSource('sounds/crunch-3.mp3', 'static'),
	['crunch-4'] = love.audio.newSource('sounds/crunch-4.mp3', 'static'),
	['crunch-5'] = love.audio.newSource('sounds/crunch-5.mp3', 'static'),
	['crunch-6'] = love.audio.newSource('sounds/crunch-6.mp3', 'static'),
	['crunch-7'] = love.audio.newSource('sounds/crunch-7.mp3', 'static')
}