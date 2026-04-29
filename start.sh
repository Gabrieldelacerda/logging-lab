#!/bin/bash
echo "Cleaning up stale containers"
docker rm -f loki fluent-bit 2>/dev/null

echo "Starting logging stack"
docker compose -f ~/logging-lab/logging/docker-compose.yml up -d

echo "Waiting for Loki"
sleep 15

echo "Starting nginx"
cd ~/nginx-multisite-lab && docker compose up -d

echo "Done"
