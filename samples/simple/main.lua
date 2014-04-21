require 'lcs.src.engine'

SAMPLES_SIMPLE = {}

local texture = love.graphics.newImage("res/smp/texture.png")
local descriptions ={
    World = {
        {
            Type = "PHYSIC_WORLD",
            Properties = {}
        }
    },
    Object = {
    {
        Type = "SPRITE",
        Properties = {
            Texture = texture,
            Extent = {64,64},
            Layer = 3
        }
        },
    {
        Type = "PHYSIC",
        Properties = {
            Shape = "circle",
            Radius = 32
        }
    },
    {
        Type = "PARTICLE",
        Properties = {
            Layer = 2
        }
    }
    },
    Ground = {
        {
            Type = "QUAD",
            Properties = {
                Extent = {600,60},
                Layer = 1
            }
        },
        {
            Type = "PHYSIC",
            Properties = {
                Shape = "rectangle",
                Extent = {600,60},
                Type = "static"
            }
        }
    },
    Camera = {
        {
            Type = "CAMERA",
            Properties = {}
        }
    }
}

-- Entity classes

HEART = entity_class(function(o,d,p)
    ENTITY.Init(o,d,p)
end)

function HEART:OnCollisionBegin()
    self:ApplyLinearImpulse(0, -3000)
end

GROUND = entity_class(function(o,d,p)
    ENTITY.Init(o,d,p)
end)

-- Callbacks

local heart1, heart2, ps, ps2
local world, ground, camera

function SAMPLES_SIMPLE.Initialize()
    ps = love.graphics.newParticleSystem(texture, 30)
    ps:setEmissionRate(30)
    ps:setParticleLifetime(2)
    ps:setSizes(1,5)
    ps:setColors(255,255,255,255,0,0,0,0)

    ps2 = love.graphics.newParticleSystem(texture, 30)
    ps2:setEmissionRate(30)
    ps2:setParticleLifetime(2)
    ps2:setSizes(1,5)
    ps2:setColors(255,255,255,255,0,0,0,0)
end

function SAMPLES_SIMPLE.Load( arguments )
    world = ENTITY(descriptions.World)
    ground = GROUND(descriptions.Ground, {0,300})
    camera = ENTITY(descriptions.Camera,{-400,-300})

    heart1 = HEART(descriptions.Object,{-200,-200})
    heart2 = HEART(descriptions.Object,{200,-200})

    heart1:AddParticleSystem(ps, false)
    heart2:AddParticleSystem(ps2, false)
end

function SAMPLES_SIMPLE.Unload()
    world:Destroy()
    ground:Destroy()
    camera:Destroy()

    heart1:Destroy()
    heart2:Destroy()
end

function SAMPLES_SIMPLE.Update( delta_time )
    -- :TODO: implement custom touch in engine with
    --        viewport and use that in this example.
    if love.touch.getTouchCount() > 0 then
        local id, x, y, pressure = love.touch.getTouch( 1 )
        if y > 0.5 then
            if x < 0.5 then
                heart1:ApplyLinearImpulse( -100 * delta_time, 0 )
            else
                heart1:ApplyLinearImpulse( 100 * delta_time, 0 )
            end
        else
            heart1:SetOrientation( heart1.Orientation + 10 * delta_time )
        end
    end
end