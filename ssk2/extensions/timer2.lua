
timer.performWithDelay0 = timer.performWithDelay
timer.pause0 = timer.pause
timer.resume0 = timer.resume
timer.cancel0 = timer.cancel


timer.timer2timers = {}
local timers = timer.timer2timers


function timer.performWithDelay(...)
	-- set up local parameters
	local args = {...}
	local delay = args[1]
	local listener = args[2]
	local iterations = 1
	local tag = nil
	local exclude = false
	for i = 3, 5 do
		local arg = args[i]
		if type(arg) == "number" then
			iterations = arg
		elseif type(arg) == "string" then
			tag = arg
		elseif type(arg) == "boolean" then
			exclude = arg
		end
	end

	-- create timer
	local newTimer = timer.performWithDelay0(delay, listener, iterations)
	newTimer.tag = tag
	newTimer.exclude = exclude
	timers[#timers+1] = newTimer

	return newTimer
end

----------------------------------------
-- MODIFY TIMER.PAUSE
----------------------------------------
function timer.pause(timerID)
	if timerID == nil then
		for i = #timers, 1, -1 do
			if not timers[i].exclude then
				local timeLeft = timer.pause0(timers[i])
				if timeLeft <=0 and (timers[i]._iterations ==  nil or timers[i]._iterations == 0) then
					timers[i] = nil
					table.remove(timers, i)
				end
			end
		end
	else
		for i = #timers, 1, -1 do
			if timerID == timers[i] or timerID == timers[i].tag then
				local timeLeft = timer.pause0(timers[i])
				if timeLeft <=0 and (timers[i]._iterations ==  nil or timers[i]._iterations == 0) then
					timers[i] = nil
					table.remove(timers, i)
				end
			end
		end
	end
end

----------------------------------------
-- MODIFY TIMER.RESUME
----------------------------------------
function timer.resume(timerID)
	if timerID == nil then
		for i = #timers, 1, -1 do
			if not timers[i].exclude then
				local timeLeft = timer.resume0(timers[i])
				if timeLeft <=0 and (timers[i]._iterations ==  nil or timers[i]._iterations == 0) then
					timers[i] = nil
					table.remove(timers, i)
				end
			end
		end
	else
		for i = #timers, 1, -1 do
			if timerID == timers[i] or timerID == timers[i].tag then
				local timeLeft = timer.resume0(timers[i])
				if timeLeft <=0 and (timers[i]._iterations ==  nil or timers[i]._iterations == 0) then
					timers[i] = nil
					table.remove(timers, i)
				end
			end
		end
	end
end

----------------------------------------
-- MODIFY TIMER.CANCEL
----------------------------------------
--function timer.cancel(...)
--	local timerID
--	if( arg ) then
--		timerID = arg[1]
--	end
	--print("CANCELLING", unpack(arg), system.getTimer() )
function timer.cancel( timerID )
	if timerID == nil then
		for i = #timers, 1, -1 do
			if not timers[i].exclude then
				timer.cancel0(timers[i])
				table.remove(timers, i)
			end
		end
	else
		for i = #timers, 1, -1 do
			if timerID == timers[i] or timerID == timers[i].tag then
				timer.cancel0(timers[i])
				timers[i] = nil
				table.remove(timers, i)
			end
		end
	end
end

return true
