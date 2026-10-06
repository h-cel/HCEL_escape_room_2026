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

## Projectstructuur (ook voor Claude Code)
- `Mission Control.dc.html` — het volledige spel in één bestand: template bovenaan, logica in
  `<script type="text/x-dc">` onderaan (`class Component`, `STEPS` = alle vragen, teksten en leeshulp).
  Draait rechtstreeks in de browser via `support.js`; geen build-stap. Alle styling staat inline.
- `instellingen.js` — speltijd, schermschaal, vragen aan/uit, studiegebieden, verbrande zone.
  Gaat voor op de `data-props`-defaults in het spelbestand.
- Satellietbeelden: `.image-slots.state.json` (base64, sleutels `eo-<vraag>`). Overige beelden in `uploads/`.
- `support.js`, `image-slot.js`, `_ds/` — runtime en stijlen; niet aanpassen.
- localStorage: `eo-state-v1` (lopend spel), `eo-board-v1` (scorebord), `eo-study-v1`, `eo-refzone-v1`.
- Lokaal testen: open via een lokale server (bv. `python -m http.server`), niet via file://,
  anders laden de satellietbeelden niet. De kiosk-starters regelen dit zelf.
- Repo: github.com/jarovdnb/HCEL_escape_room, branch `main`.
