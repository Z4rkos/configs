#!/bin/bash


lang=$(setxkbmap -query) 
lang=`echo "$lang" | grep -E "layout:(.*)"`
lang=${lang/"layout:     "/""}
if [ $lang == "us" ]; then
    setxkbmap no
else
    setxkbmap us
fi
echo "$layout"
echo "asdasdasdasdasd"
