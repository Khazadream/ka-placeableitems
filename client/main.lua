local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('ka-placeableitems:client:useItemObject', function()
    local src = source
    local dataCreateSpawnObject = { 
        distance = 100, -- distance to spawn object
        type = 'none', -- object type (none or container)
        name = 'ka001', -- object name
        --object = 'apa_mp_h_din_table_06', -- object hash name
        object = 'p_stinger_02'
    }
    exports['ps-objectspawner']:CreateSpawnedObject(dataCreateSpawnObject, true)

end)

function placeItemOnGround(dist, tpe, objectName, objectGameName, metadata)
        local dataCreateSpawnObject = { 
        distance = dist, -- distance to spawn object
        type = tpe, -- object type (none or container)
        name = objectName, -- object name
        object = objectGameName -- object hash name
    }
    exports['ps-objectspawner']:CreateSpawnedObject(dataCreateSpawnObject, true, metadata)
end

RegisterNetEvent('ka-placeableitems:client:placePlaceItem', function(obj, metadata)
    local src = source
    local distance = 100 -- distance to spawn object
    local type = 'none' -- object type (none or container)
    local name = QBCore.Functions.GetPlayerData().charinfo.firstname .. ' ' .. QBCore.Functions.GetPlayerData().charinfo.lastname -- player name
    local object = obj
    
    placeItemOnGround(distance, type, name, object, metadata)
end)

exports('testplaceable', function(data, slot)
    if not slot.metadata then return end
    
    local object = slot.metadata.type
    local distance = 100 -- distance to spawn object
    local type = 'none' -- object type (none or container)
    local name = QBCore.Functions.GetPlayerData().charinfo.firstname .. ' ' .. QBCore.Functions.GetPlayerData().charinfo.lastname -- player name
    local metadata = slot.metadata
    placeItemOnGround(distance, type, name, object, metadata)
end)