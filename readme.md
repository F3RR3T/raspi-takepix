<!--- readme.md
created 25 September 2016 (because of an effective little nag banner in github).
-->

# Takepix shell script and Systemd Timer

## Intro
**Takepix** is a systemd-driven script that takes photos periodically, under the control of a systemd timer.

The script runs on a *raspberry pi* with an attached camera module.

The Operating System that I use for raspberry pi is [Linux Arch ARM edition](https://archlinuxarm.org).

To take the photos from the camera-equipped raspi, I use another raspi on the same LAN, which is running another service-based script, [raspi-getpix](https://github.com/F3RR3T/raspi-getpix).

## Files

File name | Purpose / functions
----------|--------------------
takepix.timer|A simple timer that calls **takepix.service** periodically
takepix.service| `Systemd` service definition that is called by the Timer 
takepix.sh|A `bash` shell script that takes the photo and performs quality checks

The `timer` calls the `service` every 30 minutes, and the service then runs the `shell` script.

I have found it difficult to make `systemd` services do anything more fancy than just call a script. 

If you clone this script, you will have to edit the `picdir` variable in the shell script. Note that when you run scripts from a systemd service call, you must provide absolute paths to files or directories.

Also update the `artist` variable that is palced into the EXIF metadata of the photo.

### todo

- expand the raspi photo interface to allow for customisation of camera settings.

