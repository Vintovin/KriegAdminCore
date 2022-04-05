local Com = {}


Com.Pref = {
	["AdminLevel"] = 3,
	["CommandHelp"] = "Shutdown Command | :shutdown [Message]"
}

local function BuildMessage(P)
	local Msg = ""
	for i,v in pairs(P) do
		Msg = Msg.." "..v
	end
	return(Msg)
end

Com.Main = function(Params)
	
	local ExitMessage = BuildMessage(Params)
	while true do
		wait(1)
		
		for i,v in ipairs(game.Players:GetPlayers()) do
			v:Kick(ExitMessage)
		end
		
	end
	
end

return Com
