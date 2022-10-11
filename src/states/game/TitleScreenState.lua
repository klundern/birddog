--[[
    TitleScreenState Class
    Author: Nolan Klunder
    klundern@gmail.com

    The TitleScreenState is the starting screen of the game, shown on startup. It should
    menu options including 1) Playing the game, 2) Viewing the rules/how to play, and 
    3) the highest scores achieved and the names of that player.
]]

TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:init()
    -- currently selected menu item
    self.currentMenuItem = 1

    -- transition alpha so we can fade to white
    self.transitionAlpha = 0

    -- selected and non-slected menu item colors
    self.colors = {
        ['selected'] = {92/255, 204/255, 220/255, 1},
        ['non-selected'] = {1, 1, 1, 1}
    }

end

function TitleScreenState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('up') then
        if self.currentMenuItem == 1 then
            self.currentMenuItem = 3
        else
            self.currentMenuItem = self.currentMenuItem - 1
        end

        gSounds['blip']:play()
    end

    if love.keyboard.wasPressed('down') then
        if self.currentMenuItem == 3 then
            self.currentMenuItem = 1
        else
            self.currentMenuItem = self.currentMenuItem + 1
        end

        gSounds['blip']:play()
    end

    if love.keyboard.wasPressed('return' or 'enter') then
        if self.currentMenuItem == 1 then
            -- gradually increase transitionAlpha to create a 'fade to white', 
            -- then change to PlayState
            Timer.tween(0.5, {
                [self] = {transitionAlpha = 1}
            })
            -- after tween is finished, change to PlayState
                :finish(function()
                    gStateMachine:change('play')
                end)
        end

        if self.currentMenuItem == 2 then
            gStateMachine:change('rules')
        end

        if self.currentMenuItem == 3 then
            --gStateMachine:change('highscore')
        end
    end
end

function TitleScreenState:render()
    -- simple UI code
    love.graphics.setFont(gFonts['xlarge'])
    love.graphics.printf('BirdDog', 0, 56, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['medium'])

    -- logic for rendering currently selected menu item
    if self.currentMenuItem == 1 then
        love.graphics.setColor(self.colors['selected'])
    else
        love.graphics.setColor(self.colors['non-selected'])
    end
    love.graphics.printf('Play', 0, 128, VIRTUAL_WIDTH, 'center')

    if self.currentMenuItem == 2 then
        love.graphics.setColor(self.colors['selected'])
    else
        love.graphics.setColor(self.colors['non-selected'])
    end
    love.graphics.printf('Rules', 0, 152, VIRTUAL_WIDTH, 'center')

    if self.currentMenuItem == 3 then
        love.graphics.setColor(self.colors['selected'])
    else
        love.graphics.setColor(self.colors['non-selected'])
    end
    love.graphics.printf('High Scores', 0, 174, VIRTUAL_WIDTH, 'center')

    -- allows us to 'fade to white' when entering PlayState
    love.graphics.setColor(1, 1, 1, self.transitionAlpha)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
end