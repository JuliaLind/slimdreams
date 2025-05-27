#!/bin/bash

docker compose -f docker-compose.dev.yml up -d
sleep 3
echo "Seeding MongoDB data..."
docker exec -i mongodb-data mongoimport \
  --db data \
  --collection fooditems \
  --file /data-server-data/clean.json \
  --jsonArray
echo "Seed complete. Entering web-server..."
# docker exec -it web-server sh
# docker exec -it data-server sh
# docker exec -it auth-server sh
# docker compose -f docker-compose.dev.yml down --volumes

