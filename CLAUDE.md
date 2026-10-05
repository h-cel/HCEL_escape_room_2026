# Project-instructies

## Kiosk-export op verzoek
Als de gebruiker vraagt om "een zip", "kiosk mode", of om het spel mee te nemen naar een computer:
roep `present_fs_item_for_download` op zonder pad (hele project). `START ESCAPE ROOM.bat` (Windows) en
`START ESCAPE ROOM.command` (macOS) staan al in de root en zoeken zelf Chrome of Edge; niets anders
voorbereiden. Geen lange uitleg meer over kioskmodus — die staat hieronder en is al eens gegeven.

Opstelling in één regel: uitpakken naar een vaste map, dubbelklik `START ESCAPE ROOM.bat` (Windows,
afsluiten met Alt+F4) of `START ESCAPE ROOM.command` (Mac, eerste keer rechtermuisklik → Open,
afsluiten met Cmd+Q).
Het scorebord zit in localStorage (`eo-board-v1`) in de map `kiosk-profiel` naast het .bat; die map
verwijderen wist het scorebord.

## Taal
Antwoord in het Nederlands.
