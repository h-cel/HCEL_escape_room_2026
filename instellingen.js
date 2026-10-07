// INSTELLINGEN VAN HET ESCAPE ROOM SPEL
// Open dit bestand met Kladblok (Windows) of TextEdit (Mac), pas een waarde aan, bewaar,
// en herstart het spel. Deze waarden gaan voor op de tweaks.
// Let op: laat de komma's en aanhalingstekens staan. true = aan, false = uit.

window.EO_INSTELLINGEN = {

  // --- Spel ---
  minuten: 45,                 // speeltijd in minuten
  schermSchaal: 100,           // grootte van het scherm in %, 0 = automatisch
  instelmodus: false,          // true = resetknop + studiegebieden tekenen
  toonStudiegebiedKaart: false, // true = kaartje "Studiegebied" linksonder bij elke vraag

  // --- Tijdstraffen (in seconden, 0 = geen straf) ---
  strafHintCode: 60,          // hint vragen bij de toegangscode
  strafFouteCode: 0,           // foute toegangscode ingeven
  strafHintSatelliet: 10,      // hint vragen bij de satellietkeuze
  strafFouteSatelliet: 20,     // foute satelliet kiezen
  strafFouteRichting: 30,      // foute windrichting kiezen
  strafFouteCel: 5,           // per foute cel bij brandhaarden

  // --- Vragen aan/uit ---
  vraagVegetatie: true,
  vraagTemperatuur: true,
  vraagWind: true,
  vraagBodem: true,
  vraagBrandhaarden: false,    // celselectie
  vraagRichting: true,
  vraagOppervlakte: true,
  vraagLucht: true,

  // --- Studiegebied (blauw kader per beeld) ---
  // per vraag: links,boven,rechts,onder als fractie van het beeld (0 tot 1)
  studiegebieden: "fuel:0.43,0.423,0.593,0.568 lst:0.156,0.292,0.525,0.636 wind:0.296,0.504,0.445,0.623 soil:0.173,0.266,0.53,0.598 dir:0.296,0.504,0.445,0.623 air:0.219,0.434,0.345,0.587",

  // --- Verbrande zone (vraag oppervlakte) ---
  schaalKm: 5,                 // lengte van de schaalbalk in km
  schaalBalkPct: 4.6,          // breedte van de schaalbalk in % van het beeld
  zoneInstellen: false,        // true = juiste zone opnieuw tekenen
  bufferKm: 2.5,               // toegestane marge rond de juiste zone in km
  juisteZone: "0.3148,0.2755 0.2633,0.2978 0.2691,0.3206 0.3020,0.3323 0.3243,0.2988 0.3381,0.3227 0.4007,0.3402 0.4310,0.3445 0.4613,0.2877 0.4448,0.2617 0.4676,0.2749 0.4878,0.2436 0.4814,0.2139 0.5021,0.1895 0.4782,0.1821 0.4421,0.2028 0.4655,0.2229 0.4565,0.2383 0.4172,0.2389 0.4156,0.2182 0.4315,0.2102 0.4421,0.1831 0.4337,0.1683 0.4490,0.1513 0.4437,0.1168 0.3572,0.1592 0.3222,0.2197 0.2983,0.2399 0.3163,0.2622",

};
