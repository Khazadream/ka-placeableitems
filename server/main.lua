local QBCore = exports["qb-core"]:GetCoreObject()

local ConfigItemName = 'testplaceable'

QBCore.Commands.Add('useItemObject', 'Makes you add objects', {}, true, function(source)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)

    TriggerClientEvent('ka-placeableitems:client:useItemObject', source)

end, 'god')

RegisterNetEvent('ka-placeableitems:server:PlacePlaceItem', function(slot)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local item = exports.ox_inventory:GetSlot(src, slot)
    if not item.metadata then return end

    local object = item.metadata.type
    local metadata = item.metadata
    TriggerClientEvent('ka-placeableitems:client:placePlaceItem', src, object, metadata)
end)

RegisterNetEvent('ka-placeableitems:server:giveBackPlaceItem', function(model, options)
    local src = source
    local metadata = options.metadata

    if metadata then
        exports.ox_inventory:AddItem(src, ConfigItemName, 1, metadata)
    else
        exports.ox_inventory:AddItem(src, ConfigItemName, 1, {propName = model, label = "toto"})
    end
end)

RegisterNetEvent('ka-placeableitems:server:removePlaceItem', function(metadata)
    local src = source

    if metadata then
        exports.ox_inventory:RemoveItem(src, ConfigItemName, 1, metadata)
    else
        exports.ox_inventory:RemoveItem(src, ConfigItemName, 1)
    end
end)

