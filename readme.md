<!--- readme.md
created 25 September 2016 (because of an effective little nag banner in github).
-->

# Takepix shell script and Systemd Timer

## Intro
Takepix is a systemd-driven script that takes photos periodically, under the control of a systemd timer.

The script runs on a *raspberry pi* with an attached camera module.

The Operating System that I use for raspberry pi is [Linux Arch ARM edition](https://archlinuxarm.org).

To take the photos from the camera-equipped raspi, I use another raspi on the same LAN, which is running another service-based script, [getpix](/f3rr3t/getpix).:

## Files

File name | Purpose / functions
----------|--------------------
takepix.timer|A simple timer that calls takepix.service periodically
takepix.service| Systemd service definition that is called by the Timer 
rakepix.sh|A shell script that takes trhe photo and performs quality checks
