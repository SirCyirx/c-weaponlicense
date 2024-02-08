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
            local info = {}
                info.firstname = Player.PlayerData.charinfo.firstname
                info.lastname = Player.PlayerData.charinfo.lastname
                info.birthdate = Player.PlayerData.charinfo.birthdate
        if Config.Inventory == 'qb' then
            Player.Functions.AddItem(Config.WeaponLicenseItemName, 1, nil, info)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WeaponLicenseItemName], 'add')
        elseif Config.Inventory == 'lj' then
            Player.Functions.AddItem(Config.WeaponLicenseItemName, 1, nil, info)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WeaponLicenseItemName], 'add')
        elseif Config.Inventory == 'ox' then
            exports.ox_inventory:AddItem(src, Config.WeaponLicenseItemName, 1, info)
        end
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

RegisterServerEvent('c-buylicense:server:givelicenseitem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        if Player.PlayerData.money.bank >= Config.LicenseitemPrice then
            Player.Functions.RemoveMoney("bank", Config.LicenseitemPrice)
            local info = {}
                info.firstname = Player.PlayerData.charinfo.firstname
                info.lastname = Player.PlayerData.charinfo.lastname
                info.birthdate = Player.PlayerData.charinfo.birthdate
                if Config.Inventory == 'qb' then
                    Player.Functions.AddItem(Config.WeaponLicenseItemName, 1, nil, info)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WeaponLicenseItemName], 'add')
                elseif Config.Inventory == 'lj' then
                    Player.Functions.AddItem(Config.WeaponLicenseItemName, 1, nil, info)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WeaponLicenseItemName], 'add')
                elseif Config.Inventory == 'ox' then
                    exports.ox_inventory:AddItem(src, Config.WeaponLicenseItemName, 1, info)
                end
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, Config.Lang['you_have_money2'], 'success')
                elseif Config.NotifyType == 'Okok' then
                    TriggerClientEvent('okokNotify:Alert', src, Config.Lang['header_text'], Config.Lang['you_have_money2'], 3500, 'success')
                elseif Config.NotifyType == 'ox' then
                    TriggerClientEvent('ox_lib:notify', src, { title = Config.Lang['header_text'], description = Config.Lang['you_have_money2'], })
                elseif Config.NotifyType == 'mythic' then
                    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = Config.Lang['you_have_money2'], style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
                end
        else
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, Config.Lang['you_no_money2'], 'error')
                elseif Config.NotifyType == 'Okok' then
                    TriggerClientEvent('okokNotify:Alert', src, Config.Lang['header_text'], Config.Lang['you_no_money2'], 3500, 'error')
                elseif Config.NotifyType == 'ox' then
                    TriggerClientEvent('ox_lib:notify', src, { title = Config.Lang['header_text'], description = Config.Lang['you_no_money2'], })
                elseif Config.NotifyType == 'mythic' then
                    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = Config.Lang['you_no_money2'], style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
                end
        end
    end
end)

