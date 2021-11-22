if Config.Framework == 'esx' then 
	ESX = nil
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	ESX.RegisterUsableItem(Config.ItemForTicket, function(source)
		local xPlayer = ESX.GetPlayerFromId(source)
		TriggerClientEvent('Roda_Christmas:OpenGift', source)
		xPlayer.removeInventoryItem(Config.ItemForTicket, 1)
	end)

elseif Config.Framework == 'qbcore' then 
	QBCore = exports['qb-core']:GetCoreObject()
	QBCore.Functions.CreateUseableItem(Config.ItemForTicket, function(source)
		local xPlayer = QBCore.Functions.GetPlayer(source)
		TriggerClientEvent('Roda_Christmas:OpenGift', source)
		xPlayer.Functions.RemoveItem(Config.ItemForTicket, 1)
	end)
else
	print('The Dev of the server put a bad config, tell him that check Config.lua of '..GetCurrentResourceName())
end



RegisterServerEvent('Roda_Christmas:GiveGift')
AddEventHandler('Roda_Christmas:GiveGift', function(item, amount, label, word)
	 local src = source
	 local xPlayer

	 if word == Config.WordThatSaveYourLife then 
			if Config.Framework == 'esx' then 
				xPlayer = ESX.GetPlayerFromId(src)
				if xPlayer.getInventoryItem(Config.ItemForTicket).count > 0 then 
					
					if item == 'lose' then  	
						xPlayer.showNotification('I can\'t give u nothing 😭')
					elseif item == 'cash' then 
						xPlayer.addMoney(amount)
						xPlayer.showNotification('You win $'..amount..'')
					else
						xPlayer.addInventoryItem(item, amount)
						xPlayer.showNotification('You win x'..amount..' '..label..'')
					end
				else
					xPlayer.showNotification('Don\'t dupe here.')
				end
			elseif Config.Framework == 'qbcore' then 
				xPlayer = QBCore.Functions.GetPlayer(src)
					if item == 'lose' then 
						TriggerClientEvent('QBCore:Notify', src, "I can\'t give u nothing 😭", "error")
					elseif item == 'cash' then 
						xPlayer.Functions.AddMoney('cash', amount, 'Merry Christmas')
						TriggerClientEvent('QBCore:Notify', src, "You win $"..amount.."", "success")
					else
						print('case item')
						print('este es el item y amount', item, amount)
						xPlayer.Functions.AddItem(item, amount)
						print('se acabo')
						TriggerClientEvent('QBCore:Notify', src, "You win x"..amount.." "..label.."", "success")
					end
			else 
				print('The Dev of the server put a bad config, tell him that check Config.lua of '..GetCurrentResourceName())
			end
	else
		DropPlayer(src, 'Bye bye cheater')
	end
end)



