require 'lcs.src.engine'

require 'samples.animation.main'
require 'samples.basic.main'
require 'samples.simple.main'
require 'samples.bounding.main'
require 'samples.text.main'
require 'samples.sprite_sheet.main'

local SAMPLES = {
    SAMPLES_ANIMATION,
    SAMPLES_BASIC,
    --SAMPLES_SIMPLE, -- :TODO: Fix crashing issue and enable again
    SAMPLES_BOUNDING,
    SAMPLES_TEXT,
    SAMPLES_SPRITE_SHEET
}

local CurrentSample = #SAMPLES

function love.load( arguments )
    love.graphics.setBackgroundColor( 0, 0, 0 )

    ENGINE.Initialize( arg, { 800, 600 } )

    for i, sample in ipairs( SAMPLES ) do
        if sample.Initialize then
            sample.Initialize()
        end
    end

    SAMPLES[ CurrentSample ].Load()
end

function love.update( delta_time )
    ENGINE.Update( delta_time )
    SAMPLES[ CurrentSample ].Update( delta_time )
end

function love.draw()
    ENGINE.Render()
    if SAMPLES[ CurrentSample ].Draw then
        SAMPLES[ CurrentSample ].Draw()
    end
end

function love.touchreleased( identifier, x, y, pressure )
    if identifier == 1 then
        -- :TODO: Make unloading simpler and clean
        --        So that we don't need to rework
        --        all of the code of samples

        -- :TODO: Clean up properly!
        SAMPLES[ CurrentSample ].Unload()

        CurrentSample = CurrentSample + 1
        if CurrentSample > #SAMPLES then
            CurrentSample = 1
        end

        SAMPLES[ CurrentSample ].Load()
    end
end