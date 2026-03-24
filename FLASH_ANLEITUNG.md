# SKR Mini E3 V3.0 — Klipper Flash Anleitung

## ⚠️ Wichtig: V3.0 ≠ V2.0!
Der V3.0 hat einen **STM32G0B1** Chip, nicht STM32F103 wie die V2.0.
Falsche Firmware = Board bootet nicht!

## Klipper kompilieren

```bash
cd ~/klipper
make menuconfig
```

Einstellungen:
- **Micro-controller:** STMicroelectronics STM32
- **Processor model:** STM32G0B1
- **Bootloader offset:** 8KiB bootloader
- **Clock Reference:** 8 MHz crystal
- **Communication interface:** USB (on PA11/PA12)
- Alles andere: Standard lassen

```bash
make clean
make
```

## Firmware flashen (SD-Karte Methode)

```bash
cp out/klipper.bin /tmp/firmware.bin
```

1. SD-Karte formatieren (FAT32)
2. `firmware.bin` auf die SD-Karte kopieren
3. Drucker ausschalten
4. SD-Karte einlegen
5. Drucker einschalten → Board flasht automatisch (~10 Sek)
6. SD-Karte entfernen (Datei wird nach Flash umbenannt zu `firmware.CUR`)

## Serial-Port finden

```bash
ls /dev/serial/by-id/
```

Den gefundenen Pfad in `printer.cfg` bei `[mcu] serial:` eintragen.

## Erste Schritte nach Flash

1. **E-Steps kalibrieren** (rotation_distance Extruder):
   ```
   STEPPER_BUZZ STEPPER=extruder
   # 100mm markieren, 100mm extrudieren, nachmessen
   ```

2. **PID Extruder kalibrieren:**
   ```
   PID_CALIBRATE HEATER=extruder TARGET=200
   SAVE_CONFIG
   ```

3. **PID Bett kalibrieren:**
   ```
   PID_CALIBRATE HEATER=heater_bed TARGET=60
   SAVE_CONFIG
   ```

4. **Z-Offset einstellen:**
   ```
   PROBE_CALIBRATE  # bei BLTouch
   # oder manuell: Z_ENDSTOP_CALIBRATE
   ```

5. **Pressure Advance kalibrieren** (mit Sprite Pro wichtig!)

## TFT35 E3 V3.0

Das TFT35 hat zwei Modi:
- **Marlin-Modus** (kleines Icon links unten) → funktioniert mit Klipper via display-Config
- **Touch-Modus** → benötigt separates Serial + moonraker

Empfehlung: Im Marlin-Modus lassen, Mainsail/Fluidd für die eigentliche Steuerung nutzen.
