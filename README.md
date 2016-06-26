# HMpasswd

## Defaults
Username: homematic
Passwort: homematic

## Dependencies
- CCU2
- HTTPS/SSL Webserver aktiviert
  - Einstellungen
    - Systemsteuerung
      - Netzwerksicherheit
        - Zertifikat erstellen

## Install
1. Öffne .htpasswd
2. Ändere Username und Passwort
3. Starte ./build.sh
   Auf einem Linux System wie Debian/Ubuntu/Gentoo.
4. In der CCU2 einloggen
5. Zusatzsoftware hmpasswd.tar.gz hochladen und installieren
6. Öffne https://homematic-ccu2/

## Changelog
- 0.0.2 - 2016-06-26 - rh@hrdns.de
  - update build.sh from bash to sh
- 0.0.1 - 2015-08-23 - rh@hrdns.de
  - inital

## Author
(C) 2015 Richard Hülsberg <rh+homematic@hrdns.de>