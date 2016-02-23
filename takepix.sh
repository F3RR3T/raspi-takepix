#!/bin/bash


picdate=$(date +%Y-%m-%d_%H%M)
/opt/vc/bin/raspistill -x IFD1.Artist=neatherd -o /home/st33v/pix/${picdate}.jpg

