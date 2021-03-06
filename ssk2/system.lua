

_G.ssk = _G.ssk or {}
local ssk_system = {}
_G.ssk.system = ssk_system

-- platformName is deprecated; 
-- However, I need to use it till there is a way to tell current OS simulator is running under
local platformName            = system.getInfo("platformName") 

-- This returns the simulator skin target, or current DEVICE os:
local platform                = system.getInfo("platform")
local platformEnvironment     = system.getInfo("environment")
local targetAppStore          = system.getInfo("targetAppStore")
local architectureInfo        = system.getInfo("architectureInfo")
local model                   = system.getInfo("model")

-- =============================================================
-- Actual Running Environment
-- =============================================================
ssk_system.onSimulator        = platformEnvironment == "simulator"
ssk_system.onDevice           = platformEnvironment == "device"
ssk_system.oniOS              = platformName == "iPhone OS"
ssk_system.onAndroid          = platformName == "Android"
ssk_system.onOSX              = platformName == "Mac OS X"
ssk_system.onAppleTV          = platformName == "tvOS"
local la = _G.ssk.launchArgs or {}
ssk_system.onAndroidTV        = ( la and la.android and 
                                la.android.intent and la.android.intent.category and
                                la.android.intent.category.LEANBACK_LAUNCHER )

ssk_system.onWin              = platformName == "Win"
ssk_system.onNook             = targetAppStore == "nook"
ssk_system.onAmazon           = (targetAppStore == "amazon") or (string.find( system.getInfo("model"), "Fire" ) ~= nil)
ssk_system.onDesktop          = ssk_system.onOSX or ssk_system.onWin

-- =============================================================
-- Targeted Environment
-- =============================================================
ssk_system.targetiOS             = platform == "ios"
ssk_system.targetAndroid         = platform == "android"
ssk_system.targetOSX             = platform == "macos"
ssk_system.targetAppleTV         = platform == "tvos"
ssk_system.targetWin             = platform == "win32"
ssk_system.targetDesktop         = ssk_system.targetOSX or ssk_system.targetWin
ssk_system.targetDevice          = not ssk_system.targetDesktop

-- =============================================================
-- Device 
-- https://www.theiphonewiki.com/wiki/Main_Page
-- http://www.everymac.com/ultimate-mac-lookup/
-- https://www.theiphonewiki.com/wiki/Models#iPhone
-- =============================================================
if( ssk_system.onDevice ) then
   ssk_system.oniPhone4       = ( string.find( architectureInfo, "iPhone4" ) ~= nil )
   ssk_system.oniPhone5       = ( string.find( architectureInfo, "iPhone5,1" ) ~= nil ) or
                              ( string.find( architectureInfo, "iPhone5,2" ) ~= nil )
   ssk_system.oniPhone5c      = ( string.find( architectureInfo, "iPhone5,3" ) ~= nil ) or
                              ( string.find( architectureInfo, "iPhone5,4" ) ~= nil )
   ssk_system.oniPhone5s      = ( string.find( architectureInfo, "iPhone6" ) ~= nil )
   ssk_system.oniPhone6       = ( string.find( architectureInfo, "iPhone7,2" ) ~= nil )
   ssk_system.oniPhone6Plus   = ( string.find( architectureInfo, "iPhone7,1" ) ~= nil )
   ssk_system.oniPhone6s      = ( string.find( architectureInfo, "iPhone8,1" ) ~= nil )
   ssk_system.oniPhone6sPlus  = ( string.find( architectureInfo, "iPhone8,2" ) ~= nil )
   ssk_system.oniPhone7       = ( string.find( architectureInfo, "iPhone9,1" ) ~= nil ) or
                              ( string.find( architectureInfo, "iPhone9,3" ) ~= nil )
   ssk_system.oniPhone7Plus   = ( string.find( architectureInfo, "iPhone9,2" ) ~= nil ) or
                              ( string.find( architectureInfo, "iPhone9,4" ) ~= nil )
   ssk_system.oniPhone8        = ( string.find( architectureInfo, "iPhone10,1" ) ~= nil ) or
                              ( string.find( architectureInfo, "iPhone10,4" ) ~= nil )
   ssk_system.oniPhone8Plus   = ( string.find( architectureInfo, "iPhone10,2" ) ~= nil ) or
                              ( string.find( architectureInfo, "iPhone10,5" ) ~= nil )
   ssk_system.oniPhoneX       = ( string.find( architectureInfo, "iPhone10,3" ) ~= nil ) or
                              ( string.find( architectureInfo, "iPhone10,6" ) ~= nil )
   ssk_system.oniPhone        = ssk_system.oniPhone4 or ssk_system.oniPhone5 or
                              ssk_system.oniPhone5c or ssk_system.oniPhone5s or
                              ssk_system.oniPhone6 or ssk_system.oniPhone6Plus or
                              ssk_system.oniPhone6s or ssk_system.oniPhone6sPlus or
                              ssk_system.oniPhone7 or ssk_system.oniPhone7Plus or
                              ssk_system.oniPhone8 or ssk_system.oniPhone8Plus or
                              ssk_system.oniPhoneX
   ssk_system.oniPad          = ( string.find( architectureInfo, "iPad" ) ~= nil )
   ssk_system.oniPadPro       = ( string.find( architectureInfo, "iPad6,7" ) ~= nil ) or
                              ( string.find( architectureInfo, "iPad6,8" ) ~= nil )
   ssk_system.onAndroidTablet = ( (system.getInfo( "androidDisplayWidthInInches" ) or 0) > 5 or
                              (system.getInfo( "androidDisplayHeightInInches" ) or 0) > 5 ) 
   ssk_system.onTablet        = ssk_system.onAndroidTablet or ssk_system.oniPad 
