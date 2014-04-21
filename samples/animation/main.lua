require 'lcs.src.engine'

SAMPLES_ANIMATION = {
    AnimatedKen = nil
}

function SAMPLES_ANIMATION.Initialize()
end

function SAMPLES_ANIMATION.Load()
    ANIMATION.Create("ken",{
        Source = love.graphics.newImage("res/smp/ken.png"),
        CellWidth = 70,
        CellHeight = 80,
        Frames = { 0, 1, 2, 3 },
        FrameRate = 8
        })

    local description = {
        {
            Type= "ANIMATED_SPRITE",
            Properties = {
                Animation = ANIMATION.Get("ken"),
                Extent = { 256, 256 }
            }
        }
    }

    AnimatedKen = ENTITY(description,{400,300})
end

function SAMPLES_ANIMATION.Unload()
    AnimatedKen:Destroy()
    AnimatedKen = nil
end

function SAMPLES_ANIMATION.Update( delta_time )

end