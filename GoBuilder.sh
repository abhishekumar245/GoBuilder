#!/bin/bash

# Go Builder
# A small bash script for generating Go EXE files on Linux.
# Author - Abhishek Kumar

clear
echo "+-------------------------+"
echo "|╔═╗╔═╗╔╗ ╦ ╦╦╦  ╔╦╗╔═╗╦═╗|"
echo "|║ ╦║ ║╠╩╗║ ║║║   ║║║╣ ╠╦╝|"
echo "|╚═╝╚═╝╚═╝╚═╝╩╩═╝═╩╝╚═╝╩╚═|"
echo "+-------------------------+"
echo "|----Go EXE File Maker----|"
echo "+-------------------------+"
echo -n "Enter File Path of Go File Name with extension: "
read -e gofile

if [ ! -f "$gofile" ]; then
    echo "File not found!"
    exit 1
fi

echo -n "Enter the save location for the built file: "
read -e savelocation

if [ ! -d "$savelocation" ]; then
    echo "Save location is not a valid directory!"
    exit 1
fi

filename=$(basename -- "$gofile")
filename="${filename%.*}"

go build -o "$savelocation/$filename" "$gofile"

if [ $? -eq 0 ]; then
    echo "Success! Go File Output file created at $savelocation with file name $filename."
else
    echo "Failed to build the Go file."
    exit 1
fi
