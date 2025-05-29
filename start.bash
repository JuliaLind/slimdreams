#!/bin/bash

docker compose -f docker-compose.dev.yml up -d
sleep 3
echo "Seeding MongoDB data..."
docker exec -i mongodb-data mongoimport \
  --db data \
  --collection fooditems \
  --file /data-server-data/foods.json \
  --jsonArray
echo "Seed completed"


# To enter the containers, you can use the following commands:
# docker exec -it web-server sh
# docker exec -it data-server sh
# docker exec -it auth-server sh
