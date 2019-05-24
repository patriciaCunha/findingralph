-- =============================================================
-- Copyright Roaming Gamer, LLC. 2008-2018 (All Rights Reserved)
-- =============================================================
local common  = require "scripts.common"
local utils   = require "scripts.utils"
-- =============================================================

--
-- Set Persistent Settings' Defaults
--
ssk.persist.setDefault( "settings.json", "sound_enabled", true )
ssk.persist.setDefault( "settings.json", "bestScore", 0 )

--
-- Configure Sound
--
ssk.soundMgr.setDebugLevel( 0 )
ssk.soundMgr.setVolume( 0.25, "effect" )
ssk.soundMgr.addEffect( "click", "sounds/sfx/click.wav")
ssk.soundMgr.addEffect( "jump", "sounds/sfx/jump.wav")
ssk.soundMgr.addEffect( "gameOver", "sounds/sfx/gameOver.wav")
ssk.soundMgr.enableSFX( ssk.persist.get( "settings.json", "sound_enabled" ) )

