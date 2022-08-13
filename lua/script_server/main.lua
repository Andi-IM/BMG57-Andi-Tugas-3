print('script_server:hello world')

local platformMoving = require "script_server.Platform3Moving"

local map = World:GetStaticMap("map001")

local timer = Timer.new(160, function()
    platformMoving:Start(map)

end)

timer:Start()