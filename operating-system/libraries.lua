local path = "lib/"

local function load(lib)
	local temp = require(path .. lib)
	return temp
end

return {
	general = load("general")
}