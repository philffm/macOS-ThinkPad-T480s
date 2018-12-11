# macOS on Lenovo ThinkPad T480s

This repository contains a sample configuration to run macOS (Currently Mojave `10.14`) on a Lenovo ThinkPad T480s

## Used Hardware Configuration

- Lenovo ThinkPad T480s
  - Intel i5-8250U
  - 8GB RAM onboard + Crucial DDR4 2400-SODIMM
  - Samsung 970 evo NVMe SSD
  - Dell DW1560 Wireless (original Intel AC8265 not working)
    - Wi-Fi device ID [`14e4:43b1`], shows as Apple Airport Extreme due to `AirportBrcmFixup.kext`
    - Bluetooth device ID [`0a5c:216f`], chipset `20702A3` with firmware `v14 c5882` using `BrcmPatchRAM2.kext`
  - Realtek ALC257 by `AppleALC.kext` with `layout-id` 11 (requies a [patch][alc], already patched in this repo)
  - Intel UHD Graphics 620 (Nvidia MX150 disabled, Optimus not supported by macOS)
  - Power management and battery status by ACPI hotpatching
  - Integrated camera (works out of the box)
  - Keyboard/Elan Touchpad (PS/2) using `ApplePS2SmartTouchPad.kext` v4.7b5 by EMlyDinEsH
    - Support multi-touch gestures
    - Need to disable Trackpoint in BIOS (otherwise touchpad would be disconnected)
    - Requires to patch the binary `ApplePS2SmartTouchPad`, already patched in this repo (otherwise the driver reports unsupported model):
      ```
      Offset    Original  Patched
      0000ABF5  72        EB
      0000AC2D  01        04
      ```
- Disabled devices
  - WWAN (no module)
  - Trackpoint (can be enabled when using `VoodooPS2Controller.kext`)
- Untested devices
  - SD card reader
  - Fingerprint scanner
  - Thunderbolt 3 (USB type-c works)
- Firmware Revisions
  - BIOS version `1.26`

## Preparation

* (**Important**) You need to generate a proper `config.plist` with unique serial numbers:
  - Run `./tools/gen.sh` (macOS) or `tools\gen.bat` (Windows) to generate `config.plist`.
  - Add `-f` or `--force` flag to forcibly regenerate `config.plist` with new serial numbers.
* All SSDT hotpatches are located at `EFI/CLOVER/ACPI/dsl`. You can update the compiled `.aml` binaries by running `update.sh` (macOS) or `update.bat` (Windows).
* The `SSDT-KBD.aml` is tuned for `ApplePS2SmartTouchPad.kext`. If you want to switch to `VoodooPS2Controller.kext`, use `SSDT-KBD.aml` in `backup` folder instead.

## Credits

- [OS-X-Clover-Laptop-Config (Hot-patching)](https://github.com/RehabMan/OS-X-Clover-Laptop-Config)
- [Dell XPS 13 9360 Guide](https://github.com/the-darkvoid/XPS9360-macOS)
- [ThinkPad X1 Carbon Gen 6 Guide](https://github.com/tylernguyen/x1c6-hackintosh)

[alc]: https://github.com/acidanthera/AppleALC/pull/324
[clover]: https://www.tonymacx86.com/threads/guide-booting-the-os-x-installer-on-laptops-with-clover.148093/
[uuid]: https://www.uuidgenerator.net/
[macserial]: https://github.com/acidanthera/macserial
