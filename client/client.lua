local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function() 
    exports['qb-target']:AddTargetModel('s_m_m_armoured_01', {
    options = {
            {
              type = 'client',
              icon = Config.TargetSettings.icon,
              label = Config.TargetSettings.label,
              event = 'c-buylicense:client:start',
         },
    distance = 2.5
        }
     })
end)

RegisterNetEvent('c-buylicense:client:start', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"idle"})
    QBCore.Functions.Progressbar('gunstorebuy', Config.Lang['progressbar_text'], 2500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
      if Config.RequiredItem == true then
      if Config.Inventory == 'qb' then
          local hasidqb = QBCore.Functions.HasItem(Config.RequiredItemName, 1)
          if hasidqb == true then
            TriggerEvent('c-buylicense:client:bancheck')
          elseif hasidqb == false then
            if Config.NotifyType == 'qb' then
              QBCore.Functions.Notify(Config.Lang['no_id_card'], 'error', 3500)
              elseif Config.NotifyType == 'Okok' then
                exports['okokNotify']:Alert(Config.Lang['header_text'], Config.Lang['no_id_card'], 3500, 'error')
              elseif Config.NotifyType == 'ox' then
                lib.notify({ title = Config.Lang['header_text'], description = Config.Lang['no_id_card'], type = 'error'})
              elseif Config.NotifyType == 'mythic' then
                exports['mythic_notify']:DoHudText('error', Config.Lang['no_id_card'], { ['background-color'] = '#ffffff', ['color'] = '#000000' })
              end
            end
          elseif Config.Inventory == 'lj' then
              local hasidlj = exports['lj-inventory']:HasItem(Config.RequiredItemName, 1)
             if hasidlj == true then
              TriggerEvent('c-buylicense:client:bancheck')
            elseif hasidlj == false then
              if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify(Config.Lang['no_id_card'], 'error', 3500)
                elseif Config.NotifyType == "Okok" then
                  exports['okokNotify']:Alert(Config.Lang['header_text'], Config.Lang['no_id_card'], 3500, 'error')
                elseif Config.NotifyType == "ox" then
                  lib.notify({ title = Config.Lang['header_text'], description = Config.Lang['no_id_card'], type = 'error'})
                elseif Config.NotifyType == "mythic" then
                  exports['mythic_notify']:DoHudText('error', Config.Lang['no_id_card'], { ['background-color'] = '#ffffff', ['color'] = '#000000' })
                end
                end
            end
          elseif Config.RequiredItem == false then
            TriggerEvent('c-buylicense:client:bancheck')
          end
  end, function() 
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            if Config.NotifyType == 'qb' then
              QBCore.Functions.Notify(Config.Lang['canceled'], 'error', 3500)
              elseif Config.NotifyType == 'Okok' then
                exports['okokNotify']:Alert(Config.Lang['header_text'], Config.Lang['canceled'], 3500, 'error')
              elseif Config.NotifyType == 'ox' then
                lib.notify({ title = Config.Lang['header_text'], description = Config.Lang['canceled'], type = 'error'})
              elseif Config.NotifyType == 'mythic' then
                exports['mythic_notify']:DoHudText('error', Config.Lang['canceled'], { ['background-color'] = '#ffffff', ['color'] = '#000000' })
              end
            end)
      end)

      RegisterNetEvent('c-buylicense:client:bancheck', function()
        QBCore.Functions.TriggerCallback("c-buylicense:server:bancheckstatus", function(banned)
            if banned == false then
              TriggerEvent('c-buylicense:client:licensecheck')
            elseif banned == true then
              if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify(Config.Lang['firearm_banned'], 'error', 3500)
                elseif Config.NotifyType == 'Okok' then
                  exports['okokNotify']:Alert(Config.Lang['header_text'], Config.Lang['firearm_banned'], 3500, 'error')
                elseif Config.NotifyType == 'ox' then
                  lib.notify({ title = Config.Lang['header_text'], description = Config.Lang['firearm_banned'], type = 'error'})
                elseif Config.NotifyType == 'mythic' then
                  exports['mythic_notify']:DoHudText('error', Config.Lang['firearm_banned'], { ['background-color'] = '#ffffff', ['color'] = '#000000' })
                end
            end
        end)
        end)

      RegisterNetEvent('c-buylicense:client:licensecheck', function()
            QBCore.Functions.TriggerCallback("c-buylicense:server:licensecheckstatus", function(hasLicense)
                if hasLicense == false then
                  TriggerEvent('c-buylicense:start2')
                elseif hasLicense == true then
                  if Config.NotifyType == 'qb' then
                    QBCore.Functions.Notify(Config.Lang['you_have_already'], 'error', 3500)
                    elseif Config.NotifyType == 'Okok' then
                      exports['okokNotify']:Alert(Config.Lang['header_text'], Config.Lang['you_have_already'], 3500, 'error')
                    elseif Config.NotifyType == 'ox' then
                      lib.notify({ title = Config.Lang['header_text'], description = Config.Lang['you_have_already'], type = 'error'})
                    elseif Config.NotifyType == 'mythic' then
                      exports['mythic_notify']:DoHudText('error', Config.Lang['you_have_already'], { ['background-color'] = '#ffffff', ['color'] = '#000000' })
                    end
                end
            end)
            end)

