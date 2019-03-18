-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local background = display.newImageRect( "background.png", 360, 570 )
background.x = display.contentCenterX
background.y = display.contentCenterY

display.setStatusBar(display.HiddenStatusBar)
local physics = require "physics"
physics.start()

local ground = display.newImageRect("ground.png", 360, 125)
ground.x = 160
ground.y = 490
physics.addBody(ground , "static")

local platform = display.newImage( "platform1.png", 100, 50 )
platform.x = 250
platform.y = 250
physics.addBody(platform , "static")

local platform2 = display.newImage( "platform2.png", 100, 50 )
platform2.x = -1
platform2.y = 100
physics.addBody(platform2 , "static")

local player = display.newImageRect("player.png", -100, 70)
player.x = 100
player.y = 340

local function onTouch(event)
    if(event.phase == "began") then
-- player.y = 300
physics.addBody(player)
        if(event.x <player.x) then
            -- jump left
            player:setLinearVelocity(-30, -150)
        else
            -- jump right
            player:setLinearVelocity(30, -150)
        end    
    end
    return true
end
Runtime:addEventListener("touch", onTouch)        