--[[

]]

BirdFlyState = Class{__includes = BaseState}

function BirdFlyState:init(entity)
    self.entity = entity
    self.entity:changeAnimation('idle')
end

function BirdFlyState:update(dt)

end

function BirdFlyState:processAI(params, dt)

end

function BirdFlyState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        self.entity.x, self.entity.y)
end