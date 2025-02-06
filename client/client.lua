local function toggleNuiFrame(shouldShow)
  SetNuiFocus(shouldShow, shouldShow)
  SendReactMessage('setVisible', shouldShow)
end

RegisterCommand('show-nui', function()
  toggleNuiFrame(true)
  debugPrint('Show NUI frame')
end)

RegisterNUICallback('hideFrame', function(_, cb)
  toggleNuiFrame(false)
  debugPrint('Hide NUI frame')
  cb({})
end)

RegisterNUICallback("validateMoneyForPlayingGame", function(data, cb)
  ESX.TriggerServerCallback("plinko:validateMoneyForPlayingGame", function(result)
    print(json.encode(data), 'this is data plinko:validateMoneyForPlayingGame')
    if result and result.success then
      cb({
        numberOfDroppballs = result.numberOfDroppballs
      })
    else
      cb({ numberOfDroppballs = 0 })
    end
  end, data)
end)

RegisterNUICallback("getRandomGroup", function(_, cb)
  ESX.TriggerServerCallback("plinko:getRandomGroup", function(result)
    cb(result)
  end)
end)

RegisterNUICallback("processGameResults", function(data, cb)
  ESX.TriggerServerCallback("plinko:processGameResults", function(result)
    cb(result)
  end, data)
end)

if Config.devmove then
  Citizen.CreateThread(function()
    while true do
      Wait(0)
      -- F5
      if IsControlJustReleased(0, 166) then
        toggleNuiFrame(true)
      end
    end
  end)
end
