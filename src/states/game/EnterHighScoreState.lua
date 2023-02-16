--[[
	The code for this state is almost entirely copied from Colton Ogden's excellent
	'EnterHighScoreState' as part of the GD50 Breakout Remake.

	This state allows us to input a new high score in the form of three characters,
	meant to represent the player's initials.
]]

EnterHighScoreState = Class{__includes = BaseState}

function EnterHighScoreState:init()
	self.menu = {}
	self.texture = 1
	self.rows = 11
	self.columns = 21

	self.menu = Tile:createMenu(self.rows, self.columns)

-- default chars ('A') of our string that the player will use to input their initials
	self.chars = {
		[1] = 65,
		[2] = 65,
		[3] = 65
	}

	self.highlightedChar = 1
end

function EnterHighScoreState:enter(params)
	self.highScores = params.highScores
	self.score = params.score
	self.scoreIndex = params.scoreIndex
end

function EnterHighScoreState:update(dt)
	-- once player hits 'enter', score table is updated with new name and score
	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		local name = string.char(self.chars[1]) .. string.char(self.chars[2]) .. string.char(self.chars[3])

		-- go backwards through high scores table till this score, shifting scores
		for i = 5, self.scoreIndex, -1 do
			self.highScores[i + 1] = {
				name = self.highScores[i].name,
				score = self.highScores[i].score
			}
		end

		self.highScores[self.scoreIndex].name = name
		self.highScores[self.scoreIndex].score = self.score

		-- write scores to file
		local scoresStr = ''

		for i = 1, 5 do
			scoreStr = scoresStr .. self.highScores[i].name .. '\n'
			scoresStr = scoreStr .. tostring(self.highScores[i].score) .. '\n'
		end

		love.filesystem.write('birddog.lst', scoresStr)

		-- change back to GameOver state with new high score parameters
		gStateMachine:change('highscore')
	end

	-- scroll through character slots
	if love.keyboard.wasPressed('left') and self.highlightedChar > 1 then
		self.highlightedChar = self.highlightedChar - 1
		gSounds['blip']:play()
	elseif love.keyboard.wasPressed('right') and self.highlightedChar < 3 then
		self.highlightedChar = self.highlightedChar + 1
		gSounds['blip']:play()
	end

	-- scroll through characters
	if love.keyboard.wasPressed('up') then
		self.chars[self.highlightedChar] = self.chars[self.highlightedChar] + 1
		if self.chars[self.highlightedChar] > 90 then
			self.chars[self.highlightedChar] = 65
		end
	elseif love.keyboard.wasPressed('down') then
		self.chars[self.highlightedChar] = self.chars[self.highlightedChar] - 1
		if self.chars[self.highlightedChar] < 65 then
			self.chars[self.highlightedChar] = 90
		end
	end
end

function EnterHighScoreState:render()
	for k, tile in pairs(self.menu) do
		tile:render(self.texture)
	end

	-- UI code
	love.graphics.setFont(gFonts['medium'])
	love.graphics.printf('Your Score: ' .. tostring(self.score), 0, 30,
		VIRTUAL_WIDTH, 'center')

	love.graphics.setFont(gFonts['large'])

	-- render all 3 characters of the name
	if self.highlightedChar == 1 then
		love.graphics.setColor(103/255, 1, 1, 1)
	end
	love.graphics.print(string.char(self.chars[1]), VIRTUAL_WIDTH / 2 - 28, VIRTUAL_HEIGHT / 2)
	love.graphics.setColor(1, 1, 1, 1)

	if self.highlightedChar == 2 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
    love.graphics.print(string.char(self.chars[2]), VIRTUAL_WIDTH / 2 - 6, VIRTUAL_HEIGHT / 2)
    love.graphics.setColor(1, 1, 1, 1)

    if self.highlightedChar == 3 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
    love.graphics.print(string.char(self.chars[3]), VIRTUAL_WIDTH / 2 + 20, VIRTUAL_HEIGHT / 2)
    love.graphics.setColor(1, 1, 1, 1)
    
    love.graphics.setFont(gFonts['small'])
    love.graphics.printf('Press Enter to confirm!', 0, VIRTUAL_HEIGHT - 25,
        VIRTUAL_WIDTH, 'center')
end