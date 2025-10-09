:: names
set mod=enemy-spells
set mod_cs=Enemy Spells
set map=%mod%-demo
set map_cs=%mod_cs% Demo

:: path of DS installation
set ds=%DungeonSiege%

:: Cleanup resources so as not to confuse Siege Editor
del "%ds%\Resources\%mod_cs%.dsres"
del "%ds%\Resources\%mod_cs% - *.dsres"
del "%ds%\Maps\%map_cs%.dsmap"
del "%ds%\Resources\%map_cs%.dsres"