RegisterNetEvent('c-buylicense:start2', function()
  local price = Config.LicensePrice
  if Config.NotifyType == 'qb' then
    QBCore.Functions.Notify(Config.Lang['has_id_card'], 'success', 3500)
    elseif Config.NotifyType == 'Okok' then
      exports['okokNotify']:Alert(Config.Lang['header_text'], Config.Lang['has_id_card'], 3500, 'success')
    elseif Config.NotifyType == 'ox' then
      lib.notify({ title = Config.Lang['header_text'], description = Config.Lang['has_id_card'], type = 'success'})
    elseif Config.NotifyType == 'mythic' then
      exports['mythic_notify']:DoHudText('error', Config.Lang['has_id_card'], { ['background-color'] = '#ffffff', ['color'] = '#000000' })
    end
        local alert = lib.alertDialog({
              header = Config.ContextMenu.header,
              content = Config.ContextMenu.text..price..'?',
              centered = true,
              cancel = true
          })
          if alert == "confirm" then
            TriggerServerEvent("c-buylicense:server:givelicense")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          elseif alert == "cancel" then
            if Config.NotifyType == 'qb' then
              QBCore.Functions.Notify(Config.Lang['canceled'], 'error', 3500)
              elseif Config.NotifyType == 'Okok' then
                exports['okokNotify']:Alert(Config.Lang['header_text'], Config.Lang['canceled'], 3500, 'error')
              elseif Config.NotifyType == 'ox' then
                lib.notify({ title = Config.Lang['header_text'], description = Config.Lang['canceled'], type = 'error'})
              elseif Config.NotifyType == 'mythic' then
                exports['mythic_notify']:DoHudText('error', Config.Lang['canceled'], { ['background-color'] = '#ffffff', ['color'] = '#000000' })
              end
           end
      end)


        CreateThread(function()
          RequestModel(`s_m_m_armoured_01`)
            while not HasModelLoaded(`s_m_m_armoured_01`) do
            Wait(1)
          end
          for key, coords in pairs(Config.Stores) do
            license = CreatePed(2, `s_m_m_armoured_01`, vector4(coords.x, coords.y, coords.z, coords.h))
            SetPedFleeAttributes(license, 0, 0)
            SetPedDiesWhenInjured(license, false)
            TaskStartScenarioInPlace(license, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
            SetPedKeepTask(license, true)
            SetBlockingOfNonTemporaryEvents(license, true)
            SetEntityInvincible(license, true)
            FreezeEntityPosition(license, true)
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
