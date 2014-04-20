CONSOLE = {
    Logs = {},
    Max = 10,
    Active = true,
    Forground =  { 255,255,255,255 },
    Background = { 0,0,0,128 }
    }

local SCALE = 0.5

function CONSOLE:new( instance )
    instance = instance or {}
    setmetatable( instance, self )
    self.__index = self
    return instance
end

function CONSOLE:GetUnit( x )
    return x * ENGINE.ScreenScaleRatio
end

function CONSOLE:GetYScale( index )
    return self:GetUnit(
        10  + ( self:GetUnit( 15 ) * ( index - 1 ) * SCALE )
        )
end

function CONSOLE:GetYPosition( index )
    return
        love.graphics.getHeight() -
        self:GetYScale( self.Max + 2 ) +
        self:GetYScale( index )
end

function CONSOLE:PrintLog()
    local length = #self.Logs

    if self.Active then
        love.graphics.setColor( self.Background )

        love.graphics.rectangle(
            "fill",
            ENGINE.ViewportOffset[ 1 ],
            ENGINE.ViewportOffset[ 2 ] +
                self:GetYPosition( 1 ) -
                self:GetUnit( 10 ),
            love.graphics.getWidth(),
            self:GetYScale( self.Max + 2 ) + self:GetUnit( 20 )
            )

        love.graphics.setColor( self.Forground )

        for i = 1, length do
            love.graphics.print(
                self.Logs[ i ],
                ENGINE.ViewportOffset[ 1 ] + self:GetUnit( 10 ),
                ENGINE.ViewportOffset[ 2 ] + self:GetYPosition( i ),
                0,
                self:GetUnit( SCALE )
                )
        end
    end
end

function CONSOLE:Log( log )
    local length = #self.Logs
    
    if length > self.Max then
        for i = 1, length - 1 do
            self.Logs[ i ] = self.Logs[ i + 1 ]
        end

        self.Logs[ length ] = log
    else
        self.Logs[ length + 1 ] = log
    end
    
end