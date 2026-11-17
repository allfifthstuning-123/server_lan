#!/bin/bash

sudo add-apt-repository multiverse
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y steamcmd lib32gcc-s1 lib32stdc++6 libsdl2-2.0-0:i386 
kill $PPID
