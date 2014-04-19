require 'lcs.src.engine'

require 'dino.debug.console'
require 'dino.game'

DEBUG = nil

local game = GAME()

function love.load( arg )
    love.graphics.setBackgroundColor( 0, 0, 0 )

    DEBUG = CONSOLE:new()
    DEBUG.Max = 10

    ENGINE.Initialize( arg, { 128, 192 } )

    game:Load()
    game:ChangeState("InGame")
end

function love.update( dt )
    game:Update( dt )

    ENGINE.Update( dt )
    
    if love.touch.getTouchCount() > 0 then
        local id, x, y, pressure = love.touch.getTouch( 1 )
        DEBUG:Log( id .. ", " .. x .. ", " .. y .. ", " .. pressure )
    end
end

function love.draw()
    ENGINE.Render()
    DEBUG:PrintLog()
end