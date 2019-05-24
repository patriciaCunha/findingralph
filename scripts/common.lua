-- =============================================================
-- Copyright Roaming Gamer, LLC. 2008-2018 (All Rights Reserved)
-- =============================================================
local common = {}

-- =============================================================
-- Select an art theme for the game.
-- =============================================================
common.theme = "ansimuz" -- ansimuz kenney casual flat medieval prototype 

common.textFill1 = _W_
common.textFill2 = _W_
if( common.theme == "kenney" ) then
	common.textFill1 = hexcolor("#f0721e")
	common.textFill2 = hexcolor("#73ad19")

elseif(common.theme == "ansimuz" ) then
	common.textFill1 = hexcolor("#f0721e")
	common.textFill2 = hexcolor("#4a847c")	
end

-- On an iPhoneX or another device with a notch at the top? Adjust for that.
local topInset, leftInset, bottomInset, rightInset = display.getSafeAreaInsets()
common.titleOffsetY 	= topInset or 0
common.cornerOffsetX = _G.oniPhoneX and 20 or 0
common.cornerOffsetY = _G.oniPhoneX and 20 or 0


return common
