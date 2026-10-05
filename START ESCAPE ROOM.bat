@echo off
rem ============================================================
rem  ESCAPE ROOM - BOSBRAND GIRONDE
rem  Start het spel in kioskmodus (geen adresbalk, geen tabs).
rem  Zet dit bestand in DEZELFDE map als "Mission Control.dc.html".
rem  Afsluiten: Alt+F4
rem ============================================================

set SPEL=%~dp0Mission Control.dc.html

if not exist "%SPEL%" (
  echo.
  echo  FOUT: "Mission Control.dc.html" staat niet in deze map.
  echo  Zet dit .bat-bestand naast het spelbestand.
  echo.
  pause
  exit /b
)

rem --- Chrome zoeken op de gebruikelijke plaatsen ---
set BROWSER=
if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" set BROWSER=%ProgramFiles%\Google\Chrome\Application\chrome.exe
if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" set BROWSER=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe
if exist "%LocalAppData%\Google\Chrome\Application\chrome.exe" set BROWSER=%LocalAppData%\Google\Chrome\Application\chrome.exe

rem --- Geen Chrome? Dan Edge, die kent dezelfde schakelaars ---
if "%BROWSER%"=="" if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" set BROWSER=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe
if "%BROWSER%"=="" if exist "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe" set BROWSER=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe

if "%BROWSER%"=="" (
  echo.
  echo  FOUT: Chrome of Edge niet gevonden.
  echo  Open het spel handmatig en druk F11 voor volledig scherm.
  echo.
  pause
  exit /b
)

rem Apart profiel: bewaart het scorebord, raakt de gewone browser niet aan
start "" "%BROWSER%" --kiosk --allow-file-access-from-files --disable-pinch --overscroll-history-navigation=0 --user-data-dir="%~dp0kiosk-profiel" "file:///%SPEL:\=/%"
exit
