#!/bin/bash

set -e

echo "Xonotic downloaden..."

git clone https://github.com/xonotic/xonotic.git

cd xonotic

echo "Repositories bijwerken..."

./all update -p

echo "Dedicated server compileren..."

./all compile -r dedicated

echo "Configuratie installeren..."

cat > data/server.cfg << 'EOF'
// Server instellingen
maxplayers 16
timelimit 4
fraglimit 30

// Standaard map
map stormkeep
EOF

echo "Installatie voltooid!"
echo "Start de server met: ./all run dedicated xonotic"
