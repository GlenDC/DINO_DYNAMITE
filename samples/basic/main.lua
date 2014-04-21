require 'lcs.src.engine'

SAMPLES_BASIC = {
    Descriptions = {
        {
            Type = "SPRITE",
            Properties = {
                Texture = love.graphics.newImage("res/smp/texture.png"),
                Extent = {64,64},
                Layer = 11
            }
        },
        {
            Type = "SPRITE",
            Properties = {
                Texture = love.graphics.newImage("res/smp/texture.png"),
                Extent = {256,256},
                Layer = 3
            }
        }
    },
    Entity = nil
}

function SAMPLES_BASIC.Initialize()
end

function SAMPLES_BASIC.Load()
    SAMPLES_BASIC.Entity = ENTITY( SAMPLES_BASIC.Descriptions, { 400, 300 } )
end

function SAMPLES_BASIC.Unload()
    SAMPLES_BASIC.Entity:Destroy()
    SAMPLES_BASIC.Entity = nil
end

function SAMPLES_BASIC.Update( delta_time )
    SAMPLES_BASIC.Entity.Orientation =
        SAMPLES_BASIC.Entity.Orientation + delta_time
end