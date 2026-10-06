# Escape Room — Satellite Mission: Bosbrand Gironde

Een digitale escape room over aardobservatie. Teams spelen een missie van het ESA-satellietnetwerk en
gebruiken echte Sentinel-beelden om een bosbrand in de Gironde (ten westen van Bordeaux) te
analyseren: eerst het risico inschatten, dan de brand volgen en tot slot de schade bepalen.

Ontwikkeld bij HCEL (UGent). Het spel draait volledig offline in de browser, zonder installatie of
build-stap.

## Spelverloop

| Fase | Inhoud | Satellieten |
| --- | --- | --- |
| **Toegang** | Hang de satellieten in de volgorde van lancering en kraak de 8-cijferige toegangscode. | — |
| **Deel 1 — Risicoanalyse** | Vier factoren beoordelen: vegetatie, oppervlaktetemperatuur, wind, bodemvocht. | Sentinel-1, -2, -3 |
| **Deel 2 — Fire monitoring** | Brandhaarden aanduiden en de verspreidingsrichting bepalen. | Sentinel-2 |
| **Deel 3 — Damage assessment** | De verbrande zone intekenen en de luchtkwaliteit beoordelen. | Sentinel-2, Sentinel-5P |
| **Eindrapport** | Fire Response Report en een plaats op het scorebord. | — |

Bij elke vraag kiest het team eerst de juiste satelliet en beantwoordt het dan de vraag op het beeld.
Een leeshulp (boekicoon) legt uit hoe je het beeld leest. Foute antwoorden kosten speeltijd. Wie
vastzit, kan de spelleider erbij roepen (bel drie keer rinkelen).

## Snel starten (kioskmodus)

1. Download of kloon de repo naar een vaste map op de spelcomputer.
2. Start het spel:
   - **Windows:** dubbelklik `START ESCAPE ROOM.bat`. Afsluiten met **Alt+F4**.
   - **macOS:** dubbelklik `START ESCAPE ROOM.command`. De eerste keer: rechtermuisklik → **Open**.
     Afsluiten met **Cmd+Q**.

De starters zoeken zelf Chrome of Edge en openen het spel op volledig scherm, zonder adresbalk of
tabbladen. Ze gebruiken een apart browserprofiel (`kiosk-profiel/`), zodat de gewone browser
onaangeroerd blijft.

## Instellingen

Alle instellingen staan in [`instellingen.js`](instellingen.js). Open het bestand met Kladblok of
TextEdit, pas een waarde aan, bewaar het en herstart het spel.

| Instelling | Betekenis |
| --- | --- |
| `minuten` | Speeltijd in minuten (standaard 45). |
| `schermSchaal` | Grootte van het scherm in %; `0` = automatisch. Handig op kleine laptops. |
| `instelmodus` | `true` toont de resetknop en laat je studiegebieden en de verbrande zone tekenen. Zet op `false` tijdens het spel. |
| `vraag…` | Zet afzonderlijke vragen aan (`true`) of uit (`false`). |
| `studiegebieden` | Het blauwe kader per beeld (fracties links, boven, rechts, onder). |
| `schaalKm`, `schaalBalkPct` | Schaalbalk voor de vraag over de oppervlakte. |
| `juisteZone`, `bufferKm` | De correcte verbrande zone en de toegestane marge eromheen. |
| `zoneInstellen` | `true` om de juiste zone opnieuw te tekenen. |

**Studiegebied of zone opnieuw instellen:** zet `instelmodus: true`, teken het kader of de zone in
het spel, kopieer de getoonde code naar `studiegebieden` of `juisteZone` in `instellingen.js` en zet
de instelmodus weer uit.

## Scorebord en opgeslagen gegevens

Het spel bewaart alles in de `localStorage` van de browser:

| Sleutel | Inhoud |
| --- | --- |
| `eo-state-v1` | Het lopende spel (overleeft een herstart van de browser). |
| `eo-board-v1` | Het scorebord. |
| `eo-study-v1` | Lokaal getekende studiegebieden. |
| `eo-refzone-v1` | Lokaal getekende verbrande zone. |

Met de kiosk-starters staan deze gegevens in de map `kiosk-profiel/` naast de starter. **Die map
verwijderen wist het scorebord.** De map staat in `.gitignore` en komt dus nooit in de repo.

## Lokaal ontwikkelen

Open het spel via een lokale webserver, niet via `file://`; anders laden de satellietbeelden niet:

```bash
python -m http.server
# open http://localhost:8000/Mission%20Control.dc.html
```

### Projectstructuur

| Bestand / map | Inhoud |
| --- | --- |
| `Mission Control.dc.html` | Het volledige spel: template bovenaan, logica onderaan in `<script type="text/x-dc">` (`STEPS` bevat alle vragen, teksten en leeshulp). Styling staat inline. |
| `instellingen.js` | Instellingen voor de spelleider; deze gaan voor op de standaardwaarden in het spelbestand. |
| `.image-slots.state.json` | Satellietbeelden per vraag (base64, sleutels `eo-<vraag>`). |
| `uploads/` | Overige beelden (logo's, achtergronden, eindschermen). |
| `support.js`, `image-slot.js`, `_ds/` | Runtime en stijlen. Niet aanpassen. |
| `START ESCAPE ROOM.bat` / `.command` | Kiosk-starters voor Windows en macOS. |

<details>
<summary>Voor de spelleider: oplossing van het toegangsslot</summary>

De code is de oprichtingsdatum van ESA: **30 mei 1975** → `30051975`.

</details>

## Credits

Satellietbeelden: Copernicus Sentinel-data (ESA). Ontwikkeld door HCEL, Universiteit Gent.
