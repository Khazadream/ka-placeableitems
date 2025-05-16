local QBCore = exports['qb-core']:GetCoreObject()

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
    local object = metadata.propName
    
    placeItemOnGround(distance, type, name, object, metadata)
end)

exports('testplaceable', function(data, slot)
    if not slot.metadata then return end

    local object = slot.metadata.propName
    local distance = 100 -- distance to spawn object
    local type = 'none' -- object type (none or container)
    local name = QBCore.Functions.GetPlayerData().charinfo.firstname .. ' ' .. QBCore.Functions.GetPlayerData().charinfo.lastname -- player name
    local metadata = slot.metadata
    
    placeItemOnGround(distance, type, name, object, metadata)
end)