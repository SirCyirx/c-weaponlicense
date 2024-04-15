RegisterServerEvent('c-weaponlicense:server:givelicense', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
        local licenseTable = Player.PlayerData.metadata["licences"]
        if Config.MoneyType == "Bank" or Config.MoneyType == 'Bank' then
            if Player.PlayerData.money.bank >= Config.LicensePrice then
         Player.Functions.RemoveMoney(Config.MoneyType, Config.LicensePrice)
         licenseTable[Config.WeaponMetadataName] = true
         Player.Functions.SetMetaData('licences', licenseTable)
        if Config.LicenseReceive == true then
            local info = {}
                info.firstname = Player.PlayerData.charinfo.firstname
                info.lastname = Player.PlayerData.charinfo.lastname
                info.birthdate = Player.PlayerData.charinfo.birthdate
        if Config.Inventory == "qb" or Config.Inventory == "lj" then
            Player.Functions.AddItem(Config.WeaponLicenseItemName, 1, nil, info)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WeaponLicenseItemName], 'add')
        elseif Config.Inventory == "ox" then
            exports.ox_inventory:AddItem(src, Config.WeaponLicenseItemName, 1, info)
        end
    end
        Notificationsv(src, {Config.Lang['header_text']}, Config.Lang['you_have_money'], 'success')
    else
        Notificationsv(src, {Config.Lang['header_text']}, Config.Lang['you_no_money'], 'error')
    end
    elseif Config.MoneyType == "Cash" or Config.MoneyType == 'Cash' then
        if Player.PlayerData.money.cash >= Config.LicensePrice then
            Player.Functions.RemoveMoney(Config.MoneyType, Config.LicensePrice)
            licenseTable[Config.WeaponMetadataName] = true
            Player.Functions.SetMetaData('licences', licenseTable)
           if Config.LicenseReceive == true then
               local info = {}
                   info.firstname = Player.PlayerData.charinfo.firstname
                   info.lastname = Player.PlayerData.charinfo.lastname
                   info.birthdate = Player.PlayerData.charinfo.birthdate
           if Config.Inventory == "qb" or Config.Inventory == "lj" then
               Player.Functions.AddItem(Config.WeaponLicenseItemName, 1, nil, info)
               TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WeaponLicenseItemName], 'add')
           elseif Config.Inventory == "ox" then
               exports.ox_inventory:AddItem(src, Config.WeaponLicenseItemName, 1, info)
            end
        end
        Notificationsv(src, {Config.Lang['header_text']}, Config.Lang['you_have_money'], 'success')
    else
        Notificationsv(src, {Config.Lang['header_text']}, Config.Lang['you_no_money'], 'error')
    end
end
end)

RegisterServerEvent('c-weaponlicense:server:givelicenseitem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.MoneyType == "Bank" or Config.MoneyType == 'Bank' then
        if Player.PlayerData.money.bank >= Config.LicenseitemPrice then
            Player.Functions.RemoveMoney(Config.MoneyType, Config.LicenseitemPrice)
            local info = {}
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            if Config.Inventory == "qb" or Config.Inventory == "lj" then
                Player.Functions.AddItem(Config.WeaponLicenseItemName, 1, nil, info)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WeaponLicenseItemName], 'add')
            elseif Config.Inventory == "ox" then
                exports.ox_inventory:AddItem(src, Config.WeaponLicenseItemName, 1, info)
          end
            Notificationsv(src, {Config.Lang['header_text']}, Config.Lang['you_have_money2'], 'error')
        else
            Notificationsv(src, {Config.Lang['header_text']}, Config.Lang['you_no_money2'], 'error')
         end
    elseif Config.MoneyType == "Cash" or Config.MoneyType == 'Cash' then
        if Player.PlayerData.money.cash >= Config.LicenseitemPrice then
            Player.Functions.RemoveMoney(Config.MoneyType, Config.LicenseitemPrice)
            local info = {}
                info.firstname = Player.PlayerData.charinfo.firstname
                info.lastname = Player.PlayerData.charinfo.lastname
                info.birthdate = Player.PlayerData.charinfo.birthdate
                if Config.Inventory == "qb" or Config.Inventory == "lj" then
                    Player.Functions.AddItem(Config.WeaponLicenseItemName, 1, nil, info)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.WeaponLicenseItemName], 'add')
                elseif Config.Inventory == "ox" then
                    exports.ox_inventory:AddItem(src, Config.WeaponLicenseItemName, 1, info)
                 end
                 Notificationsv(src, {Config.Lang['header_text']}, Config.Lang['you_have_money2'], 'error')
             else
                 Notificationsv(src, {Config.Lang['header_text']}, Config.Lang['you_no_money2'], 'error')
              end
           end
       end)

