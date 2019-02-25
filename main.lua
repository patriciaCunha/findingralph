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

local player = display.newImage("player.png", 360, 125)
player.x = 175
player.y = 300
physics.addBody(player)

local function onTouch(event)
    if(event.phase == "began") then
        if(event.x <player.x) then
            -- jump left
            player:setLinearVelocity(-30, -200)
        else
            -- jump right
            player:setLinearVelocity(30, -200)
        end    
    end
end
Runtime:addEventListener("touch", onTouch)        