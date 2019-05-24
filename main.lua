local composer = require( "composer" )
 
tableHighscore = {}

--if ( tableHighscore == nil or #tableHighscore == 0 ) then
  --  tableHighscore = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
--end
point = 0
-- Hide status bar
display.setStatusBar( display.HiddenStatusBar )
 
-- Seed the random number generator
math.randomseed( os.time() )
 
-- Go to the menu screen
composer.gotoScene( "scripts.menu" )
-- composer.gotoScene( "pre_game" )


