#!/bin/bash

picdir="/home/st33v/pix"
picdate=$(date +%Y-%m-%d_%H%M)
thispic=$picdir/$picdate.jpg

#echo thispic = $thispic

/opt/vc/bin/raspistill -x IFD1.Artist=neatherd -q 70 -md 5 -o $thispic

# silly portrait shape
#/opt/vc/bin/raspistill -x IFD1.Artist=neatherd -w 1200 -o $thispic

# now check to see if the pic is too dark (i.e. taken at night)
mean=$(identify -format %[mean] $thispic | sed s/[.].*//)

#echo mean is "$mean"

# too dark
if [ $mean -lt 2000 ]; then
    rm $pixdir/$thispic
    echo mean of $mean is too low.
    exit 13
fi
