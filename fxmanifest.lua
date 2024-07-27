fx_version 'cerulean'
game 'gta5'
author 'SirCyrix'
description 'c-weaponlicense, A new way to buy a weapon license and the weapon license item'
version '1.3.3'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

lua54 'yes'