QBCore.Functions.CreateCallback('c-weaponlicense:server:bancheckstatus', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local bancheck = Player.PlayerData.metadata[Config.Metadata.Banned]

    if bancheck then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('c-weaponlicense:server:grantedcheckstatus', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local grantedcheck = Player.PlayerData.metadata[Config.Metadata.Granted]

    if grantedcheck then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('c-weaponlicense:server:licensecheckstatus', function(source, cb)
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
        if args[2] == "ban" or args[2] == "Ban" or args[2] == "BAN" then
        if Player.PlayerData.job.type == 'leo' and Player.PlayerData.job.grade.level >= Config.LicenseBanRank then
            if Config.RemoveLicense == true then
                licenseTable.weapon = false
                SearchedPlayer.Functions.SetMetaData('licences', licenseTable) 
             end
                SearchedPlayer.Functions.SetMetaData('licensebanned', true)
                           Notificationsv(SearchedPlayer.PlayerData.source, {Config.Lang['header_text']}, Config.Lang['you_get_banned'])
                           Notificationsv(src, {Config.Lang['header_text']}, Config.Lang['you_just_banned'], 'error')
                       else
                           Notificationsv(src, {Config.Lang['header_text']}, Config.Lang['rank_not_high'], 'error')
                        end
                elseif args[2] == "unban" or args[2] == "Unban" or args[2] == "UNBAN" then
                    if Player.PlayerData.job.type == 'leo' and Player.PlayerData.job.grade.level >= Config.LicenseUnBanRank then
                        SearchedPlayer.Functions.SetMetaData('licensebanned', false)
                           Notificationsv(SearchedPlayer.PlayerData.source, {Config.Lang['header_text']}, Config.Lang['you_get_unbanned'])
                           Notificationsv(src, {Config.Lang['header_text']}, Config.Lang['you_just_unbanned'], 'error')
                       else
                           Notificationsv(src, {Config.Lang['header_text']}, Config.Lang['rank_not_high'], 'error')
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
                           Notificationsv(SearchedPlayer.PlayerData.source, {Config.Lang['header_text']}, Config.Lang['you_get_granted'], 'error')
                           Notificationsv(src, {Config.Lang['header_text']}, Config.Lang['you_just_granted'], 'success')
                       else
                           Notificationsv(src, {Config.Lang['header_text']}, Config.Lang['rank_not_high'], 'error')
                        end
                elseif args[2] == "ungrant" then
                    if Player.PlayerData.job.type == 'leo' and Player.PlayerData.job.grade.level >= Config.UnGrantRank then
                    SearchedPlayer.Functions.SetMetaData('grantedlicense', false)
                           Notificationsv(SearchedPlayer.PlayerData.source, {Config.Lang['header_text']}, Config.Lang['you_get_ungranted'], 'inform')
                           Notificationsv(src, {Config.Lang['header_text']}, Config.Lang['you_just_ungranted'], 'success')
                       else
                           Notificationsv(src, {Config.Lang['header_text']}, Config.Lang['rank_not_high'], 'error')
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
                    Notificationsv(src, {Config.Lang['header_text']}, Config.Lang['you_are'], 'inform')
                elseif bannedcheck == false then
                    Notificationsv(src, {Config.Lang['header_text']}, Config.Lang['you_are_not'], 'error')
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
                    if grantedcheck == true then
                        Notificationsv(src, {Config.Lang['header_text']}, Config.Lang['you_are_granted'], 'inform')
                    elseif grantedcheck == false then
                        Notificationsv(src, {Config.Lang['header_text']}, Config.Lang['you_are_not_granted'], 'error')
                        end
                    end)
                 end
              end