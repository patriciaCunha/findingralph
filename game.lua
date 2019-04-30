
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

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


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
