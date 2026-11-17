#!/bin/bash

# Map waarin alle Minecraft-servers staan
SERVER_DIR="./Servers"

# Controleer of de map bestaat
if [ ! -d "$SERVER_DIR" ]; then
    echo "Fout: de map '$SERVER_DIR' bestaat niet."
    exit 1
fi

while true; do
    clear
    echo "================================"
    echo "      Minecraft Server Menu"
    echo "================================"
    echo ""

    # Servers verzamelen en sorteren
    mapfile -t SERVERS < <(find "$SERVER_DIR" -mindepth 1 -maxdepth 1 -type d | sort)

    if [ ${#SERVERS[@]} -eq 0 ]; then
        echo "Geen servers gevonden in $SERVER_DIR."
        exit 0
    fi

    # Genummerde lijst tonen
    for i in "${!SERVERS[@]}"; do
        echo "$((i + 1)). $(basename "${SERVERS[$i]}")"
    done

    echo ""
    echo "0. Afsluiten"
    echo ""

    read -rp "Kies een servernummer: " keuze

    if [[ "$keuze" == "0" ]]; then
        echo "Menu afgesloten."
        exit 0
    fi

    # Controleren of de invoer een geldig nummer is
    if ! [[ "$keuze" =~ ^[0-9]+$ ]] ||
       (( keuze < 1 || keuze > ${#SERVERS[@]} )); then
        echo "Ongeldige keuze!"
        sleep 2
        continue
    fi

    # Gekozen servermap bepalen
    SERVER_PATH="${SERVERS[$((keuze - 1))]}"
    START_SCRIPT="$SERVER_PATH/start.sh"

    # Controleren of start.sh bestaat
    if [[ ! -f "$START_SCRIPT" ]]; then
        echo "Fout: $START_SCRIPT bestaat niet."
        read -rp "Druk op Enter om verder te gaan..."
        continue
    fi

    # Server starten
    echo ""
    echo "Server starten: $(basename "$SERVER_PATH")"
    echo ""

    (
        cd "$SERVER_PATH" || exit 1
        sudo bash "./start.sh"
    )

    echo ""
    read -rp "Druk op Enter om terug te gaan naar het menu..."
done
