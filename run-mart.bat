:: names
set mod=enemy-spells
set map=%mod%-demo
set mart=%mod%-mart

:: path of Bits dir
set bits=%~dp0.
:: path of DS installation
set ds=%DungeonSiege%

:: Compile resource file
call "%bits%\build.bat" %*

::pause

:: Run it!
"%ds%\DSLOA.exe" nointro=true map=%mart%

:: Cleanup resources so as not to confuse Siege Editor
call "%bits%\cleanup.bat" %*
