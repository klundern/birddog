--[[

]]

PlayerRunState = Class{__includes = BaseState}

function PlayerRunState:init(entity)
    -- render offset for spaced character sprite; negated in render function of state
    self.entity = entity

    self.entity:changeAnimation('birddog-running')

    self.entity.offsetY = 0
    self.entity.offsetX = 0
end

function PlayerRunState:update(dt)
    if love.keyboard.isDown('up') and self.entity.y > 26 then
        self.entity.y = self.entity.y - BIRDDOG_RUN_SPEED * dt
    elseif love.keyboard.isDown('down') and self.entity.y < (VIRTUAL_HEIGHT - 30) then
        self.entity.y = self.entity.y + BIRDDOG_RUN_SPEED * dt
    end
end

function PlayerRunState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offsetX + 48), math.floor(self.entity.y - self.entity.offsetY), 0, -1, 1)
end