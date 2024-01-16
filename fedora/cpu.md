❯ journalctl -b -p 3                     
janv. 10 00:29:08 nobara-pc kernel: mce: [Hardware Error]: CPU 12: Machine Check: 0 Bank 5: bea0000001000108
janv. 10 00:29:08 nobara-pc kernel: mce: [Hardware Error]: TSC 0 ADDR 1424d5837 MISC d012000100000000 SYND 4d000000 IPID 500b000000000
janv. 10 00:29:08 nobara-pc kernel: mce: [Hardware Error]: PROCESSOR 2:a20f12 TIME 1704842945 SOCKET 0 APIC 1 microcode a20120a
janv. 10 00:29:08 nobara-pc systemd-modules-load[415]: Failed to find module 'v4l2loopback'
janv. 10 00:29:13 nobara-pc kernel: BTRFS error (device nvme0n1p3): incorrect extent count for 34390147072; counted 5186, expected 5185
janv. 10 00:29:13 nobara-pc kernel: Bluetooth: hci0: FW download error recovery failed (-19)
janv. 10 00:29:13 nobara-pc kernel: Bluetooth: hci0: sending frame failed (-19)
janv. 10 00:29:13 nobara-pc kernel: Bluetooth: hci0: Reading supported features failed (-19)
janv. 10 00:29:13 nobara-pc kernel: Bluetooth: hci0: sending frame failed (-19)
janv. 10 00:29:13 nobara-pc kernel: Bluetooth: hci0: Failed to read MSFT supported features (-19)
janv. 10 00:29:15 nobara-pc abrt-notification[1947]: [🡕] System encountered a non-fatal error in ??()
janv. 10 00:29:16 nobara-pc kernel: Bluetooth: hci0: Malformed MSFT vendor event: 0x02
janv. 10 00:29:16 nobara-pc bluetoothd[1289]: src/device.c:set_wake_allowed_complete() Set device flags return status: Invalid Paramete>
janv. 10 00:29:21 nobara-pc dbus-broker-launch[2503]: Ignoring duplicate name 'org.freedesktop.FileManager1' in service file '/usr/shar>
janv. 10 00:29:24 nobara-pc plasmashell[3018]: qml: The backend got an unknown wallpaper provider type. The wallpaper will now fall bac>
janv. 10 00:29:26 nobara-pc libddcutil[3113]: busno=5, sleep-multiplier =  1,30. Testing for supported feature 0x10 returned Error_Info>
lines 1-16/16 (END)

