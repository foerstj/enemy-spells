:: names
set mod=enemy-spells
set mod_cs=Enemy Spells
set map=%mod%-demo
set map_cs=%mod_cs% Demo
set mart=%mod%-mart
set mart_cs=%mod_cs% Mart

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

:: Compile Vanilla resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" /S *-v-* /xf *.psd
robocopy "%bits%\world\contentdb\templates\%mod%" "%tmp%\Bits\world\contentdb\templates\%mod%" /S base-*
robocopy "%bits%\world\contentdb\templates\%mod%" "%tmp%\Bits\world\contentdb\templates\%mod%" /S *-v-*
robocopy "%bits%\world\global\effects" "%tmp%\Bits\world\global\effects" /S %mod%-v-*.gas
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\Resources\%mod_cs% - Vanilla Attacks.dsres" -copyright "%copyright%" -title "%mod_cs%" -author "%author%"
if %errorlevel% neq 0 pause
:: Compile LoA resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" /S *-loa-* /xf *.psd
robocopy "%bits%\world\contentdb\templates\%mod%" "%tmp%\Bits\world\contentdb\templates\%mod%" /S base-*
robocopy "%bits%\world\contentdb\templates\%mod%" "%tmp%\Bits\world\contentdb\templates\%mod%" /S *-loa-*
robocopy "%bits%\world\global\effects" "%tmp%\Bits\world\global\effects" /S %mod%-loa-*.gas
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\Resources\%mod_cs% - LoA Attacks.dsres" -copyright "%copyright%" -title "%mod_cs%" -author "%author%"
if %errorlevel% neq 0 pause

:: Compile demo map file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\maps\%map%" "%tmp%\Bits\world\maps\%map%" /E
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\Maps\%map_cs%.dsmap" -copyright "%copyright%" -title "%map_cs%" -author "%author%"
if %errorlevel% neq 0 pause
:: Compile demo map resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\contentdb\templates\%map%" "%tmp%\Bits\world\contentdb\templates\%map%" /S
robocopy "%bits%\world\contentdb\templates\minibits" "%tmp%\Bits\world\contentdb\templates\minibits" /S
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\Resources\%map_cs%.dsres" -copyright "%copyright%" -title "%map_cs%" -author "%author%"
if %errorlevel% neq 0 pause

:: Compile mart map file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\maps\%mart%" "%tmp%\Bits\world\maps\%mart%" /E
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\Maps\%mart_cs%.dsmap" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause
:: Compile mart map resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\contentdb\templates\%mart%" "%tmp%\Bits\world\contentdb\templates\%mart%" /S
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\Resources\%mart_cs%.dsres" -copyright "%copyright%" -title "%mart_cs%" -author "%author%"
if %errorlevel% neq 0 pause

:: Cleanup
rmdir /S /Q "%tmp%\Bits"
