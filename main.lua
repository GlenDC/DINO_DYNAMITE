require 'lcs.src.engine'

require 'samples.animation.main'
require 'samples.basic.main'
require 'samples.simple.main'

local SAMPLES = {
    SAMPLES_ANIMATION,
    SAMPLES_BASIC,
    SAMPLES_SIMPLE
}

local CurrentSample = #SAMPLES

function love.load( arguments )
    love.graphics.setBackgroundColor( 0, 0, 0 )

    ENGINE.Initialize( arg, { 640, 480 } )

    SAMPLES[ CurrentSample ].Load()
end

function love.update( delta_time )
    ENGINE.Update( delta_time )
    SAMPLES[ CurrentSample ].Update( delta_time )
end

function love.draw()
    ENGINE.Render()
end

function love.touchreleased( identifier, x, y, pressure )
    if identifier == 1 then
        SAMPLES[ CurrentSample ].Unload()

        CurrentSample = CurrentSample + 1
        if CurrentSample > #SAMPLES then
            CurrentSample = 1
        end

        SAMPLES[ CurrentSample ].Load()
    end
end