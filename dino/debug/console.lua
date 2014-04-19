CONSOLE = {
    Logs = {},
    Max = 10,
    Active = true,
    Scale = 2.0,
    Forground =  { 255,255,255,255 },
    Background = { 0,0,0,128 }
    }

function CONSOLE:new( instance )
    instance = instance or {}
    setmetatable( instance, self )
    self.__index = self
    return instance
end

function CONSOLE:GetYValue( index )
    return 10 + ( 15 * ( index - 1 ) * self.Scale )
end

function CONSOLE:PrintLog()
    local length = #self.Logs

    if self.Active then
        love.graphics.setColor( self.Background )

        love.graphics.rectangle(
            "fill",
            0,
            0,
            love.graphics.getWidth(),
            self:GetYValue( self.Max + 2 )
            )

        love.graphics.setColor( self.Forground )

        for i = 1, length do
            love.graphics.print(
                self.Logs[ i ],
                10,
                self:GetYValue( i ),
                0,
                self.Scale
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