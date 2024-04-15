RegisterNetEvent('c-weaponlicense:client:start', function()
  TriggerEvent('animations:client:EmoteCommandStart', {"idle"})
  QBCore.Functions.Progressbar('gunstorebuy', Config.Lang['progressbar_text'], 2500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
  }, {}, {}, {}, function()
    if Config.RequiredItem == true then
    if Config.Inventory == "qb" then
        local hasidqb = QBCore.Functions.HasItem(Config.RequiredItemName, 1)
        if hasidqb == true then
          if Config.LicenseBan == true then
            TriggerEvent('c-weaponlicense:client:bancheck')
            elseif Config.LicenseBan == false then
              TriggerEvent('c-weaponlicense:client:licensecheck')
            end
        else
          Notificationcl({Config.Lang['header_text']}, Config.Lang['no_id_card'], 'error')
          end
        elseif Config.Inventory == "lj" then
            local hasidlj = exports['lj-inventory']:HasItem(Config.RequiredItemName, 1)
           if hasidlj == true then
            if Config.LicenseBan == true then
            TriggerEvent('c-weaponlicense:client:bancheck')
            elseif Config.LicenseBan == false then
              TriggerEvent('c-weaponlicense:client:licensecheck')
            end
          else
            Notificationcl({Config.Lang['header_text']}, Config.Lang['no_id_card'], 'error')
              end
        elseif Config.Inventory == "ox" then
          if exports.ox_inventory:GetItem(source, Config.RequiredItemName, nil, false) then
           if Config.LicenseBan == true then
           TriggerEvent('c-weaponlicense:client:bancheck')
           elseif Config.LicenseBan == false then
             TriggerEvent('c-weaponlicense:client:licensecheck')
           end
          else
           Notificationcl({Config.Lang['header_text']}, Config.Lang['no_id_card'], 'error')
             end
          end
        elseif Config.RequiredItem == false then
          if Config.LicenseBan == true then
            TriggerEvent('c-weaponlicense:client:bancheck')
            elseif Config.LicenseBan == false then
              TriggerEvent('c-weaponlicense:client:licensecheck')
            end
        end
end, function()
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          Notificationcl({Config.Lang['header_text']}, Config.Lang['canceled'], 'error')
          end)
      end)

    RegisterNetEvent('c-weaponlicense:client:bancheck', function()
      QBCore.Functions.TriggerCallback("c-weaponlicense:server:bancheckstatus", function(banned)
          if banned == false then
            if Config.UseGrant == true then
            TriggerEvent('c-weaponlicense:client:grantedcheck')
            elseif Config.UseGrant == false then
              TriggerEvent('c-weaponlicense:client:licensecheck')
            end
          else
            Notificationcl({Config.Lang['header_text']}, Config.Lang['firearm_banned'], 'error')
            end
        end)
    end)

      RegisterNetEvent('c-weaponlicense:client:grantedcheck', function()
        QBCore.Functions.TriggerCallback("c-weaponlicense:server:grantedcheckstatus", function(granted)
            if granted == true then
              TriggerEvent('c-weaponlicense:client:licensecheck')
            else
              Notificationcl({Config.Lang['header_text']}, Config.Lang['granted_false'], 'error')
            end
        end)
    end)

    RegisterNetEvent('c-weaponlicense:client:licensecheck', function()
          QBCore.Functions.TriggerCallback("c-weaponlicense:server:licensecheckstatus", function(hasLicense)
              if hasLicense == false then
                TriggerEvent('c-weaponlicense:start2')
              else
                Notificationcl({Config.Lang['header_text']}, Config.Lang['you_have_already'], 'error')
            end
        end)
    end)

