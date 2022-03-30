local Com = {}


Com.Pref = {
	["AdminLevel"] = 2,
	["CommandHelp"] = "Demo Command | :demo"
}

Com.Main = function()
	print("Demo")
	return(true)
end

return Com
