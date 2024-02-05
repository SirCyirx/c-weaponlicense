# C-Buylicense
[Discord](https://discord.gg/YvThXdz59G)


# Preview
[Video](https://streamable.com/cxf3oy)
# Feature
- New way to buy a weapon license
- Lots of config options
- Ban and unban people from being able to buy a weapon license
- Optimized at 0.00ms idle and 0.01ms while in use
- Drag and drop
- Open Source

# Installation
1. Download From [github](https://github.com/SirCyirx/C-BuyLicense)
2. Rename The Folder From c-buylicense-main to c-buylicense.
3. Put The Folder In Your Resources Folder.
4. use this path [qb]/qb-core/server/player.lua and put this line any where in between line 111 - 138
```lua
PlayerData.metadata['firearmban'] = PlayerData.metadata['firearmban'] or false
```
5. Restart Your Server.

# Dependencies
1. [qb-core](https://github.com/qbcore-framework/qb-core)
2. [qb-inventory](https://github.com/qbcore-framework/qb-inventory/releases/tag/v1) or [lj-inventory](https://github.com/loljoshie/lj-inventory/releases/tag/1.2)
3. [ox_lib](https://github.com/overextended/ox_lib/releases) 
4. [qb-target](https://github.com/qbcore-framework/qb-target)




Put this into your cfg in this in order
```
ensure ox_lib
ensure qb-core
ensure qb-inventory or lj-inventory
ensure qb-target
ensure c-buylicense
```

# Commands
- /firearmban id -- this will stop that person from being able to buy a weapon license again until the ban has been removed. this also removes any weapon license that they have
- /removefirearmban id -- this will unban who ever gets banned from /firearmban and then they will be allowed to buy a weapon license again