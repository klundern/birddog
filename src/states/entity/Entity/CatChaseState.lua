--[[

]]

CatChaseState = Class{__includes = BaseState}

function CatChaseState:init(entity)
    self.entity = entity
    self.entity:changeAnimation('idle')
end

function CatChaseState:update(dt)
  
end

function CatChaseState:processAI(params, dt)
    
end

function CatChaseState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        self.entity.x, self.entity.y)
end