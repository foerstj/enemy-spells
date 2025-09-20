:: names
set mod=enemy-spells
set mod_cs=Enemy Spells
set map=%mod%-demo
set map_cs=%mod_cs% Demo

:: path of Bits dir
set bits=%~dp0.
:: path of DS installation
set ds=%DungeonSiege%
:: path of TankCreator
set tc=%TankCreator%

set year=2025
set copyright=CC-BY-SA %year%
set author=Johannes Förstner
set title=%mod_cs%

:: Compile resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\contentdb\templates\%mod%" "%tmp%\Bits\world\contentdb\templates\%mod%" /S
robocopy "%bits%\world\global\effects" "%tmp%\Bits\world\global\effects" /S %mod%-*.gas
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%mod_cs%.dsres" -copyright "%copyright%" -title "%map_cs%" -author "%author%"
if %errorlevel% neq 0 pause

:: Compile demo map file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\maps\%map%" "%tmp%\Bits\world\maps\%map%" /E
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%.dsmap" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause

:: Compile demo map resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\contentdb\templates\%map%" "%tmp%\Bits\world\contentdb\templates\%map%" /S
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%.dsres" -copyright "%copyright%" -title "%map_cs%" -author "%author%"
if %errorlevel% neq 0 pause

:: Cleanup
rmdir /S /Q "%tmp%\Bits"
