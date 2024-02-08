Config = Config or {}

Config.NotifyType = 'qb' -- [qb] or [Okok] or [ox] or [mythic]
Config.Inventory = 'qb' -- [qb] or [lj] or [ox]
Config.Target = 'qb' -- [qb] or [ox]

Config.UseGrant = true -- If set true then people must be granted this before being able to buy a firearms license
Config.GrantRank = 2 -- The police grade required to grant someone the ability to get a weapon license 
Config.UnGrantRank = 2 -- The police grade required to ungrant someone the ability to get a weapon license 

Config.RemoveLicense = true -- If set true when a player is banned from getting a firearm license if they have a firearm license still active it will then be removed
Config.LicenseBan = true -- If set true players can be banned or unbanned from being able to get a weapon license
Config.LicenseBanRank = 2 -- The police grade required to ban someone from getting a weapon license
Config.LicenseUnBanRank = 2 -- The police grade required to unban someone from getting a weapon license
Config.LicensePrice = 100000 -- amount = to dollars how much it will cost when buying a weapon license
Config.LicenseitemPrice = 10000 -- amount = to dollars -- this is for buying the license item if you have lost it 

Config.SelfCheck = true -- If set true players can check with /weaponbanned and it will tell you if you are banned or not also you can do /weapongranted and it will tell you if you are granted to have weapon license or not

Config.RequiredItem = true -- If set true they must bring an item when buying a weapon license to prove who they are
Config.RequiredItemName = "id_card" -- The item name of your idencation item default should be (id_card)

Config.WeaponLicenseItemName = "weaponlicense" -- the item name of your weapon license default should be (weaponlicense)

Config.PedSettings = {
    label = "Buy Weapon license",
    icon = "fa-solid fa-cart-shopping",
    label2 = "Request Weapon license Card",
    icon2 = "fa-solid fa-cart-shopping",
    Model = `s_m_m_armoured_01`,
    Scenario = 'WORLD_HUMAN_STAND_IMPATIENT'
}

Config.ContextMenu = {
    header = 'Ammunation Shop',
    text = 'Do you want to buy a firearms license for $',
}

Config.UseBlip = true -- If set true a blip will be placed at every store with the coords below
Config.Stores = { -- Gun Store
    { x = 17.3360,    y = -1109.0836,  z = 29.7970,  h = 247.1972, blipname = "Ammunation license Manager", blipsprite = 110, blipcolor = 0, blipscale = 0.6 },
    { x = 813.9067,   y = -2153.7947,  z = 29.6190,  h = 90.7276,  blipname = "Ammunation license Manager", blipsprite = 110, blipcolor = 0, blipscale = 0.6 },
    { x = -1308.3213, y = -389.7500,   z = 36.6958,  h = 165.3118, blipname = "Ammunation license Manager", blipsprite = 110, blipcolor = 0, blipscale = 0.6 },
    { x = 250.2141,   y = -45.2953,    z = 69.9411,  h = 161.6698, blipname = "Ammunation license Manager", blipsprite = 110, blipcolor = 0, blipscale = 0.6 },
    { x = 2571.6731,  y = 297.6295,    z = 108.7350, h = 88.8301,  blipname = "Ammunation license Manager", blipsprite = 110, blipcolor = 0, blipscale = 0.6 },
    { x = 1693.5804,  y = 3754.7388,   z = 34.7054,  h = 314.0224, blipname = "Ammunation license Manager", blipsprite = 110, blipcolor = 0, blipscale = 0.6 },
    { x = -330.5937,  y = 6078.6709,   z = 31.4548,  h = 309.6658, blipname = "Ammunation license Manager", blipsprite = 110, blipcolor = 0, blipscale = 0.6 },
    { x = -3170.2866, y = 1082.8831,   z = 20.8388,  h = 333.5304, blipname = "Ammunation license Manager", blipsprite = 110, blipcolor = 0, blipscale = 0.6 },
    { x = -1118.2871, y = 2693.3999,   z = 18.5542,  h = 311.5433, blipname = "Ammunation license Manager", blipsprite = 110, blipcolor = 0, blipscale = 0.6 },
    { x = -665.9783,  y = -938.7447,   z = 21.8292,  h = 266.9340, blipname = "Ammunation license Manager", blipsprite = 110, blipcolor = 0, blipscale = 0.6 },
    { x = 846.1522,   y = -1030.1340,  z = 27.1949,  h = 92.5500,  blipname = "Ammunation license Manager", blipsprite = 110, blipcolor = 0, blipscale = 0.6 }
    -- you can add more coords below
}

Config.Lang = {
    ['canceled'] = 'Canceled',
    ['no_id_card'] = 'You do not have the right identification please get an ID card to verify who you are',
    ['has_id_card'] = 'Your identification has been verified you will be allowed to buy a firearms license',
    ['header_text'] = 'Ammunation Shop',
    ['progressbar_text'] = 'Checking Credentials',
    ['you_have_money'] = 'You have just purchased a firearms license for $100,000',
    ['you_no_money'] = 'You dont have enough money in your bank to buy a firearms license for $100,000',
    ['firearm_banned'] = 'You are banned from having a weapon license. Contact police if you wish to remove this ban',
    ['you_have_already'] = 'You already have a firearms license',
    ['you_dont_have'] = 'You need to have a firearms license',
    ['you_have_money2'] = 'You have just purchased a copy of your firearms license item for $10,000',
    ['you_no_money2'] = 'You dont have enough money in your bank to buy a copy of a firearms license item for $10,000',
    ['you_just_granted'] = 'You have just granted someone the ability to buy a weapon license',
    ['you_just_ungranted'] = 'You have just ungranted someone the ability to buy a weapon license',
    ['you_just_banned'] = 'You have just banned someone from buying a weapon license',
    ['you_just_unbanned'] = 'You have just unbanned someone from buying a weapon license',
    ['granted_false'] = 'You must talk to a police officer about getting granted a firearm then once you have been granted you can buy one',
    ['you_get_granted'] = 'You have just been granted a the ability to buy a weapon license. Head down to one of your nearest gun stores to buy one',
    ['you_get_ungranted'] = 'You have just been ungranted the ability to buy a weapon license.',
    ['you_get_unbanned'] = 'You have just been unbanned from buying a weapon license',
    ['you_get_banned'] = 'You have just been banned from buying a weapon licenese talk to an officer about being unbanned',
    ['you_are'] = 'You are banned from getting a firearm license. Talk to an officer about being unbanned',
    ['you_are_not'] = 'You are not banned from getting a firearm license. Head down to one of your nearest gun stores to buy a firearm license',
    ['you_are_granted'] = 'You are granted to get a firearm license. Head down to one of your nearest gun stores to buy a firearm license',
    ['you_are_not_granted'] = 'You are not granted to get a firearm license. Talk to an officer about being granted permission',
    ['rank_not_high'] = 'You are not a high enough rank to use this command'
}