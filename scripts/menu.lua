
local composer = require( "composer" )

local scene = composer.newScene()


local function gotoGame()
    composer.gotoScene( "pre_game" )
end
 
local function gotoHighScores()
    composer.gotoScene( "scripts.highscores" )
end


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )
	print(122)
	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
	local background = display.newImageRect( sceneGroup, "images/background.png", 800, 1400 )
    background.x = display.contentCenterX
    background.y = display.contentCenterY
	

    local title = display.newImageRect( sceneGroup, "images/title.png", 600, 120 )
    title.x = display.contentCenterX
    title.y = 250
	
	local posicaoX = 260

	tamanhoPlay = 220
	local playButton = display.newImageRect( sceneGroup, "images/play.png", tamanhoPlay, tamanhoPlay/2 )
	playButton.x = display.contentCenterX
    playButton.y = display.contentCenterY-30
    
    tamanhoHS = 400
    local highScoresButton = display.newImageRect( sceneGroup, "images/highscores.png", tamanhoHS, tamanhoHS/3 )
    highScoresButton.x = display.contentCenterX
    highScoresButton.y = display.contentCenterY+100
 
    playButton:addEventListener( "tap", gotoGame )
    highScoresButton:addEventListener( "tap", gotoHighScores )

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
		
        composer.removeScene( "scripts.menu" )
		
		-- Code here runs immediately after the scene goes entirely off screen

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	print('alex')
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
