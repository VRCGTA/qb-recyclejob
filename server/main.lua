local QBCore = exports['qb-core']:GetCoreObject()

-- Events

RegisterNetEvent('qb-recycle:server:getItem', function()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  for _ = 1, math.random(1, Config.MaxItemsReceived), 1 do
    local randItem = Config.ItemTable[math.random(1, #Config.ItemTable)]
    local amount = math.random(Config.MinItemReceivedQty, Config.MaxItemReceivedQty)
    Player.Functions.AddItem(randItem, amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add')
    Wait(500)
  end

  local chance = math.random(1, 3000)
  if chance < 2 then
    Player.Functions.AddItem(Config.ChanceItem, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ChanceItem], 'add')
  end

  local chance2 = math.random(1, 6000)
  if chance2 < 2 then
    Player.Functions.AddItem(Config.ChanceItem, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, 'techbook_pistol', 'add')
  end

  local chance3 = math.random(1, 10000)
  if chance3 < 2 then
    Player.Functions.AddItem(Config.ChanceItem, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, 'techbook_smg', 'add')
  end

  local luck = math.random(1, 10)
  if luck == 5 then
    local random = math.random(1, 10)
    Player.Functions.AddItem(Config.LuckyItem, random)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.LuckyItem], 'add')
  end

end)
