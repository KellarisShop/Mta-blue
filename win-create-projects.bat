@echo off

rem óñòàíîâêà SDK Äèñêîðäà
utils\premake5.exe install_discord

rem Update CEF eventually
utils\premake5.exe install_cef

rem Update Unifont
utils\premake5.exe install_unifont

rem Generate solutions
utils\premake5.exe vs2022

rem Create a shortcut to the solution - http://superuser.com/questions/392061/how-to-make-a-shortcut-from-cmd
set SCRIPTFILE="%TEMP%\CreateMyShortcut.vbs"
(
  echo Set oWS = WScript.CreateObject^("WScript.Shell"^)
  echo sLinkFile = oWS.ExpandEnvironmentStrings^("MTASA.sln - Shortcut.lnk"^)
  echo Set oLink = oWS.CreateShortcut^(sLinkFile^)
  echo oLink.TargetPath = oWS.ExpandEnvironmentStrings^("%~dp0\Build\MTASA.sln"^)
  echo oLink.Save
) 1>%SCRIPTFILE%
cscript //nologo %SCRIPTFILE%
del /f /q %SCRIPTFILE%

if %0 == "%~0" pause
