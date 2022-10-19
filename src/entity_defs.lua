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
        points = 5,
        animations = {
            ['idle-right'] = {
                frames = {22},
                interval = 0,
                texture = 'robin'
            }
        }
    },
    ['sparrow'] = {
        speed = 60,
        points = 5,
        animations = {
            ['idle-right'] = {
                frames = {22},
                interval = 0,
                texture = 'sparrow'
            }
        }
    },
    ['cardinal'] = {
        speed = 80,
        points = 10,
        animations = {
            ['idle-right'] = {
                frames = {22},
                interval = 0,
                texture = 'cardinal'
            }
        }
    },
    ['bluejay'] = {
        speed = 100,
        points = 15,
        animations = {
            ['idle-right'] = {
                frames = {22},
                interval = 0,
                texture = 'bluejay'
            }
        }
    },

    -- cat definition; each cat has the same point values, just different skins

    -- general cat point and speed defs
    ['cat'] = {
        speed = 90,
        points = 0,
    },

    -- texture and animation defintions
    ['white-cat'] = {
        animations = {
            ['idle-right'] = {
                frames = {4},
                interval = 0,
                texture = 'cat'
            }
        }
    },
    ['tan-cat'] = {
        animations = {
            ['idle-right'] = {
                frames = {8},
                interval = 0,
                texture = 'cat'
            }
        }
    },
    ['brown-cat'] = {
        animations = {
            ['idle-right'] = {
                frames = {12},
                interval = 0,
                texture = 'cat'
            }
        }
    },
    ['black-cat'] = {
        animations = {
            ['idle-right'] = {
                frames = {16},
                interval = 0,
                texture = 'cat'
            }
        }
    }
}