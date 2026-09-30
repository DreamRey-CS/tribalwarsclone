#!/bin/bash

docker-compose up -d --build
sleep 10
docker-compose exec mysql bash /usr/src/tribalwars-scripts/initdb.sh
docker-compose exec -T app cron
echo "Tribe Rush hazir: http://localhost:8080"
