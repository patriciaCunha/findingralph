
local composer = require( "composer" )

local scene = composer.newScene()
local game
var = true

function scene:endgame()
  
    composer.removeScene("scripts.pre_game")
    composer.gotoScene( "scripts.menu" )
end

function scene:create( event )
    local sceneGroup = self.view    
    
    io.output():setvbuf("no")
    display.setStatusBar(display.HiddenStatusBar)
    _G.fontN 	= "fonts/Roboto-Regular.ttf"
    _G.fontB 	= "fonts/TitanOne-Regular.ttf" 
    require "ssk2.loadSSK"
    _G.ssk.init( { measure = false } )

    require "scripts.init"
    game = require "scripts.game"
    
    
    if var then
         game.create(group, params)
    else
        scene:endgame()
    end

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

function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    -- A primeira chamada ocorre quando a cena está prestes a ser ocultada
    if ( phase == "will" ) then

        
    -- A segunda chamada ocorre imediatamente após a cena estar totalmente fora da tela.
    elseif ( phase == "did" ) then
       -- game:remove()
        --display.remove(game)
    end
end

-- destroy()
function scene:destroy( event )
	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
