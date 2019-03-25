#!/bin/bash
 
sudo diskutil unmount /dev/disk0s1
sudo diskutil mount /dev/disk0s1
sleep 3
cd /Users/phil/Desktop 
mv SSDT-THBT.aml /Volumes/EFI/EFI/CLOVER/ACPI/patched 
sudo reboot