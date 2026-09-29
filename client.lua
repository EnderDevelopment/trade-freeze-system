local ESX = exports['es_extended']:getSharedObject()

local isFrozen = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isFrozen then
            DisableControlAction(0, 21, true) -- Disable sprint
            DisableControlAction(0, 22, true) -- Disable jump
            DisableControlAction(0, 36, true) -- Disable input
            DisableControlAction(0, 37, true) -- Disable weapon wheel
            DisableControlAction(0, 44, true) -- Disable cover
            DisableControlAction(0, 45, true) -- Disable reload
            DisableControlAction(0, 24, true) -- Disable attack
            DisableControlAction(0, 25, true) -- Disable aim
            DisableControlAction(0, 47, true) -- Disable weapon
            DisableControlAction(0, 58, true) -- Disable weapon selection
            DisableControlAction(0, 140, true) -- Disable melee attack
            DisableControlAction(0, 141, true) -- Disable melee attack
            DisableControlAction(0, 142, true) -- Disable melee attack
            DisableControlAction(0, 263, true) -- Disable melee attack
            DisableControlAction(0, 264, true) -- Disable melee attack
            DisableControlAction(0, 257, true) -- Disable melee attack
        end
    end
end)

RegisterNetEvent('tradeFreeze:client:freeze')
AddEventHandler('tradeFreeze:client:freeze', function()
    isFrozen = true
    ESX.ShowNotification('You have been frozen.')
end)

RegisterNetEvent('tradeFreeze:client:unfreeze')
AddEventHandler('tradeFreeze:client:unfreeze', function()
    isFrozen = false
    ESX.ShowNotification('You have been unfrozen.')
end)