--[[
    PlayState Class
    Author: Nolan Klunder
    klundern@gmail.com

    The PlayState class is the 'actual' game, where we control our birddog Kenzie and 
    steer her towards birds and away from...less desirable animals.
]]

PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.animals = {}
    self.transitionAlpha = 1
    self.timer = 0
    self.score = 0

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
    -- tween for fade-in that happens when we enter the PlayState
    Timer.tween(0.5, {
        [self] = {transitionAlpha = 0}
    })
end

function PlayState:update(dt)
    -- always check for escape
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    -- DEBUG: quick transition to GameOverState
    if love.keyboard.wasPressed('g') then
        gStateMachine:change('gameover')
    end
    
    -- update our table of animals; see function below
    self:updateAnimals(dt)

    -- update our player BirdDog
    self.birddog:update(dt)
end

function PlayState:render()
    -- render player BirdDog in current state
    self.birddog.stateMachine:render()

    -- render animal in current state
    for k, animal in pairs(self.animals) do
        animal:render()
    end

    -- print our current score to the screen
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print(self.score, 10, 10)

    -- used for white fade-in when we first enter the PlayState
    love.graphics.setColor(1, 1, 1, self.transitionAlpha)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
end

--[[
    This function is reponsible for spawning animals, updating their position
    based on state (idle vs. flying/chasing), and checking for collisions with
    our player BirdDog.
]]
function PlayState:updateAnimals(dt)
    self.timer = self.timer + dt

    if self.timer > 1 then
        -- get a random number
        self.random = love.math.random(1, 20)

        -- chance of spawning sparrow (1/5)
        if self.random == (6 or 7 or 8 or 9) then
            local bird = Entity {
                animations = ENTITY_DEFS['sparrow'].animations,
                speed = ENTITY_DEFS['sparrow'].speed,
                points = ENTITY_DEFS['sparrow'].points,
                type = 'bird',

                x = VIRTUAL_WIDTH,
                y = math.random(48, VIRTUAL_HEIGHT - 64),

                height = 32,
                width = 32,

                direction = 'right'
            }

            bird.stateMachine = StateMachine {
                ['idle'] = function() return EntityIdleState(bird) end,
                ['fly'] = function() return BirdFlyState(bird) end
            }

            bird:changeState('idle')

            table.insert(self.animals, bird)

        -- chance of spawning robin (1/5)
        elseif self.random == (10 or 11 or 12 or 13) then
            local bird = Entity {
                animations = ENTITY_DEFS['robin'].animations,
                speed = ENTITY_DEFS['robin'].speed,
                points = ENTITY_DEFS['robin'].points,
                type = 'bird',

                x = VIRTUAL_WIDTH,
                y = math.random(48, VIRTUAL_HEIGHT - 64),

                height = 32,
                width = 32,

                direction = 'right'
            }

            bird.stateMachine = StateMachine {
                ['idle'] = function() return EntityIdleState(bird) end,
                ['fly'] = function() return BirdFlyState(bird) end
            }

            bird:changeState('idle')

            table.insert(self.animals, bird)

        -- chance of spawning cardinal (3/20)
        elseif self.random == (14 or 15 or 16) then
            local bird = Entity {
                animations = ENTITY_DEFS['cardinal'].animations,
                speed = ENTITY_DEFS['cardinal'].speed,
                points = ENTITY_DEFS['cardinal'].points,
                type = 'bird',

                x = VIRTUAL_WIDTH,
                y = math.random(48, VIRTUAL_HEIGHT - 64),

                height = 32,
                width = 32,

                direction = 'right'
            }

            bird.stateMachine = StateMachine {
                ['idle'] = function() return EntityIdleState(bird) end,
                ['fly'] = function() return BirdFlyState(bird) end
            }

            bird:changeState('idle')

            table.insert(self.animals, bird)

        -- chance of spawning bluejay (1/10)
        elseif self.random == (17 or 18) then
            local bird = Entity {
                animations = ENTITY_DEFS['bluejay'].animations,
                speed = ENTITY_DEFS['bluejay'].speed,
                points = ENTITY_DEFS['bluejay'].points,
                type = 'bird',

                x = VIRTUAL_WIDTH,
                y = math.random(48, VIRTUAL_HEIGHT - 64),

                height = 32,
                width = 32,

                direction = 'right'
            }

            bird.stateMachine = StateMachine {
                ['idle'] = function() return EntityIdleState(bird) end,
                ['fly'] = function() return BirdFlyState(bird) end
            }

            bird:changeState('idle')

            table.insert(self.animals, bird)

        -- chance of spawning cat (1/20)
        elseif self.random == 20 then
            local random_cat = math.random(1, 4)

            local cat_table = {
                [1] = 'white-cat',
                [2] = 'tan-cat',
                [3] = 'brown-cat',
                [4] = 'black-cat'
            }

            local cat = Entity {
                animations = ENTITY_DEFS[cat_table[random_cat]].animations,
                speed = ENTITY_DEFS['cat'].speed,
                points = ENTITY_DEFS['cat'].points,
                type = 'cat',

                x = VIRTUAL_WIDTH,
                y = math.random(48, VIRTUAL_HEIGHT - 64),

                height = 32,
                width = 32,

                direction = 'right'
            }

            -- initialize our animals StateMachine
            cat.stateMachine = StateMachine {
                ['idle'] = function() return EntityIdleState(cat) end,
                ['chase'] = function() return CatChaseState(cat) end
            }

            cat:changeState('idle')

            table.insert(self.animals, cat)
        end

        -- reset our timer
        self.timer = 0
    end

    -- updates coordiantes based upon current state, check for collisions
    for k, animal in pairs(self.animals) do
        animal.stateMachine:update(dt)

        if animal.x < (0 - animal.width) then
            table.remove(self.animals, k)
        end

        if self.birddog:collides(animal) then
            self.score = self.score + animal.points

            if animal.type == 'bird' then
                -- play a nice crunch sound, chosen at random to add some variety
                gSounds['crunch-' .. math.random(1, 7)]:play()
            elseif animal.type == 'cat' then
                gStateMachine:change('gameover')
            end

            table.remove(self.animals, k)
        end
    end
end

function PlayState:exit()

end