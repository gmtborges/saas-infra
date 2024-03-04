#!/bin/bash
# Build and deploy
docker image prune
docker container prune
docker container build -t app ./app
docker container run -d -p 3000:3000 --env-file .env --name app app
