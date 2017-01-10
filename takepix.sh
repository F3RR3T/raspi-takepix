#!/bin/bash

# define variables. Your needs may vary.
# use literal user name. Shell expansions may not work when this script is run by a service!
picdir="/home/st33v/pix"   
picdate=$(date +%Y-%m-%d_%H%M)
thispic=$picdir/$picdate.jpg
artist=$(hostname)
jpgQuality="90"

# echo thispic = $thispic

case ${artist^^} in

    LUCERNE)
    /opt/vc/bin/raspistill -vf -hf -x IFD1.Artist=${artist} -q $jpgQuality -md 4: -o $thispic;;

    NEATHERD)
    /opt/vc/bin/raspistill -x IFD1.Artist=${artist} -q $jpgQuality -md 4: -o $thispic;;

    *)
    /opt/vc/bin/raspistill -x IFD1.Artist=${artist} -q $jpgQuality -md 4: -o $thispic;;

esac

# Note: we do no image processing on this pi, because it has so little RAM
# left after devoting 128MB to the GPU (camera).
# STAN does all the heavy lifting:
#   1) delete nightshots (where threshold pixel value is not met)
#   2) resize and unsharp mask ready for display on the internet.
