--[[
    PlayState Class
    Author: Nolan Klunder
    klundern@gmail.com

    The PlayState class is the 'actual' game, where we control our birddog Kenzie and 
    steer her towards birds and away from...less desirable animals.
]]

PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.transitionAlpha = 1

    -- initialize our birddog, which represents the Player
    self.birddog = Player {
        animations = ENTITY_DEFS['birddog'].animations,
        speed = ENTITY_DEFS['birddog'].speed,

        x = 10,
        y = ((VIRTUAL_HEIGHT - 48) / 2) - 13,

        height = 27,
        width = 46,

        direction = 'right'
    }

    self.birddog.stateMachine = StateMachine {
        ['run'] = function() return PlayerRunState(self.birddog) end
    }

    self.birddog:changeState('run')
end

function PlayState:enter()
    Timer.tween(0.5, {
        [self] = {transitionAlpha = 0}
    })
end

function PlayState:update(dt)
    -- always check for escape
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    self.birddog:update(dt)
end

function PlayState:render()
    self.birddog.stateMachine:render()

    love.graphics.setColor(1, 1, 1, self.transitionAlpha)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
end

function PlayState:exit()

end