require 'lcs.engine'
require 'dino.debug.console'

DEBUG = nil

function love.load()
    DEBUG = CONSOLE:new()
    DEBUG.Max = 10
end

function love.update(dt)
    ENGINE.Update(dt)
    if love.touch.getTouchCount() > 0 then
        local id, x, y, pressure = love.touch.getTouch( 1 )
        DEBUG:Log( id .. ", " .. x .. ", " .. y .. ", " .. pressure )
    end
end

function love.draw()
    ENGINE.Render()
    DEBUG:PrintLog()
end