else
   local width = math.floor((display.actualContentWidth/display.contentScaleX)+0.5)
   local height = math.floor((display.actualContentHeight/display.contentScaleY)+0.5)
   local wh = string.format("%d_%d", width, height )
   ssk_system.oniPhone4       = wh == "640_960"
   ssk_system.oniPhone5       = wh == "640_1136"
   ssk_system.oniPhone5c      = false -- SAME ASPECT RATIO AS oniPhone5
   ssk_system.oniPhone5s      = false -- SAME ASPECT RATIO AS oniPhone5
   ssk_system.oniPhone6       = wh == "740_1334"
   ssk_system.oniPhone6Plus   = wh == "1080_1920"
   ssk_system.oniPhone6s      = false -- SAME ASPECT RATIO AS oniPhone6P
   ssk_system.oniPhone6sPlus  = false -- SAME ASPECT RATIO AS oniPhone6Plus
   ssk_system.oniPhone7       = false -- SAME ASPECT RATIO AS oniPhone6P
   ssk_system.oniPhone7Plus   = false -- SAME ASPECT RATIO AS oniPhone6Plus
   ssk_system.oniPhone8       = false -- SAME ASPECT RATIO AS oniPhone6
   ssk_system.oniPhone8Plus   = false -- SAME ASPECT RATIO AS oniPhone6Plus
   ssk_system.oniPhoneX       = wh == "1125_2436"
   ssk_system.oniPhone        = ssk_system.oniPhone4 or ssk_system.oniPhone5 or
                              ssk_system.oniPhone5c or ssk_system.oniPhone5s or
                              ssk_system.oniPhone6 or ssk_system.oniPhone6Plus or
                              ssk_system.oniPhone6s or ssk_system.oniPhone6sPlus or
                              ssk_system.oniPhone7 or ssk_system.oniPhone7Plus or
                              ssk_system.oniPhone8 or ssk_system.oniPhone8Plus or
                              ssk_system.oniPhoneX
   ssk_system.oniPadMini      = wh == "768_1024"
   ssk_system.oniPad          = wh == "1536_2048"
   ssk_system.oniPadPro       = wh == "1125_2436"
   ssk_system.onAndroidTablet = false -- EFM detect this... but how?
   ssk_system.onTablet        = ssk_system.oniPadMini or ssk_system.oniPad or ssk_system.oniPadPro or ssk_system.onAndroidTablet
end


-- Export all system fields/functions as globals
function ssk_system.export()
  for k,v in pairs( ssk_system ) do
    if( k ~= "export" ) then
      _G[k] = v 
    end
  end
end


return ssk_system
