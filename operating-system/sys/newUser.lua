term.clear()

--[[
1 welcome
2 new user
3 
4 TYPE HERE
5 ¯¯¯¯¯¯¯¯¯
]]

-- File output:

local lib = ...
local limit = {
	min = 3,
	max = 10
}

-- Welcome Text:
term.setCursorPos(1, 1)
print("Welcome to User Creation!")
term.setCursorPos(1, 2)
print("Enter your new username:")

-- Underline:
term.setCursorPos(1, 5)
underline = ""
for i=1, limit.max do
	local ch = ""
	if i <= limit.min then
		ch = "*"
	else
		ch = "¯"
	end
	underline = underline .. ch
end


-- Input:
user = ""
local function isValid()
	local temp = tonumber(#user) < tonumber(limit.min) or tonumber(#user) > tonumber(limit.max)
	return not temp
end

while not isValid() do
	-- Underline:
	term.setCursorPos(1, 5)
	io.write("  " .. underline)

	-- Input:
	--term.clearLine(4)
	term.setCursorPos(1,4)
	io.write("                                     ")
	term.setCursorPos(1,4)
	io.write("> ")
	user = ""
	user = io.read()

	if not isValid() then
		term.setCursorPos(1,7)
		io.write("Username must be between " .. limit.min .. " and " .. limit.max .. " characters!")
	end
end

-- Invalid Name Catch:
if user == "" or user == nil then
	user = "guest"
end

-- Return Username:
print("\nSaving...")
lib.general.saveToFile("/user/username.txt", user)
os.sleep(0.5)
print("Saved as *" .. user .. "*")
os.sleep(1)