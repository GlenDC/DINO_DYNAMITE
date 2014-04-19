require 'dino.level'
require 'dino.camera'

GAME = class( function( o )
    o.Level = LEVEL()
end )

STATE_MACHINE.ImplementInClass( GAME )

function GAME:Load()
end

function GAME:NewGame()
    ENTITY.DestroyAll()

    self.Camera = CAMERA()
    self.Level:Load()
end

function GAME:Update( dt )
    self:UpdateState( dt )
end

function GAME.OnStateEnter:InGame()
    self:NewGame()
end

function GAME.OnStateUpdate:InGame( dt )
    -- self.Camera.Position[1] = self.Camera.Position[1] - 200 * dt

    self.Level:Update( dt )
end