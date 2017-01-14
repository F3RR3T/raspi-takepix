#!/bin/bash
# takepix.sh  SJP 10 January 2017
# Version 2: PUSH photos to STAN rather than waiting for STAN to pull them by scp.
#
# Create a file called 'picdir.config', containing paths to your local photos and 
# the storage location on your equivalent of STAN, or 'cam Herder' raspi. It must overwrite
# the following variable assignments, which are shown as examples:
#   use literal user name. Shell expansions may not work when this script is run by a service!
picdir="/path/to/my/photos"  # overwritten by sourcing from .picdir.config
camHerder="STAN:/home/path/to/stored/photos"
. picdir.config             # source directory name from local config file
picdate=$(date +%Y-%m-%d_%H%M)
thispic=$picdir/$picdate.jpg
artist=$(hostname)
jpgQuality="90"
camHerderHostname='stan'    # Substitute your cam 'controller' hostname or LAN IP address

# echo thispic = $thispic

case ${artist^^} in

    LUCERNE)
    /opt/vc/bin/raspistill -vf -hf -x IFD1.Artist=${artist} -q $jpgQuality -md 4: -o $thispic;;

    NEATHERD)
    /opt/vc/bin/raspistill -x IFD1.Artist=${artist} -q $jpgQuality -md 4: -o $thispic;;

    *)
    /opt/vc/bin/raspistill -x IFD1.Artist=${artist} -q $jpgQuality -md 4: -o $thispic;;

esac

# Copy pic to STAN, and place it in proper subdirectory (which of course must exist on STAN).
scp $thispic $camHerder/$artist/.
rm $thispic

# Note: we do no image processing on this pi, because it has so little RAM
# left after devoting 128MB to the GPU (camera).
# STAN does all the heavy lifting:
#   1) delete nightshots (where threshold pixel value is not met)
#   2) resize and unsharp mask ready for display on the internet.
