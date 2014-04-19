require 'dino.level'
require 'dino.camera'

GAME = class( function( o )
    o.Level = LEVEL()
end )

STATE_MACHINE.ImplementInClass( GAME )

function GAME:Load()
    TEXTURE.Load( "clouds", "res/img/clouds.png" )
end

function GAME:CreateResources()
    local descriptions = {
        Clouds = {
            {
                Type = "SPRITE",
                Properties = {
                    Texture = TEXTURE.Get( "clouds" ),
                    World = 1
                }
            }
        }
    }

    self.Clouds = ENTITY(
        descriptions.Clouds,
        { 0, 0 }
        )
end

function GAME:NewGame()
    ENTITY.DestroyAll()

    self.Camera = CAMERA()
    self.Level:Load()

    self:CreateResources()
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