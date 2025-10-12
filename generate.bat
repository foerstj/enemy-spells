:: path of Bits dir
set bits=%~dp0.

pushd "%GasPy%"
venv\Scripts\python -m jinja gaspy\jinja\enemy-spells world\contentdb\templates\enemy-spells --bits "%bits%"
if %errorlevel% neq 0 pause
popd
