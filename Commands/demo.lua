local Com = {}


Com.Pref = {
	["AdminLevel"] = 2,
	["CommandHelp"] = "Demo Command | :demo"
	
}

Com.Main = function(Params)
	print("--Demo--")
	for i,v in pairs(Params) do
		print("Parameter "..i..":"..v)
	end
	
	return(true)
end

return Com
