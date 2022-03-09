local lib = ...
local width, height = term.getSize()


-- FUNCTIONS:

local function button(x, y, w, txt, cTX, cBG, fn)
	local temp = {
		x = x,
		y = y,
		w = w,
		txt = txt,
		cTX = cTX,
		cBG =cBG,
		fn = fn
	}
	return temp
end

local function delayPrint(txt)
	lib.general.clearScreen()
	print(txt)
	os.sleep(2)
end

local buttons = {
	-- System Buttons:
	button(width-1, 1, 1, "x", colours.white, colours.red, function()
		delayPrint("Shutting Down...")
		os.shutdown()
	end),
	button(width-2, 1, 1, "@", colours.white, colours.orange, function()
		delayPrint("Rebooting...")
		os.reboot()
	end),

	-- Application Buttons:
	button(2, 6, 16, "Help", colours.white, colours.purple, function()
		term.clear()
		os.sleep(10)
	end),
	button(2, 8, 16, "Shell", colours.white, colours.purple, function()
		term.clear()
		os.run({}, "shell")
	end),
	button(2, 10, 16, "orefinder", colours.white, colours.green, function()
		lib.general.launch("/programs/orefinder.lua")
	end)
}

local function drawMisc()
	-- Draw Upper Bar:
	term.setCursorPos(1, 1)
	for i=1, width do
		term.setBackgroundColour(colours.grey)
		io.write(" ")
	end
	term.setCursorPos(2, 1)
	term.setTextColour(colours.white)
	io.write("Launcher")
end
local function drawButtons()
	for i, v in pairs(buttons) do
		term.setCursorPos(v.x, v.y)
		term.setBackgroundColour(v.cBG)
		term.setTextColour(v.cTX)

		-- Background and Text:
		term.setCursorPos(v.x, v.y)
		for i=v.x, v.w do
			io.write(" ")
		end
		term.setCursorPos(v.x, v.y)
		for j=1, v.w do
			io.write(string.sub( v.txt, j, j))
		end

		-- Colour Reset:
		term.setBackgroundColour(colours.black)
		term.setTextColour(colours.white)
	end
end


-- MAIN:

while true do
	term.clear()
	-- Draw Misc:
	drawMisc()
	-- Draw Buttons:
	drawButtons()

	-- Click Buttons:
	local event, b, x, y = os.pullEvent("mouse_click")
	for i, v in pairs(buttons) do
		if (x >= v.x and x <= v.x + v.w) and (y == v.y) then
			--term.clear()
			term.setCursorPos(1, 1)
			v.fn()
		end
	end
end