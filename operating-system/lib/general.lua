general = {}

-- Launch Files with parameters:
function general.launch(process, libraries, args)
	os.run({}, process, libraries, args)
end

-- Terminal:
-- Terminal Stuff
function general.clearScreen()
    term.clear()
    term.setCursorPos(1, 1)
end

-- File system:
function general.readFile(flp)
	if not fs.exists(flp) then
		io.output(flp, "t")
	end
	local fl = fs.open(flp, "r")
	local filedata = fl.readAll()
	fl.close()
	return filedata
end
function general.saveToFile(flp, text)
	local file = fs.open(flp, "w")
	file.write(text)
	file.close()
end

return general