RegisterNetEvent('c-weaponlicense:start2', function()
Notificationcl({Config.Lang['header_text']}, Config.Lang['has_id_card'], 'inform')
      local alert = lib.alertDialog({
            header = Config.ContextMenu.header,
            content = Config.ContextMenu.text..Config.LicensePrice..'?',
            centered = true,
            cancel = true
        })
        if alert == "confirm" then
          TriggerServerEvent("c-weaponlicense:server:givelicense")
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        elseif alert == "cancel" then
          Notificationcl({Config.Lang['header_text']}, Config.Lang['canceled'], 'error')
         end
     end)

    RegisterNetEvent('c-weaponlicense:client:itemstart', function()
      TriggerEvent('animations:client:EmoteCommandStart', {"idle"})
      QBCore.Functions.Progressbar('gunstorebuyitem', Config.Lang['progressbar_text'], 2500, false, true, {
          disableMovement = true,
          disableCarMovement = true,
          disableMouse = false,
          disableCombat = true,
      }, {}, {}, {}, function()
        if Config.RequiredItem == true then
        if Config.Inventory == "qb" then
            local hasidqb = QBCore.Functions.HasItem(Config.RequiredItemName, 1)
            if hasidqb == true then
              TriggerEvent('c-weaponlicense:client:licensecheck2')
            else
              Notificationcl({Config.Lang['header_text']}, Config.Lang['no_id_card'], 'error')
                end
              end
            elseif Config.Inventory == "lj" then
                local hasidlj = exports['lj-inventory']:HasItem(Config.RequiredItemName, 1)
               if hasidlj == true then
                TriggerEvent('c-weaponlicense:client:licensecheck2')
              else
                Notificationcl({Config.Lang['header_text']}, Config.Lang['no_id_card'], 'error')
                  end
        elseif Config.Inventory == "ox" then
          if exports.ox_inventory:GetItem(source, Config.RequiredItemName, nil, false) then
             TriggerEvent('c-weaponlicense:client:licensecheck2')
          else
             Notificationcl({Config.Lang['header_text']}, Config.Lang['no_id_card'], 'error')
             end
            elseif Config.RequiredItem == false then
                TriggerEvent('c-weaponlicense:client:licensecheck2')
            end
    end, function()
              TriggerEvent('animations:client:EmoteCommandStart', {"c"})
              Notificationcl({Config.Lang['header_text']}, Config.Lang['canceled'], 'error')
              end)
          end)

        RegisterNetEvent('c-weaponlicense:client:licensecheck2', function()
          QBCore.Functions.TriggerCallback("c-weaponlicense:server:licensecheckstatus", function(hasLicense)
            if hasLicense == true then
               Notificationcl({Config.Lang['header_text']}, Config.Lang['id_verified'], 'error')
               TriggerServerEvent('c-weaponlicense:server:givelicenseitem')
           else
               Notificationcl({Config.Lang['header_text']}, Config.Lang['you_dont_have'], 'error')
            end
        end)
    end)

    CreateThread(function()
      if Config.Target == "qb" then
        exports['qb-target']:AddTargetModel(Config.PedSettings.Model, {
        options = {
                {
                  type = 'client',
                  icon = Config.PedSettings.icon,
                  label = Config.PedSettings.label,
                  event = 'c-weaponlicense:client:start',
          },{
                    type = 'client',
                    icon = Config.PedSettings.iconitem,
                    label = Config.PedSettings.labelitem,
                    event = 'c-weaponlicense:client:itemstart',
                  },
                },
                distance = 2.5
          })
            elseif Config.Target == "ox" then
              exports.ox_target:addModel(Config.PedSettings.Model, {label = Config.PedSettings.label, icon = Config.PedSettings.icon, event = 'c-weaponlicense:client:start'})
              exports.ox_target:addModel(Config.PedSettings.Model, {label = Config.PedSettings.labelitem, icon = Config.PedSettings.iconitem, event = 'c-weaponlicense:client:itemstart'})
            end
        end)

      CreateThread(function()
        RequestModel(Config.PedSettings.Model)
          while not HasModelLoaded(Config.PedSettings.Model) do
          Wait(1)
        end
        for key, coords in pairs(Config.Stores) do
          licenseped = CreatePed(2, Config.PedSettings.Model, vector4(coords.x, coords.y, coords.z, coords.h))
          SetPedFleeAttributes(licenseped, 0, 0)
          SetPedDiesWhenInjured(licenseped, false)
          TaskStartScenarioInPlace(licenseped, Config.PedSettings.Scenario, 0, true)
          SetPedKeepTask(licenseped, true)
          SetBlockingOfNonTemporaryEvents(licenseped, true)
          SetEntityInvincible(licenseped, true)
          FreezeEntityPosition(licenseped, true)
         end
     end)

     CreateThread(function()
      if Config.UseBlip == true then
      for k, coords in pairs(Config.Stores) do
          local licenseblip = AddBlipForCoord(vector3(coords.x, coords.y, coords.z))
          SetBlipSprite(licenseblip, coords.blipsprite)
          SetBlipScale(licenseblip, coords.blipscale)
          SetBlipColour(licenseblip, coords.blipcolor)
          SetBlipDisplay(licenseblip, 4)
          SetBlipAsShortRange(licenseblip, true)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(coords.blipname)
          EndTextCommandSetBlipName(licenseblip)
         end
      end
  end)