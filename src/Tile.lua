--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}

function Tile:init(tileID, x, y)
    
    -- board positions
    self.x = x
    self.y = y

    -- tile appearance/points
    self.tileID = tileID
end

function Tile:update(dt)
end

function Tile:render(x, y)
    love.graphics.draw(gTextures['menuUI'], gFrames['menuUI'][self.tileID], self.x, self.y)
end