--[[
    File for all of our entity definitons

    For the purpose of this game, all animals (including our Player Birddog)
    are considered 'entities'.
]]

ENTITY_DEFS = {
    ['birddog'] = {
        speed = BIRDDOG_RUN_SPEED,
        animations = {
            ['birddog-running'] = {
                frames = {1, 2, 3},
                interval = 0.15,
                texture = 'birddog-running'
            }
        }
    },
    ['bird'] = {
        speed = 60,
        animations = {
            ['sitting'] = {
                frames = {},
                interval = 0,
                texture = ''
            }
        }
    }
}