require 'lcs.src.engine'

-- Locals

local sprite_sheet =
    SPRITE_SHEET(
        love.graphics.newImage( "res/smp/tile_set.png" ),
        32,
        32
        )

sprite_sheet:AddQuad( "grass", 0, 20, 1, 1 )
sprite_sheet:AddQuad( "tree", 2, 20, 1, 1 )
sprite_sheet:AddQuad( "building", 0, 10, 4, 5 )


local description = {
    World = {
        {
            Type = "SPRITE_BATCH",
            Properties = {
                SpriteSheet = sprite_sheet,
            }
        }
    },
    Grass = {
        {
            Type = "STATIC_SPRITE",
            Properties = {
                Quad = sprite_sheet:GetQuad("grass")
            }
        }
    },
    Tree = {
        {
            Type = "STATIC_SPRITE",
            Properties = {
                Quad = sprite_sheet:GetQuad("tree")
            }
        }
    },
    Building = {
        {
            Type = "STATIC_SPRITE",
            Properties = {
                Quad = sprite_sheet:GetQuad("building")
            }
        }
    }
}

SAMPLES_SPRITE_SHEET = {}

local world, environment

function SAMPLES_SPRITE_SHEET.Load()
    world = ENTITY( description.World, { 0, 0 } )

    world:Bind()

    environment = {}

    for x = 0, 800, 32 do
        for y = 0, 600, 32 do
            if math.random() < 0.06 then
                environment[ #environment + 1 ] = ENTITY( description.Tree, { x, y } )
            else
                environment[ #environment + 1 ] = ENTITY( description.Grass, { x, y } )
            end
        end
    end

    ENTITY( description.Building, { 512, 256 } )

    world:Unbind()
end

function SAMPLES_SPRITE_SHEET.Unload()
    world:Destroy()

    for i, entity in ipairs( environment ) do
        entity:Destroy()
    end

    environment = nil
end

function SAMPLES_SPRITE_SHEET.Update( delta_time )
end