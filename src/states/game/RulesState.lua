--[[
    RulesState Class
    Author: Nolan Klunder
    klundern@gmail.com

    Basic menu that explains the rules of the game.
]]

RulesState = Class{__includes = BaseState}

function RulesState:init()
    self.menu = {}

    self.rows = 11
    self.columns = 21
    self.texture = 1

    self.menu = Tile:createMenu(self.rows, self.columns)
end

function RulesState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('return' or 'enter') then
        gStateMachine:change('title')
        gSounds['blip']:play()
    end

    -- allows us to swap MenuUI skins (so we can compare them in-game)
    if love.keyboard.wasPressed('1') then
        self.texture = 1
    elseif love.keyboard.wasPressed('2') then
        self.texture = 2
    elseif love.keyboard.wasPressed('3') then
        self.texture = 3
    elseif love.keyboard.wasPressed('4') then
        self.texture = 4
    end
end

function RulesState:render()
    -- build menu, tile by tile
    for k, tile in pairs(self.menu) do
        tile:render(self.texture)
    end

    -- UI Code
    love.graphics.setFont(gFonts['large'])
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf('Rules:', 0, 20, VIRTUAL_WIDTH, 'center')

    love.graphics.rectangle('fill', 92, 50, 200, 2)

    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('1. Catch birds (             )', 0, 60, VIRTUAL_WIDTH, 'center')
    love.graphics.draw(gTextures['robin'], gFrames['robin'][22], 200, 50)
    love.graphics.draw(gTextures['sparrow'], gFrames['sparrow'][22], 225, 50)
    love.graphics.draw(gTextures['cardinal'], gFrames['cardinal'][22], 250, 50)
    love.graphics.draw(gTextures['bluejay'], gFrames['bluejay'][22], 275, 50)

    love.graphics.printf('2. Avoid cats (    )', 0, 90, VIRTUAL_WIDTH, 'center')
    love.graphics.draw(gTextures['cat'], gFrames['cat'][1], 234, 76)

    love.graphics.printf('3. Have fun!', 0, 120, VIRTUAL_WIDTH, 'center')

    --love.graphics.setColor(92/255, 204/255, 220/255, 1)
    love.graphics.printf("Press 'Enter' for Main Menu", 0, 180, VIRTUAL_WIDTH, 'center')

end