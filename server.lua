local QBCore = exports['qb-core']:GetCoreObject()
local ox_inventory = exports.ox_inventory

QBCore.Functions.CreateCallback("qb-cdwithlink:server:GiveCD", function(source, cb, data, serial)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {
        ["link"] = data.link,
        ["songname"] = data.songname,
        ["artist"] = data.artist,
        ["serial2"] = serial,
    }
    if Config.UseOxinventory then
        local item, response = ox_inventory:AddItem(src, "musicdisc", 1, info)
    else
        if Player.Functions.AddItem("musicdisc", 1, nil, info) then
            cb(true, info)
        else
            cb(false)
        end
    end
end)



QBCore.Functions.CreateUseableItem("musicdisc", function(source, item)
    local src = source
    print(json.encode(item))
    TriggerClientEvent("qb-cdwithlink:client:copyLink", src, item.metadata.link)
end)