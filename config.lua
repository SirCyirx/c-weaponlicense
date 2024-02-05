Config = Config or {}

Config.NotifyType = 'ox' -- [qb] or [Okok] or [ox] or [mythic]
Config.Inventory = 'qb' -- [qb] or [lj]

Config.LicenseBanRank = 2
Config.LicenseUnBanRank = 2
Config.LicensePrice = 100000 -- amount = to dollars

Config.RequiredItem = true
Config.RequiredItemName = "id_card"

Config.WeaponLicenseWeaponLicenseItemName = "weaponlicense"

Config.TargetSettings = {
    label = "Buy firearm license",
    icon = "fa-solid fa-cart-shopping",
}

Config.ContextMenu = {
    header = 'Ammunation Shop',
    text = 'Do you want to buy a firearms license for $',
}

Config.UseBlip = false -- If set true a blip will be placed at every store with the coords below
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
    ['you_have_already'] = 'You already have a firearms license'
}