--[[
    For the purposes of this game, a "Tile" is a 16x16 image that can be used to draw
    Menus or game boards.
]]

Tile = Class{}

function Tile:init(tileID, x, y)
    -- Positions of tiles
    self.x = x
    self.y = y

    -- reference for frame
    self.tileID = tileID
end

function Tile:update(dt)
end

function Tile:render(texture)
    love.graphics.draw(gTextures['menuUI-' .. tostring(texture)], 
        gFrames['menuUI-' .. tostring(texture)][self.tileID], 
        self.x, self.y)
end

--[[
    A function that returns a table of tiles that represent a Menu; takes the
    desired Menu texture, number or rows, and number of clumns as arguments.
]]
function Tile:createMenu(rows, columns)
    self.menu = {}
    local tileID = 0

    -- each row
    for y = 0, rows do
        for x = 0, columns do
            -- set ID for 4 'sides' of menu, then everything else in-between
            if y == 0 then
                tileID = 2
            elseif y == rows then
                tileID = 8
            elseif x == 0 then
                tileID = 4
            elseif x == columns then
                tileID = 6
            else
                tileID = 5
            end

            -- set tileID's for corners
            if y == 0 and x == 0 then
                tileID = 1
            elseif y == rows and x == 0 then
                tileID = 7
            elseif y == 0 and x == columns then
                tileID = 3
            elseif y == rows and x == columns then
                tileID = 9
            end

            -- add each tile to the menu table
            local tile = Tile(tileID, (x * 16) + 16, (y * 16) + 16)
            table.insert(self.menu, tile)
        end
    end

    return self.menu
end