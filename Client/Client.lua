

RegisterNUICallback("closeCard",function(data, cb)
    SetNuiFocus(false, false)
end)


RegisterNUICallback("giveitem", function(data, cb)
    SendNUIMessage({
        action = "close";
    })
    SetNuiFocus(false, false)
    TriggerServerEvent('Roda_Christmas:GiveGift', data.itemtogive, data.itemamout, data.itemlabel, Config.WordThatSaveYourLife)
end)


RegisterNetEvent('Roda_Christmas:OpenGift')
AddEventHandler('Roda_Christmas:OpenGift', function()
    local itemtogive = Config.Items[math.random(1, #Config.Items)]
    SendNUIMessage({
        action = "show";
        item = itemtogive;
        config = Config.NUI;
    })
    SetNuiFocus(true, true)
end)