QBCore.Functions.CreateCallback('c-buylicense:server:bancheckstatus', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local bancheck = Player.PlayerData.metadata['licensebanned']

    if bancheck then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('c-buylicense:server:grantedcheckstatus', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local grantedcheck = Player.PlayerData.metadata['grantedlicense']

    if grantedcheck then
        cb(true)
    else
        cb(false)
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

if Config.LicenseBan == true then
QBCore.Commands.Add('weaponban', "Ban or unban someone from getting a Weapon License", { { name = 'id', help = "Id of player you want to ban or unban" }, { name = 'ban or unban', help = "banning someone will result in them not being able to get a firearm license & unbanning someone will result in them being able to get a firearm license" } }, true, function(source, args)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
        local licenseTable = SearchedPlayer.PlayerData.metadata['licences']
        if args[2] == "ban" then
        if Player.PlayerData.job.type == 'leo' and Player.PlayerData.job.grade.level >= Config.LicenseBanRank then
            if Config.RemoveLicense == true then
                licenseTable.weapon = false
                SearchedPlayer.Functions.SetMetaData('licences', licenseTable)
            end
                SearchedPlayer.Functions.SetMetaData('licensebanned', true)
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, Config.Lang['you_get_banned'], 'error')
                    TriggerClientEvent('QBCore:Notify', src, Config.Lang['you_just_banned'], 'error')
                    elseif Config.NotifyType == 'Okok' then
                        TriggerClientEvent('okokNotify:Alert', SearchedPlayer.PlayerData.source, Config.Lang['header_text'], Config.Lang['you_get_banned'], 3500, 'error')
                        TriggerClientEvent('okokNotify:Alert', src, Config.Lang['header_text'], Config.Lang['you_just_banned'], 3500, 'error')
                    elseif Config.NotifyType == 'ox' then
                        TriggerClientEvent('ox_lib:notify', SearchedPlayer.PlayerData.source, { title = Config.Lang['header_text'], description = Config.Lang['you_get_banned'], })
                        TriggerClientEvent('ox_lib:notify', src, { title = Config.Lang['header_text'], description = Config.Lang['you_just_banned'], })
                    elseif Config.NotifyType == 'mythic' then
                        TriggerClientEvent('mythic_notify:client:SendAlert', SearchedPlayer.PlayerData.source, { type = 'error', text = Config.Lang['you_get_banned'], style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
                        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = Config.Lang['you_just_banned'], style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
                    end
                else
                    if Config.NotifyType == 'qb' then
                        TriggerClientEvent('QBCore:Notify', src, Config.Lang['rank_not_high'], 'error')
                        elseif Config.NotifyType == 'Okok' then
                            TriggerClientEvent('okokNotify:Alert', src, Config.Lang['header_text'], Config.Lang['rank_not_high'], 3500, 'error')
                        elseif Config.NotifyType == 'ox' then
                            TriggerClientEvent('ox_lib:notify', src, { title = Config.Lang['header_text'], description = Config.Lang['rank_not_high'], })
                        elseif Config.NotifyType == 'mythic' then
                            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = Config.Lang['rank_not_high'], style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
                        end
                end
                elseif args[2] == "unban" then
                    if Player.PlayerData.job.type == 'leo' and Player.PlayerData.job.grade.level >= Config.LicenseUnBanRank then
                        SearchedPlayer.Functions.SetMetaData('licensebanned', false)
                    if Config.NotifyType == 'qb' then
                        TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, Config.Lang['you_get_unbanned'], 'error')
                        TriggerClientEvent('QBCore:Notify', src, Config.Lang['you_just_unbanned'], 'error')
                        elseif Config.NotifyType == 'Okok' then
                            TriggerClientEvent('okokNotify:Alert', SearchedPlayer.PlayerData.source, Config.Lang['header_text'], Config.Lang['you_get_unbanned'], 3500, 'error')
                            TriggerClientEvent('okokNotify:Alert', src, Config.Lang['header_text'], Config.Lang['you_just_unbanned'], 3500, 'error')
                        elseif Config.NotifyType == 'ox' then
                            TriggerClientEvent('ox_lib:notify', SearchedPlayer.PlayerData.source, { title = Config.Lang['header_text'], description = Config.Lang['you_get_unbanned'], })
                            TriggerClientEvent('ox_lib:notify', src, { title = Config.Lang['header_text'], description = Config.Lang['you_just_unbanned'], })
                        elseif Config.NotifyType == 'mythic' then
                            TriggerClientEvent('mythic_notify:client:SendAlert', SearchedPlayer.PlayerData.source, { type = 'error', text = Config.Lang['you_get_unbanned'], style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
                            TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = Config.Lang['you_just_unbanned'], style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
                        end
                    else
                        if Config.NotifyType == 'qb' then
                            TriggerClientEvent('QBCore:Notify', src, Config.Lang['rank_not_high'], 'error')
                            elseif Config.NotifyType == 'Okok' then
                                TriggerClientEvent('okokNotify:Alert', src, Config.Lang['header_text'], Config.Lang['rank_not_high'], 3500, 'error')
                            elseif Config.NotifyType == 'ox' then
                                TriggerClientEvent('ox_lib:notify', src, { title = Config.Lang['header_text'], description = Config.Lang['rank_not_high'], })
                            elseif Config.NotifyType == 'mythic' then
                                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = Config.Lang['rank_not_high'], style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
                            end
                    end
                end
            end)
        end

if Config.UseGrant == true then
    QBCore.Commands.Add('weapongrant', "Grant or ungrant someone the option of being able to get a firearm license", { { name = 'id', help = "Id of player you want to grant or ungrant"}, {  name = 'grant or ungrant', help = "Granting will result in them not being able to get a firearm license & Ungranting will result in them being able to get a firearm license" } }, true, function(source, args)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1])) 
        if args[2] == "grant" then
        if Player.PlayerData.job.type == 'leo' and Player.PlayerData.job.grade.level >= Config.GrantRank then
                SearchedPlayer.Functions.SetMetaData('grantedlicense', true)
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, Config.Lang['you_get_granted'], 'error')
                    TriggerClientEvent('QBCore:Notify', src, Config.Lang['you_just_granted'], 'error')
                    elseif Config.NotifyType == 'Okok' then
                        TriggerClientEvent('okokNotify:Alert', SearchedPlayer.PlayerData.source, Config.Lang['header_text'], Config.Lang['you_get_granted'], 3500, 'error')
                        TriggerClientEvent('okokNotify:Alert', src, Config.Lang['header_text'], Config.Lang['you_just_granted'], 3500, 'error')
                    elseif Config.NotifyType == 'ox' then
                        TriggerClientEvent('ox_lib:notify', SearchedPlayer.PlayerData.source, { title = Config.Lang['header_text'], description = Config.Lang['you_get_granted'], })
                        TriggerClientEvent('ox_lib:notify', src, { title = Config.Lang['header_text'], description = Config.Lang['you_just_granted'], })
                    elseif Config.NotifyType == 'mythic' then
                        TriggerClientEvent('mythic_notify:client:SendAlert', SearchedPlayer.PlayerData.source, { type = 'error', text = Config.Lang['you_get_granted'], style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
                        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = Config.Lang['you_just_granted'], style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
                    end
                else
                    if Config.NotifyType == 'qb' then
                        TriggerClientEvent('QBCore:Notify', src, Config.Lang['rank_not_high'], 'error')
                        elseif Config.NotifyType == 'Okok' then
                            TriggerClientEvent('okokNotify:Alert', src, Config.Lang['header_text'], Config.Lang['rank_not_high'], 3500, 'error')
                        elseif Config.NotifyType == 'ox' then
                            TriggerClientEvent('ox_lib:notify', src, { title = Config.Lang['header_text'], description = Config.Lang['rank_not_high'], })
                        elseif Config.NotifyType == 'mythic' then
                            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = Config.Lang['rank_not_high'], style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
                        end
                end
                elseif args[2] == "ungrant" then
                    if Player.PlayerData.job.type == 'leo' and Player.PlayerData.job.grade.level >= Config.UnGrantRank then
                    SearchedPlayer.Functions.SetMetaData('grantedlicense', false)
                    if Config.NotifyType == 'qb' then
                        TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, Config.Lang['you_get_ungranted'], 'error')
                        TriggerClientEvent('QBCore:Notify', src, Config.Lang['you_just_ungranted'], 'error')
                        elseif Config.NotifyType == 'Okok' then
                            TriggerClientEvent('okokNotify:Alert', SearchedPlayer.PlayerData.source, Config.Lang['header_text'], Config.Lang['you_get_ungranted'], 3500, 'error')
                            TriggerClientEvent('okokNotify:Alert', src, Config.Lang['header_text'], Config.Lang['you_just_ungranted'], 3500, 'error')
                        elseif Config.NotifyType == 'ox' then
                            TriggerClientEvent('ox_lib:notify', SearchedPlayer.PlayerData.source, { title = Config.Lang['header_text'], description = Config.Lang['you_get_ungranted'], })
                            TriggerClientEvent('ox_lib:notify', src, { title = Config.Lang['header_text'], description = Config.Lang['you_just_ungranted'], })
                        elseif Config.NotifyType == 'mythic' then
                            TriggerClientEvent('mythic_notify:client:SendAlert', SearchedPlayer.PlayerData.source, { type = 'error', text = Config.Lang['you_get_ungranted'], style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
                            TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = Config.Lang['you_just_ungranted'], style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
                        end
                    else
                        if Config.NotifyType == 'qb' then
                            TriggerClientEvent('QBCore:Notify', src, Config.Lang['rank_not_high'], 'error')
                            elseif Config.NotifyType == 'Okok' then
                                TriggerClientEvent('okokNotify:Alert', src, Config.Lang['header_text'], Config.Lang['rank_not_high'], 3500, 'error')
                            elseif Config.NotifyType == 'ox' then
                                TriggerClientEvent('ox_lib:notify', src, { title = Config.Lang['header_text'], description = Config.Lang['rank_not_high'], })
                            elseif Config.NotifyType == 'mythic' then
                                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = Config.Lang['rank_not_high'], style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
                            end
                    end
                end
    end)
    end

    if Config.LicenseBan == true then
    if Config.SelfCheck == true then
        QBCore.Commands.Add('weaponbanned', "Check if your banned from getting a firearm license", {}, true, function(source)
                local src = source
                local Player = QBCore.Functions.GetPlayer(src)
                local bannedcheck = Player.PlayerData.metadata['licensebanned']

                if bannedcheck == true then
                    if Config.NotifyType == 'qb' then
                        TriggerClientEvent('QBCore:Notify', src, Config.Lang['you_are'], 'error')
                        elseif Config.NotifyType == 'Okok' then
                            TriggerClientEvent('okokNotify:Alert', src, Config.Lang['header_text'], Config.Lang['you_are'], 3500, 'error')
                        elseif Config.NotifyType == 'ox' then
                            TriggerClientEvent('ox_lib:notify', src, { title = Config.Lang['header_text'], description = Config.Lang['you_are'], })
                        elseif Config.NotifyType == 'mythic' then
                            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = Config.Lang['you_are'], style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
                        end
                elseif bannedcheck == false then
                    if Config.NotifyType == 'qb' then
                        TriggerClientEvent('QBCore:Notify', src, Config.Lang['you_are_not'], 'error')
                        elseif Config.NotifyType == 'Okok' then
                            TriggerClientEvent('okokNotify:Alert', src, Config.Lang['header_text'], Config.Lang['you_are_not'], 3500, 'error')
                        elseif Config.NotifyType == 'ox' then
                            TriggerClientEvent('ox_lib:notify', src, { title = Config.Lang['header_text'], description = Config.Lang['you_are_not'], })
                        elseif Config.NotifyType == 'mythic' then
                            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = Config.Lang['you_are_not'], style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
                        end
                    end
        end)
        end
    end

    if Config.UseGrant == true then
        if Config.SelfCheck == true then
            QBCore.Commands.Add('weapongranted', "Check if you have been to get a firearm license", {}, true, function(source)
                    local src = source
                    local Player = QBCore.Functions.GetPlayer(src)
                    local grantedcheck = Player.PlayerData.metadata['grantedlicense']

                    if grantedcheck then
                        if Config.NotifyType == 'qb' then
                            TriggerClientEvent('QBCore:Notify', src, Config.Lang['you_are_granted'], 'error')
                            elseif Config.NotifyType == 'Okok' then
                                TriggerClientEvent('okokNotify:Alert', src, Config.Lang['header_text'], Config.Lang['you_are_granted'], 3500, 'error')
                            elseif Config.NotifyType == 'ox' then
                                TriggerClientEvent('ox_lib:notify', src, { title = Config.Lang['header_text'], description = Config.Lang['you_are_granted'], })
                            elseif Config.NotifyType == 'mythic' then
                                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = Config.Lang['you_are_granted'], style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
                            end
                    elseif grantedcheck == false then
                        if Config.NotifyType == 'qb' then
                            TriggerClientEvent('QBCore:Notify', src, Config.Lang['you_are_not_granted'], 'error')
                            elseif Config.NotifyType == 'Okok' then
                                TriggerClientEvent('okokNotify:Alert', src, Config.Lang['header_text'], Config.Lang['you_are_not_granted'], 3500, 'error')
                            elseif Config.NotifyType == 'ox' then
                                TriggerClientEvent('ox_lib:notify', src, { title = Config.Lang['header_text'], description = Config.Lang['you_are_not_granted'], })
                            elseif Config.NotifyType == 'mythic' then
                                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = Config.Lang['you_are_not_granted'], style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
                            end
                        end
            end)
            end
        end