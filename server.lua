local ESX = exports['es_extended']:getSharedObject()

ESX.RegisterCommand(Config.FreezeCommand, 'admin', function(xPlayer, args, showError)
    local targetId = tonumber(args[1])
    if targetId then
        local targetPlayer = ESX.GetPlayerFromId(targetId)
        if targetPlayer then
            MySQL.Async.execute('INSERT INTO trade_freeze (player_id, frozen, freeze_time) VALUES (@player_id, @frozen, NOW()) ON DUPLICATE KEY UPDATE frozen = @frozen, freeze_time = NOW()', {
                ['@player_id'] = targetPlayer.identifier,
                ['@frozen'] = true
            }, function(rowsChanged)
                TriggerClientEvent('tradeFreeze:client:freeze', targetId)
                xPlayer.showNotification('Player ' .. targetId .. ' has been frozen.')
            end)
        else
            xPlayer.showNotification('Player not found.')
        end
    else
        xPlayer.showNotification('Invalid player ID.')
    end
end, true, {help = 'Freeze a player', validate = true, arguments = {{
    name = 'playerId',
    help = 'Player ID',
    type = 'number'
}}})

ESX.RegisterCommand(Config.UnfreezeCommand, 'admin', function(xPlayer, args, showError)
    local targetId = tonumber(args[1])
    if targetId then
        local targetPlayer = ESX.GetPlayerFromId(targetId)
        if targetPlayer then
            MySQL.Async.execute('UPDATE trade_freeze SET frozen = @frozen WHERE player_id = @player_id', {
                ['@player_id'] = targetPlayer.identifier,
                ['@frozen'] = false
            }, function(rowsChanged)
                TriggerClientEvent('tradeFreeze:client:unfreeze', targetId)
                xPlayer.showNotification('Player ' .. targetId .. ' has been unfrozen.')
            end)
        else
            xPlayer.showNotification('Player not found.')
        end
    else
        xPlayer.showNotification('Invalid player ID.')
    end
end, true, {help = 'Unfreeze a player', validate = true, arguments = {{
    name = 'playerId',
    help = 'Player ID',
    type = 'number'
}}})

ESX.RegisterServerCallback('tradeFreeze:server:isFrozen', function(source, cb, playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if xPlayer then
        MySQL.Async.fetchScalar('SELECT frozen FROM trade_freeze WHERE player_id = @player_id', {
            ['@player_id'] = xPlayer.identifier
        }, function(frozen)
            cb(frozen)
        end)
    else
        cb(false)
    end
end)