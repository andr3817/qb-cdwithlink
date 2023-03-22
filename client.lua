local QBCore = exports['qb-core']:GetCoreObject()

local function OpenMenu()
    local dialog = exports['qb-input']:ShowInput({
        header = "Create a cd",
        submitText = "Submit.",
        inputs = {
            {
                text = "Youtube Link *", -- text you want to be displayed as a place holder
                name = "link", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                -- default = "CID-1234", -- Default text option, this is optional
            },
            {
                text = "Musician Name *", -- text you want to be displayed as a place holder
                name = "artist", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                -- default = "CID-1234", -- Default text option, this is optional
            },
            {
                text = "Song name *", -- text you want to be displayed as a place holder
                name = "songname", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                -- default = "CID-1234", -- Default text option, this is optional
            },
        },
    })
    if dialog ~= nil then
        if string.match(dialog.link, "youtube") ~= nil or string.match(dialog.link, "Youtube") ~= nil then
            local serial = math.random(11111111, 99999999)
            QBCore.Functions.TriggerCallback("qb-cdwithlink:server:GiveCD", function(cb, info)
                if cb then
                    QBCore.Functions.Notify("You just printed a CD", "success", 3500)
                else
                    QBCore.Functions.Notify("Try again", "error", 3500)
                end
            end, dialog, serial)
        end
    end
end

RegisterNetEvent("qb-cdwithlink:client:copyLink", function(link)
    SendNUIMessage({
        type = 'copylink',
        link = link
    })
end)


CreateThread(function()
    exports.ox_inventory:displayMetadata({
        link = "Link",
        songname = "Song Name",
        artist = "Musician",
        serial2 = "serial",
    })
end)


exports['qb-target']:AddBoxZone("cdcreator", vector3(-821.69, -724.09, 32.34), 0.4, 0.5, { -- The name has to be unique, the coords a vector3 as shown, the 1.5 is the length of the boxzone and the 1.6 is the width of the boxzone, the length and width have to be float values
  name = "cdcreator",
  heading = 0,
  debugPoly = false,
  minZ = 32.14,
  maxZ = 32.54,
}, {
  options = {
    {
      icon = 'fas fa-compact-disc',
      label = 'Create Disc',
      action = function(entity)
        if IsPedAPlayer(entity) then return false end
        OpenMenu()
      end,
      job = "wuchang"
    }
  },
  distance = 2.5,
})



