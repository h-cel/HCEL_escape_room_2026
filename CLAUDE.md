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
- `instellingen.js` — zet `window.EO_INSTELLINGEN`; gaat voor op de `data-props`-defaults (tweaks)
  in het spelbestand. Bedoeld om door de spelleider in Kladblok/TextEdit te bewerken: houd het
  bestand eenvoudig, met Nederlandse commentaar per regel. Sleutels:
  - Spel: `minuten`, `schermSchaal` (% , 0 = auto), `instelmodus` (resetknop + tekenen studiegebieden),
    `toonStudiegebiedKaart` (kaartje linksonder bij elke vraag).
  - Tijdstraffen in seconden (0 = geen): `strafHintCode`, `strafFouteCode`, `strafHintSatelliet`,
    `strafFouteSatelliet`, `strafFouteRichting`, `strafFouteCel`; gelezen via `this.straf(naam, default)`,
    labels op het scherm (`…Label` in de render-data) volgen mee.
  - Vragen aan/uit: `vraagVegetatie`, `vraagTemperatuur`, `vraagWind`, `vraagBodem`,
    `vraagBrandhaarden`, `vraagRichting`, `vraagOppervlakte`, `vraagLucht` (= `prop` in `STEPS`).
  - `studiegebieden`: `"<key>:links,boven,rechts,onder ..."` als fracties 0–1, keys uit `STEPS`
    (fuel, lst, wind, soil, dir, air).
  - Verbrande zone: `schaalKm`, `schaalBalkPct`, `zoneInstellen`, `bufferKm`, `minZoneScore` (% om verder te mogen), `juisteZone`
    (`"u,v u,v ..."` als fracties van het beeld).
  Nieuwe tweak toevoegen: in `data-props` én in `instellingen.js` (zelfde naam), en in de README-tabel.
  Kaders/zone instellen: instelmodus aan, tekenen in het spel, gekopieerde code in `instellingen.js` plakken.
- Intro (fase `brief`): `briefStep` 0 = alarmscherm (`uploads/alert-vuur.webp`), 1 = uitleg + volgordepuzzel
  (`PARTS`, `PART_DECK`); stap-voor-stap verschijnen via `animation:eoRise … <delay>s both` (ook op het eindscherm).
- Satellietbeelden: `.image-slots.state.json` (base64, sleutels `eo-<vraag>`). Overige beelden in `uploads/`.
- `support.js`, `image-slot.js`, `_ds/` — runtime en stijlen; niet aanpassen.
- localStorage: `eo-state-v1` (lopend spel), `eo-board-v1` (scorebord), `eo-study-v1`, `eo-refzone-v1`.
- Lokaal testen: open via een lokale server (bv. `python -m http.server`), niet via file://,
  anders laden de satellietbeelden niet. De kiosk-starters regelen dit zelf.
- Repo: github.com/h-cel/HCEL_escape_room_2026, branch `main`.
