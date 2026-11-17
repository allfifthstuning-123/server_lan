#!/bin/bash


sudo apt install toilet -y

# De terminal leegmaken
clear

# Een titel weergeven
echo "IP van Minecraft Server:"


# Het lokale IPv4-adres ophalen
IP=$(ip -4 route get 1.1.1.1 | awk '{print $7; exit}')

# Controleren of er een IP-adres is gevonden
if [ -n "$IP" ]; then
    # Het IP-adres groot weergeven
    echo "$IP" | toilet -f mono12
else
    echo "Geen lokaal IP-adres gevonden!"
fi
