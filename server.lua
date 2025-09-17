ESX = exports["es_extended"]:getSharedObject()


for cmd, coords in pairs(Config.Teleports) do
    RegisterCommand(cmd, function(source, args)
        local targetId = tonumber(args[1])
        if not targetId then
            TriggerClientEvent('kollegah_hud:notify', source, { args = { '^1SYSTEM', 'Bitte gebe eine PlayerID an.' } })
            return
        end

        local xPlayer = ESX.GetPlayerFromId(targetId)
        if xPlayer then
            TriggerClientEvent('teleportScript:teleportPlayer', targetId, coords)
            TriggerClientEvent('kollegah_hud:notify', source, { args = { '^2SYSTEM', 'Spieler wurde teleportiert.' } })
        else
            TriggerClientEvent('kollegah_hud:notify', source, { args = { '^1SYSTEM', 'Ungültige PlayerID.' } })
        end
    end, false)
end

-- Event zum Teleportieren
RegisterNetEvent('teleportScript:teleportPlayer')
AddEventHandler('teleportScript:teleportPlayer', function(coords)
    local src = source
    SetEntityCoords(GetPlayerPed(src), coords.x, coords.y, coords.z)
end)
