#!/bin/bash

# define variables. Your needs may vary.
# use literal user name. Shell expansions may not work when this script is run by a service!Y
picdir="/home/st33v/pix"   
picdate=$(date +%Y-%m-%d_%H%M)
thispic=$picdir/$picdate.jpg
artist=$(hostname)


# echo thispic = $thispic

/opt/vc/bin/raspistill -x IFD1.Artist=${artist} -q 70 -md 4: -o $thispic

# silly portrait shape
#/opt/vc/bin/raspistill -x IFD1.Artist=neatherd -w 1200 -o $thispic

# now check to see if the pic is too dark (i.e. taken at night)
mean=$(identify -format %[mean] $thispic | sed s/[.].*//)

# echo "mean is |$mean|"

# too dark (nighttime)
if [[ "${mean}" -lt 2000 ]] ; then
    rm $thispic
#    echo mean of $mean is too low.
    exit 13
fi

# We can't resize image on this raspi because it has too little RAM!
# Let's try it on STAN, which is a pi model 3B

# convert ${thispic} -unsharp 1.5x1+0.7+0.02 $picdir/temp.jpg
# cp ${thispic} $picdir/temp.jpg
# convert $picdir/temp.jpg -resize 33% ${thispic}
# rm $picdir/temp.jpg
