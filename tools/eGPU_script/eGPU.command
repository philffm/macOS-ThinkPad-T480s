#!/bin/bash

sudo diskutil unmount /dev/disk0s1
sudo diskutil mount /dev/disk0s1
sleep 3
cd /Volumes/EFI/EFI/CLOVER/ACPI/patched 
mv SSDT-THBT.aml /Users/phil/Desktop 
sudo reboot