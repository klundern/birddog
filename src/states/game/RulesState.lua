--[[
    RulesState Class
    Author: Nolan Klunder
    klundern@gmail.com


]]

RulesState = Class{__includes = BaseState}

function RulesState:init()
    self.menu = {}

    self.rows = 10
    self.columns = 21

    local tileID = 0

    -- each row
    for y = 0, self.rows do
        for x = 0, self.columns do
            -- set ID for 4 'sides' of menu, then everything else in-between
            if y == 0 then
                tileID = 2
            elseif y == self.rows then
                tileID = 8
            elseif x == 0 then
                tileID = 4
            elseif x == self.columns then
                tileID = 6
            else
                tileID = 5
            end

            -- set tileID's for corners
            if y == 0 and x == 0 then
                tileID = 1
            elseif y == self.rows and x == 0 then
                tileID = 7
            elseif y == 0 and x == self.columns then
                tileID = 3
            elseif y == self.rows and x == self.columns then
                tileID = 9
            end

            -- add each tile to the menu table
            local tile = Tile(tileID, (x * 16) + 16, (y * 16) + 16)
            table.insert(self.menu, tile)
        end
    end
end

function RulesState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('return' or 'enter') then
        gStateMachine:change('title')
        gSounds['blip']:play()
    end
end

function RulesState:render()
    for k, tile in pairs(self.menu) do
        tile:render()
    end
end