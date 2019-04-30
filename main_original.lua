local background = display.newImageRect( "background.png", 360, 570 )
background.x = display.contentCenterX
background.y = display.contentCenterY

display.setStatusBar(display.HiddenStatusBar)
local physics = require "physics"
physics.start()
physics.setDrawMode( "hybrid" )

local cw, ch = display.actualContentWidth, display.actualContentHeight
local ground = display.newRect( display.contentCenterX, ch-64, cw, 64 )
ground:setFillColor( 0.4, 0.4, 0.8 )
ground.objType = "ground"
physics.addBody( ground, "static", { bounce=0.0, friction=0.3 } )



local ground2 = display.newRect( 50, 290, 100, 64 )
ground2:setFillColor( 1, 0.4, 0.8 )
ground2.objType = "ground"
physics.addBody( ground2, "static", { bounce=0.0, friction=0.3 } )



local ground3 = display.newRect( 250, 190, 100, 64 )
ground3:setFillColor( 1, 0.4, 0.8 )
ground3.objType = "ground"
physics.addBody( ground3, "static", { bounce=0.0, friction=0.3 } )


local character = display.newRect( display.contentCenterX, ground.y-150, 80, 120 )
character:setFillColor( 1, 0.2, 0.4 )
 
physics.addBody( character, "dynamic",
    { density=1.0, bounce=0.0 },  -- Main body element
    { box={ halfWidth=30, halfHeight=10, x=0, y=60 }, isSensor=true }  -- Foot sensor element
)
character.isFixedRotation = true
character.sensorOverlaps = 0








local function touchAction( event )
 
    if ( event.phase == "began" and character.sensorOverlaps > 0 ) then
        -- Jump procedure here
        local vx, vy = character:getLinearVelocity()
        character:setLinearVelocity( 0, 0   )
        
        if(event.x <character.x) then

            character:applyLinearImpulse( -10, -150, character.x, character.y )
        else
            character:applyLinearImpulse( 10, -150, character.x, character.y )
        end
    end
end
Runtime:addEventListener( "touch", touchAction )

local function sensorCollide( self, event )
    
    -- Confirm that the colliding elements are the foot sensor and a ground object
    if ( event.selfElement == 2 and event.other.objType == "ground" ) then
 
        -- Foot sensor has entered (overlapped) a ground object
        if ( event.phase == "began" ) then
            self.sensorOverlaps = self.sensorOverlaps + 1
            character:setLinearVelocity( 0, 0   )
        -- Foot sensor has exited a ground object
        elseif ( event.phase == "ended" ) then
            self.sensorOverlaps = self.sensorOverlaps - 1
        end
    end
end
-- Associate collision handler function with character
character.collision = sensorCollide
character:addEventListener( "collision" )


-- local ground = display.newImageRect("ground.png", 360, 125)
-- ground.x = 160
-- ground.y = 490
-- physics.addBody(ground , "static")

-- local platform = display.newImage( "platform1.png", 100, 50 )
-- platform.x = 250
-- platform.y = 250
-- physics.addBody(platform , "static")

-- local platform2 = display.newImage( "platform2.png", 100, 50 )
-- platform2.x = -1
-- platform2.y = 100
-- physics.addBody(platform2 , "static")

-- local player = display.newImageRect("player.png", -100, 70)
-- player.x = 100
-- player.y = 340

-- local function onTouch(event)
--     if(event.phase == "began") then
-- -- player.y = 300
-- physics.addBody(player)
--         if(event.x <player.x) then
--             -- jump left
--             player:setLinearVelocity(-30, -300)
--         else
--             -- jump right
--             player:setLinearVelocity(30, -300)
--         end    
--     end
--     return true
-- end
-- Runtime:addEventListener("touch", onTouch)        