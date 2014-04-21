require 'lcs.src.engine'

SAMPLES_BOUNDING = {}

-- Locals

local descriptions = {
    World = {
        {
            Type = "BOUNDING_WORLD",
            Properties = {
            }
        }
    },
    Block = {
        {
            Type = "QUAD",
            Properties = {
                Extent = {64,64}
            }
        },
        {
            Type = "BOUNDING",
            Properties = {
                Extent = {64,64}
            }
        }
    },
}

-- Callbacks

local world, block, userblock

function SAMPLES_BOUNDING.Load()
    world = ENTITY(descriptions.World)
    block = ENTITY(descriptions.Block,{400,300})

    userblock = ENTITY(descriptions.Block,{400,300})
end

function SAMPLES_BOUNDING.Unload()
    world:Destroy()
    block:Destroy()
    userblock:Destroy()
end

local x1,y1,x2,y2 = 20,250,300,40

function SAMPLES_BOUNDING.Update( delta_time )
    -- :NOTE: getMousePosition works to :)
    if love.touch.getTouchCount() > 0 then
        local id, x, y, pressure = love.touch.getTouch( 1 )
        userblock.Position = {
            x * love.graphics.getWidth(),
            y * love.graphics.getHeight()
            }
    end

    if userblock:CollidesWithWorld() or userblock:Intersects(x1,y1,x2,y2) then
        userblock:SetQuadColor({255,0,0,255})
    else
        userblock:SetQuadColor({255,255,255,255})
    end
end

function SAMPLES_BOUNDING.Draw()
    love.graphics.setColor(255,255,255,255)
    love.graphics.line(x1,y1,x2,y2)
end