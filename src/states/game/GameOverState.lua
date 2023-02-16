--[[
]]

GameOverState = Class{__includes = BaseState}

function GameOverState:init()
	self.menu = {}
	self.texture = 1
	self.rows = 11
	self.columns = 21

	self.menu = Tile:createMenu(self.rows, self.columns)
end

function GameOverState:enter(params)
	self.score = params.score
	self.highScores = loadHighScores()
	
	-- when we enter the GameOverState, check if a high score has been achieved
	local highScore = false

	-- keep track if which score our high score overwrites, if any
	local scoreIndex = 6

	for i = 5, 1, -1 do
		local score = self.highScores[i].score or 0
		if self.score > score then
			highScoreIndex = i
			highScore = true
		end
	end

	-- if we did beat a highscore, transition to the 'enter-high-score' state
	if highScore then
		gStateMachine:change('enter-high-score', {
			highScores = self.highScores,
			score = self.score,
			scoreIndex = highScoreIndex
		})
	end
end

function GameOverState:update(dt)
	if love.keyboard.wasPressed('escape') then
		love.event.quit()
	end

	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		gStateMachine:change('title')
	end
end

function GameOverState:render()
	for k, tile in pairs(self.menu) do
		tile:render(self.texture)
	end

	-- UI code
	love.graphics.setFont(gFonts['large'])
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.printf('Game Over', 0, 20, VIRTUAL_WIDTH, 'center')
	love.graphics.setFont(gFonts['medium'])
	love.graphics.printf('You got caught by a kitty!', 0, 50, VIRTUAL_WIDTH, 'center')

	love.graphics.rectangle('fill', 68, 70, 250, 2)

	love.graphics.printf('High Scores:', 0, 80, VIRTUAL_WIDTH, 'center')

	-- display High Scores, iterating over each one in the scores table
	for i = 1, 5 do
		local name = self.highScores[i]. name or '---'
		local score = self.highScores[i].score or '---'

		love.graphics.printf(tostring(i) .. '.', VIRTUAL_WIDTH / 3,
			90 + i * 13, 50, 'left')
		love.graphics.printf(name, VIRTUAL_WIDTH / 3 + 5,
			90 + i * 13, 50, 'right')
		love.graphics.printf(tostring(score), VIRTUAL_WIDTH / 3 + 20,
			90 + i * 13, 100, 'right')
	end

	--love.graphics.setColor(92/255, 204/255, 220/255, 1)
	love.graphics.printf("Press 'Enter' for Main Menu", 0, 180, VIRTUAL_WIDTH, 'center')
end