#!/bin/bash

# Colors for echo
RED='\033[0;31m'
NC='\033[0m' # No Color

### JPEGOptim ###
# -m 95 : 95% minimum quality
# -s : strip all metadata
echo -e "${RED} \t\t JPEGOPTIM ${NC}"
jpegoptim -m90 -s *.{jpg,jpeg,JPG,JPEG}

#TODO add MozJPEG

### PNGQuant ###
# 256 colors
# -s1 : Max optimization level, brute-force
# -Q 80-100 : 80% min quality
# -f --ext .png : overwrite file
# --skip-if-large : only save reduced files
echo -e "${RED} \t\t PNGQUANT ${NC}"
pngquant 256 -s1 -Q 80-100 -f --ext .png --skip-if-larger *.png

### OxiPNG ###
# -06 : Max optimization level
# -i0 : Interlace type 0
# --strip all : Remove al metadata
# -a : Alpha optimizations
# -q : Quiet mode
# Zoptli compression disabled, too slow
echo -e "${RED} \t\t OXIPNG ${NC}"
oxipng -o6 -i0 --strip all -a -q *.{png,PNG}

### AdvPNG ###
# -z : Recompress
# -4 : Max optimization level with Zopfli compression
# -i2 : 2 compress iterations
echo -e "${RED} \t\t ADVPNG ${NC}"
advpng -z -4 -i2 *.{png,PNG}


### GIFsicle ###
# -b : batch mode for mutiple files
# -k 256 : Reduce to 256 colors
# -O3 : Max optimization level
echo -e "${RED} \t\t GIFSICLE ${NC}"
gifsicle -b *.gif -k 256 -O3