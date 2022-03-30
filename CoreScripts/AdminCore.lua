local CS = game:GetService("Chat")
local DS = game:GetService("DataStoreService")


local KA = script.Parent.Parent
local Commands = KA:FindFirstChild("Commands")
local CoreScripts = KA:FindFirstChild("CoreScripts")


local DefProf = require(CoreScripts.ProfileLayout)
local Pref = require(CoreScripts.Settings)


local AdminStore = DS:GetDataStore(Pref.DatastoreKey)


_G.PlayerList = {}

local Playerlist = _G.PlayerList

local function GetPlayerStats(plr)
	local entry,KeyInfo = AdminStore:GetAsync(plr.UserId)
	
	if entry then
		print(entry.UserId)
	else
		print("Failed")
	end
	
	return(entry)
end

local function FindCommand(Com)
	local C = Commands:FindFirstChild(Com)
	if C then
		return(C)
	else
		return(nil)
	end
end

local function FormatCommand(Com)
	
	local Unform,form = string.gsub(Com,":","")
	
	print(Unform)
	print(form)
	if form == 0 then
		return(nil)
	end
	
	local tab = Unform.split(" ")
	print(tab[1])
	if tab[1] == " " then
		return Unform,"single"
	else
		return tab,"table"
	end
end




game.Players.PlayerAdded:Connect(function(plr)
	
	Playerlist[plr.Name] = DefProf.Default
	
	--AdminStore:SetAsync(plr.UserId,data)
	
	local stat = GetPlayerStats(plr)
	if stat then
		Playerlist[plr.Name] = stat
	else
		Playerlist[plr.Name].UserId = plr.UserId 
	end
	
	plr.Chatted:Connect(function(msg)
		
		local comName,kind = FormatCommand(msg)
		local com = FindCommand(comName)
		if kind == "single" then
			
			if com ~= nil then
				print("In")
				local CommandScript = require(com)
				local CommandSettings = CommandScript.Pref
				if CommandSettings.AdminLevel <= Playerlist[plr.Name].AdminLevel then
					local status = CommandScript.Main()
					if status == true then
						print("Run Success")
					else
						print("Run Failed")
					end	
				end
			end 
		elseif kind == "table" then
			
		end
	end)
end)
