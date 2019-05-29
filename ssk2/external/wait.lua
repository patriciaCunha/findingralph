
local getTimer = system.getTimer
local yield = coroutine.yield

-- Exports --
local wait = {}
if( not _G.ssk ) then
	_G.ssk = {}
end
_G.ssk.wait = wait


-- All of these have optional updates.

-- Wait some number of milliseconds.
wait.ms = function( time, update )
	local now = getTimer()
	local ends_at = now + time
	while now < ends_at do
		if update then
			update()
		end
		yield()		
		now = getTimer()
	end
end

-- Wait for some property to be true.
wait.untilPropertyTrue = function( object, name, update )
	while not object[name] do
		if update then
			update()
		end
		yield()
	end
end

-- Wait for some predicate to be true.
wait.untilTrue = function( func , update )
	while not func() do
		if update then
			update()
		end
		yield()
	end
end

wait.run = function( func )
	local timerID
	local wrapped = coroutine.wrap( 
		function( event ) 
			timerID = event.source
			func()
			timer.cancel(timerID)
		end )
	timer.performWithDelay( 1, wrapped, 0 )
end

-- Export the module.
return wait




--[[
-- Wait in a timer:
timer.performWithDelay(20, 
	coroutine.wrap(
		function(event)
		local source = event.source -- GOTCHA: save this now!

		ssk.wait.ms( 500 )
		print("1")
		ssk.wait.ms( 500 )

		print("2")

		ssk.wait.ms( 500 )
		print("3")

		timer.cancel(source)
	end), 0)
--]]

--[[
local function testSeq()
	local start = system.getTimer()
	print("YO " .. tostring(start) )
	ssk.wait.ms( 500 )
	print("1 " .. tostring(system.getTimer() - start) )
	
	ssk.wait.ms( 500 )
	print("2 " .. tostring(system.getTimer() - start) )

	ssk.wait.ms( 500 )
	print("3 " .. tostring(system.getTimer() - start) )
end

ssk.wait.run( testSeq )
--]]
