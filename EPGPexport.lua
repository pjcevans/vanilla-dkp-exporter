function EPGPexport_OnLoad()
	SLASH_EPGPEXPORT1 = "/epgpexport" 
	SLASH_EPGPEXPORT2 = "/epgpex" 
	SlashCmdList["EPGPEXPORT"] = EPGPexport_exportData
end

function EPGPexport_exportData()
	EPGPexportData = {}	
	dkpextract = "^<(%d+)>"

	for i = 1, GetNumGuildMembers(true) do
		local name, _, _, _, class, _, note, _, _, _ = GetGuildRosterInfo(i)
		local dkp = string.match(note, dkpextract)
		if dkp then
			EPGPexportData[name] = "DKP: " .. dkp
		end
	end
	DEFAULT_CHAT_FRAME:AddMessage("DKP exported to WTF\Account\ACCOUNTNAME\SavedVariables\EPGPexportData.lua", 1, 1, 0)
	DEFAULT_CHAT_FRAME:AddMessage("Reload UI or Logout to save the file", 1, 1, 0)
end
