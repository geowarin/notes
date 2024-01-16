Short Version:

1. `sudo modprobe wacom`

2. Now tablet should work, uninstall opentabletdriver with `sudo dnf remove opentabletdriver`

Detailed:

Wacom drivers are present within the nobara install and tablet but the otd is blocking it by default.
This results in the tablet not working when plugged in even though it is detected in the settings (gnome at least). The
first command enables them again, the second removes otd. I think you could also get it to work with otd but I like the
simple standard wacom drivers and settings.