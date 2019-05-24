local composer = require( "composer" )

local scene = composer.newScene()

local scoresTable = tableHighscore


local function goToMenu()
  
    composer.removeScene("scripts.highscore")
    composer.gotoScene( "scripts.menu" )
end


function scene:create( event )
    local sceneGroup = self.view


    local background = display.newImageRect( sceneGroup, "images/background.png", 800, 1400 )
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    local highScoresHeader = display.newText( sceneGroup, "High Scores", display.contentCenterX, 30, native.systemFont, 44 )
    local sizeWord = 50
    for i = 1, 10 do
        print(tableHighscore[i] )
        if ( tableHighscore[i] ) then
            local yPos = 50+ ( i * 50 )
            

            local rankNum = display.newText( sceneGroup, i .. "º -------------------- ", display.contentCenterX+150, yPos, native.systemFont, sizeWord )
            rankNum:setFillColor( 0.8 )
            rankNum.anchorX = 1

            local thisScore = display.newText( sceneGroup, tableHighscore[i], display.contentCenterX+150, yPos, native.systemFont, sizeWord )
            thisScore.anchorX = 0
        end
    end


    local playButton = display.newImageRect( sceneGroup, "images/play.png", tamanhoPlay, tamanhoPlay/2 )
	playButton.x = display.contentCenterX
    playButton.y = display.contentCenterY+200


    playButton:addEventListener( "tap", goToMenu )
    

end

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

function scene:destroy( event )
	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
