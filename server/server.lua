local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('c-buylicense:server:givelicense', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        local licenseTable = Player.PlayerData.metadata["licences"]
        if licenseTable then
        if Player.PlayerData.money.bank >= Config.LicensePrice then
        licenseTable['weapon'] = true
        Player.Functions.SetMetaData('licences', licenseTable)
            Player.Functions.RemoveMoney("bank", Config.LicensePrice)
             info = {}
                info.firstname = Player.PlayerData.charinfo.firstname
                info.lastname = Player.PlayerData.charinfo.lastname
                info.birthdate = Player.PlayerData.charinfo.birthdate

            Player.Functions.AddItem(Config.WeaponLicenseItemName, 1, nil, info)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WeaponLicenseItemName], 'add')
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, Config.Lang['you_have_money'], 'success')
                elseif Config.NotifyType == 'Okok' then
                    TriggerClientEvent('okokNotify:Alert', src, Config.Lang['header_text'], Config.Lang['you_have_money'], 3500, 'success')
            
                elseif Config.NotifyType == 'ox' then
                    TriggerClientEvent('ox_lib:notify', src, { title = Config.Lang['header_text'], description = Config.Lang['you_have_money'], })
                elseif Config.NotifyType == 'mythic' then
                    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = Config.Lang['you_have_money'], style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
                end
        else
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, Config.Lang['you_no_money'], 'error')
                elseif Config.NotifyType == 'Okok' then
                    TriggerClientEvent('okokNotify:Alert', src, Config.Lang['header_text'], Config.Lang['you_no_money'], 3500, 'error')
                elseif Config.NotifyType == 'ox' then
                    TriggerClientEvent('ox_lib:notify', src, { title = Config.Lang['header_text'], description = Config.Lang['you_no_money'], })
                elseif Config.NotifyType == 'mythic' then
                    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = Config.Lang['you_no_money'], style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
                end
        end
    end
    end
end)

QBCore.Functions.CreateCallback('c-buylicense:server:licensecheckstatus', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local licenseTable = Player.PlayerData.metadata["licences"]

    if licenseTable.weapon then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('c-buylicense:server:bancheckstatus', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local bancheck = Player.PlayerData.metadata['firearmban']

    if bancheck then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Commands.Add('firearmban', "Ban someone from getting a Weapon License", { { name = 'id', help = "Id of player you want banned" } }, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.type == 'leo' and Player.PlayerData.job.grade.level >= Config.LicenseBanRank then
            local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1])) 
            if not SearchedPlayer then return end
            local licenseTable = SearchedPlayer.PlayerData.metadata['licences']
            licenseTable.weapon = false
            SearchedPlayer.Functions.SetMetaData('licences', licenseTable)
            SearchedPlayer.Functions.SetMetaData('firearmban', true)
    else
    end
end)

QBCore.Commands.Add('removefirearmban', "Remove a ban from someone who has been banned", { { name = 'id', help = "Id of player you to unban" } }, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.type == 'leo' and Player.PlayerData.job.grade.level >= Config.LicenseUnBanRank then
            local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
            if not SearchedPlayer then return end
            SearchedPlayer.Functions.SetMetaData('firearmban', false)
    else
    end
end)