---
❯ journalctl -k --priority warning --boot 0
janv. 10 00:29:08 nobara-pc kernel: Speculative Return Stack Overflow: IBPB-extending microcode not applied!
janv. 10 00:29:08 nobara-pc kernel: Speculative Return Stack Overflow: WARNING: See https://kernel.org/doc/html/latest/admin-guide/hw-v>
janv. 10 00:29:08 nobara-pc kernel: device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. Duplicate IMA measurements will not be >
janv. 10 00:29:08 nobara-pc kernel: mce: [Hardware Error]: CPU 12: Machine Check: 0 Bank 5: bea0000001000108
janv. 10 00:29:08 nobara-pc kernel: mce: [Hardware Error]: TSC 0 ADDR 1424d5837 MISC d012000100000000 SYND 4d000000 IPID 500b000000000
janv. 10 00:29:08 nobara-pc kernel: mce: [Hardware Error]: PROCESSOR 2:a20f12 TIME 1704842945 SOCKET 0 APIC 1 microcode a20120a
janv. 10 00:29:08 nobara-pc kernel: blacklist: Duplicate blacklisted hash bin:47ff1b63b140b6fc04ed79131331e651da5b2e2f170f5daef4153dc2f>
janv. 10 00:29:08 nobara-pc kernel: blacklist: Duplicate blacklisted hash bin:5391c3a2fb112102a6aa1edc25ae77e19f5d6f09cd09eeb2509922bfc>
janv. 10 00:29:08 nobara-pc kernel: blacklist: Duplicate blacklisted hash bin:80b4d96931bf0d02fd91a61e19d14f1da452e66db2408ca8604d411f9>
janv. 10 00:29:08 nobara-pc kernel: blacklist: Duplicate blacklisted hash bin:992d359aa7a5f789d268b94c11b9485a6b1ce64362b0edb4441ccc187>
janv. 10 00:29:08 nobara-pc kernel: blacklist: Duplicate blacklisted hash bin:c452ab846073df5ace25cca64d6b7a09d906308a1a65eb5240e3c4ebc>
janv. 10 00:29:08 nobara-pc kernel: blacklist: Duplicate blacklisted hash bin:e051b788ecbaeda53046c70e6af6058f95222c046157b8c4c1b9c2cfc>
janv. 10 00:29:08 nobara-pc kernel: nvme nvme1: missing or invalid SUBNQN field.
janv. 10 00:29:13 nobara-pc systemd-sysv-generator[815]: SysV service '/etc/rc.d/init.d/livesys' lacks a native systemd unit file. ~ Au>
janv. 10 00:29:13 nobara-pc systemd-sysv-generator[815]: SysV service '/etc/rc.d/init.d/livesys-late' lacks a native systemd unit file.>
janv. 10 00:29:13 nobara-pc kernel: v4l2loopback: loading out-of-tree module taints kernel.
janv. 10 00:29:13 nobara-pc kernel: v4l2loopback: unknown parameter 'Loopback'' ignored
janv. 10 00:29:13 nobara-pc kernel: BTRFS error (device nvme0n1p3): incorrect extent count for 34390147072; counted 5186, expected 5185
janv. 10 00:29:13 nobara-pc kernel: iwlwifi 0000:05:00.0: api flags index 2 larger than supported by driver
janv. 10 00:29:13 nobara-pc kernel: Bluetooth: hci0: FW download error recovery failed (-19)
janv. 10 00:29:13 nobara-pc kernel: Bluetooth: hci0: sending frame failed (-19)
janv. 10 00:29:13 nobara-pc kernel: Bluetooth: hci0: Reading supported features failed (-19)
janv. 10 00:29:13 nobara-pc kernel: Bluetooth: hci0: HCI LE Coded PHY feature bit is set, but its usage is not supported.
janv. 10 00:29:13 nobara-pc kernel: Bluetooth: hci0: sending frame failed (-19)
janv. 10 00:29:13 nobara-pc kernel: Bluetooth: hci0: Failed to read MSFT supported features (-19)
janv. 10 00:29:13 nobara-pc kernel: thermal thermal_zone0: failed to read out thermal zone (-61)
janv. 10 00:29:15 nobara-pc kernel: ACPI: \: failed to evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
janv. 10 00:29:15 nobara-pc kernel: ACPI: \: failed to evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
janv. 10 00:29:15 nobara-pc kernel: ACPI: \: failed to evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
janv. 10 00:29:15 nobara-pc kernel: ACPI: \: failed to evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
janv. 10 00:29:15 nobara-pc kernel: ACPI: \: failed to evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
janv. 10 00:29:15 nobara-pc kernel: ACPI: \: failed to evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
janv. 10 00:29:15 nobara-pc kernel: ACPI: \: failed to evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
janv. 10 00:29:15 nobara-pc kernel: ACPI: \: failed to evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
janv. 10 00:29:15 nobara-pc kernel: ACPI: \: failed to evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
janv. 10 00:29:15 nobara-pc kernel: ACPI: \: failed to evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
janv. 10 00:29:15 nobara-pc kernel: ACPI: \: failed to evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
janv. 10 00:29:15 nobara-pc kernel: ACPI: \: failed to evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
janv. 10 00:29:15 nobara-pc kernel: ACPI: \: failed to evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
janv. 10 00:29:15 nobara-pc kernel: ACPI: \: failed to evaluate _DSM bf0212f2-788f-c64d-a5b3-1f738e285ade (0x1001)
janv. 10 00:29:16 nobara-pc kernel: Bluetooth: hci0: Malformed MSFT vendor event: 0x02
janv. 10 00:29:16 nobara-pc kernel: Bluetooth: hci0: HCI LE Coded PHY feature bit is set, but its usage is not supported.
janv. 10 00:29:16 nobara-pc kernel: Bluetooth: hci0: Bad flag given (0x1) vs supported (0x0)
janv. 10 00:29:22 nobara-pc kernel: pipewire[2770]: memfd_create() called without MFD_EXEC or MFD_NOEXEC_SEAL set
janv. 10 00:29:23 nobara-pc kernel: warning: `kded5' uses wireless extensions which will stop working for Wi-Fi 7 hardware; use nl80211
lines 1-45/45 (END)

---

❯ sudo dmesg | grep Error
[sudo] password for geo:
[    0.847631] mce: [Hardware Error]: Machine check events logged
[    0.847632] mce: [Hardware Error]: CPU 12: Machine Check: 0 Bank 5: bea0000001000108
[    0.847638] mce: [Hardware Error]: TSC 0 ADDR 1424d5837 MISC d012000100000000 SYND 4d000000 IPID 500b000000000
[    0.847645] mce: [Hardware Error]: PROCESSOR 2:a20f12 TIME 1704842945 SOCKET 0 APIC 1 microcode a20120a
[    0.996361] RAS: Correctable Errors collector initialized.
[    8.126256] Bluetooth: hci0: Error reading debug features

❯ sudo dmesg --level err
[    7.741919] BTRFS error (device nvme0n1p3): incorrect extent count for 34390147072; counted 5186, expected 5185
[    8.126208] Bluetooth: hci0: FW download error recovery failed (-19)
[    8.126242] Bluetooth: hci0: sending frame failed (-19)
[    8.126253] Bluetooth: hci0: Reading supported features failed (-19)
[    8.126268] Bluetooth: hci0: sending frame failed (-19)
[    8.126275] Bluetooth: hci0: Failed to read MSFT supported features (-19)
[   10.348053] Bluetooth: hci0: Malformed MSFT vendor event: 0x02


---

https://bugzilla.kernel.org/show_bug.cgi?id=206903


Clemens Eisserer: All these hangs in idle situations are due to a lack of voltage, either because the processor is not properly calibrated from the factory or because the motherboard does not supply the necessary voltage.

When a core is off and wakes up to perform a light task that raises its frequency to the maximum is when this problem usually appears, and if a core is in total sleep (C6) the hang will be more accentuated, so disabling the C6 state solves the problem to some people.

To solve this kind of hangs you have to set a positive voltage offset to the CPU. Zen3 and Zen4 users can do it per core thanks to Curve Optimizer, the rest of users can only apply it to the whole CPU.

---

https://forum.manjaro.org/t/system-auto-rebooted-mce-hardware-error-in-dmesg-related-to-cpu/89580/7

https://forum.manjaro.org/t/system-auto-rebooted-mce-hardware-error-in-dmesg-related-to-cpu/89580/9

---

https://community.amd.com/t5/processors/ryzen-5900x-system-constantly-crashing-restarting-whea-logger-id/td-p/423321/page/84

---

https://wiki.archlinux.org/title/Ryzen#Random_reboots