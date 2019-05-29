local social = {}
_G.ssk.social = social


function social.rate( params )
	params = params or {}
	local id = params.id or ""
	
	local appName = params.appName or ""
	if( not params.preProcessed ) then
		appName = string.gsub(string.lower(string.clean("appName") ), "% ", "%-" )
	end

	local url
	if( ssk.system.onAmazon ) then		
		url = "amzn://apps/android?p=" .. id

	elseif( ssk.system.onAndroid ) then
		--url = "market://details?id=" .. id
		url = "https://play.google.com/store/apps/details?id=" .. id
	
	elseif( ssk.system.oniOS ) then		
		url = "itms-apps://itunes.apple.com/app/id" .. id .. "?onlyLatestVersion=false"
		
		-- Old Varations(s)
		-- local osVer = tonumber(system.getInfo("platformVersion").sub(1, 1))
		--
		-- if (iOS Ver < 7) ==>
		-- url = "itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=" .. id

	elseif( ssk.system.onAppleTV ) then		
		url = "com.apple.TVAppStore://itunes.apple.com/us/app/" .. name .. "/id" .. id .. "?mt=‌​8"
			
	end
	if( not url ) then return false end


	if( not system.canOpenURL( url ) ) then
		print("Warning! - ssk.social.rate() - Cannot Open URL: ", url ) 
	end

	if( params.debugEn ) then print("ssk2.social.rate() - Opening URL: ", url ) end
	system.openURL( url )	
	return true
end


return social