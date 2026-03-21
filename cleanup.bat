:: names
set mod_cs=Enemy Spells
set map_cs=%mod_cs% Demo
set mart_cs=%mod_cs% Mart

:: path of DS installation
set ds=%DungeonSiege%

:: Cleanup resources so as not to confuse Siege Editor
del "%ds%\Resources\%mod_cs%.dsres"
del "%ds%\Resources\%mod_cs% - *.dsres"
del "%ds%\Maps\%map_cs%.dsmap"
del "%ds%\Resources\%map_cs%.dsres"
del "%ds%\Maps\%mart_cs%.dsmap"
del "%ds%\Resources\%mart_cs%.dsres"
