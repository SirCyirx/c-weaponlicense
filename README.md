# C-Buylicense
[Discord](https://discord.gg/YvThXdz59G)

# Preview OLD
[Video](https://streamable.com/r0r9gk)
# Feature
- New way to buy a weapon license
- Lots of config options
- Ban and unban people from being able to buy a weapon license. Conifg option
- Grant and ungrant people from getting a weapon license. Conifg option
- Optimized at 0.00ms idle and 0.01ms while in use
- Drag and drop
- Open Source

# Installation
1. Download From [github](https://github.com/SirCyirx/C-BuyLicense)
2. Rename The Folder From c-buylicense-main to c-buylicense.
3. Put The Folder In Your Resources Folder.
4. use this path [qb]/qb-core/server/player.lua and put this line any where in between line 111 - 138
```lua
PlayerData.metadata['blicensestatus'] = PlayerData.metadata['blicensestatus'] or false
```
```lua
PlayerData.metadata['glicensestatus'] = PlayerData.metadata['glicensestatus'] or false
```
5. Restart Your Server.

# Dependencies
1. [qb-core](https://github.com/qbcore-framework/qb-core)
2. [qb-inventory](https://github.com/qbcore-framework/qb-inventory/releases/tag/v1) or [lj-inventory](https://github.com/loljoshie/lj-inventory/releases/tag/1.2) or [ox_inventory](https://github.com/overextended/ox_inventory)
3. [ox_lib](https://github.com/overextended/ox_lib/releases) 
4. [qb-target](https://github.com/qbcore-framework/qb-target) or [ox_target](https://github.com/overextended/ox_target)


Put this into your cfg in this in order
```
ensure ox_lib
ensure qb-core
ensure qb-inventory or lj-inventory or ox_inventory
ensure qb-target or ox_target
ensure c-buylicense
```

# Commands
- /weaponban playerid   -- police can use this command to ban or unban from being able to buy a weapon license. Conifg option
- /weapongrant playerid -- police can use this command to grant someone to get a weapon license or ungrant someone from being able to get a weapon license. Conifg option
- /weapongranted        -- players can use this command to check if they have been granted the option to buy a weapon license
- /weaponbanned         -- players can use this command to check if they have been banned from buying a weapon license