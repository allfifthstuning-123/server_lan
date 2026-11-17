#!/bin/bash

#aan maken van variable
m=0
g=0
s=0
x=0
File="Server_list.txt"

clear
#inladen van .txt

if [[ ! -f "$File" ]]; then
    echo "Error server file niet gevonden"
    exit 1
fi


while IFS= read -r line || [[ -n "$line" ]]; do
    echo "$line"
done < "$File"

#vragen wat ze willen doen

read number
g=$((number))


#if else om te weten welk .sh te laten werken

if [ $g = 1 ]; then
#binenhalen van allen update's / servers
cd sh
tmux split-window -h "bash ./install.sh; exec bash" &
fi

#minecraft server opstarten en downloaden

if [ $g = 2 ]; then
	echo "Download van minecraft server klik 1"
	echo "Op starten van minecraft klik 2"
	read number
	m=$((number))
	if [ $m = 1 ]; then
	cd ./sh
	tmux split-window -h "sudo bash ./mcserver_installer.sh; exec bash"
	fi
	if [ $m = 2 ]; then
	cd ./sh
	tmux split-window -h "bash ./steamcmd_installer.sh; exec bash"
	fi
fi
#steamcmd opstarten / steam server opstarten
if [ $g = 3 ]; then
	echo "klik 1 voor steamcmd installeren"
	echo "klik 2 voor steamcmd optestarten"
	read number
	s=$((number))

	if [ $s = 1 ]; then
	cd ./sh
	tmux split-window -h  "bash ./steamcmd_installer.sh; exec bash"
	fi

	if [ $s = 2 ]; then
	cd ./sh
	tmux split-window -h "bash ./steamcmd_start.sh; exec bash"
	fi

fi

if [ $g = 4 ]; then
	echo "klik 1 voor xonotic installeren"
	echo "klik 2 voor xonotic starten"
	read number
	x=$((number))
	
	if [ $x = 1 ]; then
	cd ./sh
	tmux split-window -h "bash ./xonotic_compiler.sh; exec bash"
	fi
	if [ $x = 2 ]; then
	cd ./sh
	tmux split-window -h "bash ./xonotic_starter.sh; exec bash"
	fi
fi

