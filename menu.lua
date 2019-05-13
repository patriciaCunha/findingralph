
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local function gotoGame()
    composer.gotoScene( "game" )
end
 
local function gotoHighScores()
    composer.gotoScene( "highscores" )
end


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
	local background = display.newImageRect( sceneGroup, "background.png", 800, 1400 )
    background.x = display.contentCenterX
    background.y = display.contentCenterY
 
    local title = display.newImageRect( sceneGroup, "title.png", 300, 80 )
    title.x = display.contentCenterX
    title.y = 70
	
	local posicaoX = 260

	tamanhoPlay = 120
	local playButton = display.newImageRect( sceneGroup, "play.png", tamanhoPlay, tamanhoPlay/2 )
	playButton.x = display.contentCenterX
    playButton.y = display.contentCenterY+1
    
    tamanhoHS = 180
    local highScoresButton = display.newImageRect( sceneGroup, "highscores.png", tamanhoHS, tamanhoHS/3 )
    highScoresButton.x = display.contentCenterX
    highScoresButton.y = display.contentCenterY+90
 
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
