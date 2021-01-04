local pvp = false

RegisterNetEvent('pvp:toggle')

function EnablePvp(enable)
	if enable then
		SetRelationshipBetweenGroups(5, `PLAYER`, `PLAYER`)
		NetworkSetFriendlyFireOption(true)
	else
		SetRelationshipBetweenGroups(1, `PLAYER`, `PLAYER`)
		NetworkSetFriendlyFireOption(false)
	end
end

function TogglePvp()
	pvp = not pvp

	EnablePvp(pvp)

	TriggerEvent('chat:addMessage', {
		color= {255, 255, 128},
		args = {'PVP', pvp and 'on' or 'off'}
	})
end

RegisterCommand('pvp', function(source, args, raw)
	TogglePvp()
end, false)

AddEventHandler('pvp:toggle', TogglePvp)

CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/pvp', 'Enable/Disable PvP', {})

	EnablePvp(pvp)
end)
