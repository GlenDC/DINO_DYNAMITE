require 'lcs.engine'
require 'dino.debug.console'

DEBUG = nil

function love.load()
    DEBUG = CONSOLE:new()
    DEBUG.Max = 10
end

function love.update(dt)
    ENGINE.Update(dt)
    DEBUG:Log( "Hello Debug Logger!" )
end

function love.draw()
    ENGINE.Render()
    DEBUG:PrintLog()
end