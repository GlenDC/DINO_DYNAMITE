require 'lcs.src.engine'

-- Locals

local description = {
    {
        Type = "TEXT",
        Properties = {
            Text = "love-component-system",
            Extent = {312,64}
        }
    }
}

-- Callbacks

local entity

SAMPLES_TEXT = {}

function SAMPLES_TEXT.Load()
    entity = ENTITY(description,{400,300})
end

function SAMPLES_TEXT.Unload()
    entity:Destroy()
end

function SAMPLES_TEXT.Update( delta_time )
    entity.Orientation = entity.Orientation + delta_time
end