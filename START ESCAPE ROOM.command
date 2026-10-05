#!/bin/bash
# ============================================================
#  ESCAPE ROOM - BOSBRAND GIRONDE  (macOS)
#  Start het spel in kioskmodus: geen adresbalk, geen tabs.
#  Zet dit bestand in DEZELFDE map als "Mission Control.dc.html".
#  Afsluiten: Cmd+Q
#
#  Eerste keer: rechtermuisklik op dit bestand -> Open -> Open.
#  Werkt dubbelklikken niet, voer dan eenmalig uit in Terminal:
#     chmod +x "START ESCAPE ROOM.command"
# ============================================================

MAP="$(cd "$(dirname "$0")" && pwd)"
SPEL="$MAP/Mission Control.dc.html"

if [ ! -f "$SPEL" ]; then
  echo ""
  echo "  FOUT: 'Mission Control.dc.html' staat niet in deze map."
  echo "  Zet dit bestand naast het spelbestand."
  echo ""
  read -n 1 -s -r -p "Druk op een toets om te sluiten."
  exit 1
fi

# Chrome zoeken, anders Edge
BROWSER=""
if [ -x "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" ]; then
  BROWSER="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
elif [ -x "$HOME/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" ]; then
  BROWSER="$HOME/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
elif [ -x "/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge" ]; then
  BROWSER="/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge"
fi

if [ -z "$BROWSER" ]; then
  echo ""
  echo "  FOUT: Chrome of Edge niet gevonden."
  echo "  Open 'Mission Control.dc.html' handmatig en druk Ctrl+Cmd+F"
  echo "  voor volledig scherm."
  echo ""
  read -n 1 -s -r -p "Druk op een toets om te sluiten."
  exit 1
fi

# Apart profiel: bewaart het scorebord, raakt de gewone browser niet aan
"$BROWSER" \
  --kiosk \
  --allow-file-access-from-files \
  --disable-pinch \
  --overscroll-history-navigation=0 \
  --user-data-dir="$MAP/kiosk-profiel" \
  "file://$SPEL" >/dev/null 2>&1 &

exit 0
