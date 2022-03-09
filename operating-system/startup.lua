local function load(mod)
	local temp = require(mod)
	print("Loaded Module: " .. mod)
	return temp
end
local width, height = term.getSize()

lib      = load("libraries")
sysInfo  = load("sys/sysInfo")
userInfo = load("user/userInfo")

-- Check if user exists and Create new if needed:
USER = lib.general.readFile("user/username.txt")
if USER == "" or USER == nil then
	print("\nNo user found, launching User Creation!")
	os.sleep(1)
	lib.general.launch("sys/newUser.lua", lib)
	USER = lib.general.readFile("user/username.txt")
end

os.setComputerLabel(USER .. "'s " .. userInfo.device_name)

-- Welcome Screen:
term.clear()
term.setCursorPos(1, width/2-3)
textutils.slowPrint("Welcome, " .. USER .. " :)\n\nOperating System: " .. sysInfo.os .. " v" .. sysInfo.version, 20)

os.sleep(2)
lib.general.launch("sys/launcher.lua", lib)