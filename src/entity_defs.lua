--[[
    File for all of our entity definitons

    For the purpose of this game, all animals (including our Player Birddog)
    are considered 'entities'.
]]

ENTITY_DEFS = {
    -- birddog (player) defs
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

    -- bird defs
    ['robin'] = {
        speed = 60,
        points = 500,
        animations = {
            ['idle'] = {
                frames = {22},
                interval = 0,
                texture = 'robin'
            }
        }
    },
    ['sparrow'] = {
        speed = 60,
        points = 500,
        animations = {
            ['idle'] = {
                frames = {22},
                interval = 0,
                texture = 'sparrow'
            }
        }
    },
    ['cardinal'] = {
        speed = 80,
        points = 1000,
        animations = {
            ['idle'] = {
                frames = {22},
                interval = 0,
                texture = 'cardinal'
            }
        }
    },
    ['bluejay'] = {
        speed = 100,
        points = 1500,
        animations = {
            ['idle'] = {
                frames = {22},
                interval = 0,
                texture = 'bluejay'
            }
        }
    }
}