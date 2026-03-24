# Klipper Ender 3 + SKR Mini E3 V3.0
Config-Backup und Upgrade-Anleitung für Ender 3 mit Sprite Pro + BLTouch + TFT35

## Hardware
- Board: BIGTREETECH SKR Mini E3 V3.0 (STM32G0B1)
- Extruder: Creality Sprite Pro Direct Drive
- Probe: BLTouch
- Display: BTT TFT35 E3 V3.0
- Filament: Switch + Motion Sensor
- Spoolman Integration

## Wichtig: V2 → V3.0 Unterschiede
- Chip: STM32F103 → **STM32G0B1** → neue Firmware!
- enable_pin Extruder: !PD2 → **!PD1**
- [static_digital_output usb_pullup_enable] entfällt
- Serial-ID nach Flash neu auslesen

Siehe FLASH_ANLEITUNG.md für Details.
