CAMERA = entity_class( function( o )
    local description = {
        {
            Type = "CAMERA",
            Properties = {
                Extent = {
                    love.graphics.getWidth(),
                    love.graphics.getHeight()
                    }
            }
        }
    }

    ENTITY.Init( o,description )
end)


function CAMERA:Update( dt )

end